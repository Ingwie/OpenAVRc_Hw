/*
  OpenAVRc HC-05 subset emulator over UART + ESP-NOW transport (ESP32-C3 core 3.x)
  + OLED status (SSD1306 I2C) on SDA=GPIO5, SCL=GPIO6
  + LED status on GPIO8

  One single firmware: OpenAVRc can configure role with AT+ROLE=0/1.
  USB console (line-based): m/s/i/d/g/w/ssid/pass/creds/h

  IMPORTANT PINS (because OLED uses GPIO5):
    - I2C: SDA=5, SCL=6
    - UART to Mega Serial1: RX=4, TX=7
    - KEY input: GPIO2 (AT mode when HIGH)
    - STATUS output: GPIO3 (HIGH when connected)
    - LED: GPIO8 (solid=connected, fast blink=connecting, slow blink=idle)
*/

#include <Arduino.h>
#include <WiFi.h>
#include <esp_now.h>
#include <esp_wifi_types.h>
#include <Preferences.h>
#include <esp_wifi.h>

#include <Wire.h>
#include <U8g2lib.h>

// ================== USER CONFIG ==================

float VERSION = 1.7f; // v1.7m

static const char* BUILD_TAG = "1.7m";

static constexpr int UART_RX    = 4;   // Mega TX1 -> ESP RX (via divider 4.7k/10k on your board)
static constexpr int UART_TX    = 7;   // ESP TX  -> Mega RX1

static constexpr int SDA_PIN    = 5;
static constexpr int SCL_PIN    = 6;

static constexpr int PIN_LED    = 8;

static constexpr uint8_t ESPNOW_CHANNEL = 1;

static constexpr uint32_t DEFAULT_BAUD = 115200;   // OpenAVRc init at 115200 on test board


static constexpr uint8_t  DEFAULT_ROLE = 0;      // 0=Slave by default
static constexpr const char* DEFAULT_NAME = "OAVRC";
static constexpr const char* DEFAULT_PSWD = "1234";

static constexpr uint16_t HELLO_INTERVAL_MS = 800;
static constexpr uint32_t LINK_TIMEOUT_MS = 3000; // v1.7a: consider link lost after no RX
static constexpr uint16_t MAX_PAYLOAD = 220;

// OLED
static constexpr uint8_t OLED_ADDR = 0x3C;
static constexpr int OLED_W = 128;
static constexpr int OLED_H = 64;
// =================================================

HardwareSerial BT(1);
Preferences prefs;

// OLED 0.42" (often 72x40) with U8g2
U8G2_SSD1306_72X40_ER_F_HW_I2C u8g2(U8G2_R0, U8X8_PIN_NONE);
static bool oled_ok = false;

enum {CPPM_MODE = 0, HC05_MODE};

// Persistent config
//static uint8_t  cfg_mode = HC05_MODE; 
static uint32_t cfg_baud = DEFAULT_BAUD;
static uint8_t  cfg_role = DEFAULT_ROLE;     // 0 slave, 1 master
static String   cfg_name = DEFAULT_NAME;
static String   cfg_pswd = DEFAULT_PSWD;

// Peer management
static uint8_t  bound_peer_mac[6] = {0};
static bool     bound_peer_set = false;

static uint8_t  linked_peer_mac[6] = {0};
static bool     linked_peer_set = false;

static volatile bool link_connected = false;
static uint32_t last_rx_ms = 0;
static uint32_t last_tx_ms = 0;
static int8_t   last_rssi_dbm = 0;
static uint32_t rx_count = 0;
static uint32_t tx_count = 0;
static uint32_t stat_boot_ms = 0;
static uint32_t tfMuteUntilMs = 0;   // mute TF until this time (millis)

static bool tfDropLine = false;
static uint8_t tfState = 0; // 0 none, 1 saw 't', 2 saw 'tf'

static bool tfMute = false;          // TFMUTE par défaut
static bool tfAtLineStart = true;


// ---------------- Helpers ----------------
static bool isATMode() {
  return false;
}

// Link phase (for OLED/LED)
enum LinkPhase : uint8_t { PH_IDLE=0, PH_CONNECTING=1, PH_CONNECTED=2 };
static volatile LinkPhase link_phase = PH_IDLE;

// ==== Scan table (like OpenAVRc REMOTE_BT_DEV_MAX_NB) ====
static constexpr uint8_t MAX_SCAN_DEV = 3;

struct ScanDev {
  uint8_t mac[6];
  char    name[16];
  bool    used;
};

static volatile bool scanning = false;
static ScanDev scanDev[MAX_SCAN_DEV];
static volatile uint8_t scanCount = 0;

// --- v1.6l: persistent peer name cache for AT+RNAME? ---
static bool saved_peer_set = false;
static uint8_t saved_peer_mac[6] = {0};
static char saved_peer_name[16] = {0};

static void scanClear() {
  for (uint8_t i=0;i<MAX_SCAN_DEV;i++) {
    scanDev[i].used = false;
    scanDev[i].name[0] = 0;
  }
  scanCount = 0;
}

static int scanFindByMac(const uint8_t mac[6]) {
  for (uint8_t i=0;i<MAX_SCAN_DEV;i++) {
    if (scanDev[i].used && memcmp(scanDev[i].mac, mac, 6) == 0) return i;
  }
  return -1;
}

static void scanAddOrUpdate(const uint8_t mac[6], const char* name) {
  int idx = scanFindByMac(mac);
  if (idx < 0) {
    for (uint8_t i=0;i<MAX_SCAN_DEV;i++) {
      if (!scanDev[i].used) { idx = i; break; }
    }
  }
  if (idx < 0) return; // full

  scanDev[idx].used = true;
  memcpy(scanDev[idx].mac, mac, 6);
  if (name && *name) {
    strncpy(scanDev[idx].name, name, sizeof(scanDev[idx].name)-1);
    scanDev[idx].name[sizeof(scanDev[idx].name)-1] = 0;
  } else {
    scanDev[idx].name[0] = 0;
  }

  uint8_t c = 0;
  for (uint8_t i=0;i<MAX_SCAN_DEV;i++) if (scanDev[i].used) c++;
  scanCount = c;
}

static void loadConfig() {
  prefs.begin("hc05emu", true);
  //cfg_mode = prefs.getUInt("mode", HC05_MODE);												
  cfg_baud = prefs.getUInt("baud", DEFAULT_BAUD);
  cfg_role = prefs.getUChar("role", DEFAULT_ROLE);
  cfg_name = prefs.getString("name", DEFAULT_NAME);
  cfg_pswd = prefs.getString("pswd", DEFAULT_PSWD);

  size_t n = prefs.getBytesLength("bind");
  if (n == 6) { prefs.getBytes("bind", bound_peer_mac, 6); bound_peer_set = true; }
  else bound_peer_set = false;

  // v1.6l: load cached peer name/mac
  size_t n2 = prefs.getBytesLength("pmac");
  if (n2 == 6) { prefs.getBytes("pmac", saved_peer_mac, 6); saved_peer_set = true; }
  else saved_peer_set = false;
  String pn = prefs.getString("pnam", "");
  if (pn.length()) {
    strncpy(saved_peer_name, pn.c_str(), sizeof(saved_peer_name)-1);
    saved_peer_name[sizeof(saved_peer_name)-1] = 0;
  }
  prefs.end();
}

static void saveConfig() {
  prefs.begin("hc05emu", false);
  //prefs.putUInt("mode", cfg_mode);//HC05 or CPPM mode													   
  prefs.putUInt("baud", cfg_baud);
  prefs.putUChar("role", cfg_role);
  prefs.putString("name", cfg_name);
  prefs.putString("pswd", cfg_pswd);
  if (bound_peer_set) prefs.putBytes("bind", bound_peer_mac, 6);
  // v1.6l: save cached peer name/mac
  if (saved_peer_set) prefs.putBytes("pmac", saved_peer_mac, 6);
  if (saved_peer_name[0]) prefs.putString("pnam", String(saved_peer_name));
  prefs.end();
}

