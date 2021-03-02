//-----------------------------------------------------------------------------
// Original project by Dennis Frie - 2012 - Dennis.frie@gmail.com
// Discussion: http://www.rcgroups.com/forums/showthread.php?t=1677559
//
// Other contributors to this code:
//  Mark Mansur (Mangus on rcgroups)
//
// Version history:
// - 0.01 - 0.08 - Dennis Frie - preliminary releases
// - 1.01 - April 2013 - Mark Mansur - code clean-up and refactoring, comments
//      added. Added pause functionality, added settings retrieval commands.
//      Minor optimizations.
//-----------------------------------------------------------------------------
//
// - 1.06 - October 2018 Chris Stephens - RCGroups user 'hangarspace'
//
// Bluetooth implementation either using SoftwareSerial library or connection to 
// hardware serial port. 
//
// HC06 on the 'head tracker' module
// HC05 on the 'receiver' module`
//
// SoftwareSerial uses more memory and processor resources which can cause missed or
// corrupted data being sent/received and so it also needs to be checksummed 
// all of which impairs performance plus failing checksums causes packets to be 
// discarded and results in a not-so-smooth servo movement.
// SoftwareSerial uses pin 7 (RX) and pin 8 (TX)
//
// Using the hardware serial ports prevents the use of the USB serial connection
// when in use which means it cannot connect to the GUI app or arduino IDE to 
// download a new sketch. Although you may be able to do all of that using the
// bluetooth connection with your pc instead. 
// Starting the unit whilst holding the button will temporarily disable the
// hardware bluetooth
//
// The 'button' pin has been changed to pin 10 - this differs from the original 
// design as it allows pins 11 & 12 to be ganged together to power the bluetooth module.
// 
// Roll axis over bluetooth can be enabled by un-commenting the marked sections of code.
//
// #define BT_SOFTSERIAL		// ****  Un-comment this line to enable SoftwareSerial  ****
//
//-----------------------------------------------------------------------------
//
// - 1.07 - November 2018 Carlo Nebuloni - RCGroups user 'carlonb'
// QMC5883 Mag (marked as DA5883) implementation where GY-85 has this mag chip instead of HMC5883
// This has different address and registers, and the raw mag data values are higer than HMC5883L 
// Define the appropriate mag in config.h
//
//-----------------------------------------------------------------------------
//
// - 1.08 - December 2019 Alexander Eltsyn (ae@aeinc.ru, RCGroups user name 'AE_')
//
// * Carlo's version reworked to isolate specific sensor board implementations into different 
//   sensorXXX.cpp files and avoid messing "ifdef�s and allow different sensor logic 
//   like using external hardware driver library
//
// * MPU9250 sensor board support implemented based on library by Brian R Taylor:
//   https://github.com/bolderflight/MPU9250 
//
// * $HARD command implemented to distinguish HT hardware in GUI if needed
//
// * $DBGS command implemented to call dbgOutput() every SERIAL_OUTPUT_FRAME_INTERVAL
//   frame for easier development & debug. Function is to be implemented in SensorsXXX.cpp
//   Use "CMAE" (or any other stream stop) command to stop dbgOutput
//
// * $CHNLS command implemented to output channel values for GUI charting
//   Use "CMAE" (or any other stream stop) command to stop channel output
//
// * Minor code optimizations.
//
//-----------------------------------------------------------------------------
//
// - 1.09 - March 2020 Jacek Wielogorski (kniuk@data.pl, RCGroups user name 'kniuk')
//
// * support for Quanum Head Tracker and older hardware before bluetooth implementation:
//    -proper button pin assignement can be set via QUANUM_HT_MODULE
//
// * Checked and fidled with bluetooth functionality using bare 3.3V Huamao HM10 / HM11 BTLE modules
//    -see: BT_HM10_HM11 and BT_DISABLE_BY_RESET_PIN
//
// * Added support for 3.3V@8MHz Arduino Pro Mini board:
//    -implemented via MHZ_DIVIDER used in few places in interrupt routines (loading counter values),
//     all timing remained the same, sacrifing timing precision by factor of 2
//    -I use 8MHz board for bluetooth receiver to be able to supply HM10 / HM11 bare module from Arduino's onboard 3.3V regulator,
//     also no need for level shifters on RX/TX pin, all this makes bluetooth receiver more compact in physical dimensions
//    -8MHz option not tested or recommended for main head tracker, where more computational power is needed!
//    -when using 8MHz board remember to set proper "Board" target in Arduino IDE
//
// * Center/pause button improvements:
//    -improved button pressed routine in main loop with proper debouncing (BUTTON_DEBOUNCE_DELAY)
//     (I experienced weard calibration data corruption, which IMHO might have been linked to multiple button presses in short time) 
//    -bluetooth receiver now can send pause command (long button press)
//    -acknowledgment of button press implemented, so lost packet with button press can be retransmitted
//     (BLUETOOTH_RESEND_DELAY and BLUETOOTH_RESEND_COUNT)
//
// * Halt bluetooth stream to enable communication with GUI
//    -added feature that stops bluetooth communication and switches off bluetooth module when $VERS command is received,
//     (works parallel to existing way of disabling bluetooth by button press on powerup)
//
// * Fixed center pulse/servo position:
//    -it was 1450us instead of 1500us (DEAD_TIME changed from 800 to 900)
//    -in PPM stream pulse length correspondig to servo pulse length consist of DEAD_TIME + channel_value which is 3000digs
//     for neutral servo position of 1500us
//
// * Fixed negative PPM shift generation:
//    -it was broken due to bad Timer1 config in Timer1 interrupt routine
//
// * Putting the DIY Headtracker project on GitHub to facilitate future development
//-----------------------------------------------------------------------------

#include <Wire.h>
#include "config.h"
#include "functions.h"

#include <EEPROM.h>

#ifdef OPENAVRC
#include "OpenAVRc_BT.h"
#define BT_MSG_MAX_LENGTH      39
char BtMessage[BT_MSG_MAX_LENGTH + 1];
#endif

#include "sensors.h"
/*
  Channel mapping/config for PPM out:

  1 = PPM CHANNEL 1
  2 = PPM CHANNEL 2
  3 = PPM CHANNEL 3
  4 = PPM CHANNEL 4
  5 = PPM CHANNEL 5
  6 = PPM CHANNEL 6
  7 = PPM CHANNEL 7
  8 = PPM CHANNEL 8
  9 = PPM CHANNEL 9
  10 = PPM CHANNEL 10
  11 = PPM CHANNEL 11
  12 = PPM CHANNEL 12

  Mapping example:
  $123456789111CH
*/




// Local file variables
//
int frameNumber = 0;		    // Frame count since last debug serial output

char serial_data[128];          // Array for serial-data
unsigned char serial_index = 0; // How many bytes have been received?
char string_started = 0;        // Only saves data if string starts with right byte
char htdata_started = 0;        // Only saves data if string starts with right byte
unsigned char channel_mapping[13];

