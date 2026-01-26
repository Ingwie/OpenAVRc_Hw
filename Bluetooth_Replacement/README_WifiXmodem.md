# WiFi XMODEM Bridge for OpenAVRc

This document describes the optional WiFi TCP bridge used to transfer
files between OpenAVRc radios and a PC using XMODEM.

The ESP32 replaces the original HC-05 Bluetooth link for file transfer
without modifying OpenAVRc firmware.

---

## Overview

- Control channel (TCP port 3334)
- File transfer channel (TCP port 3333)
- Compatible with OpenAVRc XMODEM implementation
- Tested with Desktop and TeraTerm

---

## Operating Modes

- STA mode (connects to existing WiFi network)
- AP mode (standalone access point)

Mode selection is done via ESP32 console commands.

---

## Typical Workflow

1. Power radio and ESP32
2. Desktop connects to ESP32 TCP port
3. Desktop sends XMODEM commands
4. OpenAVRc handles SD access normally
5. ESP32 forwards raw data

---

## Notes About Timing

- Desktop must be connected during transfer
- Control port remains active during file transfer
- XMODEM requires clean, unfiltered data
- tf frames are automatically muted during transfers

---

## Debugging

- Console access via TCP or USB
- Transfer activity indicated by LED blinking
- OLED shows transfer state when available

---

## Limitations

- First peer scan required after flashing firmware
- Only one active file transfer at a time
- TCP requires stable WiFi connection

---

## Compatibility

- OpenAVRc V3.x
- ESP32-C3 Arduino core 3.x
- Windows Desktop
- Linux supported (socket API)

---

## License

Open source project.