static void macToStr(const uint8_t mac[6], char* out, size_t outSz) {
  snprintf(out, outSz, "%02X:%02X:%02X:%02X:%02X:%02X",
           mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
}

static String macToNapUapLap(const uint8_t mac[6]) {
  char b[24];
  uint16_t nap = (uint16_t)((mac[0] << 8) | mac[1]);
  uint8_t  uap = mac[2];
  uint32_t lap = ((uint32_t)mac[3] << 16) | ((uint32_t)mac[4] << 8) | mac[5];
  snprintf(b, sizeof(b), "%04X:%02X:%06lX", nap, uap, (unsigned long)lap);
  return String(b);
}

static bool parseNapUapLap(const char* s, uint8_t out[6]) {
  // accept "NAP:UAP:LAP" or "NAP,UAP,LAP"
  char tmp[40];
  size_t L = strnlen(s, sizeof(tmp) - 1);
  memcpy(tmp, s, L); tmp[L] = 0;

  for (size_t i=0;i<strlen(tmp);i++) {
    if (tmp[i] == ' ') { tmp[i]=0; break; }
    if (tmp[i] == ',') tmp[i] = ':';
  }

  char *p = tmp;
  char *a = strsep(&p, ":");
  char *b = strsep(&p, ":");
  char *c = strsep(&p, ":");
  if (!a || !b || !c) return false;

  uint32_t nap = strtoul(a, nullptr, 16);
  uint32_t uap = strtoul(b, nullptr, 16);
  uint32_t lap = strtoul(c, nullptr, 16);

  out[0] = (nap >> 8) & 0xFF;
  out[1] = (nap >> 0) & 0xFF;
  out[2] = (uap >> 0) & 0xFF;
  out[3] = (lap >> 16) & 0xFF;
  out[4] = (lap >> 8) & 0xFF;
  out[5] = (lap >> 0) & 0xFF;
  return true;
}

// ---------------- BT debug (USB console) ----------------
static bool dbg_bt = false;

// --- Slave UART monitor (debug) ---
static bool dbg_uart_slave = false;
static char dbg_uart_line[128];
static uint8_t dbg_uart_len = 0;
static bool usb_at_mode = false; // v1.7l: echo AT responses to USB when using 'at' command

static bool dbg_tf = false;

// --- TF monitor (MASTER): count dropped tf and compute tf/s ---
static uint32_t tfDroppedCount = 0;
static uint32_t tfDroppedPrev = 0;
static uint32_t tfRate = 0;          // tf per second (approx)
static uint32_t tfRateLastMs = 0;
static uint32_t tfPrintLastMs = 0;   // rate print pacing when dbg is ON

static char btRxLine[160];
static uint16_t btRxLen = 0;

static char btTxLine[160];
static uint16_t btTxLen = 0;

static int hexNib(char c) {
  if (c >= '0' && c <= '9') return c - '0';
  if (c >= 'A' && c <= 'F') return 10 + (c - 'A');
  if (c >= 'a' && c <= 'f') return 10 + (c - 'a');
  return -1;
}

// Decode OpenAVRc frame: "tf sXXXXsXXXX...:YY"
static bool decodeTfFrame(const char* line, uint16_t ch[8], bool& chkOk, uint8_t& rxChk, uint8_t& calcChk) {
  chkOk = false;
  rxChk = 0;
  calcChk = 0;

  if (strncmp(line, "tf ", 3) != 0) return false;
  const char* p = line + 3;

  uint8_t chk = 0;

  for (uint8_t i = 0; i < 8; i++) {
    if (*p != 's') return false;
    chk ^= 's';
    p++;

    uint16_t raw = 0;
    for (uint8_t n = 0; n < 4; n++) {
      int v = hexNib(*p);
      if (v < 0) return false;
      chk ^= (uint8_t)(*p);
      raw = (raw << 4) | (uint16_t)v;
      p++;
    }
    ch[i] = raw >> 4;
  }

  if (*p != ':') return false;
  p++;

  int h = hexNib(p[0]);
  int l = hexNib(p[1]);
  if (h < 0 || l < 0) return false;

  rxChk = (uint8_t)((h << 4) | l);
  calcChk = chk;
  chkOk = (rxChk == calcChk);
  return true;
}

static void dbgPrintLine(const char* tag, const char* line) {
  Serial.print(tag);
  Serial.print(' ');
  Serial.println(line);

  uint16_t ch[8];
  bool ok; uint8_t rx, calc;
  if (decodeTfFrame(line, ch, ok, rx, calc)) {
    Serial.print("    TF ch:");
    for (int i=0;i<8;i++) { Serial.print(' '); Serial.print(ch[i]); }
    Serial.print("  chk ");
    Serial.println(ok ? "OK" : "ERR");
  }
}

static void dbgFeedChar(char c, char* buf, uint16_t& len, const char* tag) {
  if (c == '\r') return;
  if (c == '\n') {
    buf[len] = 0;
    if (len > 0) dbgPrintLine(tag, buf);
    len = 0;
    return;
  }
  if (len < 159) buf[len++] = c;
  else len = 0;
}

static void dbgUartSlaveFeed(char c) {
  if (!dbg_uart_slave) return;
  if (c == '\r') return; // ignore CR
  if (c == '\n') {
    if (dbg_uart_len) {
      dbg_uart_line[dbg_uart_len] = 0;
      Serial.print("[SLV-UART] ");
      Serial.println(dbg_uart_line);
      dbg_uart_len = 0;
    }
    return;
  }
  if (dbg_uart_len < sizeof(dbg_uart_line) - 1) {
    dbg_uart_line[dbg_uart_len++] = c;
  }
}


static void btWriteStr(const char* s) {
  BT.print(s);
  if (usb_at_mode) Serial.print(s);
  if (dbg_bt) {
    for (const char* p=s; *p; ++p) dbgFeedChar(*p, btTxLine, btTxLen, "[TX]");
  }
}


static void btWriteU32(uint32_t v) {
  char buf[16];
  snprintf(buf, sizeof(buf), "%lu", (unsigned long)v);
  btWriteStr(buf);
}
static void btWriteI32(int32_t v) {
  char buf[16];
  snprintf(buf, sizeof(buf), "%ld", (long)v);
  btWriteStr(buf);
}
static void btWriteStrS(const String& s) {
  btWriteStr(s.c_str());
}

// ================= DATA debug (ESPNOW DATA RX) =================
static char dataLine[200];
static uint16_t dataLen = 0;

static void dataFeedChar(char c) {
  if (c == '\r') return;
  if (c == '\n') {
    dataLine[dataLen] = 0;
    if (dataLen > 0) {
      Serial.print("[DATA-RX] ");
      Serial.println(dataLine);

      uint16_t ch[8];
      bool ok; uint8_t rx, calc;
      if (decodeTfFrame(dataLine, ch, ok, rx, calc)) {
        Serial.print("          CH:");
        for (int i=0;i<8;i++) { Serial.print(' '); Serial.print(ch[i]); }
        Serial.print("  CHK ");
        Serial.println(ok ? "OK" : "ERR");
      }
    }
    dataLen = 0;
    return;
  }
  if (dataLen < sizeof(dataLine)-1) dataLine[dataLen++] = c;
  else dataLen = 0;
}

// ================= TF generator (simulate student) =================
static bool gen_tf = false;
static bool Master_gen_tf = false;
static uint32_t gen_last_ms = 0;
static uint32_t gen_phase = 0;

static char hexDigit(uint8_t v) {
  v &= 0xF;
  return (v < 10) ? ('0' + v) : ('A' + (v - 10));
}

static void buildTfFrame(const uint16_t ch[8], char* out, size_t outSz) {
  uint8_t chk = 0;
  size_t pos = 0;

  auto putc = [&](char c) {
    if (pos + 1 < outSz) out[pos++] = c;
  };
  auto putHexNib = [&](uint8_t nib) {
    char c = hexDigit(nib);
    putc(c);
    chk ^= (uint8_t)c;
  };

  // "tf " prefix (NOT included in checksum in OpenAVRc)
  putc('t'); putc('f'); putc(' ');

  for (int i = 0; i < 8; i++) {
    putc('s');
    chk ^= (uint8_t)'s';

    // OpenAVRc encodes 1500 as "5DC" (not "5DC0")
    // i.e. take (ch << 4) and emit nibbles 12, 8, 4 only => 3 hex digits.
    uint16_t v = (uint16_t)(ch[i] << 4);
    putHexNib((v >> 12) & 0xF);
    putHexNib((v >>  8) & 0xF);
    putHexNib((v >>  4) & 0xF);
  }

  // ':' and checksum digits are NOT included in the XOR (OpenAVRc does XOR on first 32 chars)
  putc(':');
  putc(hexDigit((chk >> 4) & 0xF));
  putc(hexDigit((chk >> 0) & 0xF));

  // End of line: for uCLI, use CR only (avoid empty command on LF)
  putc('\r');

  if (pos < outSz) out[pos] = 0;
  else out[outSz - 1] = 0;
}


// ================= WiFi File Transfer (TCP <-> UART) =================
enum FtMode : uint8_t { FT_OFF=0, FT_AP=1, FT_STA=2 };
static FtMode ft_mode = FT_OFF;
static bool wifi_ft = false;


// ===== v1.6j: XMODEM detection + TF mute during FT =====
static bool xferActive = false;
static uint32_t xferLastMs = 0;
static uint32_t xferForceUntilMs = 0; // force XMODEM active window after "cp xmdm"
static uint32_t ftTcp2Uart = 0;
static uint32_t ftUart2Tcp = 0;
static uint32_t ftLastPrintMs = 0;
static uint32_t ftLastMasterPrintMs = 0;

static WiFiServer ftServer(3333);
static WiFiServer ctrlServer(3334);
static WiFiClient ctrlClient;

static WiFiClient ftClient;

static String ft_sta_ssid;
static String ft_sta_pass;

static const char* FT_AP_SSID = "OpenAVRc-FT";
static const char* FT_AP_PASS = "openavrc123";   // >= 8 chars

static void espnowStart();
static void espnowStop();

static void ftLoadCreds() {
  prefs.begin("hc05emu", true);
  ft_sta_ssid = prefs.getString("ft_ssid", "");
  ft_sta_pass = prefs.getString("ft_pass", "");
  prefs.end();
}
static void ftSaveCreds() {
  prefs.begin("hc05emu", false);
  prefs.putString("ft_ssid", ft_sta_ssid);
  prefs.putString("ft_pass", ft_sta_pass);
  prefs.end();
}

static void ftPrintIp() {
  IPAddress ip = (ft_mode == FT_AP) ? WiFi.softAPIP() : WiFi.localIP();
  Serial.print("[FT] IP: ");
  Serial.println(ip);
  Serial.println("[FT] TCP port: 3333");
}

static bool wifiFtStartAP() {
  espnowStop();
  wifi_ft = true;

  WiFi.mode(WIFI_AP);
  WiFi.softAP(FT_AP_SSID, FT_AP_PASS);

  ftServer.begin();
  ftServer.setNoDelay(true);

  ft_mode = FT_AP;
  Serial.print("[FT] Mode: AP  SSID: ");
  Serial.println(FT_AP_SSID);
  ftPrintIp();
  return true;
}

static bool wifiFtStartSTA(const String& ssid, const String& pass) {
  espnowStop();
  wifi_ft = true;

  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid.c_str(), pass.c_str());

  Serial.print("[FT] Mode: STA  joining SSID: ");
  Serial.println(ssid);

  uint32_t t0 = millis();
  while (WiFi.status() != WL_CONNECTED && millis() - t0 < 12000) {
    delay(250);
    Serial.print('.');
  }
  Serial.println();

  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("[FT] STA connect FAILED");
    wifi_ft = false;
    ft_mode = FT_OFF;
    WiFi.mode(WIFI_OFF);
    espnowStart();
    return false;
  }

  ftServer.begin();
  ftServer.setNoDelay(true);

  ft_mode = FT_STA;
  ftPrintIp();
  return true;
}

