# MS8-Xany V2 decoder

MS8-Xany V2 is a new Ms8 version with more features.  
It not only allows you to drive 8 digital outputs, but also allows you to drive up to 8 digital servos including the 2 extreme positions and the speed between these 2 positions are programmable!  
It also provides a booster proportional channel to drive a servo or an ESC. 

## Ms8 V2 schematic
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MutltiSwitch_Sw8_V2/MutltiSwitch_Sw8_V2.pdf)

## Ms8 V2 PCB:
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MutltiSwitch_Sw8_V2/MutltiSwitch_Sw8_V2.jpg)

## Upload Firmware with UsbAsp dongle
  - Upload firmware:  

  
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

Ms8 files:
* [MS8-Xany folder in Git repository](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MutltiSwitch_Sw8_V2).
* PCB: [here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MutltiSwitch_Sw8_V2/MutltiSwitch_Sw8_V2.zip)
* User Manual:  
  - [French]()
  - [English]()
* HEX file to be loaded in the ATtiny84 microcontroller:  
  - [Linux]()  
  - [Windows]() 



Additionally, this decoder provides a supplement proportional channel: thus, even if MS8-Xany uses one proportional channel, this one is not lost! The position of the contacts are sent using multiplexing technique.

The data transmission being digital, no tuning is needed.

RC Navy 