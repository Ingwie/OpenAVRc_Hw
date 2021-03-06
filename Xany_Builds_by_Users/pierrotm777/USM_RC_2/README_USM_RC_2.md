# USM_RC_2 & X-Any

This [Beier](https://www.beier-electronic.de/modellbau/home/home.php) module has been developed especially for RC model construction in order to equip models for land, air and sea with realistic and speed-dependent driving and engine sounds.

Complet documentation can be found [here](https://www.beier-electronic.de/modellbau/produkte/usm-rc-2/usm-rc-2.php)


- Universal module to control sound-, light- and servo functions  
- Suitable for all types of commercial remote controls
- Individually programmable
- With 170 ready to use sound projects and over 700 sound files
- Speed-dependent engine and movement sounds
- Powerful built-in amplifier for optimal sound quality
- 12 switching outputs for LEDs, lamps, smoke generators, relays, etc.
- Free programmable light and sound sequences
- 2 programmable servo outputs
- Easy transfer of settings with micro SD card
- Easy updating of Sound-Teacher and firmware
- Extension accessories available


For use this module whith Xany, you need:
- An OpenAVRc Transmitter with the X-Any feature.  
- A [Xany2Msx](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Xany2Msx) module with the [Xany2Misc]() firmware. 



## Configuration mode
### USM_RC_2 configuration
The USM-RC-2 sound module recognize sevral protocols.  
Nautic (Graupner) / Multiswitch (Futaba), EKMFA, S-Bus / SUMD / i-Bus are possible.  
To control this module, Xany uses the **EKMFA** protocol.  
- To configure the USM_RC_2 module in this protocol, you need to use the **USM-RC-2 Sound-Teacher** software.  
This software is supplied on DVD with the module.  
- Select **Configuration** tab, click on **EKMFA** tab and then click on *Activate EKMFA on channel #3(X2/3)*.  

### Xany2Msx configuration
- Configure the **Xany2Msx** interface for the **EKMFA** protocol.  



## How to use this project

### Connect your 8 or 16 switch module into your OpenAVRc transmitter
- If you use a shield V2.0 or V2.1 or V2.2, use the connector P2.  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany_Builds_by_Users/pierrotm777/Xany2Sensor360/Shield_v2.1_Xany_Connector.jpg)  
- On your OpenAVRc transmitter, select a model and go to the 5/13 screen and select **SW: 00000000** or  **SW: 0000000000000000**.  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany_Builds_by_Users/pierrotm777/Xany2Sounds/Xanyswitchmode.jpg)  

### Connect sound module
You can found the USM_RC_2 manual [here](https://www.beier-electronic.de/modellbau/service/Soundmodul_USM-RC-2_GB.pdf).





Good use.

Pierre