static void wifiFtStop() {
  if (ftClient) ftClient.stop();
  ftServer.end();

  // Keep CTRL server always on
  // (It will keep running as long as WiFi interface stays up)

  if (ft_mode == FT_AP) {
    // Stop AP completely
    WiFi.softAPdisconnect(true);
    WiFi.mode(WIFI_OFF);
    wifi_ft = false;
    ft_mode = FT_OFF;
    espnowStart();
    Serial.println("[FT] stopped");
    return;
  }

  if (ft_mode == FT_STA) {
    // Stop DATA but keep STA connected so CTRL remains reachable
    wifi_ft = false;
    ft_mode = FT_OFF;
    // Do NOT WiFi.mode(WIFI_OFF) here
    espnowStart(); // re-enable ESPNOW on current STA channel
    Serial.println("[FT] stopped (STA kept for CTRL)");
    return;
  }

  // default
  WiFi.mode(WIFI_OFF);
  wifi_ft = false;
  ft_mode = FT_OFF;
  espnowStart();
  Serial.println("[FT] stopped");
}

static inline bool isXmodemByte(uint8_t b) {
  return (b==0x01 || b==0x02 || b==0x04 || b==0x06 || b==0x15 || b==(uint8_t)'C');
}

static inline void xferTouch(uint8_t b) {
  if (isXmodemByte(b)) { xferActive = true; xferLastMs = millis(); }
}

static void wifiFtTask(HardwareSerial& uart) {
  if (!wifi_ft) return;

  if (!ftClient || !ftClient.connected()) {
    ftClient = ftServer.available(); // deprecated warning ok
    if (ftClient) {
      ftClient.setNoDelay(true);
      Serial.println("[FT] client connected");
      // reset states per new connection
      ftTcp2Uart = 0; ftUart2Tcp = 0; ftLastPrintMs = millis();
      xferActive = false;
      tfDropLine = false;
      tfAtLineStart = true;
      tfState = 0;
    }
  }
  if (!ftClient || !ftClient.connected()) return;

  
// TCP -> UART
// Also sniff ASCII command lines to arm XMODEM right after "cp xmdm ..." (Desktop copy PC->SD).
static char ftCmdBuf[96];
static uint8_t ftCmdLen = 0;

while (ftClient.available()) {
  uint8_t b = (uint8_t)ftClient.read();

  // Arm XMODEM window on command line (does NOT change forwarded bytes)
  if (!xferActive) {
    if (b == '\r' || b == '\n') {
      if (ftCmdLen > 0) {
        ftCmdBuf[ftCmdLen] = 0;
        // case-insensitive search for "cp xmdm"
        for (uint8_t i = 0; i + 7 < ftCmdLen; i++) {
          char c0 = ftCmdBuf[i+0] | 0x20;
          char c1 = ftCmdBuf[i+1] | 0x20;
          char c2 = ftCmdBuf[i+2] | 0x20;
          char c3 = ftCmdBuf[i+3] | 0x20;
          char c4 = ftCmdBuf[i+4] | 0x20;
          char c5 = ftCmdBuf[i+5] | 0x20;
          char c6 = ftCmdBuf[i+6] | 0x20;
          if (c0=='c' && c1=='p' && c2==' ' && c3=='x' && c4=='m' && c5=='d' && c6=='m') {
            xferActive = true;
            xferLastMs = millis();
            xferForceUntilMs = xferLastMs + 15000; // keep filter disabled while XMODEM handshake starts
            Serial.println("[FT] XMODEM armed (cp xmdm)");
            break;
          }
        }
        ftCmdLen = 0;
      }
    } else if (ftCmdLen < sizeof(ftCmdBuf)-1) {
      // record only printable-ish bytes to avoid binary pollution
      if (b >= 0x20 && b <= 0x7E) ftCmdBuf[ftCmdLen++] = (char)b;
      else ftCmdLen = 0; // reset on other controls
    }
  }

  xferTouch(b);
  uart.write(b);
  ftTcp2Uart++;
}

  // UART -> TCP (mute 'tf ' lines when SLAVE and not in XMODEM transfer)
  while (uart.available()) {
    uint8_t b = (uint8_t)uart.read();
    xferTouch(b);

    if (cfg_role == 0) {
      if (tfDropLine) {
        if (b == '\n' || b == '\r') {
          tfDropLine = false;
          tfAtLineStart = true;
          tfState = 0;
        }
        continue;
      }

      if (tfAtLineStart) {
        if (tfState == 0) {
          if (b == 't') { tfState = 1; continue; }
        } else if (tfState == 1) {
          if (b == 'f') { tfState = 2; continue; }
          // not tf line: flush buffered 't'
          ftClient.write((const uint8_t*)"t", 1);
          tfState = 0;
          // fall through
        } else if (tfState == 2) {
          if (b == ' ') { tfDropLine = true; tfState = 0; continue; }
          // not "tf ": flush "tf"
          ftClient.write((const uint8_t*)"t", 1);
          ftClient.write((const uint8_t*)"f", 1);
          tfState = 0;
          // fall through
        }
      }
    }

    ftClient.write(&b, 1);
    ftUart2Tcp++;

    if (b == '\n' || b == '\r') {
      tfAtLineStart = true;
      tfState = 0;
    } else {
      tfAtLineStart = false;
    }
  }

  // periodic stats on Serial only (never to TCP/UART), helps diagnose file copy issues
  if (xferActive) {
    uint32_t now = millis();
    if (now - ftLastPrintMs >= 1000) {
      ftLastPrintMs = now;
      Serial.printf("[FT] bytes tcp->uart=%u uart->tcp=%u\n", (unsigned)ftTcp2Uart, (unsigned)ftUart2Tcp);
    }
  }
}


// ================= FT CTRL (TCP 3334) v1.6j =================
// Control channel is always listening. It can start/stop FT without USB typing.
// Commands (one per line, LF or CRLF):
//   FT:STA
//   FT:AP
//   FT:OFF
//   FT:STATUS
static void ctrlTask()
{
  // accept client
  if (!ctrlClient || !ctrlClient.connected()) {
    ctrlClient = ctrlServer.available();
    if (ctrlClient) {
      ctrlClient.setNoDelay(true);
      Serial.println("[CTRL] client connected");
    }
  }
  if (!ctrlClient || !ctrlClient.connected()) return;

  // read line
  if (!ctrlClient.available()) return;
  String cmd = ctrlClient.readStringUntil('\n');
  cmd.trim();
  if (cmd.length() == 0) return;

  if (cmd == "FT:STATUS") {
    String mode = (ft_mode==FT_AP) ? "AP" : (ft_mode==FT_STA) ? "STA" : "OFF";
    IPAddress ip = (ft_mode==FT_AP) ? WiFi.softAPIP() : WiFi.localIP();
    ctrlClient.printf("OK FT=%s MODE=%s IP=%s PORT=3333\r\n", wifi_ft ? "ON":"OFF", mode.c_str(), ip.toString().c_str());
    return;
  }

  // Reboot command (useful when Desktop closes): ESP32 restarts and goes back to wait/advertise.
  // Accepted commands: REBOOT, RST, SYS:REBOOT
  if (cmd == "REBOOT" || cmd == "RST" || cmd == "SYS:REBOOT") {
    ctrlClient.println("OK REBOOT");
    ctrlClient.flush();
    delay(80);
    ESP.restart();
    return;
  }


  if (cmd == "FT:OFF") {
    Serial.println("w off");
    if (wifi_ft) {
      wifiFtStop();          // modified below to keep STA if needed
    }
    ctrlClient.println("OK OFF");
    return;
  }

  if (cmd == "FT:STA") {
    Serial.println("w sta");
    // Use saved STA creds
    if (ft_sta_ssid.length()==0 || ft_sta_pass.length()==0) {
      ctrlClient.println("ERR NO_CREDS");
      return;
    }
    if (wifi_ft) wifiFtStop();
    bool ok = wifiFtStartSTA(ft_sta_ssid, ft_sta_pass);
    ctrlClient.println(ok ? "OK STA" : "ERR STA");
    return;
  }

  if (cmd == "FT:AP") {
    Serial.println("w ap");
    if (wifi_ft) wifiFtStop();
    bool ok = wifiFtStartAP();
    ctrlClient.println(ok ? "OK AP" : "ERR AP");
    return;
  }

  ctrlClient.println("ERR UNKNOWN");
}


// ---------------- LED ----------------
static void ledInit() {
  pinMode(PIN_LED, OUTPUT);
  digitalWrite(PIN_LED, LOW);
}

