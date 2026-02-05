# Shield update
Several shield PCBs were produced, versions 2.0 to 2.2.  
The first two need to be slightly modified.  

## Shield v2.0
When the v2.0 board was created, Bluetooth functionality was not yet implemented.  
The pin assignment that activates it was not yet defined.  
Therefore, a connection must be created between pin G4 and resistor R40.  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Hardware/Shield_v2.0_update.png)  
The Q1 MOSFET (BSS84) also needs to be replaced with a much more efficient OA3401.  

## Shield v2.1
During the creation of PCB v2.1, the pin that controlled the HC05 was initially assigned to a pin that was subsequently reassigned to the Bluetooth KEY pin.  
This connection must be broken to connect resistor R40 to pin G4.  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Hardware/Shield_v2.1_update.png)  
Just like in version v2.0, you need to replace the Q1 mosfet with an oa3401.  

## Shield v2.2
R44 and R46 must not be installed. Replace R44 with a wire or a 0 ohm resistor.  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Hardware/Shield_v2.2_update.png)  

# Wireless HC05 PCB simulator for External JR Bay
This board is usable with a RC transmitter as a Tx16s who has an external JR bay.  
It accept CPPM and SBUS ouput or CPPM and SBUS input .  

## Schematic
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Hardware/ESPNOW_Trainer.png)  

## PCB
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Hardware/ESPNOW_Trainer_Top.jpg)
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Hardware/ESPNOW_Trainer_Bot.jpg)  

## How to use

