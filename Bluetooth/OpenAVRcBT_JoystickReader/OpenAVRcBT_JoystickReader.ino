
/*
**************************************************************************
*                                                                        *
*                 ____                ___ _   _____                      *
*                / __ \___  ___ ___  / _ | | / / _ \____                 *
*               / /_/ / _ \/ -_) _ \/ __ | |/ / , _/ __/                 *
*               \____/ .__/\__/_//_/_/ |_|___/_/|_|\__/                  *
*                   /_/                                                  *
*                                                                        *
*              This file is part of the OpenAVRc project.                *
*                                                                        *
*                         Based on code(s) named :                       *
*             OpenTx - https://github.com/opentx/opentx                  *
*             Deviation - https://www.deviationtx.com/                   *
*                                                                        *
*                Only AVR code here for visibility ;-)                   *
*                                                                        *
*   OpenAVRc is free software: you can redistribute it and/or modify     *
*   it under the terms of the GNU General Public License as published by *
*   the Free Software Foundation, either version 2 of the License, or    *
*   (at your option) any later version.                                  *
*                                                                        *
*   OpenAVRc is distributed in the hope that it will be useful,          *
*   but WITHOUT ANY WARRANTY; without even the implied warranty of       *
*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        *
*   GNU General Public License for more details.                         *
*                                                                        *
*       License GPLv2: http://www.gnu.org/licenses/gpl-2.0.html          *
*                                                                        *
************************************************************************** 
*/

/*
 Libraries used for this project:
 USB_Host_Shield_2.0: https://github.com/felis/USB_Host_Shield_2.0
 Rc-Navy libraries  : (Rcul, TinyPinChange, TinyCppmGen) https://github.com/RC-Navy/DigisparkArduinoIntegration/tree/master/libraries
 SoftwareSerial     : https://github.com/PaulStoffregen/SoftwareSerial
 */

#include <usbhid.h>
#include <hiduniversal.h>
#include <usbhub.h>
#include "le3dp_rptparser2.0.h"
#include <SPI.h>
#include "LCDDisplay.h"

#include "RcModeConfig.h"

//#define AT_INIT
//#define DEBUG

#define PPM         0
#define BLUETOOTH   1
#define MODE PPM //Select PPM or BLUETOOTH


#define NUM_CHANNELS   8
#if (MODE == PPM)
#include <Rcul.h>
#include <TinyPinChange.h>
#include <TinyCppmGen.h>
#define CPPM_PERIOD_US 22500
#endif

#if (MODE == BLUETOOTH)
uint16_t BLUETOOTH_BAUDS;
#if defined(__AVR_ATmega328P__)
#include <SoftwareSerial.h>
SoftwareSerial BT(7,8);// RX, TX use 57600 maxi
#endif
#if defined(__AVR_ATmega32U4__) 
HardwareSerial & BT = Serial1;// Only with Leonardo board
#endif
#endif

RCState rcs;

USB                                             Usb;
USBHub                                          Hub(&Usb);
HIDUniversal                                    Hid(&Usb);
JoystickEvents                                  JoyEvents;
JoystickReportParser                            Joy(&JoyEvents, &rcs);

LCDDisplay lcd_display;

int16_t channelOutputs[NUM_CHANNELS];
#define FULL_CHANNEL_OUTPUTS(ch) channelOutputs[ch]
uint16_t ppmOut[8];

/**
* \file  misclib.h
* \fn    Macro: BIN_NBL_TO_HEX_DIGIT(BinNbl)
* \brief returns the ASCII Hexa digit corresponding to a nibble value (eg: BIN_NBL_TO_HEX_DIGIT(15) -> 'F'
* \param BinNbl:  The Nibble value (0 to 15)
*/
#define BIN_NBL_TO_HEX_DIGIT(BinNbl)      ((BinNbl) < 10) ? ((BinNbl) + '0'): ((BinNbl) - 10 + 'A')