static void ledUpdate() {
  if (wifi_ft) {
    uint32_t now = millis();
    bool on = ((now / 300) & 1) != 0;
    digitalWrite(PIN_LED, on ? HIGH : LOW);
    return;
  }

  if (link_phase == PH_CONNECTED) {
    digitalWrite(PIN_LED, HIGH);
    return;
  }

  uint32_t now = millis();
  uint16_t period = (link_phase == PH_CONNECTING) ? 150 : 700;
  bool on = ((now / period) & 1) != 0;
  digitalWrite(PIN_LED, on ? HIGH : LOW);
}

// ---------------- OLED draw (needs wifi_ft/ft_mode) ----------------
static void oledInit() {
  Wire.begin(SDA_PIN, SCL_PIN);
  oled_ok = u8g2.begin();
  if (!oled_ok) {
    Serial.println("[OLED] init FAILED");
  } else {
    Serial.println("[OLED] init OK (U8g2)");
  }
}


static void oledDrawStatus() {
  if (!oled_ok) return;

  u8g2.clearBuffer();
  u8g2.setFont(u8g2_font_6x10_tf);   // lisible, compact

  // 72px width => ~12 chars max
  // Line 1 (y=10): name + role letter
  u8g2.setCursor(0, 10);
  // cfg_name doit être une String
  for (int i = 0; i < 11 && i < (int)cfg_name.length(); i++) {
    u8g2.print(cfg_name[i]);
  }
  u8g2.print(cfg_role ? "_M" : "_S");

  // if((int)cfg_name.length() <= 5)//si la taille du nom est > à 5, pas de version à
  // {
  //   if (sizeof(BUILD_TAG) > 3)
  //     u8g2.setCursor(49, 10);//version avec lettre
  //   else
  //     u8g2.setCursor(55, 10);//version sans lettre
  //   u8g2.print(BUILD_TAG);
  // }
  // else//placé à la 4ème ligne si name > 5 caractères
  //{
    if (sizeof(BUILD_TAG) > 3)
      u8g2.setCursor(49, 40);//version avec lettre
    else
      u8g2.setCursor(55, 40);//version sans lettre
    u8g2.print(BUILD_TAG);
 //}

  // Line 2 (y=20): CONNECTED/CONNECTING/READY
  u8g2.setCursor(0, 20);
  if (link_phase == PH_CONNECTED) u8g2.print("CONNECTED");
  else if (link_phase == PH_CONNECTING) u8g2.print("CONNECTING");
  else u8g2.print("READY");

  // Line 3 (y=30): AUTO
  u8g2.setCursor(0, 30);
  // u8g2.print("AUTO");

  u8g2.print("RSSI=");
  u8g2.print((int32_t)last_rssi_dbm);
  u8g2.print("dBm");

  // Line 4 (y=40): FT state
  u8g2.setCursor(0, 40);
  u8g2.print(wifi_ft ? "FT ON" : "FT OFF");

  u8g2.sendBuffer();
}

// ---------------- ESPNOW ----------------
enum : uint8_t { PKT_HELLO=1, PKT_HELLO_ACK=2, PKT_DATA=3, PKT_SCAN_REQ=4, PKT_SCAN_RSP=5 };

struct __attribute__((packed)) Packet {
  uint8_t type;
  uint8_t flags;
  uint16_t len;
  uint8_t payload[MAX_PAYLOAD];
};

static bool ensurePeer(const uint8_t mac[6]) {
  if (esp_now_is_peer_exist(mac)) return true;

  // Use current WiFi home channel (important when STA is connected to an AP)
  uint8_t ch = ESPNOW_CHANNEL;
  wifi_second_chan_t sch = WIFI_SECOND_CHAN_NONE;
  esp_wifi_get_channel(&ch, &sch);

  esp_now_peer_info_t pi{};
  memcpy(pi.peer_addr, mac, 6);
  pi.channel = ch;
  pi.encrypt = false;
  return esp_now_add_peer(&pi) == ESP_OK;
}

static void sendPkt(const uint8_t mac[6], uint8_t type, const void* data, uint16_t len, uint8_t flags=0) {
  if (!ensurePeer(mac)) return;
  Packet p{};
  p.type = type;
  p.flags = flags;
  p.len = (len > MAX_PAYLOAD) ? MAX_PAYLOAD : len;
  if (data && p.len) memcpy(p.payload, data, p.len);
  esp_now_send(mac, (uint8_t*)&p, sizeof(Packet) - MAX_PAYLOAD + p.len);
  last_tx_ms = millis();
  tx_count++;
}

static void broadcastPkt(uint8_t type, const void* data, uint16_t len) {
  uint8_t bcast[6] = {0xFF,0xFF,0xFF,0xFF,0xFF,0xFF};
  ensurePeer(bcast);
  sendPkt(bcast, type, data, len);
}

// Core 3.x callback signature:static void onRecv(const esp_now_recv_info* info, const uint8_t* data, int len) {
static void onRecv(const esp_now_recv_info* info, const uint8_t* data, int len) {

  if (!info || !data || len < 4) return;
  const uint8_t* mac = info->src_addr;
  const Packet* p = (const Packet*)data;

  last_rx_ms = millis();
  rx_count++;
  if (info && info->rx_ctrl) last_rssi_dbm = (int8_t)info->rx_ctrl->rssi;


  if (p->type == PKT_HELLO) {
    memcpy(linked_peer_mac, mac, 6);
    linked_peer_set = true;
    link_connected = true;
    link_phase = PH_CONNECTED;
    //setStatusPin(true);
    sendPkt(mac, PKT_HELLO_ACK, nullptr, 0);
    return;
  }
  if (p->type == PKT_HELLO_ACK) {
    memcpy(linked_peer_mac, mac, 6);
    linked_peer_set = true;
    link_connected = true;
    link_phase = PH_CONNECTED;
    //setStatusPin(true);
    return;
  }

  if (p->type == PKT_DATA) {

    // MASTER only: filter Trainer frames unless explicitly unmuted
    if (cfg_role == 1 && (tfMute || (millis() < tfMuteUntilMs))) {
      for (uint16_t i = 0; i < p->len; i++) {
        uint8_t b = p->payload[i];

        // Drop whole "tf ..." line safely, even if fragmented
        if (tfDropLine) {
          if (b == '\n' || b == '\r') {
            tfDropLine = false;
            tfAtLineStart = true;
            tfState = 0;
          }
          continue;
        }

        if (tfAtLineStart) {
          if (tfState == 0 && b == 't') { tfState = 1; continue; }
          if (tfState == 1 && b == 'f') { tfState = 2; continue; }
          if (tfState == 2 && b == ' ') {
            tfDropLine = true;
            tfDroppedCount++;
            tfState = 0;
            continue;
          }

          // Not a tf frame → flush buffered prefix
          if (tfState == 1) BT.write('t');
          if (tfState == 2) { BT.write('t'); BT.write('f'); }
          tfState = 0;
        }

        BT.write(b);
        tfAtLineStart = (b == '\n' || b == '\r');
      }
      return;
    }

    // Default path (tfMute OFF or SLAVE)
    BT.write(p->payload, p->len);

    if (dbg_bt && p->len) {
      for (uint16_t i = 0; i < p->len; i++)
        dataFeedChar((char)p->payload[i]);
    }
    return;
  }


  if (p->type == PKT_SCAN_REQ) {
    if (cfg_role == 0) {
      char namebuf[16] = {0};
      strncpy(namebuf, cfg_name.c_str(), sizeof(namebuf)-1);
      sendPkt(mac, PKT_SCAN_RSP, namebuf, (uint16_t)strlen(namebuf));
    }
    return;
  }
  if (p->type == PKT_SCAN_RSP) {
    if (cfg_role == 1 && scanning) {
      char rname[16] = {0};
      uint16_t n = (p->len < sizeof(rname)-1) ? p->len : (sizeof(rname)-1);
      if (n) memcpy(rname, p->payload, n);
      rname[n] = 0;
      scanAddOrUpdate(mac, rname);
      // v1.6l: cache peer name for AT+RNAME? after reboot
      bool changed = (!saved_peer_set) || memcmp(saved_peer_mac, mac, 6) != 0 || strncmp(saved_peer_name, rname, sizeof(saved_peer_name)) != 0;
      if (changed) {
        memcpy(saved_peer_mac, mac, 6);
        saved_peer_set = true;
        strncpy(saved_peer_name, rname, sizeof(saved_peer_name)-1);
        saved_peer_name[sizeof(saved_peer_name)-1] = 0;
        saveConfig();
      }
    }
    return;
  }
}


static void espnowStart() {
  WiFi.mode(WIFI_STA);

  // If STA is connected, keep the AP's channel (do NOT force ESPNOW_CHANNEL)
  // Otherwise, set a default channel for standalone ESPNOW use.
  if (WiFi.status() != WL_CONNECTED) {
    esp_wifi_set_channel(ESPNOW_CHANNEL, WIFI_SECOND_CHAN_NONE);
  }

  uint8_t ch = ESPNOW_CHANNEL;
  wifi_second_chan_t sch = WIFI_SECOND_CHAN_NONE;
  esp_wifi_get_channel(&ch, &sch);
  Serial.printf("[ESPNOW] home channel=%u\n", ch);

  esp_now_deinit();
  if (esp_now_init() != ESP_OK) {
    Serial.println("esp_now_init FAILED");
    return;
  }
  esp_now_register_recv_cb(onRecv);
}

