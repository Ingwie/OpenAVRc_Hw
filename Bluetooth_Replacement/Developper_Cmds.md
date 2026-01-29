---

## ESP32 Console Commands

The ESP32 provides a local console accessible via:
- USB serial
- TCP control port (if WiFi enabled)

These commands are intended for diagnostics and configuration.
They do not interfere with OpenAVRc operation.

### General

- h  
  Display help

- reboot  
  Reboot ESP32

### Bluetooth / Link

- B  
  Enable Bluetooth debug output

- dtf  
  Enable TF (data frame) debug

- destf  
  Disable TF debug

- AT+ADDR?  
  Display local Bluetooth-like address

- AT+OAVINFO?  
  Display internal status information

Example output:
