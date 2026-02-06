# ESP32-C3 HC05 Emulator for OpenAVRc

This project implements a full HC-05 Bluetooth module emulator using an ESP32-C3.
It is designed to be used with OpenAVRc radios (Mega2560 based) without modifying
the OpenAVRc firmware.

The ESP32 communicates with the radio using the original HC-05 AT command set
and replaces the Bluetooth link with an ESP-NOW and/or WiFi transport layer.

---

## Features

- HC-05 AT command compatible interface
- Master and Slave modes
- Peer discovery (AT+INQ)
- Name resolution (AT+RNAME?)
- Persistent peer name cache (after first scan)
- Automatic reconnection after reboot
- ESP-NOW data transport between radios
- Optional WiFi TCP bridge for Desktop (SD / XMODEM)
- OLED status display (optional)
- Status LED (connected / transfer)

---

## HC-05 AT Commands Supported
Standard commands used by OpenAVRc:

- AT
- AT+ROLE
- AT+INIT
- AT+INQ
- AT+RMAAD
- AT+RNAME?
- AT+LINK
- AT+NAME?
- AT+PSWD?

Additional diagnostic commands (ESP32 only):

- AT+ADDR?
- AT+OAVINFO?
- AT+OAVSTAT?

These additional commands do not interfere with OpenAVRc
and are intended for manual diagnostics via serial or TCP console.

---

## Outline of the documentation
[Emulation mode hc-05](Emulation_Hc05.md)  
[Wiring Details](Wiring.md)  
[Wifi Protol Details](WifiXmodem.md)  
[Architecture Details](Architecture_Details.md)  
[Software Details](Software/Software_Details.md)  
[Hardware Details](Hardware/Hardware_Details.md)  
[Debug Details](Debug_Details.md)  
[Developper Commands](Developper_Cmds.md)  
[How to Use](HowToUse.md)  

---

## Hardware Notes

- ESP32-C3 runs at 3.3V logic
- Mega2560 TX to ESP32 RX must use a resistor divider
  (recommended 4.7k / 10k)
- Status LED on GPIO8
- Optional OLED on I2C (GPIO5 SDA / GPIO6 SCL)

---

## Debug

- BT debug can be enabled via serial console
- Dedicated debug commands are kept separate from normal AT traffic
- Data frames (tf) are filtered to avoid polluting the radio UI

---

## License

Open source project.
Use at your own risk.