char outputMag = 0;             // Stream magnetometer data to host
char outputAcc = 0;             // Stream accelerometer data to host
char outputMagAcc = 0;          // Stream mag and accell data (for calibration on PC)
char outputTrack = 0;	          // Stream angle data to host
char outputDbg = 0;             // Stream debug data (call debugOutput() implemented in SensorsXXX to simplify development&debug
char outputChnl = 0;            // Stream channels output to use with GUI or Serial Plotter. Issue "$CHNLS" and "$CHNLE" command to start/stop outputs
// Keep track of button press
char buttonLastState = 0;           // 0 is not pressed, 1 is pressed
char buttonState = 0;           // 0 is not pressed, 1 is pressed
unsigned char buttonDownTime = 0;   // time of the press in 16ms units (16ms units used to spare memory)
unsigned char buttonDebounceTime = 0;  //the last time in 16ms units the output pin was toggled (16ms units used to spare memory)
char pauseToggled = 0;              // Used to make sure we toggle pause only once per hold
char ht_paused = 0;
char BTcenterAck = 1;          //set to 0 if waiting for response from BT headtracker to ackonowledge center command
char BTpauseAck = 1;           // set to 0 if waiting for response from BT headtracker to ackonowledge pause command
unsigned char BTresendDelay = 0;  //time in 16ms units after which command is resend due to lack of acknowledge received (16ms units used to spare memory)
char BTresendCnt = 0;    //how many times command should be resend, each time separated by BTresendDelay ms

char blinkLED = 0;  //blink the LED - used for debugging, set to 1 to blink, 0 to stop blinking
char blinkCounter = 0;

// External variables (defined in other files)
//
extern unsigned char PpmIn_PpmOut[13];
extern char read_sensors;
extern char resetValues;
extern char tiltInverse;
extern char rollInverse;
extern char panInverse;

// Settings (Defined in sensors.cpp)
//
extern float tiltRollBeta;
extern float panBeta;
extern float gyroWeightTiltRoll;
extern float GyroWeightPan;
extern int servoPanCenter;
extern int servoTiltCenter;
extern int servoRollCenter;
extern int panMaxPulse;
extern int panMinPulse;
extern int tiltMaxPulse;
extern int tiltMinPulse;
extern int rollMaxPulse;
extern int rollMinPulse;
extern float panFactor;
extern float tiltFactor;
extern float rollFactor;
extern unsigned char servoReverseMask;
extern unsigned char htChannels[];
extern float gyroOff[];
extern float magOffset[];
extern int accOffset[];
extern long channel_value[];
unsigned char bluetoothMode = BLUETOOTH_MODE_DISABLED;

// End settings

extern int I2CPresent;

int lastPan = 0;
int lastTilt = 0;

int btEnabled = 0;
char serialDataChar = ' ';

#ifdef BT_SOFTSERIAL

#if defined(__AVR_ATmega328P__)
#include <SoftwareSerial.h>
SoftwareSerial btSerial(7,8);// RX, TX use 57600 maxi
#endif
#if defined(__AVR_ATmega32U4__) 
HardwareSerial & btSerial = Serial1;// Only with Leonardo board
#endif

char btSerial_data[96];          // Array for serial-data
unsigned char btSerial_index = 0; // How many bytes have been received?
char btString_started = 0;
char btSerialDataChar = ' ';
#endif

//	  ****  Uncomment this section and other 'roll' sections to support roll axis over bluetoooth  ****
int	lastRoll= 0;
int newRoll = 0;


 //--------------------------------------------------------------------------------------
 // Func: setup
 // Desc: Called by Arduino framework at initialization time. This sets up pins for I/O,
 //       initializes sensors, etc.
 //--------------------------------------------------------------------------------------
void setup() {
    pinMode(9, OUTPUT);
    digitalWrite(2, HIGH);
    digitalWrite(3, HIGH);

    // Set all other pins to input, for safety.
    pinMode(0, INPUT);
    pinMode(1, INPUT);
    pinMode(2, INPUT);
    pinMode(3, INPUT);
    pinMode(6, INPUT);

#ifndef BT_SOFTSERIAL
    pinMode(7, INPUT);
    pinMode(8, INPUT);
#endif

#ifdef BT_DISABLE_BY_RESET_PIN  
    pinMode(BT_RESET_PIN, OUTPUT);    
    digitalWrite(BT_RESET_PIN, HIGH); //keep BT at reset
#else
// Gang two output pins together to power BT module which enables us to disable it and use USB serial for GUI    
    pinMode(BT_POWER_PIN_1, OUTPUT);
    pinMode(BT_POWER_PIN_2, OUTPUT);
    
    digitalWrite(BT_POWER_PIN_1, LOW);
    digitalWrite(BT_POWER_PIN_2, LOW);
#endif

    // Set button pin to input:
    pinMode(BUTTON_INPUT, INPUT);

    // Set internal pull-up resistor.
    digitalWrite(BUTTON_INPUT, HIGH);

    digitalWrite(0, LOW); // pull-down resistor
    digitalWrite(1, LOW);
    digitalWrite(2, HIGH);
    digitalWrite(3, HIGH);

    pinMode(ARDUINO_LED, OUTPUT);    // Arduino LED
    digitalWrite(ARDUINO_LED, HIGH);

#if FATSHARK_HT_MODULE
    pinMode(BUZZER, OUTPUT);         // Buzzer
    digitalWrite(BUZZER, HIGH);
#endif

#ifndef BT_SOFTSERIAL
    //If we start up whilst holding the button then we disable the BT so we can use the usb serial port
    if (digitalRead(BUTTON_INPUT) == 0) {
        btEnabled = 0;

        while (digitalRead(BUTTON_INPUT) == 0)  { // and wait for the button to be released
            delay(100);
        }
    } else btEnabled = 1;
#else
    btEnabled = 1;
#endif  

    // Give it time to be noticed, then turn it off.  Note: only use delay here. This won't work when Timer0 is repurposed later.
    delay(200);
    digitalWrite(ARDUINO_LED, LOW);

#if FATSHARK_HT_MODULE
    digitalWrite(BUZZER, LOW);
#endif

    // Start I2C
    Wire.begin();

    CheckI2CPresent();

    // If the device is being upgraded then store default bluetoothMode
    if (EEPROM.read(0) <= 10) {
        EEPROM.write(41, (unsigned char)bluetoothMode);
        EEPROM.write(0, 11);
    }

    // If the device have just been programmed, write initial config/values to EEPROM:
    if (EEPROM.read(0) != 11) {
        InitSensors();
        SaveSettings();
        SaveMagData();
        SaveAccelData();
    }

    // Get settings saved in EEPROM
    GetSettings();

    if (bluetoothMode == BLUETOOTH_MODE_DISABLED || btEnabled == 0) {
        Serial.begin(SERIAL_BAUD);
        // while the serial stream is not open, do nothing:
        while (!Serial);
    } else {
#ifdef BT_SOFTSERIAL
        Serial.begin(SERIAL_BAUD);
        // while the serial stream is not open, do nothing:
        while (!Serial);
        btSerial.begin(BLUETOOTH_SERIAL_BAUD);
#else
        Serial.begin(BLUETOOTH_SERIAL_BAUD);
        // while the serial stream is not open, do nothing:
        while (!Serial);
#endif

#ifdef BT_DISABLE_BY_RESET_PIN
        digitalWrite(BT_RESET_PIN, LOW); //unload reset pin of BT module
#else
        digitalWrite(BT_POWER_PIN_1, HIGH);
        digitalWrite(BT_POWER_PIN_2, HIGH);
#endif

#ifdef BT_HM10_HM11
        if (bluetoothMode != BLUETOOTH_MODE_DISABLED) {
          //delay(2000); // allow module to boot after powerup Note: only use delay here. This won't work when Timer0 is repurposed later.
          //Serial.println("AT+BAUD4"); // 57600
          /*            
          Query/Set Module Power
          Send Receive Parameter
          AT+POWE? OK+Get:[P1] None
          AT+ POWE [P1] OK+Set:[P1] P1: 0 ~ 3
          0: -23dbm
          1: -6dbm
          2: 0dbm
          3: 6dbm
          Default: 2
           */
          //Serial.println("AT+POWE2");          
        }
        if (bluetoothMode == BLUETOOTH_MODE_TRACKER) {
          //Serial.println("AT+ROLE1"); // sets HM-10 / HM-11 as main module, capable of autobind to another module running at default settings "AT+RENEW"
        }
#endif
    }

    // Start PWM interrupt if not sending tracker data over bluetooth
    if (bluetoothMode != BLUETOOTH_MODE_TRACKER) InitPWMInterrupt();
      InitTimerInterrupt();    // Start timer interrupt (for sensors and button press)

#ifdef OPENAVRC
    ppmEncoder.begin(4);
#endif
    
      
    if (bluetoothMode != BLUETOOTH_MODE_RECEIVER) {
        InitSensors();	// Initialize I2C sensors
        CalibrateMag();
        ResetCenter();
    }
    InitTimerInterrupt();    // Start timer interrupt (for sensors and button press)
}

