# MS16 Pro Micro Xany decoder

MS16-Xany is much more than a simple Multiswitch decoder.  
It not only allows to control 16 digital outputs in All-Or-Nothing, but also allows to control up to 16 servos in All-Or-Nothing including the 2 extreme positions and the speed between these 2 positions are programmable! It also provides a booster proportional channel to drive a servo or an ESC.
It is in fact a derivative version of MS8-Xany, but more "muscular" and having more functionalities.  
For example, MS16-Xany can interface with the RC receiver in PWM, CPPM, SBUS, SRXL, SUMD, IBUS, JETI!
For the SBUS, no need for an external signal inverter: it is already integrated into the MS16-Xany card!  
Two optional small daughter boards can even supply 2 different external voltages from the same battery to power the 2 groups of 8 outputs (group S01 to S08 and group S09 to S16)! 
## Ms16 schematic:
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw16-ProMicro/Ms16_ProMicro-Xany_Schematic.jpg)

## Ms16 PCB:
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw16-ProMicro/Ms16_ProMicro_V1.0.png)

It shows the MS16-Xany configuration in case the user wants to access to the advanced functionalities, 
such as driving servos between 2 limit positions at a preprogrammed motion speed. 

Nice for opening slowly a door or to rotate slowly cannon turrets, just by using a simple Off/On switch of the OpenAVRc transmitter (or by using a simple Logical Switch).

By default, all the outputs are configured in Digital mode (as with regular Multiswitch decoders).
It is necessary to use USB ProMicro port to access to the advanced mode for driving servos: it's described in the video.

Additionally, this decoder provides a supplement proportional channel: thus, even if MS16_ProMicro-Xany uses one proportional channel, this one is not lost! 

The position of the contacts are sent using multiplexing technique.

The data transmission being digital, no tuning is needed.  

## User manual
[Configuration of the MS16_ProMicro-Xany decoder](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw16-ProMicro/MS16-Xany_Manuel_Utilisateur.pdf)

## Upload the HEX file
We don't give sources, because X-Any libraries are not Open Source for the receive side.   
You can found binary file [MS16_ProMicro-Xany](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MultiSwitch_Sw16-ProMicro/Firmware_Ms16_ProMicro)   

The **Arduino Pro Micro** board use a particular method for upload a code.  
You can use the program [32u4_hexuploader](https://github.com/uriba107/32u4_hexuploader).

 


## Video
 

RC Navy 