**MS8-Xany decoder**

Here after, please find a first video of the 8 output MS8-Xany Multiswitch decoder using the "official" PCB of the OpenAVRc Team.

Ms8 schematic:

![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8/D%C3%A9codeur%20MS8_X-Any.jpg)

Ms8 PCB:

![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8/D%C3%A9codeur%20MS8_X-Any_3D.jpg)

It shows the MS8-Xany configuration in case the user wants to access to the advanced functionalities, 
such as driving servos between 2 limit positions at a preprogrammed motion speed. 

Nice for opening slowly a door or to rotate slowly cannon turrets, just by using a simple Off/On switch of the OpenAVRc transmitter (or by using a simple Logical Switch).

[Configuration of the MS8-Xany decoder (Part 1)](https://www.youtube.com/watch?v=y_skDGLVK1A)

[![se of the MS8-Xany decoder (Part 2)](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8/video2.jpg](https://www.youtube.com/watch?v=EJCJJWh63EM "Ms8-Xany Part 2")

By default, all the outputs are configured in Digital mode (as with regular Multiswitch decoders).
It is necessary to use a TTL USB/Serial converter (FTDI type) to access to the advanced mode for driving servos: it's described in the video.

PCB + User Manual + HEX file to be loaded in the ATtiny84 microcontroller:

[MS8-Xany folder in Git repository](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MultiSwitch_Sw8).

Additionally, this decoder provides a supplement proportional channel: thus, even if MS8-Xany uses one proportional channel, this one is not lost! The position of the contacts are sent using multiplexing technique.

The data transmission being digital, no tuning is needed.

The next video will present the MS8-Xany decoder controlled by the OpenAVRc transmitter. Coming soon...

RC Navy 