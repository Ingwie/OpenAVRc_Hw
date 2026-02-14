# Compilations
This HC05 simulator for an Mini ESP32C3 Oled can be compiled with the Arduino IDE 2.3.7.  

## How to compile and upload
1. Open your Arduino IDE.  
2. Install the Espressif json link.  
```
https://espressif.github.io/arduino-esp32/package_esp32_index.json  
```
3. Download these [libraries](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Software/libraries.zip).  
4. Unzip our [software](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Software/ESP32C3_HC05_MasterSlave_v1_7w.zip).  
5. Select settings. 
  - select the board **esp32/ESP32 C3 Dev Module**.  
  - use settings that follow.  
  ![pic](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Software/compilation_settings.png)  
6. Use **Export compiled binaries** and save the .ino.bin found into the \build\esp32.esp32.esp32c3 folder.  
7. Into the IDE, type into the console the commande **ota 1**.  
8. After modifying the OTA_Upload.txt file with your PC's IP address, the IP address of the ESP32 to be updated, and the OTA password (which is "oavrc" by default), rename the OTA_Upload.txt file to .bat and drag and drop the .ino.bin file onto the OTA_Upload.bat file.  

## Follow instructions
[How to Use](../HowToUseTraining.md)  