//--------------------------------------------------------------------------------------
// Func: loop
// Desc: Called by the Arduino framework once per frame. Represents main program loop.
//--------------------------------------------------------------------------------------
void loop() {
    // Check input button for reset/pause request
    char buttonReading = (digitalRead(BUTTON_INPUT) == 0);
    if(buttonReading != buttonLastState) {
      buttonDebounceTime = 0;
      //buttonDownTime = 0;
    }

    if(buttonDebounceTime > BUTTON_DEBOUNCE_DELAY/16){
      if(buttonState != buttonReading){
        //change of button state
        buttonState = buttonReading;
        if(buttonState == 1){
            //button pressed - CENTER
          if (bluetoothMode == BLUETOOTH_MODE_RECEIVER && btEnabled == 1) {
#ifdef BT_SOFTSERIAL
            btSerial.write('^');
#else
            Serial.write('^');
#endif
            blinkLED = 0; //stop show occured retransmission, because next button command is issued
            blinkCounter = 0;
            
            BTcenterAck = 0;
            BTpauseAck = 1;
            BTresendDelay = 0;
            BTresendCnt = 0;
          }
          else {
            resetValues = 1; //center servos
          }
          buttonDownTime = 0;
          pauseToggled = 0;
          digitalWrite(ARDUINO_LED, HIGH);         
        }
        else {
          if(!blinkLED) digitalWrite(ARDUINO_LED, LOW);         
        }
      }
    }

    if (buttonState == 1 && !pauseToggled && buttonDownTime > BUTTON_HOLD_PAUSE_THRESH/16) {
            //button long pressed - PAUSE
        if (bluetoothMode == BLUETOOTH_MODE_RECEIVER && btEnabled == 1) {
#ifdef BT_SOFTSERIAL
          btSerial.write('*');
#else
          Serial.write('*');
#endif      
          blinkLED = 0; //stop show occured retransmission, because next button command is issued
          blinkCounter = 0;
               
          BTpauseAck = 0;
          BTcenterAck = 1;
          BTresendDelay = 0;
          BTresendCnt = 0;
        }  
        else{
          ht_paused = !ht_paused;
          resetValues = 1;
        }
        pauseToggled = 1;
    }
    
    buttonLastState = buttonReading;    

    //check if needed to resend command
    if (bluetoothMode == BLUETOOTH_MODE_RECEIVER  && btEnabled == 1) {
      if(BTcenterAck == 0 && BTresendDelay > BLUETOOTH_RESEND_DELAY/16 && BTresendCnt < BLUETOOTH_RESEND_COUNT) {
        BTresendCnt += 1;
        blinkLED = 1; //show the world that retransmission occured
        BTresendDelay = 0;
#ifdef BT_SOFTSERIAL
          btSerial.write('^');
#else
          Serial.write('^');
#endif  
      }      
      if(BTpauseAck == 0 && BTresendDelay > BLUETOOTH_RESEND_DELAY/16 && BTresendCnt < BLUETOOTH_RESEND_COUNT) {
        BTresendCnt += 1;
        blinkLED = 1; //show the world that retransmission occured
        BTresendDelay = 0;
#ifdef BT_SOFTSERIAL
          btSerial.write('*');
#else
          Serial.write('*');
#endif  
      }
    }

#ifdef BT_SOFTSERIAL      //  ****  SoftwareSerial receiver data process  ***
    if (btEnabled == 1 && bluetoothMode == BLUETOOTH_MODE_RECEIVER && btSerial.available()) {
        btSerialDataChar = btSerial.read();

        //TO DO : routine for '^' and '*' commands
        
        if (btSerialDataChar == '%') {
            btString_started = 0;
            htdata_started = 1;
            btSerial_index = 0;
        } else if (htdata_started == 1) {
            if (btSerialDataChar == 'T') { // If data is "T" then this is TILT value.
                if (btSerial_index > 3)	{ // make sure we have at least four digits of data
                    btSerial_index--;			// step pointer back

                    // process the checksum character

                    int cs = int(btSerial_data[btSerial_index]);

                    int sum = int(btSerial_data[0]) + int(btSerial_data[1]) + int(btSerial_data[2]) - 144;

                    if (btSerial_index > 3) sum += int(btSerial_data[3]) - 48;

                    sum += 40;

                    if (cs == sum) {
                        btSerial_data[btSerial_index] = '\n';
                        String ss = String(btSerial_data);

                        channel_value[htChannels[1]] = ss.toInt();

                        //    Serial.print("T"+ss);
                    }
                    /*  else
                      Serial.println("CHECKSUM ERROR"); */
                }

                btSerial_index = 0;
                htdata_started = 0;
            } 
            else if (btSerialDataChar == 'P') {// If data is  'P' then this is PAN value;
                if (btSerial_index > 3) {
                    btSerial_index--;

                    int cs = int(btSerial_data[btSerial_index]);

                    int sum = int(btSerial_data[0]) + int(btSerial_data[1]) + int(btSerial_data[2]) - 144;

                    if (btSerial_index > 3) sum += int(btSerial_data[3]) - 48;

                    sum += 40;

                    if (cs == sum) {
                        btSerial_data[btSerial_index] = '\n';
                        String ss = String(btSerial_data);

                        channel_value[htChannels[0]] = ss.toInt();

                        // Serial.print("P"+ ss);
                    }
                    /* else
                      Serial.println("CHECKSUM ERROR");*/
                }

                btSerial_index = 0;
                htdata_started = 0;
            }
/*	  ****  Uncomment to support roll axis over bluetoooth  ****
            else if (btSerialDataChar == 'R') { // If data is  'R' then this is ROLL value;
                if (btSerial_index > 3) {
                    btSerial_index--;

                    int cs = int(btSerial_data[btSerial_index]);

                    int sum = int(btSerial_data[0]) + int(btSerial_data[1]) + int(btSerial_data[2]) - 144;

                    if (btSerial_index > 3) sum += int(btSerial_data[3]) - 48;

                    sum += 40;

                    if (cs == sum) {
                        btSerial_data[btSerial_index] = '\n';
                        String ss = String(btSerial_data);
                        channel_value[htChannels[2]] = ss.toInt();
                    }
                }

                btSerial_index = 0;
                htdata_started = 0;
            }
*/
            else if (isDigit(btSerialDataChar)) {
                btSerial_data[btSerial_index++] = btSerialDataChar;
            }
            else {
                btSerial_index = 0;
                htdata_started = 0;
            }
        }
    }
#endif
    //
    // All this is used for communication with GUI or tracker sending data over bluetooth
    //
    if (Serial.available()) {
        serialDataChar = Serial.read();
        //Serial.print(serialDataChar);

        if (serialDataChar == '$') {
            string_started = 1;
            htdata_started = 0;
            serial_index = 0;
        }

        else if (serialDataChar == '^') {//  remote button pressed - center
            string_started = 0;
            htdata_started = 0;
            serial_index = 0;
            resetValues = 1;
            if(bluetoothMode == BLUETOOTH_MODE_RECEIVER) {
              BTcenterAck = 1;  //set ackonwledgement received flag
            }
            if(bluetoothMode == BLUETOOTH_MODE_TRACKER && btEnabled == 1) {
              Serial.write('^'); //send acknowledgement
            }            
        }

        else if (serialDataChar == '*') {//  remote button long pressed - pause
            string_started = 0;
            htdata_started = 0;
            serial_index = 0;
            ht_paused = !ht_paused;
            resetValues = 1;
            if(bluetoothMode == BLUETOOTH_MODE_RECEIVER) {
              BTpauseAck = 1;  //set ackonwledgement received flag
            }
            if(bluetoothMode == BLUETOOTH_MODE_TRACKER  && btEnabled == 1) {
              Serial.write('*'); //send acknowledgement
            }
        }

        else if (serialDataChar == '%' && bluetoothMode == BLUETOOTH_MODE_RECEIVER) {
            string_started = 0;
            htdata_started = 1;
            serial_index = 0;
        }

        else if (string_started == 1) {
            // Read incoming byte
            serial_data[serial_index++] = serialDataChar;

            // If string ends with "CH" it's channel configuration, that have been received.
            // String must always be 12 chars/bytes and ending with CH to be valid.
            if (serial_index == 14 && serial_data[serial_index - 2] == 'C' && serial_data[serial_index - 1] == 'H') {
                // To keep it simple, we will not let the channels be 0-initialized, but
                // start from 1 to match actual channels.
                for (unsigned char i = 0; i < 13; i++) {
                    channel_mapping[i + 1] = serial_data[i] - 48;

                    // Update the dedicated PPM-in -> PPM-out array for faster performance.
                    if ((serial_data[i] - 48) < 14) {
                        PpmIn_PpmOut[serial_data[i] - 48] = i + 1;
                    }
                }

                Serial.println("Channel mapping received");

                // Reset serial_index and string_started
                serial_index = 0;
                string_started = 0;
            }

            // Configure headtracker
            else if (IsCommand("HE")) {
                // HT parameters are passed in from the PC in this order:
                //
                // 0 tiltRollBeta
                // 1 panBeta
                // 2 gyroWeightTiltRoll
                // 3 GyroWeightPan
                // 4 tiltFactor
                // 5 panFactor
                // 6 rollFactor
                // 7 servoReverseMask
                // 8 servoPanCenter
                // 9 panMinPulse
                // 10 panMaxPulse
                // 11 servoTiltCenter
                // 12 tiltMinPulse
                // 13 tiltMaxPulse
                // 14 servoRollCenter
                // 15 rollMinPulse
                // 16 rollMaxPulse
                // 17 htChannels[0]  // pan
                // 18 htChannels[1]  // tilt
                // 19 htChannels[2]  // roll
                // 20 bluetoothMode

                // Parameters from the PC client need to be scaled to match our local
                // expectations
                if (btEnabled == 0) Serial.println("HT config received:");

                int valuesReceived[22] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
                int comma_index = 0;

                for (unsigned char k = 0; k < serial_index - 2; k++) {
                    // Looking for comma
                    if (serial_data[k] == 44) {
                        comma_index++;
                    } else if( (serial_data[k]>47) && (serial_data[k]<58) ){
                        valuesReceived[comma_index] = valuesReceived[comma_index] * 10 + (serial_data[k] - 48);
                    }
                }

                tiltRollBeta = (float)valuesReceived[0] / 100;
                panBeta = (float)valuesReceived[1] / 100;
                gyroWeightTiltRoll = (float)valuesReceived[2] / 100;
                GyroWeightPan = (float)valuesReceived[3] / 100;
                tiltFactor = (float)valuesReceived[4] / 10;
                panFactor = (float)valuesReceived[5] / 10;
                rollFactor = (float)valuesReceived[6] / 10;

                servoReverseMask = (unsigned char)valuesReceived[7];

                tiltInverse = 1;
                rollInverse = 1;
                panInverse = 1;

                if ((servoReverseMask & HT_PAN_REVERSE_BIT) != 0) panInverse = -1;
                if ((servoReverseMask & HT_ROLL_REVERSE_BIT) != 0) rollInverse = -1;
                if ((servoReverseMask & HT_TILT_REVERSE_BIT) != 0) tiltInverse = -1;

                servoPanCenter = valuesReceived[8];
                panMinPulse = valuesReceived[9];
                panMaxPulse = valuesReceived[10];

                servoTiltCenter = valuesReceived[11];
                tiltMinPulse = valuesReceived[12];
                tiltMaxPulse = valuesReceived[13];

                servoRollCenter = valuesReceived[14];
                rollMinPulse = valuesReceived[15];
                rollMaxPulse = valuesReceived[16];

                htChannels[0] = valuesReceived[17];
                htChannels[1] = valuesReceived[18];
                htChannels[2] = valuesReceived[19];
                bluetoothMode = valuesReceived[20];

                SaveSettings();

                serial_index = 0;
                string_started = 0;
            } // end configure headtracker

            // Debug info
            else if (IsCommand("DEBUG")) {
                DebugOutput();
                serial_index = 0;
                string_started = 0;
            }

            // Firmware version requested
            else if (IsCommand("VERS")) {
                Serial.print("FW: ");
                Serial.println(FIRMWARE_VERSION_FLOAT, 2);
                serial_index = 0;
                string_started = 0;
#ifndef BT_SOFTSERIAL 
                //"VERS" is one of the first commands issued by GUI software, so we will disable bluetooth data stream to not interfer with the GUI<->BT communication. Note that You will need to reset HT to enable bluetooth again
                //Please note that holding the button during powerup will also disable bluetooth. This is yet another approach, which doesn't required forward thinking from the user.
                //Will work only if BLUETOOTH_SERIAL_BAUD == SERIAL_BAUD
                if(btEnabled == 1 && BLUETOOTH_SERIAL_BAUD == SERIAL_BAUD){
                  btEnabled=0;
#ifdef BT_DISABLE_BY_RESET_PIN
                  digitalWrite(BT_RESET_PIN, HIGH);
#else
                  digitalWrite(BT_POWER_PIN_1, LOW);
                  digitalWrite(BT_POWER_PIN_2, LOW);
#endif
                }    
#endif
            }
            
            // Hardmware version requested
            else if (IsCommand("HARD")) {
                Serial.print("HW: ");
                Serial.println(SENSOR_NAME);
                serial_index = 0;
                string_started = 0;
            }

            // Stop any data stream commands (leave all aliases for compatibility
            else if (IsCommand("CMAE") || IsCommand("CAEN") || IsCommand("GREN") || IsCommand("PLEN") ) {
                outputMagAcc = 0;
                outputMag = 0;
                outputTrack = 0;
                outputAcc = 0;
                outputDbg = 0;
                outputChnl = 0;
                serial_index = 0;
                string_started = 0;
            }

            // Start mag and accel data stream
            else if (IsCommand("CMAS")) {
                outputMagAcc = 1;
                outputMag = 0;
                outputAcc = 0;
                outputTrack = 0;
                outputDbg = 0;
                outputChnl = 0;
                serial_index = 0;
                string_started = 0;
            }

            // Start magnetometer data stream
            else if (IsCommand("CAST")) {
                outputMag = 1;
                outputMagAcc = 0;
                outputAcc = 0;
                outputTrack = 0;
                outputDbg = 0;
                outputChnl = 0;
                serial_index = 0;
                string_started = 0;
            }

            // Start accelerometer data stream
            else if (IsCommand("GRAV")) {
                outputAcc = 1;
                outputMagAcc = 0;
                outputMag = 0;
                outputTrack = 0;
                outputDbg = 0;
                outputChnl = 0;
                serial_index = 0;
                string_started = 0;
            }

            // Start tracking data stream
            else if (IsCommand("PLST")) {
                outputTrack = 1;
                outputMagAcc = 0;
                outputMag = 0;
                outputAcc = 0;
                outputDbg = 0;
                outputChnl = 0;
                serial_index = 0;
                string_started = 0;
            }

            // Start dbg output
            else if (IsCommand("DBGS")) {
                outputMagAcc = 0;
                outputMag = 0;
                outputAcc = 0;
                outputDbg = 1;
                outputChnl = 0;
                outputTrack = 0;
                serial_index = 0;
                string_started = 0;
            }

            // Start channels output
            else if (IsCommand("CHNLS")) {
                outputMagAcc = 0;
                outputMag = 0;
                outputAcc = 0;
                outputDbg = 0;
                outputChnl = 1;
                outputTrack = 0;
                serial_index = 0;
                string_started = 0;
            }
            // Save RAM settings to EEPROM
            else if (IsCommand("SAVE")) {
                SaveSettings();
                serial_index = 0;
                string_started = 0;
            }

            // Calibrate gyro
            else if (IsCommand("CALG")) {
                SetGyroOffset();
                SaveSettings();

                Serial.print("Gyro offset measured:");
                Serial.print(gyroOff[0]);
                Serial.print(",");
                Serial.print(gyroOff[1]);
                Serial.print(",");
                Serial.println(gyroOff[2]);

                serial_index = 0;
                string_started = 0;
            }

            // Store magnetometer offset
            else if (IsCommand("MAG")) {
                int valuesReceived[5] = { 0, 0, 0, 0, 0 };
                int comma_index = 0;

                for (unsigned char k = 0; k < serial_index - 3; k++) {
                    // Looking for comma
                    if (serial_data[k] == 44) {
                        comma_index++;
                    } else {
                        valuesReceived[comma_index] = valuesReceived[comma_index] * 10 + (serial_data[k] - 48);
                    }
                }

                // Y and Z are swapped on purpose.
#ifdef SENSOR_QMC5883 // NEB
                magOffset[0] = valuesReceived[0] - 20000;  // (NEB) Here I don't understood but works!
                magOffset[1] = valuesReceived[2] - 20000;
                magOffset[2] = valuesReceived[1] - 20000;
#else
                magOffset[0] = valuesReceived[0] - 2000;
                magOffset[1] = valuesReceived[2] - 2000;
                magOffset[2] = valuesReceived[1] - 2000;
#endif   
                serial_index = 0;
                string_started = 0;

                SaveMagData();
            }

            // Store accelerometer offset
            else if (IsCommand("ACC")) {
                int valuesReceived[5] = { 0, 0, 0, 0, 0 };
                int comma_index = 0;
                for (unsigned char k = 0; k < serial_index - 3; k++) {
                    // Looking for comma
                    if (serial_data[k] == 44) {
                        comma_index++;
                    } else {
                        valuesReceived[comma_index] = valuesReceived[comma_index] * 10 + (serial_data[k] - 48);
                    }
                }

                accOffset[0] = valuesReceived[0] - 2000;
                accOffset[1] = valuesReceived[1] - 2000;
                accOffset[2] = valuesReceived[2] - 2000;

                serial_index = 0;
                string_started = 0;

                SaveAccelData();
            }

            // Retrieve settings
            else if (IsCommand("GSET")) {
                // Get Settings. Scale our local values to real-world values usable on the PC side.
                Serial.print("$SET$"); // something recognizable in the stream

                SendSettings();

                Serial.println("Settings Retrieved");

                serial_index = 0;
                string_started = 0;
            } else if (serial_index > 120) {
              Serial.println("Line is too long");
                // If more than 120 bytes have been received, the string is not valid.
                // Reset and "try again" (wait for $ to indicate start of new string).
                serial_index = 0;
                string_started = 0;
            }
        }
#ifndef BT_SOFTSERIAL     // **  Hardware serial port receiver data process...  ***
        else if (htdata_started == 1) {
            if (serialDataChar == 'T') { // If data is "T" then this is TILT value.
                if (serial_index > 2) {
                    serial_data[serial_index] = '\n';
                    String ss = String(serial_data);

                    channel_value[htChannels[1]] = ss.toInt();
                }

                serial_index = 0;
                htdata_started = 0;
            } else if (serialDataChar == 'P') {// If data is  'P' then this is PAN value;
                if (serial_index > 2) {
                    serial_data[serial_index] = '\n';
                    String ss = String(serial_data);

                    channel_value[htChannels[0]] = ss.toInt();
                }

                serial_index = 0;
                htdata_started = 0;
            }
            /*	  ****  Uncomment to support roll axis over bluetoooth  ****
                    else if (serialDataChar == 'R') // If data is  'R' then this is ROLL value;
                  {
                    if (serial_index > 2)
                    {
                      serial_data[serial_index] = '\n';
                      String ss = String(serial_data);

                      channel_value[htChannels[2]] = ss.toInt();
                    }

                    serial_index = 0;
                    htdata_started = 0;
                  }*/
            else if (isDigit(serialDataChar))
                serial_data[serial_index++] = serialDataChar;
            else {
                serial_index = 0;
                htdata_started = 0;
            }
        }
#endif
    }

    // ************************* end of serial port input   ****************************

    // if "read_sensors" flag is set high, read sensors and update
    if (read_sensors == 1 && ht_paused == 0 && bluetoothMode != BLUETOOTH_MODE_RECEIVER) {
        UpdateSensors();
        GyroCalc();
        AccelCalc();
        MagCalc();
        FilterSensorData();

        if (bluetoothMode == BLUETOOTH_MODE_TRACKER && btEnabled == 1) {

            int newPan = channel_value[htChannels[0]];

            if (abs(lastPan - newPan) > 5) {
#ifdef BT_SOFTSERIAL
                //calculate checksum
                String ss = String(newPan);

                int sum = int(ss[0]) + int(ss[1]) + int(ss[2]) - 144;
                if (newPan > 999)
                    sum += int(ss[3]) - 48;

                sum += 40;

                btSerial.write('%');
                btSerial.print(newPan);
                btSerial.write(sum);
                btSerial.write('P');
#else
                Serial.write('%');
                Serial.print(newPan);
                Serial.write('P');
#endif

                lastPan = newPan;
                //ppmOut[5] = newPan;
            }

            int newTilt = channel_value[htChannels[1]];
            if (abs(lastTilt - newTilt) > 5) {

#ifdef BT_SOFTSERIAL

                String ss = String(newTilt);
                int sum = int(ss[0]) + int(ss[1]) + int(ss[2]) - 144;

                if (newTilt > 999)
                    sum += int(ss[3]) - 48;

                sum += 40;

                btSerial.write('%');
                btSerial.print(newTilt);
                btSerial.write(sum);
                btSerial.write('T');
#else
                Serial.write('%');
                Serial.print(newTilt);
                Serial.write('T');
#endif

                lastTilt = newTilt;
                //ppmOut[6] = newTilt;
                
            }
// ****  Uncomment to support roll axis over bluetoooth  ****
            int newRoll = channel_value[htChannels[2]];
            if (abs(lastRoll - newRoll) > 5) {
#ifdef BT_SOFTSERIAL
                String ss = String(newRoll);
                int sum = int(ss[0]) + int(ss[1]) + int(ss[2]) - 144;

                if (newRoll > 999) sum += int(ss[3]) - 48;
                sum += 40;

                btSerial.write('%');
                btSerial.print(newRoll);
                btSerial.write(sum);
                btSerial.write('R');
#else
                Serial.write('%');
                Serial.print(newRoll);
                Serial.write('R');
#endif
                lastRoll = newRoll;
                //ppmOut[7] = newRoll;
            }

        }

#ifndef BT_SOFTSERIAL
        else
#endif

        {
            // Only output this data every X frames - for debug purposes

            if (frameNumber++ >= SERIAL_OUTPUT_FRAME_INTERVAL) {
                if (outputTrack == 1) {
                    trackerOutput();
                } else if (outputMagAcc == 1) {
                    calMagAccOutput();
                } else if (outputMag == 1) {
                    calMagOutput();
                } else if (outputAcc == 1) {
                    calAccOutput();
                } else if (outputDbg == 1) {
                    dbgOutput();
                } else if (outputChnl == 1) {
                    chnlOutput();
                }
                frameNumber = 0;
            }
        }

        // Will first update read_sensors when everything is done.
        read_sensors = 0;
    }
    
#ifdef OPENAVRC
// bloque HeadTrackerGUI.exe
//  Serial.print(ppmOut[5]);
//  Serial.print("\t");Serial.print(ppmOut[6]);
//  Serial.print("\t");Serial.println(ppmOut[7]);
#ifdef BT_SOFTSERIAL
  BT_Send_Channels();
#else
  ppmEncoder.setChannel(5, ppmOut[5]);
  ppmEncoder.setChannel(6, ppmOut[6]);
  ppmEncoder.setChannel(7, ppmOut[7]);
#endif
#endif     
}// end loop