static void espnowStop() {
  esp_now_deinit();
}

// ---------------- AT subset ----------------
static void btOK()  { btWriteStr("OK\r\n"); }
static void btERR() { btWriteStr("ERROR\r\n"); }

static void btReplyGet(const String& prefix, const String& value) {
  btWriteStr(prefix.c_str());
  BT.print(value);
  if (dbg_bt) {
    for (size_t i=0;i<value.length();i++) dbgFeedChar(value[i], btTxLine, btTxLen, "[TX]");
  }
  btWriteStr("\r\nOK\r\n");
}

static void btReplyPswd() {
  btReplyGet("+PSWD:", String("\"") + cfg_pswd + "\"");
}

static void handleATLine(const String& line) {
  if (line == "AT") { btOK(); return; }

  if (line.startsWith("AT+UART=")) {
    String arg = line.substring(8);
    uint32_t b = (uint32_t)strtoul(arg.c_str(), nullptr, 10);
    if (b >= 1200 && b <= 921600) {
      cfg_baud = b;
      saveConfig();
      btOK();
      delay(20);
      BT.updateBaudRate(cfg_baud);
    } else btERR();
    return;
  }

  if (line.startsWith("AT+CLASS="))  { btOK(); return; }
  if (line.startsWith("AT+INQM="))   { btOK(); return; }
  if (line.startsWith("AT+IAC="))    { btOK(); return; }
  if (line.startsWith("AT+IPSCAN=")) { btOK(); return; }
  if (line == "AT+INIT")             { btOK(); return; }
  if (line == "AT+DISC" || line=="AT+INQC") { scanning = false; btOK(); return; }
  if (line == "AT+RMAAD")            { scanClear(); scanning = false; btOK(); return; }
  if (line.startsWith("AT+CMODE="))  { btOK(); return; }

  if (line.startsWith("AT+ROLE=")) {
    int v = atoi(line.substring(8).c_str());
    if (v==0 || v==1) { cfg_role = (uint8_t)v; saveConfig(); btOK(); }
    else btERR();
    return;
  }

  if (line.startsWith("AT+NAME=")) {
    cfg_name = line.substring(8);
    if (cfg_name.length() > 10) cfg_name = cfg_name.substring(0,10);
    saveConfig();
    btOK();
    return;
  }

  if (line.startsWith("AT+PSWD=")) {
    String arg = line.substring(8); arg.trim();
    if (arg.startsWith("\"") && arg.endsWith("\"") && arg.length() >= 2) {
      arg = arg.substring(1, arg.length()-1);
    }
    cfg_pswd = arg;
    if (cfg_pswd.length() > 10) cfg_pswd = cfg_pswd.substring(0,10);
    saveConfig();
    btOK();
    return;
  }

  if (line.startsWith("AT+LINK=")) {
    uint8_t mac[6];
    if (!parseNapUapLap(line.substring(8).c_str(), mac)) { btERR(); return; }

    memcpy(linked_peer_mac, mac, 6);
    linked_peer_set = true;
    link_connected = false;
    link_phase = PH_CONNECTING;
    //setStatusPin(false);

    memcpy(bound_peer_mac, mac, 6);
    bound_peer_set = true;
    saveConfig();

    sendPkt(mac, PKT_HELLO, nullptr, 0);
    btOK();
    return;
  }

  if (line == "AT+STATE?") { btReplyGet("+STATE:", link_connected ? "CONNECTED" : "READY"); return; }
  if (line == "AT+NAME?")  { btReplyGet("+NAME:", cfg_name); return; }
  if (line == "AT+PSWD?")  { btReplyPswd(); return; }


  // --- v1.7: extra info commands (safe, do not change OpenAVRc expectations) ---
  if (line == "AT+ADDR?") {
    uint8_t mymac[6]; WiFi.macAddress(mymac);
    btReplyGet("+ADDR:", macToNapUapLap(mymac));
    return;
  }

  // Extended diagnostic info (multi-line), for manual use (TeraTerm / Desktop debug)
  
  // Link diagnostics (single request)
  if (line == "AT+OAVLINK?") {
    String peera = "NONE";
    if (linked_peer_set) peera = macToNapUapLap(linked_peer_mac);
    else if (bound_peer_set) peera = macToNapUapLap(bound_peer_mac);

    btWriteStr("+OAVLINK:ROLE=");
    btWriteStr(cfg_role ? "MASTER" : "SLAVE");
    btWriteStr("\r\n");

    btWriteStr("+OAVLINK:STATE=");
    btWriteStr(link_connected ? "CONNECTED" : "READY");
    btWriteStr("\r\n");

    btWriteStr("+OAVLINK:PEER=");
    btWriteStrS(peera);
    if (dbg_bt) for (size_t k=0;k<peera.length();k++) dbgFeedChar(peera[k], btTxLine, btTxLen, "[TX]");
    btWriteStr("\r\n");

    btWriteStr("+OAVLINK:BOUND=");
    btWriteStr(bound_peer_set ? "YES" : "NO");
    btWriteStr("\r\n");

    btWriteStr("+OAVLINK:LAST_RX_MS=");
    btWriteU32((uint32_t)(millis() - last_rx_ms));
    btWriteStr("\r\n");

    btWriteStr("+OAVLINK:LAST_TX_MS=");
    btWriteU32((uint32_t)(millis() - last_tx_ms));
    btWriteStr("\r\n");

    btWriteStr("+OAVLINK:RSSI=");
    btWriteI32((int32_t)last_rssi_dbm);
    btWriteStr("\r\n");

    btWriteStr("+OAVLINK:RX=");
    btWriteU32((uint32_t)rx_count);
    btWriteStr(",TX=");
    btWriteU32((uint32_t)tx_count);
    btWriteStr("\r\n");

    btOK();
    return;
  }

  if (line == "AT+OAVINFO?") {
    uint8_t mymac[6]; WiFi.macAddress(mymac);

    String mya = macToNapUapLap(mymac);
    String peera = "NONE";
    if (linked_peer_set) peera = macToNapUapLap(linked_peer_mac);
    else if (bound_peer_set) peera = macToNapUapLap(bound_peer_mac);

    btWriteStr("+OAVINFO:ROLE=");
    btWriteStr(cfg_role ? "MASTER" : "SLAVE");
    btWriteStr("\r\n");

    btWriteStr("+OAVINFO:STATE=");
    btWriteStr(link_connected ? "CONNECTED" : "READY");
    btWriteStr("\r\n");

    btWriteStr("+OAVINFO:ADDR=");
    btWriteStrS(mya);
    if (dbg_bt) for (size_t k=0;k<mya.length();k++) dbgFeedChar(mya[k], btTxLine, btTxLen, "[TX]");
    btWriteStr("\r\n");

    btWriteStr("+OAVINFO:PEER=");
    btWriteStrS(peera);
    if (dbg_bt) for (size_t k=0;k<peera.length();k++) dbgFeedChar(peera[k], btTxLine, btTxLen, "[TX]");
    btWriteStr("\r\n");

    if (saved_peer_set && saved_peer_name[0]) {
      btWriteStr("+OAVINFO:PNAME=");
      btWriteStr(saved_peer_name);
      btWriteStr("\r\n");
    }

    btOK();
    return;
  }

  if (line == "AT+OAVSTAT?") {
    // Compact single-line status for scripts
    const char* roleStr = cfg_role ? "MASTER" : "SLAVE";
    const char* stateStr = link_connected ? "CONNECTED" : "READY";
    btWriteStr("+OAVSTAT:ROLE=");
    btWriteStr(roleStr);
    btWriteStr(",STATE=");
    btWriteStr(stateStr);
    uint32_t up_s = (millis() - stat_boot_ms) / 1000;
    btWriteStr(",UP=");
    btWriteU32(up_s);
    btWriteStr("s");
    btWriteStr(",TFPS=");
    btWriteU32((uint32_t)tfRate);
    btWriteStr(",DROP=");
    btWriteU32((uint32_t)tfDroppedCount);
    btWriteStr(",FT=");
    btWriteStr(wifi_ft ? "ON" : "OFF");
    btWriteStr("\r\nOK\r\n");
    return;
  }

  if (line == "AT+OAVCLR") {
    // Reset diagnostic counters only (does not touch bind/cache)
    tfDroppedCount = 0;
    tfDroppedPrev = 0;
    tfRate = 0;
    tfRateLastMs = millis();
    last_rx_ms = millis();
    rx_count++;

    btOK();
    return;
  }

  if (line == "AT+TFMUTE=ON") {
    tfMute = true;
    btOK();
    return;
  }
  if (line == "AT+TFMUTE=OFF") {
    tfMute = false;
    btOK();
    return;
  }
  if (line == "AT+TFMUTE?") {
    btWriteStr("+TFMUTE:");
    btWriteStr(tfMute ? "ON" : "OFF");
    btWriteStr("\r\n");
    btOK();
    return;
  }
  
  if (line.startsWith("AT+RNAME?")) {
    delay(10);
    uint8_t mac[6];
    if (!parseNapUapLap(line.substring(9).c_str(), mac)) { btERR(); return; }
    int idx = scanFindByMac(mac);
    if (idx >= 0 && scanDev[idx].name[0]) {
      btReplyGet("+RNAME:", scanDev[idx].name);
    }
    else if (saved_peer_set && memcmp(saved_peer_mac, mac, 6) == 0 && saved_peer_name[0]) {
      btReplyGet("+RNAME:", saved_peer_name);
    }
    else {
      btReplyGet("+RNAME:", "UNKNOWN");
    }
    return;
  }

  if (line == "AT+INQ") {
    if (cfg_role == 0) { btOK(); return; }

    if (link_phase != PH_CONNECTED) link_phase = PH_CONNECTING;

    scanClear();
    scanning = true;
    broadcastPkt(PKT_SCAN_REQ, nullptr, 0);

    uint32_t t0 = millis();
    while (millis() - t0 < 350) { delay(1); }
    scanning = false;

    for (uint8_t i=0; i<MAX_SCAN_DEV; i++) {
      if (!scanDev[i].used) continue;
      btWriteStr("+INQ:");
      String a = macToNapUapLap(scanDev[i].mac);
      BT.print(a);
      if (dbg_bt) for (size_t k=0;k<a.length();k++) dbgFeedChar(a[k], btTxLine, btTxLen, "[TX]");
      btWriteStr(",1C010C,7FFF\r\n");
    }

    btOK();
    return;
  }

  if (line == "AT+RESET") { btOK(); delay(50); ESP.restart(); return; }

  btERR();
}

