# MS8-Xany V3 decoder

MS8-Xany V3 is a new Ms8 version with more features.  
It not only allows you to drive 8 digital outputs, but also allows you to drive up to 8 digital servos including the 2 extreme positions and the speed between these 2 positions are programmable!  
It also provides a booster proportional channel to drive a servo or an ESC. 

## Ms8 V3 schematic
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MultiSwitch_Sw8_V3_sch.jpg)


## Ms8 V3 PCB
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MultiSwitch_Sw8_V3_Top.jpg)  
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MultiSwitch_Sw8_V3_Bot.jpg)  

## Upload Firmware
- Connect your MS8 V3 to your PC with a USB cable  and lauch the cmd file for upload the firmware.  
- Load [Xloader](https://github.com/binaryupdates/xLoader) uploader hex file.  
- Upload the firmware file found below:  
  - [Windows](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MultiSwitch_Sw8_V3/PROG/Windows).  
  - [Linux]().  
- Define Xloader as below:  
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/PROG/Windows/xloader.jpg).  

## Videos
This first video show:

The **MS8-Xany** configuration in case the user wants to access to the **advanced functionalities**, 
such as **driving servos** between 2 limit positions at a preprogrammed motion speed. 

Nice for opening slowly a door or to rotate slowly cannon turrets, just by using a simple Off/On switch of the OpenAVRc transmitter (or by using a simple Logical Switch).

[![Configuration of the MS8-Xany decoder (Part 1)](https://img.youtube.com/vi/y_skDGLVK1A/0.jpg)](https://www.youtube.com/watch?v=y_skDGLVK1A "Ms8-Xany Part 1") 

This second video describes:
- how to control the **MS8-Xany** decoder from the **OpenAVRc** transmitter without adding any hardware, just by using **logical switches**
- how to control the **MS8-Xany** decoder with **physical switches**, by adding an I2C extender on the **OpenAVRc** transmitter
- the multiple **proportional sources** for the **optional proportional channel**
- the **Failsafe** behaviour

[![Configuration of the MS8-Xany decoder (Part 1)](https://img.youtube.com/vi/EJCJJWh63EM/0.jpg)](https://www.youtube.com/watch?v=EJCJJWh63EM "Ms8-Xany Part 2") 

By default, all the outputs are configured in Digital mode (as with regular Multiswitch decoders).
It is necessary to use a TTL USB/Serial converter (FTDI type) to access to the advanced mode for driving servos: it's described in the video.

Ms8 documentation files:
* [MS8-Xany folder in Git repository](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MultiSwitch_Sw8_V3).
* PCB: [here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MultiSwitch_Sw8_V3.zip)
* User Manual:  
  - [French](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MS8-Xany-V3_Manuel_Utilisateur.pdf)

RC Navy 