void chnlOutput() {
    Serial.print(channel_value[htChannels[1]]); // Tilt 
    Serial.print(",");
    Serial.print(channel_value[htChannels[2]]); // Roll
    Serial.print(",");
    Serial.println(channel_value[htChannels[0]]); // Pan 
}

//--------------------------------------------------------------------------------------
// Check if current line ends with specified command 
//--------------------------------------------------------------------------------------
bool IsCommand(String command) {
    // Ensure we read enough characters
    int cLength = command.length();
    if( cLength > serial_index ) return false;
    // ..and then check characters one by one
    for (int i = 0; i < cLength; i++) {
         if (serial_data[serial_index - cLength + i ] != command.charAt(i)) return false;
    }
    return true;
}

//--------------------------------------------------------------------------------------
// Check if current line ends with command string.
//--------------------------------------------------------------------------------------
void SendSettings() {
    Serial.print(tiltRollBeta * 100);
    Serial.print(",");
    Serial.print(panBeta * 100);
    Serial.print(",");
    Serial.print(gyroWeightTiltRoll * 100);
    Serial.print(",");
    Serial.print(GyroWeightPan * 100);
    Serial.print(",");
    Serial.print(tiltFactor * 10);
    Serial.print(",");
    Serial.print(panFactor * 10);
    Serial.print(",");
    Serial.print(rollFactor * 10);
    Serial.print(",");
    Serial.print(servoReverseMask);
    Serial.print(",");
    Serial.print(servoPanCenter);
    Serial.print(",");
    Serial.print(panMinPulse);
    Serial.print(",");
    Serial.print(panMaxPulse);
    Serial.print(",");
    Serial.print(servoTiltCenter);
    Serial.print(",");
    Serial.print(tiltMinPulse);
    Serial.print(",");
    Serial.print(tiltMaxPulse);
    Serial.print(",");
    Serial.print(servoRollCenter);
    Serial.print(",");
    Serial.print(rollMinPulse);
    Serial.print(",");
    Serial.print(rollMaxPulse);
    Serial.print(",");
    Serial.print(htChannels[0]);
    Serial.print(",");
    Serial.print(htChannels[1]);
    Serial.print(",");
    Serial.print(htChannels[2]);
    Serial.print(",");
    Serial.println(bluetoothMode);

}


