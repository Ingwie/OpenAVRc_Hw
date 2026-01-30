---

## ESP32 Console Commands

The ESP32 provides a local console accessible via:
- USB serial
- TCP control port (if WiFi enabled)

These commands are intended for diagnostics and configuration.
They do not interfere with OpenAVRc operation.


```
m              -> force ROLE=MASTER (1)
s              -> force ROLE=SLAVE  (0)
i              -> info
d              -> toggle BT debug (sniff UART BT, decode tf frames, show DATA-RX)
dtf            -> toggle BT count tf stream from SLAVE
sg             -> toggle Slave  TF generator (simulate student data)
mg             -> toggle Master TF generator (simulate student data)
w              -> show FT state
w ap           -> start FT in AP mode (OpenAVRc-FT / openavrc123)
w sta          -> start FT in STA mode using saved creds
w sta <s> <p>  -> start FT in STA mode + save creds
w off          -> stop FT and return normal
ssid <name>    -> set/save STA ssid
pass <pass>    -> set/save STA password
creds          -> show saved STA creds (ssid + pass length)
h              -> help
diag           -> version and more
diag tf        -> diagnostic tf stream
diag link      -> diagnostic link
AT+OAVSTAT?    -> compact status line (manual)
AT+OAVCLR      -> reset diagnostic counters (manual)

```