void setup()
{
  lcd_display.setup();
 
  Serial.begin( 115200 );
  
#if !defined(__MIPSEL__)
  while (!Serial); // Wait for serial port to connect - used on Leonardo, Teensy and other boards with built-in USB CDC serial connection
#endif

  Serial.println("Start");
  if (Usb.Init() == -1)
      Serial.println("OSC did not start.");
  lcd_display.display_oerr();
  delay( 200 );

  if (!Hid.SetReportParser(0, &Joy))
      ErrorMessage<uint8_t>(PSTR("SetReportParser"), 1  );
  
  lcd_display.display_herr();

  AileronNbChannel = (uint8_t)pgm_read_byte(&ChannelOrder[channelsOrder].Aileron);//AILERON + 1;
  ElevatorNbChannel   = (uint8_t)pgm_read_byte(&ChannelOrder[channelsOrder].Elevator);//THROTTLE + 1;
  RudderNbChannel  = (uint8_t)pgm_read_byte(&ChannelOrder[channelsOrder].Rudder);//RUDDER + 1;
  ThrottleNbChannel  = (uint8_t)pgm_read_byte(&ChannelOrder[channelsOrder].Throttle);//RUDDER + 1;

  // Serial.print("Ail:");Serial.print(AileronNbChannel);
  // Serial.print("\tEle:");Serial.print(ElevatorNbChannel);
  // Serial.print("\tRud:");Serial.print(RudderNbChannel);
  // Serial.print("\tThr:");Serial.println(ThrottleNbChannel);
  
  rcs.init();

  

#if (MODE == PPM)
  //ppmEncoder.begin(PPM_OUTPUT_PIN);
  TinyCppmGen.begin(TINY_CPPM_GEN_NEG_MOD, NUM_CHANNELS, CPPM_PERIOD_US);//Futaba use negative pulse
#endif

#ifdef AT_INIT
  #undef MODE
  Serial.begin( 9600 );//need to be < BT speed in this mode
  BT.begin(38400);while (!BT);
  InitBtAuto();
  delay(500);
  ReadBTSettings();
#endif
  
#if (MODE == BLUETOOTH)
#if defined(__AVR_ATmega328P__)  
  BT.begin(57600);  while (!BT);// wait for serial port to connect.
#endif
#if defined(__AVR_ATmega32U4__)  
  BT.begin(115200);  while (!BT);// wait for serial port to connect.
#endif
#endif
  
  
}


bool is_connected = true;
int update_now = 0;

void loop()
{

#ifdef AT_INIT
  if (BT.available())  
  Serial.write(BT.read());

  if (Serial.available())  
  BT.write(Serial.read());
#else   
  update_now++;
  //
  int Xval;   // 0 - 1023
  int Yval;   // 0 - 1023
  int Hat;    // 0 - 15;
  int Twist;  // 0 - 255
  int Slider; // 0 - 255
  int Button; // 0 - 12 (0 = No button)
  
  Usb.Task();
  
  if (Usb.getUsbTaskState() == USB_STATE_RUNNING)
  {
    if (is_connected == true)
    {
      //already connected, do nothing
    }
    else
    {
      is_connected = true;
      rcs.is_connected = true;
      Serial.println("joystick connected");
      lcd_display.display_joystick_connected();
      delay(200);
      lcd_display.clear();
    }
  }
  else
  {

    if (is_connected == false)
    {
      //already disconnected, do nothing
    }
    else
    {
      is_connected = false;
      rcs.is_connected = false;
      Serial.println("joystick disconnected");
      lcd_display.display_joystick_disconnected();
      delay(200);
    }
  }  
  
  if (update_now > 15)
  {
    if (is_connected)
    {
      lcd_display.display(rcs.flight_mode_code, rcs.channel5, (byte)rcs.camera_mode, rcs.auto_center);
      lcd_display.print_all(&rcs);
      //lcd_display.display_rx_rssi(frsky_accessor.link_down);
      //lcd_display.display_tx_rssi(frsky_accessor.link_up);
    }
    update_now = 0;
  }  

  //Use to read joystick input to controller
  //JoyEvents.PrintValues();                                       //Returns joystick values to user
  //JoyEvents.GetValues(Xval, Yval, Hat, Twist, Slider, Button);   //Copies joystick values to user
  JoyEvents.GetValues(Hat, Button);
  
  rcs.data_updated();
  
  rcs.hat_changed((HAT_POSITION) Hat);

  rcs.hat_tick();
  
  rcs.button_changed(Button);
  rcs.OnButtonUp(Button);
  rcs.OnButtonDn(Button);

/*
ElevatorNbChannel;
RudderNbChannel;
AileronNbChannel;
ThrottleNbChannel;
*/
  
  ppmOut[AileronNbChannel] = rcs.roll;
  ppmOut[ElevatorNbChannel] = rcs.pitch;
  ppmOut[ThrottleNbChannel] = rcs.throttle;
  ppmOut[RudderNbChannel] = rcs.yaw;
  ppmOut[4] = ((rcs.channel5) ? rcs.MAX_VALUE : rcs.MIN_VALUE);
  ppmOut[5] = rcs.flight_mode;
  ppmOut[6] = rcs.camera_pitch;
  ppmOut[7] = rcs.camera_yaw;
    
#if (MODE == PPM)
    for (uint8_t ch = 0; ch<8;ch++)
    {
      TinyCppmGen.setChWidth_us(ch+1, ppmOut[ch]);
    }
#endif

#if (MODE == BLUETOOTH)
  BT_Send_Channels();
#endif

#ifdef DEBUG
  Serial.print("Trottle:");
  Serial.print(rcs.throttle);
  Serial.print(" Aileron:");
  Serial.print(rcs.roll);
  Serial.print(" Elevator:");
  Serial.print(rcs.pitch);
  Serial.print(" Rudder:");
  Serial.print(rcs.yaw);

  Serial.print(" CH5:");
  Serial.print((rcs.channel5) ? rcs.MAX_VALUE : rcs.MIN_VALUE);
  
  Serial.print(" Fly Mode:");
  Serial.print(rcs.flight_mode);
  Serial.print(" Camera Mode:");
  Serial.print((uint8_t)rcs.camera_mode);
  Serial.print(" Cam Pitch:");
  Serial.print(rcs.camera_pitch);
  Serial.print(" Cam Yaw:");
  Serial.println(rcs.camera_yaw);
#endif
#endif

//  Serial.print(" Cam Pitch:");
//  Serial.print(ppmOut[6]);
//  Serial.print(" Cam Yaw:");
//  Serial.println(ppmOut[7]);  
}

