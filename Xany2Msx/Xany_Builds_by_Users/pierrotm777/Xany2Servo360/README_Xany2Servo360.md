# Xany2Servo360

Xany2Servo360 is a can command a turret or a shuttle motor with a 360 degrees rotation.
I use a Pro Micro board.

For use it, you need:
- An OpenAVRc Transmitter with the X-Any feature:
- A 360 degrees sensor. 
- A 360 degrees servo. 


See our documentation here for all connections:
https://github.com/Ingwie/OpenAVRc_Dev/tree/V3/documentation/Compilez%20votre%20FW%20OpenAVRc_V3.pdf


The module accept several input mode.
PWM, CPPM, SBUS, SRXL, SUMD, IBUS or JETI.
You can select also these modes in confuration menu.

**Upload the HEX file:**

I don't give sources, because X-Any libraries are not Open Source for the receive side.  
You can found binary file [here]().  
Rename Xany2Servo360.ino.with_bootloader.promicro._hex file to Xany2Servo360.ino.with_bootloader.promicro.hex
Pro Micro use a particular method for upload a code.  
You can use the program https://github.com/uriba107/32u4_hexuploader .

**Configuration mode**

Connect the USB connector of your Pro Micro board to your PC.  
Select the console window, define 115200 bauds and NL and CR mode.  
You have 5 seconds for click on the ENTER key.  
When you are in the configuration mode, type h key and ENTER for see all options:  

  H Help  
  Q quit  
  C=0 to 360 for test  
  M=5,6,7,9,10,11,12,13,14,15 Xany Channel    
  M=P set PWM mode  
  M=C set CPPM mode  
  M=B set SBUS mode  
  M=I set IBUS mode  
  M=X set SRLX mode  
  M=D set SUMD mode  
  M=J set JETIx mode  
  M? Read Sensor & servo values  
  Z=1 Search 0 sensor position value (On/off)  
  Z=2 Search 0 servo360 value in µS(On/off)  
  R set RESET mode  

The configuration is saved into the EEPROM.  
So, you need to do this configuration just one time when you want change your settings.


**Wires**
See picture file.

![here]()

Good use.

Pierre