// ---------------- UART processing ----------------
static String atLine;

static char autoLineBuf[200];
static uint16_t autoLineLen = 0;
static void autoFlushAsData() {
  if (autoLineLen == 0) return;
  if (linked_peer_set) sendPkt(linked_peer_mac, PKT_DATA, autoLineBuf, autoLineLen);
  else if (bound_peer_set) sendPkt(bound_peer_mac, PKT_DATA, autoLineBuf, autoLineLen);
  autoLineLen = 0;
}


static void processUART() {
  while (BT.available()) {
    char c = (char)BT.read();
    if (cfg_role == 0) dbgUartSlaveFeed(c);

    if (dbg_bt) dbgFeedChar(c, btRxLine, btRxLen, "[RX]");

    if (c == '\r' || c == '\n') {
      // Detect line type BEFORE we potentially append CR
      bool isAT = (autoLineLen >= 2 && autoLineBuf[0] == 'A' && autoLineBuf[1] == 'T');
      bool isTf = (!isAT && autoLineLen >= 3 && autoLineBuf[0] == 't' && autoLineBuf[1] == 'f' && autoLineBuf[2] == ' ');

      // Re-inject missing CR for tf lines (uCLI expects CR-terminated command)
      if (isTf) {
        if (autoLineLen < sizeof(autoLineBuf) - 1) {
          autoLineBuf[autoLineLen++] = '\r';
        }
      }

      autoLineBuf[autoLineLen] = 0;

      // If radio is doing SD/uCLI operations, mute tf for a short time to avoid UI pollution
      if (!strncmp((char*)autoLineBuf, "cp ", 3) ||
          !strncmp((char*)autoLineBuf, "ls", 2)  ||
          !strncmp((char*)autoLineBuf, "dir", 3) ||
          !strncmp((char*)autoLineBuf, "xmdm", 4)) {
        tfMuteUntilMs = millis() + 4000; // 4s window (adjust if needed)
      }

      if (isAT) {
        handleATLine(String((char*)autoLineBuf));
      } else {
        // Arm TF mute during SD/XMODEM operations (prevents SD screen pollution)
        if (!strncmp((char*)autoLineBuf, "cp ", 3) ||
            !strncmp((char*)autoLineBuf, "ls", 2)  ||
            !strncmp((char*)autoLineBuf, "dir", 3) ||
            !strncmp((char*)autoLineBuf, "xmdm", 4)) {
          tfMuteUntilMs = millis() + 4000;  // 4 seconds window
        }
        autoFlushAsData();
      }

      autoLineLen = 0;
      continue;
    }

    if (autoLineLen < sizeof(autoLineBuf)-1) autoLineBuf[autoLineLen++] = c;
    else autoFlushAsData();

  }
}

// ---------------- USB console (line-based) ----------------
static String usbLine;

static void showCreds() {
  Serial.print("[STA] ssid='");
  Serial.print(ft_sta_ssid);
  Serial.print("' passLen=");
  Serial.println(ft_sta_pass.length());
}

static void usbHelp() {
  Serial.println();
  Serial.println(F("[USB] Commands:"));
  Serial.println(F("  h              -> help"));
  Serial.println(F("  m              -> force ROLE=MASTER (1)"));
  Serial.println(F("  s              -> force ROLE=SLAVE  (0)"));
  Serial.println(F("  ssid <name>    -> set/save STA ssid"));
  Serial.println(F("  pass <pass>    -> set/save STA password"));
  Serial.println(F("  creds          -> show saved STA creds (ssid + pass length)"));
  Serial.println(F("  i              -> info"));
//**************
  Serial.println(F("  d              -> toggle BT debug (sniff UART BT, decode tf frames, show DATA-RX)"));
  Serial.println(F("  dtf            -> toggle BT count tf stream from SLAVE"));
  if (!cfg_role)
    Serial.println(F("  sg             -> toggle Slave  TF generator (simulate student data)"));
  else
    Serial.println(F("  mg             -> toggle Master TF generator (simulate student data)"));
//**************
  Serial.println(F("  w              -> show FT state"));
  Serial.println(F("  w ap           -> start FT in AP mode (OpenAVRc-FT / openavrc123)"));
  Serial.println(F("  w sta          -> start FT in STA mode using saved creds"));
  Serial.println(F("  w sta <s> <p>  -> start FT in STA mode + save creds"));
  Serial.println(F("  w off          -> stop FT and return normal"));
//**************
  Serial.println(F("  at?            -> at Commands help"));
  Serial.println(F("  diag           -> version and more"));
  Serial.println(F("  diag tf        -> diagnostic tf stream"));
  Serial.println(F("  diag link      -> diagnostic link"));
//**************
  Serial.println();

  Serial.println(F("  suart on|off       -> SLAVE: print UART lines to USB"));}

static void atCmdHelp() {
  Serial.println(F("[USB] AT Commands:"));
  Serial.println(F("  at <cmd>       -> allows an AT cmommand, Ex: at AT+OAVINFO? etc..."));
  Serial.println(F("  AT+OAVINFO?    -> compact info line (manual)"));
  Serial.println(F("  AT+OAVLINK?    -> compact link line (manual)"));
  Serial.println(F("  AT+OAVSTAT?    -> compact status line (manual)"));
  Serial.println(F("  AT+OAVCLR      -> reset diagnostic counters (manual)"));
}
static void usbInfo() {
  uint8_t mymac[6]; WiFi.macAddress(mymac);
  char myMacStr[18]; macToStr(mymac, myMacStr, sizeof(myMacStr));

  char peerStr[18] = "NONE";
  if (linked_peer_set) macToStr(linked_peer_mac, peerStr, sizeof(peerStr));
  else if (bound_peer_set) macToStr(bound_peer_mac, peerStr, sizeof(peerStr));

  const char* atStr = "AUTO";

  const char* linkStr =
    (link_phase==PH_CONNECTED) ? "CONNECTED" :
    (link_phase==PH_CONNECTING) ? "CONNECTING" :
    "READY";

  const char* ftStr = wifi_ft ? "ON" : "OFF";
  const char* ftModeStr =
    (ft_mode==FT_AP) ? "AP" :
    (ft_mode==FT_STA) ? "STA" :
    "OFF";

  Serial.println(F("\r\n=== OpenAVRc HC05-EMU ESPNOW ==="));
  Serial.printf("Version : v%.1f\r\n", VERSION);
  Serial.printf("Role    : %s\r\n", cfg_role ? "MASTER" : "SLAVE");
  Serial.printf("Baud    : %lu\r\n", (unsigned long)cfg_baud);
  Serial.printf("Name    : %s\r\n", cfg_name.c_str());
  Serial.printf("AT      : %s\r\n", atStr);
  Serial.printf("Link    : %s\r\n", linkStr);
  Serial.printf("My MAC  : %s\r\n", myMacStr);
  Serial.printf("Peer MAC: %s\r\n", peerStr);
  Serial.printf("Debug   : %s\r\n", dbg_bt ? "ON" : "OFF");
  Serial.printf("Gen_S TF: %s\r\n", gen_tf ? "ON" : "OFF");
  Serial.printf("Gen_M TF: %s\r\n", Master_gen_tf ? "ON" : "OFF");
  Serial.printf("FT      : %s\r\n", ftStr);
  Serial.printf("FT Mode : %s\r\n", ftModeStr);
  Serial.printf("tf Slave: %lu tf/s=%lu\r\n", (unsigned long)tfDroppedCount, (unsigned long)tfRate);																																																								 

  if (wifi_ft) {
    IPAddress ip = (ft_mode == FT_AP) ? WiFi.softAPIP() : WiFi.localIP();
    Serial.printf("FT IP   : %s\r\n", ip.toString().c_str());
    Serial.println(F("FT Port : 3333"));
  }

  Serial.println(F("===============================\r\n"));
}