//--------------------------------------------------------------------------------------
// Func: SaveSettings
// Desc: Saves device settings to EEPROM for retrieval at boot-up.
//--------------------------------------------------------------------------------------
void SaveSettings() {
    EEPROM.write(1, (unsigned char)(tiltRollBeta * 100));
    EEPROM.write(2, (unsigned char)(panBeta * 100));
    EEPROM.write(3, (unsigned char)(gyroWeightTiltRoll * 100));
    EEPROM.write(4, (unsigned char)(GyroWeightPan * 100));

    EEPROM.write(5, (unsigned char)servoReverseMask);

    // 6 unused

    EEPROM.write(7, (unsigned char)servoPanCenter);
    EEPROM.write(8, (unsigned char)(servoPanCenter >> 8));

    EEPROM.write(9, (unsigned char)(tiltFactor * 10));
    EEPROM.write(10, (int)((tiltFactor * 10)) >> 8);

    EEPROM.write(11, (unsigned char)(panFactor * 10));
    EEPROM.write(12, (int)((panFactor * 10)) >> 8);

    EEPROM.write(13, (unsigned char)(rollFactor * 10));
    EEPROM.write(14, (int)((rollFactor * 10)) >> 8);

    // 15 unused

    EEPROM.write(16, (unsigned char)servoTiltCenter);
    EEPROM.write(17, (unsigned char)(servoTiltCenter >> 8));

    EEPROM.write(18, (unsigned char)servoRollCenter);
    EEPROM.write(19, (unsigned char)(servoRollCenter >> 8));


    EEPROM.write(20, (unsigned char)panMaxPulse);
    EEPROM.write(21, (unsigned char)(panMaxPulse >> 8));

    EEPROM.write(22, (unsigned char)panMinPulse);
    EEPROM.write(23, (unsigned char)(panMinPulse >> 8));

    EEPROM.write(24, (unsigned char)tiltMaxPulse);
    EEPROM.write(25, (unsigned char)(tiltMaxPulse >> 8));

    EEPROM.write(26, (unsigned char)tiltMinPulse);
    EEPROM.write(27, (unsigned char)(tiltMinPulse >> 8));

    EEPROM.write(28, (unsigned char)rollMaxPulse);
    EEPROM.write(29, (unsigned char)(rollMaxPulse >> 8));

    EEPROM.write(30, (unsigned char)rollMinPulse);
    EEPROM.write(31, (unsigned char)(rollMinPulse >> 8));

    EEPROM.write(32, (unsigned char)htChannels[0]);
    EEPROM.write(33, (unsigned char)htChannels[1]);
    EEPROM.write(34, (unsigned char)htChannels[2]);

    // Saving gyro calibration values
    int temp = (int)(gyroOff[0] + 500.5);
    EEPROM.write(35, (unsigned char)temp);
    EEPROM.write(36, (unsigned char)(temp >> 8));

    temp = (int)(gyroOff[1] + 500.5);
    EEPROM.write(37, (unsigned char)temp);
    EEPROM.write(38, (unsigned char)(temp >> 8));

    temp = (int)(gyroOff[2] + 500.5);
    EEPROM.write(39, (unsigned char)temp);
    EEPROM.write(40, (unsigned char)(temp >> 8));

    EEPROM.write(41, (unsigned char)bluetoothMode);

    // Mark the memory to indicate that it has been
    // written. Used to determine if board is newly flashed
    // or not.
    EEPROM.write(0, 11);

    Serial.println("Settings saved");
}

