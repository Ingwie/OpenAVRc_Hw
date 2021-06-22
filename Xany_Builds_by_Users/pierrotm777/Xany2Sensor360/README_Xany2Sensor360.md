# Xany2Servo360

Xany2Servo360 can command a cannon turret or a [schottle motor](https://www.sud-rc.fr/gouvernail-acces-de-barre/721-propulsion-schottel-ii-graupner-2335.html) with a 360 degrees rotation.

For build it, you need:  
- Build a 360 degrees I2C sensor [see how to](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany_Builds_by_Users/pierrotm777/Xany2Servo360/README_Xany2Servo360.md#build-a-360-degrees-i2c-sensor).  
- Build a continous rotation servo [see videos](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany_Builds_by_Users/pierrotm777/Xany2Servo360/README_Xany2Servo360.md#how-to-build-servo-with-continous-rotation).
- A Pro Micro board 5v/16Mhz.
- An **OpenAVRc** Transmitter with the X-Any feature.    
- See our documentation [here](https://github.com/Ingwie/OpenAVRc_Dev/tree/V3/documentation/Compilez%20votre%20FW%20OpenAVRc_V3.pdf) for configure an **OpenAVRc** transmitter.
  * See **8.3.2 Type d’information à transmettre via X-Any**  
    * 0:360 : Angle absolu de 0 à 360°
    * I2C   : utilisation d’un capteur I²C externe de type A1335
- See **V2.1** or **V2.2** shield schematic on page 5/7, connector P2 [here](https://github.com/Ingwie/OpenAVRc_Dev/blob/V3/documentation/Schema_MegaMini.pdf) for connect sensor on our shield.
- Use (D20/D21) if you use an Arduino Atmega2560 board.

## Upload the HEX file

I don't give sources, because X-Any libraries are not Open Source for the receive side.  
You can found binary file [here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany_Builds_by_Users/pierrotm777/Xany2Servo360/Xany2Sensor360.ino.with_bootloader.promicro._hex).  
Rename Xany2Servo360.ino.with_bootloader.promicro._hex file to Xany2Servo360.ino.with_bootloader.promicro.hex
Pro Micro use a particular method for upload a code.  
You can use the program https://github.com/uriba107/32u4_hexuploader .

## Configuration mode

The module accept several inputs modes.
PWM, CPPM, SBUS, SRXL, SUMD, IBUS or JETI.
You can select also these modes in confuration menu.

Connect the USB connector of your Pro Micro board to your PC.  
Select the console window, define 115200 bauds and NL and CR mode.  
You have 5 seconds for click on the ENTER key.  
When you are in the configuration mode, type H key or ENTER for see all options:  

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


## How to build servo with continous rotation

### Mod Futaba S3003 servo for continous rotation

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/sBtxttzMcoo/0.jpg)](https://www.youtube.com/watch?v=sBtxttzMcoo "Click") 

Or   

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/SK8mhnEzcvY/0.jpg)](https://www.youtube.com/watch?v=SK8mhnEzcvY "Click")

### Build a 360 degrees I2C sensor
[I2C sensor](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Capteur_Hall_I2C).  
[In french](http://p.loussouarn.free.fr/projet/sensors/angle/i2c_angle_sensor.html).

### Wires
See picture file.

![here]()

Good use.

Pierre