#if (MODE == BLUETOOTH)
void BT_Send_Channels()
{
  char txt;
  uint8_t ComputedCheckSum = 0;
  String bt;
  BT.print(F("tf "));
  bt += "tf ";
 
  for(uint8_t Idx = 0; Idx < NUM_CHANNELS; Idx++)
  {

   BT.print('s');
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
     BT.print(txt);
    }
  }

  BT.print(':');
  bt += ":";
  txt = BIN_NBL_TO_HEX_DIGIT(ComputedCheckSum>>4 & 0x0F);
  bt += (String)txt;
  BT.print(txt);
  txt = BIN_NBL_TO_HEX_DIGIT(ComputedCheckSum & 0x0F);
  bt += (String)txt;
  BT.println(txt);
}
#endif


#ifdef AT_INIT          // AT configuration of the HC05, to make once time
void InitBtAuto()
{
  Serial.print("AT: ");                 // verify we are in AT mode
  BT.print("AT\r\n");
  if (!waitFor("OK\r\n")) Serial.println("time out error AT");

  Serial.print("UART: ");               // serial communication parameters
#if defined(__AVR_ATmega328P__)
  BT.print("AT+UART=57600,0,0\r\n");//57600
#endif
#if defined(__AVR_ATmega32U4__) 
  BT.print("AT+UART=115200,0,0\r\n");//115200
#endif
  if (!waitFor("OK\r\n")) Serial.println("time out error AT+UART");

  Serial.print("NAME: ");               // bluetooth device name
  BT.print("AT+NAME=BT/SIM\r\n");
  if (!waitFor("OK\r\n")) Serial.println("time out error AT+NAME");

  Serial.print("PSWD: ");               // password for pairing
  BT.print("AT+PSWD=\"1234\"\r\n");
  if (!waitFor("OK\r\n")) Serial.println("time out error AT+PSWD");

  Serial.print("ROLE: ");               // device in slave mode
  BT.print("AT+ROLE=0\r\n");
  if (!waitFor("OK\r\n")) Serial.println("time out error AT+ROLE");

//  digitalWrite(MODULE_KEY, LOW);            // leave AT mode & switch back to communication mode
}

void ReadBTSettings()
{
  BT.print("AT\r\n");

  BT.print("AT+UART\r\n");

  BT.print("AT+NAME\r\n");

  BT.print("AT+PSWD\r\n");

  BT.print("AT+ROLE\r\n");
}

//  The waitFor a string function with time out
bool waitFor(const char *rep){
unsigned long t0 = millis(), t;
int i=0, j=strlen(rep);
char c;

  for (i = 0 ; i<j ; )
  {
    if (BT.available())
    {
      c=(char)BT.read();
      Serial.print(c);
      if (c==rep[i])i++;
    }

    t = millis();
    if (t-t0>2000)break;
  }
  return i==j ;
  delay(10);
}

#endif
