# Protocol Lora (Long Range) with OpenAVRc

If you follow the [MultiProtocol](https://www.rcgroups.com/forums/showthread.php?2165676-DIY-Multiprotocol-TX-Module) (MPM) thread on Rcgroups, you know that it's possible to use a SX1276 RF module in 915Mhz or 868Mhz.

The MPM code add the Lora feature only with a STM32 who has enough pins for command cc2500, a7105, cyrf6936, nrf24l01+ and rfm95w in same time.  
Whith an atmega328, we need to do a choice. Our choice is to use the CS (chip select) of the cyrf6936.

## Transmitter side
For the Tx side, the project use a RFM95W who has a RFM95W in 868Mhz or 915Mhz.  
![RFM95W 868/915](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Lora/rfm95w.jpg)  

The RFM95W(868Mhz/915Mhz) accept only 3,3v levels:   
 - If you have already a 4in1 module with STM32, you don't need to use a level convert.
 - If you use a DIY 4in1 with atmega328p 3,3v, you don't need to use a level convert.
 - If you use a DIY 4in1 with atmega328p 5v, you need to use a level convert.
 - If you use a DIY 4in1 with stm32f103**cb**t6 (128KB), you need to use a level convert.


### Wiring
1. Lora with atmega328:  
![PCB v2.3&Lora.pdf](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Lora/MPM_FrskyR9_328p.jpg)
1. Lora with STM32 (128KB):  
![PCB v2.3&Lora.pdf](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Lora/MPM_FrskyR9_stm32.jpg)

### Firmware for Atmega328
In the MultiProcol code FRSKY-R9 use the value 65, but for now, **OpenAVRc** accept only (for now) **63** maxi values.  
So, **MultiProtocol's** source need to be updated for accept up to 63 values.
1. Open the **Multiprotocol.h** file.  
1. Replace by PROTO_FRSKY_R9 = **65** with **63**.    
1. Replace PROTO_XN297DUMP = **63** with **65**.  
![Multiprotocol.h](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Lora/Multiprotocol.h.jpg)
1. Use your actual firmware in **MultiMod** protocol with **custom 63**.  
    * sub-protocol **1** for 16ch **without** telemetry.  
    * sub-protocol **3** for 8ch **with** telemetry.  

MPM code for use an atmega328p [see Multiprotocol_Lora328P.zip](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Lora/Multiprotocol_Lora328P.zip)  MPM modified sources files). 

### Firmware for STM32F103CBT6
As for the Atmega328, we need to modified to MPM code.
1. Open the **Multiprotocol.h** file.  
1. Replace by PROTO_FRSKY_R9 = **65** with **63**.    
1. Replace PROTO_XN297DUMP = **63** with **65**.  
![Multiprotocol.h](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Lora/Multiprotocol.h.jpg)
1. Use your actual firmware in **MultiMod** protocol with **custom 63**.  
    * sub-protocol **1** for 16ch **without** telemetry.  
    * sub-protocol **3** for 8ch **with** telemetry.  
	
## Receiver side

### The firmwares
You need to flash your R9 receiver with one of the two firmwares **FCC** or **FLEX**.  
Our choice is to use the **FLEX** version.  
[R9_FLEXX](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Lora/HowToUploadFirmware/R9_FLEX) with a special **F-PORT** version or not.  
[R9_FCC](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Lora/HowToUploadFirmware/R9_FCC) with a special **F-PORT** version or not.  

### How to upgrade your receiver
1. Wiring with a FTDI interface:  
![How to do](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Lora/HowToUploadFirmware/Wiring_for_load_firmware-STM32.png)
1. You need a USB to S.Port or STK module:  
![How to do](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Lora/HowToUploadFirmware/STK.jpg)  Or  ![How to do](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Lora/HowToUploadFirmware/S_Port.png)
1. Upload a firmware:
    * Download [frsky_update_sport_rev20.zip](https://www.frsky-rc.com/wp-content/uploads/2017/07/Tool/frsky_update_sport_rev20.zip). 
	* Connect USB_To_S-Port module to your PC.
	* Connect USB_To_S-Port module to the S-Port of your receiver **without the power**, (the receiver should not be powered at the start).
    * Start **frsky_update_sport** software, select com port and once the software says **"finding device"** connect the power supply to the receiver.   	

## Which receiver
You can choose to buy a R9 EU receiver in 868Mhz or a R9 in 915Mhz for US. 
This system use the R9mm or R9 as receiver:  
![PCB v2.3&Lora.pdf](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Lora/receivers.jpg)  

Attention, you don't must to use a CYRF6936 chip in same time than RFM95W because the RFM95W use the same atmega328's CS pin .

**************************************************************************************************************
* Use this new feature if you want but not in France.                                                        *
* OpenAVRc's github is updated with this feature.                                                            *
**************************************************************************************************************

Hope you will like more OpenAVRc with this option.

@OpenAVRc Team