//--------------------------------------------------------------------------------------
// Func: GetSettings
// Desc: Retrieves device settings from EEPROM.
//--------------------------------------------------------------------------------------
void GetSettings() {
    tiltRollBeta = (float)EEPROM.read(1) / 100;
    panBeta = (float)EEPROM.read(2) / 100;
    gyroWeightTiltRoll = (float)EEPROM.read(3) / 100;
    GyroWeightPan = (float)EEPROM.read(4) / 100;

    tiltInverse = 1;
    rollInverse = 1;
    panInverse = 1;

    unsigned char temp = EEPROM.read(5);
    if (temp & HT_TILT_REVERSE_BIT) {
        tiltInverse = -1;
    }
    if (temp & HT_ROLL_REVERSE_BIT) {
        rollInverse = -1;
    }
    if (temp & HT_PAN_REVERSE_BIT) {
        panInverse = -1;
    }

    // 6 unused

    servoPanCenter = EEPROM.read(7) + (EEPROM.read(8) << 8);
    tiltFactor = (float)(EEPROM.read(9) + (EEPROM.read(10) << 8)) / 10;
    panFactor = (float)(EEPROM.read(11) + (EEPROM.read(12) << 8)) / 10;
    rollFactor = (float)(EEPROM.read(13) + (EEPROM.read(14) << 8)) / 10;

    // 15 unused

    servoTiltCenter = EEPROM.read(16) + (EEPROM.read(17) << 8);
    servoRollCenter = EEPROM.read(18) + (EEPROM.read(19) << 8);

    panMaxPulse = EEPROM.read(20) + (EEPROM.read(21) << 8);
    panMinPulse = EEPROM.read(22) + (EEPROM.read(23) << 8);

    tiltMaxPulse = EEPROM.read(24) + (EEPROM.read(25) << 8);
    tiltMinPulse = EEPROM.read(26) + (EEPROM.read(27) << 8);

    rollMaxPulse = EEPROM.read(28) + (EEPROM.read(29) << 8);
    rollMinPulse = EEPROM.read(30) + (EEPROM.read(31) << 8);

    htChannels[0] = EEPROM.read(32);
    htChannels[1] = EEPROM.read(33);
    htChannels[2] = EEPROM.read(34);

    gyroOff[0] = EEPROM.read(35) + (EEPROM.read(36) << 8) - 500;
    gyroOff[1] = EEPROM.read(37) + (EEPROM.read(38) << 8) - 500;
    gyroOff[2] = EEPROM.read(39) + (EEPROM.read(40) << 8) - 500;

    magOffset[0] = EEPROM.read(200) + (EEPROM.read(201) << 8) - 2000;
    magOffset[1] = EEPROM.read(202) + (EEPROM.read(203) << 8) - 2000;
    magOffset[2] = EEPROM.read(204) + (EEPROM.read(205) << 8) - 2000;

    accOffset[0] = EEPROM.read(206) + (EEPROM.read(207) << 8) - 2000;
    accOffset[1] = EEPROM.read(208) + (EEPROM.read(209) << 8) - 2000;
    accOffset[2] = EEPROM.read(210) + (EEPROM.read(211) << 8) - 2000;

    bluetoothMode = EEPROM.read(41);

#if (DEBUG)
    DebugOutput();
#endif
}

