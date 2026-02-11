---

## ESP32 Console Commands

The ESP32 provides a local console accessible via:
- USB serial
- TCP control port (if WiFi enabled)

These commands are intended for diagnostics and configuration.
They do not interfere with OpenAVRc operation.


```
[USB] Commands:
  h              -> help
  m              -> force ROLE=MASTER (1)
  s              -> force ROLE=SLAVE  (0)
  ssid <name>    -> set/save STA ssid
  pass <pass>    -> set/save STA password
  creds          -> show saved STA creds (ssid + pass length)
  moutput  <x>   -> set/save MASTER output: 0=PPM 1=SBUS 2=HC05 3=PPM2PPM (reboot)
  sinput   <x>   -> set/save SLAVE   input: 0=PPM 1=SBUS 2=HC05 3=PPM2PPM (reboot)
  ppmpulse <x>   -> set CPPM pulse mode (0=PPM POS, 1=PPM NEG)
  scan [ms]      -> MASTER: ESPNOW scan (like AT+INQ) and list responders
  scan link      -> MASTER: ESPNOW scan and link to SLAVE
  i              -> info
  d              -> toggle BT debug (sniff UART BT, decode tf frames, show DATA-RX)
  dtf            -> toggle BT count tf stream from SLAVE
  sg             -> toggle Slave  TF generator (simulate student data)
  w              -> show FT state
  w ap           -> start FT in AP mode (OpenAVRc-FT / openavrc123)
  w sta          -> start FT in STA mode using saved creds
  w sta <s> <p>  -> start FT in STA mode + save creds
  w off          -> stop FT and return normal
  at?            -> at Commands help
  diag           -> version and more
  diag tf        -> diagnostic tf stream
  diag link      -> diagnostic link

```