static void cmdDiag() {
  Serial.println(F("[DIAG]"));

  Serial.print(F("VERSION: "));
  Serial.print(VERSION, 1);
  Serial.print(F(" ("));
  Serial.print(BUILD_TAG);
  Serial.println(F(")"));

  Serial.print(F("ROLE: "));
  Serial.println(cfg_role ? F("MASTER") : F("SLAVE"));

  Serial.print(F("LINK: "));
  Serial.println(link_connected ? F("CONNECTED") : F("NOT_CONNECTED"));

  Serial.print(F("PEER: "));
  if (linked_peer_set) {
    char buf[18];
    snprintf(buf, sizeof(buf), "%02X:%02X:%02X:%02X:%02X:%02X",
             linked_peer_mac[0], linked_peer_mac[1], linked_peer_mac[2],
             linked_peer_mac[3], linked_peer_mac[4], linked_peer_mac[5]);
    Serial.println(buf);
  } else {
    Serial.println(F("NONE"));
  }

  Serial.print(F("BOUND: "));
  Serial.println(bound_peer_set ? F("YES") : F("NO"));

  Serial.print(F("WIFI_MODE: "));
  wifi_mode_t m = WiFi.getMode();
  Serial.println(m == WIFI_STA ? F("STA") : (m == WIFI_AP ? F("AP") : F("OFF")));

  Serial.print(F("WIFI_CH: "));
  Serial.println(WiFi.channel());

  Serial.print(F("UP_MS: "));
  Serial.println((unsigned long)millis());

  // Optional counters if present
#ifdef TF_MONITOR
  Serial.print(F("TF_DROPPED: "));
  Serial.println((unsigned long)tfDroppedCount);
#endif
}

static void cmdDiagTf() {
  Serial.println(F("[DTF]"));
  Serial.print(F("tf/s     : "));
  Serial.println((unsigned long)tfRate);
  Serial.print(F("dropped  : "));
  Serial.println((unsigned long)tfDroppedCount);
  Serial.print(F("up_ms    : "));
  Serial.println((unsigned long)millis());
}

static void cmdDiagLink() {
  Serial.println(F("[DLINK]"));

  Serial.print(F("role     : "));
  Serial.println(cfg_role ? F("MASTER") : F("SLAVE"));

  Serial.print(F("phase    : "));
  switch (link_phase) {
    case PH_IDLE:       Serial.println(F("IDLE")); break;
    case PH_CONNECTING: Serial.println(F("CONNECTING")); break;
    case PH_CONNECTED:  Serial.println(F("CONNECTED")); break;
    default:            Serial.println(F("UNKNOWN")); break;
  }

  Serial.print(F("connected: "));
  Serial.println(link_connected ? F("YES") : F("NO"));

  Serial.print(F("linked   : "));
  Serial.println(linked_peer_set ? F("YES") : F("NO"));

  Serial.print(F("bound    : "));
  Serial.println(bound_peer_set ? F("YES") : F("NO"));

  Serial.print(F("peer_mac : "));
  if (linked_peer_set) {
    char buf[18];
    snprintf(buf, sizeof(buf), "%02X:%02X:%02X:%02X:%02X:%02X",
             linked_peer_mac[0], linked_peer_mac[1], linked_peer_mac[2],
             linked_peer_mac[3], linked_peer_mac[4], linked_peer_mac[5]);
    Serial.println(buf);
  } else if (bound_peer_set) {
    char buf[18];
    snprintf(buf, sizeof(buf), "%02X:%02X:%02X:%02X:%02X:%02X",
             bound_peer_mac[0], bound_peer_mac[1], bound_peer_mac[2],
             bound_peer_mac[3], bound_peer_mac[4], bound_peer_mac[5]);
    Serial.println(buf);
  } else {
    Serial.println(F("NONE"));
  }

  Serial.print(F("last_rx_ms: "));
  Serial.println((unsigned long)last_rx_ms);
  Serial.print(F("now_ms    : "));
  Serial.println((unsigned long)millis());
}


static void usbHandleCmd(String cmd) {
  cmd.trim();
  if (!cmd.length()) return;

  // tokenize: op + rest
  int sp = cmd.indexOf(' ');
  String op = (sp<0) ? cmd : cmd.substring(0, sp);
  String rest = (sp<0) ? ""  : cmd.substring(sp+1);
  op.toLowerCase();
  rest.trim();

  // suart on/off : monitor raw UART lines on SLAVE (USB only)
  if (op == "suart") {
    if (cfg_role != 0) { Serial.println("[USB] suart: SLAVE only"); return; }
    if (rest == "on")  { dbg_uart_slave = true;  dbg_uart_len = 0; Serial.println("[USB] suart ON");  return; }
    if (rest == "off") { dbg_uart_slave = false; dbg_uart_len = 0; Serial.println("[USB] suart OFF"); return; }
    Serial.println("[USB] suart on|off");
    return;
  }

  if (op == "diag") {
    if (rest == "tf") { cmdDiagTf(); return; }
    if (rest == "link") { cmdDiagLink(); return; }
    cmdDiag();
    return;
  }

  if (op == "at?") {
    atCmdHelp();
    return;
  }

  if (op == "at") {
    if (!rest.length()) {
      Serial.println("Usage: at <AT command>");
      return;
    }
    // Ensure command starts with AT
    if (!rest.startsWith("AT")) rest = "AT" + rest;
    usb_at_mode = true;
    handleATLine(rest);
    usb_at_mode = false;
    return;
  }

if (op == "m") {
    cfg_role = 1;
    saveConfig();
    Serial.println("[USB] ROLE forced to MASTER (1) and saved");
    if (link_phase != PH_CONNECTED) link_phase = PH_IDLE;
    oledDrawStatus();
    return;
  }

  if (op == "s") {
    cfg_role = 0;
    saveConfig();
    Serial.println("[USB] ROLE forced to SLAVE (0) and saved");
    if (link_phase != PH_CONNECTED) link_phase = PH_IDLE;
    oledDrawStatus();
    return;
  }

  if (op == "d") {
    dbg_bt = !dbg_bt;
    Serial.print("[USB] BT debug ");
    Serial.println(dbg_bt ? "ON" : "OFF");
    return;
  }

  if (op == "dtf") {
    dbg_tf = !dbg_tf;
    tfPrintLastMs = 0;   // force immediate print when enabling debug
    tfDroppedCount = 0;  // remise à zéro du décompte des lignes tf en provenance de l'élève
    Serial.print("[USB] BT tf debug ");
    Serial.println(dbg_tf ? "ON" : "OFF");
    return;
  }
  
  if (op == "sg"){
    if (!cfg_role){
      gen_tf = !gen_tf;
      Serial.print("[USB] SLAVE TF generator ");
      Serial.println(gen_tf ? "ON" : "OFF");
    }
    else
      Serial.print("Only usable by SLAVE !");
    return;
  }

  if (op == "mg"){
    if (cfg_role){
      Master_gen_tf = !Master_gen_tf;
      Serial.print("[USB] MASTER TF generator ");
      Serial.println(Master_gen_tf ? "ON" : "OFF");
    }
    else
      Serial.print("Only usable by MASTER !");
    return;
  }

  if (op == "ssid") {
    if (rest.length() == 0) { Serial.println("[USB] Usage: ssid <name>"); return; }
    ft_sta_ssid = rest;
    ftSaveCreds();
    Serial.println("[USB] STA SSID saved");
    showCreds();
    return;
  }

  if (op == "pass") {
    if (rest.length() == 0) { Serial.println("[USB] Usage: pass <password>"); return; }
    ft_sta_pass = rest;
    ftSaveCreds();
    Serial.println("[USB] STA password saved");
    showCreds();
    return;
  }

  if (op == "creds") {
    showCreds();
    return;
  }

  if (op == "w") {
    if (rest.length() == 0) {
      Serial.print("[FT] state: ");
      Serial.println(wifi_ft ? "ON" : "OFF");
      Serial.print("[FT] mode : ");
      Serial.println(ft_mode==FT_AP?"AP":ft_mode==FT_STA?"STA":"OFF");
      if (wifi_ft) ftPrintIp();
      return;
    }

    String sub = rest;
    int sp2 = sub.indexOf(' ');
    String wop = (sp2<0) ? sub : sub.substring(0, sp2);
    String wrest = (sp2<0) ? ""  : sub.substring(sp2+1);
    wop.toLowerCase();
    wrest.trim();

    if (wop == "off") {
      if (wifi_ft) wifiFtStop();
      oledDrawStatus();
      return;
    }

    if (wop == "ap") {
      if (wifi_ft) wifiFtStop();
      wifiFtStartAP();
      oledDrawStatus();
      return;
    }

    if (wop == "sta") {
      // w sta  -> use saved creds
      // w sta <ssid> <pass> -> set+save creds then connect
      String ssid = ft_sta_ssid;
      String pass = ft_sta_pass;

      if (wrest.length() > 0) {
        int sp3 = wrest.indexOf(' ');
        if (sp3 < 0) {
          Serial.println("[FT] Usage: w sta <ssid> <pass>   (or: w sta to use saved)");
          return;
        }
        ssid = wrest.substring(0, sp3);
        pass = wrest.substring(sp3+1);
        pass.trim();
        ft_sta_ssid = ssid;
        ft_sta_pass = pass;
        ftSaveCreds();
      }

      if (ssid.length() == 0 || pass.length() == 0) {
        Serial.println("[FT] Missing STA creds. Use: ssid <name> / pass <pwd> then 'w sta'");
        return;
      }

      if (wifi_ft) wifiFtStop();
      bool ok = wifiFtStartSTA(ssid, pass);
      espnowStart();					
      Serial.println(ok ? "[FT] STA OK" : "[FT] STA FAIL");
      oledDrawStatus();
      return;
    }

    Serial.println("[FT] Usage: w ap | w sta <ssid> <pass> | w sta | w off | w");
    return;
  }

  if (op == "i") { usbInfo(); return; }
  if (op == "h" || op == "?") { usbHelp(); return; }

  Serial.println("[USB] Unknown. Type 'h'.");
}