//--------------------------------------------------------------------------------------
// Func: SaveMagData
// Desc: Stores magnetometer calibration info to EEPROM.
//--------------------------------------------------------------------------------------
void SaveMagData() {
    int temp = (int)(magOffset[0] + 2000);
    EEPROM.write(200, (unsigned char)temp);
    EEPROM.write(201, (unsigned char)(temp >> 8));

    temp = (int)(magOffset[1] + 2000);
    EEPROM.write(202, (unsigned char)temp);
    EEPROM.write(203, (unsigned char)(temp >> 8));

    temp = (int)(magOffset[2] + 2000);
    EEPROM.write(204, (unsigned char)temp);
    EEPROM.write(205, (unsigned char)(temp >> 8));

    Serial.print("Saving Mag offset: ");
    Serial.print(magOffset[0]);
    Serial.print(", ");
    Serial.print(magOffset[1]);
    Serial.print(", ");
    Serial.println(magOffset[2]);
}

//--------------------------------------------------------------------------------------
// Func: SaveAccelData
// Desc: Stores accelerometer calibration data to EEPOM.
//--------------------------------------------------------------------------------------
void SaveAccelData() {
    int temp = (int)(accOffset[0] + 2000);
    EEPROM.write(206, (unsigned char)temp);
    EEPROM.write(207, (unsigned char)(temp >> 8));

    temp = (int)(accOffset[1] + 2000);
    EEPROM.write(208, (unsigned char)temp);
    EEPROM.write(209, (unsigned char)(temp >> 8));

    temp = (int)(accOffset[2] + 2000);
    EEPROM.write(210, (unsigned char)temp);
    EEPROM.write(211, (unsigned char)(temp >> 8));

    Serial.print("Saving Acc offset: ");
    Serial.print(accOffset[0]);
    Serial.print(",");
    Serial.print(accOffset[1]);
    Serial.print(",");
    Serial.println(accOffset[2]);
}

