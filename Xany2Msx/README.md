# Xany2Msx

## There are two firmware versions for the *Xany2Msx* interface

- [Xany2Msx](./Firmware_Msx/README.md)

Currently supported commercial Multi-Switch / Prop decoders are:  
* **Robbe Multi Switch Decoder** No 8369 ***(MS16)***
* **Robbe Multi Decoder Switch + Prop** No 8370 ***(MS12 + 2 PROP)***
* **Robbe-Futaba Multi Switch Decoder** No F1513 ***(MS8)***
* **MULTIPLEX MULTInaut top** ***(MS12 + 2 MoTors)***
* **GRAUPNER NAUTIC Expert** ***(MS16)***

- [Xany2Misc](./Firmware_Misc/README.md)

Currently supported commercial pulse decoders are:  
* **Conrad Module 7 fonctions**
* **Beier Module son USM-RC-2**
* **NVM Multi-Switch Decoder**

## Upload Firmware with UsbAsp dongle
  - Wiring:  
  ![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany2Msx/Attiny85.jpg)
  - Upload firmware:  
  ![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany2Msx/Avrdudess_Attiny85.jpg)
  - [AVRDUDESS](https://blog.zakkemble.net/avrdudess-a-gui-for-avrdude/):
 
## Beier mode

### Configuration for BURC/Beier
See the documentation on paragraph **5.2.1**.  
- For control 16 commands of a Beier USM-RC-2 sound module (30 maxi) over a **FTDI interface** on the M1 output,  
simply configure Xany2Misc with the command:  
**M1=B1** or **M2=B1**  
This configuration allows 16 commands to be sent in EKMFA mode from the transmitter to the Beier USM-RC-2 sound module.
**Fx=1** to activate the x function (x from 1 to 16).  

### Configure your Hanset
We must define a channel for the BURC/X-Any signal, by example on the channel 8.  
1 OpenAVRc handset
  * Into the Xany menu, define SW=16
  ![OpenAVRc-Xany](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany2Msx/OpenAVRc_Xany.png)  
2 Other handset with a [BURC Encoder](https://github.com/pierrotm777/BURC_Encoder)  
  * Configuration example  
	RCUL3.VOIE=8  
	RCUL3.MESSAGE=C1-C16@0x24  
