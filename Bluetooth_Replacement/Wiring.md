---

## Hardware Wiring

The ESP32-C3 replaces the HC-05 Bluetooth module and is connected
directly to the OpenAVRc radio (Mega2560) using a UART interface.

### Power

- ESP32-C3 powered from radio 5V rail
- Power is usually switched by the radio (BT ON/OFF)
- Do not power ESP32 directly from HC-05 footprint without verification

### UART Connection

OpenAVRc Mega2560 uses Serial1 for Bluetooth.

- Mega2560 TX -> ESP32 RX (GPIO4)
- Mega2560 RX <- ESP32 TX (GPIO7)

A voltage divider is mandatory on ESP32 RX:

- 4.7k from Mega TX to ESP32 RX
- 10k from ESP32 RX to GND

This limits 5V logic to safe 3.3V levels.

### Status Signals

  - GPIO8 : Status LED
  - GPIO9 : Status external LED
  - OFF : not connected
  - ON  : link connected
  - FAST BLINK : file transfer
  
### Scan button
  - GPIO10 : Scan button

### Optional OLED Display

- I2C interface
- SDA : GPIO5
- SCL : GPIO6
- Used for status, link state and transfer indication

### Notes

- ESP32-C3 runs at 3.3V logic
- All unused HC-05 pins can be left unconnected
- KEY pin is not required