static void processUsbConsole() {
  while (Serial.available()) {
    char c = (char)Serial.read();
    if (c == '\r') continue;
    if (c == '\n') {
      usbHandleCmd(usbLine);
      usbLine = "";
    } else {
      if (usbLine.length() < 120) usbLine += c;
    }
  }
}

void setup() {

  ledInit();

  Serial.begin(115200);

  // Timeout USB Serial (ne bloque pas sans USB)
  uint32_t t0 = millis();
  while (!Serial && (millis() - t0 < 1500)) {
    delay(1);
  }

  stat_boot_ms = millis();

  loadConfig();
  ftLoadCreds();

  // v1.6j: bring up STA (if creds exist) so CTRL port is reachable without manual 'w sta'
  if (ft_sta_ssid.length() && ft_sta_pass.length()) {
    Serial.println();
    Serial.print("[CTRL] pre-connect STA SSID: ");
    Serial.println(ft_sta_ssid);
    WiFi.mode(WIFI_STA);
    WiFi.begin(ft_sta_ssid.c_str(), ft_sta_pass.c_str());
    uint32_t t1 = millis();
    while (WiFi.status() != WL_CONNECTED && millis() - t1 < 8000) {
      delay(250);
      Serial.print('.');
    }
    Serial.println();
    if (WiFi.status() == WL_CONNECTED) {
      Serial.print("[CTRL] STA IP: ");
      Serial.println(WiFi.localIP());
    } else {
      Serial.println("[CTRL] STA not connected (CTRL may be unreachable until FT started)");
    }
  } else {
    Serial.println("[CTRL] No STA creds saved");
  }

  ctrlServer.begin();
  ctrlServer.setNoDelay(true);
  Serial.println("[CTRL] listening on port 3334");

  oledInit();

  BT.begin(cfg_baud, SERIAL_8N1, UART_RX, UART_TX);

  espnowStart();
  // --- v1.6j: force clean link state at boot (MASTER and SLAVE) ---
  link_connected = false;
  link_phase = PH_IDLE;
  //setStatusPin(false);

  if (bound_peer_set) {
    memcpy(linked_peer_mac, bound_peer_mac, 6);
    linked_peer_set = true;
    link_phase = PH_CONNECTING;
    Serial.print("[LINK] ");Serial.print(BUILD_TAG);Serial.println(" boot: peer armed, waiting HELLO/ACK");
  }

  // --- v1.6j auto-reconnect (no scan needed after reboot) ---
  // If we already have a bound peer (saved from previous LINK), arm reconnection at boot.
  if (bound_peer_set) {
    memcpy(linked_peer_mac, bound_peer_mac, 6);
    linked_peer_set = true;
    link_connected = false;
    link_phase = PH_CONNECTING;
    Serial.println("[LINK] auto-reconnect armed");
  }

  Serial.println();
  Serial.print("OpenAVRc HC05-EMU ESPNOW (single firmware)");
  Serial.printf(" Version v%.1f (%s)\r\n", VERSION, BUILD_TAG);
  Serial.println("USB console ready. Type 'h' + Enter for help.\r\n");

  link_phase = link_connected ? PH_CONNECTED : PH_IDLE;

  oledDrawStatus();
}

void loop() {
  // --- v1.6j: HELLO retry from SLAVE too (fix reconnect after reboot) ---
  static uint32_t tHello_j = 0;
  if (linked_peer_set && !link_connected) {
    if (millis() - tHello_j > HELLO_INTERVAL_MS) {
      tHello_j = millis();
      sendPkt(linked_peer_mac, PKT_HELLO, nullptr, 0);
    }
  }

  // --- v1.6j: auto HELLO keepalive (MASTER and SLAVE) ---
  static uint32_t tHello_i = 0;
  if (linked_peer_set && !link_connected) {
    if (millis() - tHello_i > HELLO_INTERVAL_MS) {
      tHello_i = millis();
      sendPkt(linked_peer_mac, PKT_HELLO, nullptr, 0);
    }
  }

  processUsbConsole();
  // v1.7a: link watchdog
  if (link_connected && (millis() - last_rx_ms > LINK_TIMEOUT_MS)) {
    link_connected = false;
    if (linked_peer_set) link_phase = PH_CONNECTING; else link_phase = PH_IDLE;
    //setStatusPin(false);
  }

  // --- TF monitor: compute tf/s once per second ---
  if (millis() - tfRateLastMs >= 1000) {
    tfRateLastMs += 1000;
    tfRate = tfDroppedCount - tfDroppedPrev;
    tfDroppedPrev = tfDroppedCount;
  }

  //Print tf/s periodically when debug is ON (does not affect radio/UART)
  if (dbg_tf && (millis() - tfPrintLastMs >= 500)) {
    tfPrintLastMs = millis();
    Serial.printf("[TF] tf/s=%lu dropped=%lu\r\n",
      (unsigned long)tfRate,
      (unsigned long)tfDroppedCount
    );
  }
  ctrlTask(); // v1.6j control channel


  // When FileTransfer is ON: exclusive TCP<->UART bridge
  if (wifi_ft) {
    wifiFtTask(BT);
    if (xferActive) {
      uint32_t now = millis();
      if (xferForceUntilMs && (int32_t)(now - xferForceUntilMs) < 0) {
        // still within forced XMODEM window
      } else if (now - xferLastMs > 2000) {
        xferActive = false;
      }
    }
    ledUpdate();

    static uint32_t tDispFt = 0;
    if (millis() - tDispFt > 300) { tDispFt = millis(); oledDrawStatus(); }

    delay(1);
    return;
  }

  processUART();

  // generate simulated student frames (tf ...) over ESPNOW
  if (gen_tf) cmdSg();

  if (Master_gen_tf) cmdMg();

  ledUpdate();

  static uint32_t tHello = 0;
  if (!isATMode() && linked_peer_set && !link_connected) {
    link_phase = PH_CONNECTING;
    if (millis() - tHello > HELLO_INTERVAL_MS) {
      tHello = millis();
      sendPkt(linked_peer_mac, PKT_HELLO, nullptr, 0);
    }
  } else if (!link_connected) {
    if (link_phase != PH_CONNECTED && !linked_peer_set) link_phase = PH_IDLE;
  }

  static uint32_t tDisp = 0;
  if (millis() - tDisp > 300) {
    tDisp = millis();
    oledDrawStatus();
  }

  delay(1);
}

// sg: inject a simulated student tf frame by SLAVE directly to radio UART (BT Serial1)
// ckeck if SLAVE send well the good frame over the ESPNOW link to the MASTER
static void cmdSg()
{
  if (linked_peer_set || bound_peer_set) {
    tfMute = false;

    uint32_t now = millis();
    if (now - gen_last_ms >= 20) {
      gen_last_ms = now;
      gen_phase++;

      uint16_t ch[8] = {1500,1500,1500,1500,1500,1500,1500,1500};

      // CH1..CH4 visible movement (trainer uses first 4 channels)
      uint16_t tri1 = (uint16_t)((gen_phase % 200) < 100 ? (gen_phase % 100) : (100 - (gen_phase % 100)));
      ch[0] = 1000 + (tri1 * 10); // CH1: triangle slow 1000..2000

      uint16_t tri2 = (uint16_t)(((gen_phase * 2) % 200) < 100 ? ((gen_phase * 2) % 100) : (100 - ((gen_phase * 2) % 100)));
      ch[1] = 1000 + (tri2 * 10); // CH2: faster triangle

      ch[2] = 2000 - (tri1 * 10); // CH3: inverse triangle

      ch[3] = ((gen_phase / 50) % 2) ? 1700 : 1300; // CH4: step pattern (~1Hz at 50Hz loop)

      char frame[80];
      buildTfFrame(ch, frame, sizeof(frame));

      const uint8_t* dst = linked_peer_set ? linked_peer_mac : bound_peer_mac;
      sendPkt(dst, PKT_DATA, frame, (uint16_t)strlen(frame));

      if (dbg_bt) {
        Serial.print("[DATA-TX] ");
        Serial.print(frame);
      }
    }
  }
}

// mg: inject a simulated student tf frame by MASTER directly to radio UART (BT Serial1)
// This is for testing the BT trainer icon in OpenAVRc (uCli_Cmd_tf).
// ckeck if MASTER send well the good frame without need to SLAVE connection
static void cmdMg()
{
  tfMute = false;

  uint16_t ch[8] = {1500,1500,1500,1500,1500,1500,1500,1500};

  static uint32_t phase = 0;
  phase++;

  // CH1: triangle slow 1000..2000
  uint16_t tri1 = (uint16_t)((phase % 200) < 100 ? (phase % 100) : (100 - (phase % 100)));
  ch[0] = 1000 + (tri1 * 10);

  // CH2: triangle faster
  uint16_t tri2 = (uint16_t)(((phase * 2) % 200) < 100 ? ((phase * 2) % 100) : (100 - ((phase * 2) % 100)));
  ch[1] = 1000 + (tri2 * 10);

  // CH3: inverse triangle (so it moves opposite direction)
  ch[2] = 2000 - (tri1 * 10);

  // CH4: step pattern (toggles every ~1s if mg runs at 50Hz)
  ch[3] = ((phase / 50) % 2) ? 1700 : 1300;

  char frame[96];
  buildTfFrame(ch, frame, sizeof(frame));

  BT.write((const uint8_t*)frame, strlen(frame)); // already ends with '\r'

  if (dbg_bt) {
    Serial.print("[MG->UART] ");
    Serial.print(frame);
  }

}
