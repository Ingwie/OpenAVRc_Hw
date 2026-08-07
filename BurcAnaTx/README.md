# BurcAnaTx coder
In an RC transmitter, the BurcAnaTx module can connect to up to 4 proportional channels.  
The proportional channels can be spare ones, or can reuse accessories potentiometers channels or unused stick potentiometers.  

BurcAnaTx injects in each connected proportional channel a digital data stream (RCUL / X-Any protocol) which allows adding to the transmitter the following RC extensions:  
- 8 native contacts, or 8/16 contact I/O I2C extenders  
- An Analog poportional value (the accessorie potentiometer can be reused!)  
- A 360° angular I2C Sensor  

When using 4 proportional channels, the BurcAnaTx can transmit simultanously and independantly up to:  
- 4 x 16 Contacts states (64 contacts)  
- 4 x analog values  
- 4 x 360° angular values  

At receiver side, on each used channel, a decoder shall be connected to retrieve the sent informations:  
- For 8   Contacts + 1 x Analog value: MS8-Any Mulitswitch decoder  
- For 16 Contacts + 1 x Analog value: MS16-Any Mulitswitch decoder  
- For 360° Angle value: Decoder still under development  

![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/Switch.png)  

## Schematic
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/PCB/BurcAnaTx_sch.png)  

## Wiring
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/f14.png)  

Here is the interior of a Futaba F14 radio transmitter.  
You can see the wiring for the two proportional sticks.  

![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A_1.jpg)  

Here is the interior of a Protronik PTR-6A radio transmitter.  
You can see the wiring for the two proportional sticks and more precisely, the wiring of channels 5 and 6.  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A_2.jpg)  ![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A_3.jpg)  

![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/f14_coder.jpg)  

This radio also features proportional inputs for additional potentiometers or switches.  
We will use one of these extra inputs to connect our RcilI2CPotTx encoder.  

Each channel of the BurcAnaTx module acts as an interface between four sets of 8 to 16 switches and the radio's proportional inputs.  
The two AD5282 chips are dual digital potentiometers.  
By simulating movements of varying speeds, the AD5282 generate a digital signal that reflects the positions of the various switches.  

It is also possible to use a new potentiometer in parallel with the 8 to 16 switches.  
A final option is to use a 0–360° angular sensor and a potentiometer to control up to 4 azimuth motors.  

The module's four outputs support radios with potentiometers powered by voltages ranging from +5V up to a maximum of 15V.  
Each output is polarized; the positive (+) pin must be connected to the input's positive terminal, and the negative (-) pin to the input's negative terminal.  

## Compatibles modules usable with BURC
All these modules behind
- [Ms8 v3](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MultiSwitch_Sw8_V3)  
- [Ms16](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MultiSwitch_Sw16-ProMicro)  
- [Sound&SmokeModule](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Sound%26SmokeModule)  
- [Xany2Msx](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Xany2Msx/Firmware_Msx)  
- [Xany2Misc](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Xany2Msx/Firmware_Misc)  
- Hall sensor:  
  * [Hall I2C sensor](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Capteur_Hall_I2C)  
  * [Hall I2C sensor mini](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Capteur_Hall_I2C_Mini)  
- [MultiSwitch_MosFet](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MultiSwitch_MosFet)  
- [Ms8 Pulseq](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/PulseSeq) 
- [Servo 360°]() 