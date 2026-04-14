# Compilations
This HC05 simulator for an Mini ESP32C3 Oled can be compiled with the Arduino IDE 2.3.7.  

## How to compile and upload
1. Open your Arduino IDE.  
2. Install the Espressif json link.  
```
https://espressif.github.io/arduino-esp32/package_esp32_index.json  
```
3. Download these [libraries](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Software/BUILD_FROM_SOURCES/libraries.zip).  
4. Unzip our [software](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Software/BUILD_FROM_SOURCES/).  
5. Select settings. 
  - select the board **esp32/ESP32 C3 Dev Module** or **esp32/ESP32 S3 Dev Module** (for joystick feature only).  
  - use C3 settings that follow.  
  ![pic](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Software/BUILD_FROM_SOURCES/compilation_C3.png)  
  - use S3 settings that follow.  
  ![pic](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth_Replacement/Software/BUILD_FROM_SOURCES/compilation_S3.png)  
6. Compile and upload the sketch.  

With the 1.8c version and more, It's possible to use an [OTA upload mode](OTA_Upload.md).  

## Follow instructions
[How to Use](../HowToUseTraining.md)  