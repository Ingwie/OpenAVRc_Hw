# Xany2Misc

The Xany2Misc adapter cord uses the Xany2Msx card.
The only difference is the firmware which is called Xany2Misc.

The Xany2Msx / Xany2Misc adapter cord allows the use of Multi-Switch modules at
**pulse control** on one or two **X-Any** channels of the OpenAVRc RC set. 

Currently supported commercial pulse decoders are:  
* [**Conrad Module 7 fonctions**](https://www.conrad.fr/p/commutateur-multiple-7-canaux-231517-1-pcs-231517)  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany2Msx/Firmware_Misc/Conrad7outputs.jpg)
* [**Beier Module son USM-RC-2**](https://www.beier-electronic.de/modellbau/produkte/usm-rc-2/usm-rc-2.php)  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany2Msx/Firmware_Misc/USM-RC-2.jpg)
* [**NVMMulti-Switch Decoder**](https://www.modelbouwforum.nl/threads/nvm-multiswitch-met-arduino.247761)  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany2Msx/Firmware_Misc/NVM_MS_2.jpg)

Note: 
1. On the transmitter side, there is no need for the specific encoder corresponding to the model of
decoder.
2. The unique and universal encoder is built into the OpenAVRc transmitter and uses the XAny protocol.
It is possible to declare up to 4 instances of X-Any on the transmitter side in order to authorize up to 64 all-or-nothing commands.
Refer to the documentation for OpenAVRc to configure X-Any on the transmitter side.

For more details, see the [manual](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany2Msx/Xany2Misc_Manuel_Utilisateur.pdf).

## Videos

[![Xany2Msx & Conrad 7 Multiswitch module](https://img.youtube.com/vi/QR7gnT5Co_U/0.jpg)](https://www.youtube.com/watch?v=QR7gnT5Co_U "Xany2Msx & Conrad 7") 





