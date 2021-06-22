# Xany2Sounds

Xany2Sounds is a sound module that use the X-Any feature for command un JQ6500-16p or JQ6500-28p.
I use a Pro Micro board.

For use it, you need:
- An OpenAVRc Transmitter with the X-Any feature:
- A PCF8574 board.
- Height switch.

See our documentation here for all connections:
https://github.com/Ingwie/OpenAVRc_Dev/tree/V3/documentation/Compilez%20votre%20FW%20OpenAVRc_V3.pdf

Each X-Any switch command one sound.
With 8 switchs you can command 8 sounds.
But the JQ6500 has 5 inputs that can be used for command 5 other sounds.
Add if you use as input CPPM, SBUS, SRXL, SUMD, IBUS or JETI, you can play 8 sounds in same time you move your throttle stick.

So, it's possible to command 21 sounds.
The JQ6500 inputs commands sounds from 1 to 5 , X-Any switchs command sounds from 6 to 13 and with throttle 14 to 21.
You can select this mode or not (shift mode) when your are in the configuration mode.
Exemple as use, connect the K1 to K5 inputs to 5 relay and you can use the JQ6500 as alarm in a boat .
K1 to K5 are active with a ground connection.

The module accept several input mode.
PWM, CPPM, SBUS, SRXL, SUMD, IBUS or JETI.
You can select also these modes in confuration menu.

## Upload the HEX file
I don't give sources, because X-Any libraries are not Open Source for the receive side.
You can found binary file [here](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Xany2Sounds).
Rename Xany2Sounds.ino.with_bootloader.promicro._hex file to Xany2Sounds.ino.with_bootloader.promicro.hex
Pro Micro use a particular method for upload a code.
You can use the program https://github.com/uriba107/32u4_hexuploader .

## Configuration mode
Connect the USB connector of your Pro Micro board to your PC.  
Select the console window, define 115200 bauds and NL and CR mode.  
You have 5 seconds for click on the ENTER key.  
When you are in the configuration mode, type h key and ENTER for see all options:  

  H Help  
  Q quit  
  N=4 or 8 or 16 Sounds mode  
  C=5,6,7,9,10,11,12,13,14,15 Xany Channel  
  T=1,2,3,4 Throttle Channel  
  M=S set shift mode On/Off  
  M=T set shift mode On/Off  
  M=P set PWM mode  
  M=C set CPPM mode  
  M=B set SBUS mode  
  M=I set IBUS mode  
  M=X set SRLX mode  
  M=D set SUMD mode  
  M=J set JETIx mode  
  M? Read Sensor & servo values  
  R set RESET mode  

The configuration is saved into the EEPROM.  
So, you need to do this configuration just one time when you want change your settings.

Add sounds files in your JQ6500 module:
Follow the JQ6500 [documentation](https://sparks.gogo.co.nz/jq6500/index.html).

## Build your 8 or 16 switch module
- For 8 switchs, use a PCF8574.  
![PCF8574](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany_Builds_by_Users/pierrotm777/Xany2Sounds/pcf8574.jpg)  
- For 16 switchs, use a PCF8575**A** or a MCP23017 or a PCA9671.  
![PCF8575A](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany_Builds_by_Users/pierrotm777/Xany2Sounds/pcf8575.jpg) <span style="font-family: Open Sans; font-weight: 800; font-size: 30px;font-style: italic">Or</span> ![MCP23017](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany_Builds_by_Users/pierrotm777/Xany2Sounds/mcp23017.jpg)   
See our [documentation](https://github.com/Ingwie/OpenAVRc_Dev/blob/V3/documentation/Compilez%20votre%20FW%20OpenAVRc_V3.pdf), paragraph **8.4**.

## How to use this project

### Connect your 8 or 16 switch module into your OpenAVRc transmitter
- If you use a shield V2.0 or V2.1 or V2.2, use the connector P2.  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany_Builds_by_Users/pierrotm777/Xany2Sensor360/Shield_v2.1_Xany_Connector.jpg)  
- On your OpenAVRc transmitter, select a model and go to the 5/13 screen and select **SW: 00000000** or  **SW: 0000000000000000**.  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany_Builds_by_Users/pierrotm777/Xany2Sounds/Xanyswitchmode.jpg)  

### Connect sound module
- Follow schemtic for build the sound module.  
![See picture file](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany2Sounds/Xany2Sounds.jpg)  
- Connect the Pro Micro Input to your output receiver (channel 5 by default).



Good use.

Pierre


