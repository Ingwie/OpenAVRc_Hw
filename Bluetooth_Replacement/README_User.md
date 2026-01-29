# OpenAVRc Bluetooth Replacement (ESP32)

This radio uses an ESP32 module instead of a classic HC-05 Bluetooth module.
No modification of OpenAVRc firmware is required.

---

## First Use

1. Power the radio
2. Enter the Bluetooth menu
3. Run a Bluetooth scan
4. Select the student radio
5. Pairing is complete

The scan is required once after firmware installation.

---

## Normal Operation

- Power ON both radios
- Connection is automatic
- The paired radio name is displayed
- No manual action required

---

## File Transfer (SD Card)

- Start Desktop on PC
- Connect to the radio
- Use normal OpenAVRc file transfer functions
- Files are transferred via WiFi automatically

---

## Indicators

- LED ON : radio connected
- LED blinking : file transfer in progress
- OLED (if present) shows link and transfer status

---

## Notes

- Do not power off during file transfer
- Only one transfer at a time
- Bluetooth scan is only needed when changing student radio