//--------------------------------------------------------------------------------------
// Func: DebugOutput
// Desc: Outputs useful device/debug information to the serial port.
//--------------------------------------------------------------------------------------
void DebugOutput() {
    Serial.println();
    Serial.println("------ Debug info------");

    Serial.print("FW Version: ");
    Serial.println(FIRMWARE_VERSION_FLOAT, 2);

    Serial.print("Sensor: ");
    Serial.println(SENSOR_NAME);

    Serial.print("BT Mode: ");
    Serial.println(bluetoothMode);

    Serial.print("tiltRollBeta: ");
    Serial.println(tiltRollBeta);

    Serial.print("panBeta: ");
    Serial.println(panBeta);

    Serial.print("gyroWeightTiltRoll: ");
    Serial.println(gyroWeightTiltRoll);

    Serial.print("GyroWeightPan: ");
    Serial.println(GyroWeightPan);

    Serial.print("servoPanCenter: ");
    Serial.println(servoPanCenter);

    Serial.print("servoTiltCenter: ");
    Serial.println(servoTiltCenter);

    Serial.print("servoRollCenter: ");
    Serial.println(servoRollCenter);

    Serial.print("tiltFactor: ");
    Serial.println(tiltFactor);

    Serial.print("panFactor: ");
    Serial.println(panFactor);

    Serial.print("Gyro offset: ");
    Serial.print(gyroOff[0]);
    Serial.print(",");
    Serial.print(gyroOff[1]);
    Serial.print(",");
    Serial.println(gyroOff[2]);

    Serial.print("Mag offset: ");
    Serial.print(magOffset[0]);
    Serial.print(",");
    Serial.print(magOffset[1]);
    Serial.print(",");
    Serial.println(magOffset[2]);

    Serial.print("Acc offset: ");
    Serial.print(accOffset[0]);
    Serial.print(",");
    Serial.print(accOffset[1]);
    Serial.print(",");
    Serial.println(accOffset[2]);

    SensorInfoPrint();
}


#ifdef OPENAVRC
#ifdef BT_SOFTSERIAL
int16_t mini = 2000,maxi;
void BT_Send_Channels()
{
  char txt;
  uint8_t ComputedCheckSum = 0;
  String bt;
  
  //btSerial.print(F("tf "));
  bt += "tf ";
    
  for(uint8_t Idx = 0; Idx < NUM_TRAINER; Idx++)
  {

   //btSerial.print(F('s'));
   bt += "s";
   int16_t value = (FULL_CHANNEL_OUTPUTS(Idx))/2; // +-1280 to +-640
   value += ppmOut[Idx];//PPM_CENTER; // + 1500 offset
   ComputedCheckSum ^= 's';
   value <<= 4;
   for(uint8_t j = 12; j ; j-=4)
    {
     txt = BIN_NBL_TO_HEX_DIGIT((value>>j) & 0x0F);
     bt += (String)txt;
     ComputedCheckSum ^= txt;
     //btSerial.print(txt);
    }
  }

  //btSerial.print(F(':'));
  bt += ":";
  txt = BIN_NBL_TO_HEX_DIGIT(ComputedCheckSum>>4 & 0x0F);
  bt += (String)txt;
  //btSerial.print(txt);
  txt = BIN_NBL_TO_HEX_DIGIT(ComputedCheckSum & 0x0F);
  bt += (String)txt;
  //btSerial.println(txt);

  Serial.println(bt);
//  Serial.print(ppmOut[5]);
//  Serial.print("\t");Serial.print(ppmOut[6]);
//  Serial.print("\t");Serial.println(ppmOut[7]);

//#define DEBUG_OPENAVRC
#ifdef DEBUG_OPENAVRC
  //Serial.print(bt);
  int bt_len = bt.length() + 1;
  bt.toCharArray(BtMessage, bt_len);
  
  //check BT message send
  uint8_t RxChks, ComputedChks;
  ComputedChks = 0;
  for(uint8_t Idx = 0; Idx < (8 * 4); Idx++) // Il y a 8 voies et chaque voie fait 4 caractères ->
  {
    ComputedChks ^= BtMessage[3 + Idx]; // On commence après un offset de 3 caracteres (apres "tf ")
  }
  RxChks = (uint8_t)strtol(BtMessage + 3 + (8 * 4) + 1, NULL, 16);
  if(RxChks == ComputedChks)
  {
    Serial.println(F(" OK"));
  }
  else
  {
    Serial.println(F(" Bad"));
  }
#endif   
}
#endif 
#endif
