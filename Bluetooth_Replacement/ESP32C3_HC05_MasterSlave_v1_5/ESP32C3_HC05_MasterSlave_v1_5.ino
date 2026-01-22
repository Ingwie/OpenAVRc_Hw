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
#include <Preferences.h>
#include <esp_wifi.h>

#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

// ================== USER CONFIG ==================
#define USE_KEY_PIN 0

float VERSION = 1.5f;

static constexpr int PIN_KEY    = 2;   // not used when USE_KEY_PIN=0
static constexpr int PIN_STATUS = 3;   // not used on your test board, kept for compatibility

static constexpr int UART_RX    = 4;   // Mega TX1 -> ESP RX (via divider on your board)
static constexpr int UART_TX    = 7;   // ESP TX  -> Mega RX1

static constexpr int SDA_PIN    = 5;
static constexpr int SCL_PIN    = 6;

static constexpr int PIN_LED    = 8;

static constexpr uint8_t ESPNOW_CHANNEL = 1;

#if USE_KEY_PIN
static constexpr uint32_t DEFAULT_BAUD = 38400;
#else
static constexpr uint32_t DEFAULT_BAUD = 115200;   // OpenAVRc init at 115200 on test board
#endif

static constexpr uint8_t  DEFAULT_ROLE = 0;      // 0=Slave by default
static constexpr const char* DEFAULT_NAME = "OAVRC";
static constexpr const char* DEFAULT_PSWD = "1234";

static constexpr uint16_t HELLO_INTERVAL_MS = 800;
static constexpr uint16_t MAX_PAYLOAD = 220;

// OLED
static constexpr uint8_t OLED_ADDR = 0x3C;
static constexpr int OLED_W = 128;
static constexpr int OLED_H = 64;
// =================================================

HardwareSerial BT(1);
Preferences prefs;

// OLED instance
Adafruit_SSD1306 display(OLED_W, OLED_H, &Wire, -1);

// Persistent config
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

// ---------------- Helpers ----------------
static bool isATMode() {
#if USE_KEY_PIN
  return digitalRead(PIN_KEY) == HIGH;
#else
  return false;
#endif
}

static void setStatusPin(bool connected) {
#if USE_KEY_PIN
  digitalWrite(PIN_STATUS, connected ? HIGH : LOW);
#else
  (void)connected;
#endif
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
  cfg_baud = prefs.getUInt("baud", DEFAULT_BAUD);
  cfg_role = prefs.getUChar("role", DEFAULT_ROLE);
  cfg_name = prefs.getString("name", DEFAULT_NAME);
  cfg_pswd = prefs.getString("pswd", DEFAULT_PSWD);

  size_t n = prefs.getBytesLength("bind");
  if (n == 6) { prefs.getBytes("bind", bound_peer_mac, 6); bound_peer_set = true; }
  else bound_peer_set = false;

  prefs.end();
}

static void saveConfig() {
  prefs.begin("hc05emu", false);
  prefs.putUInt("baud", cfg_baud);
  prefs.putUChar("role", cfg_role);
  prefs.putString("name", cfg_name);
  prefs.putString("pswd", cfg_pswd);
  if (bound_peer_set) prefs.putBytes("bind", bound_peer_mac, 6);
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

// ---------------- OLED ----------------
static bool oled_ok = false;

// ---------------- BT debug (USB console) ----------------
static bool dbg_bt = false;

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

static void btWriteStr(const char* s) {
  BT.print(s);
  if (dbg_bt) {
    for (const char* p=s; *p; ++p) dbgFeedChar(*p, btTxLine, btTxLen, "[TX]");
  }
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

  putc('t'); putc('f'); putc(' ');

  for (int i = 0; i < 8; i++) {
    putc('s');
    chk ^= (uint8_t)'s';

    uint16_t v = (uint16_t)(ch[i] << 4);
    putHexNib((v >> 12) & 0xF);
    putHexNib((v >> 8)  & 0xF);
    putHexNib((v >> 4)  & 0xF);
    putHexNib((v >> 0)  & 0xF);
  }

  putc(':');
  putc(hexDigit((chk >> 4) & 0xF));
  putc(hexDigit((chk >> 0) & 0xF));
  putc('\r');
  putc('\n');

  if (pos < outSz) out[pos] = 0;
  else out[outSz - 1] = 0;
}

// ================= WiFi File Transfer (TCP <-> UART) =================
enum FtMode : uint8_t { FT_OFF=0, FT_AP=1, FT_STA=2 };
static FtMode ft_mode = FT_OFF;
static bool wifi_ft = false;

static WiFiServer ftServer(3333);
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

  if (ft_mode == FT_AP) WiFi.softAPdisconnect(true);
  WiFi.disconnect(true);

  WiFi.mode(WIFI_OFF);

  wifi_ft = false;
  ft_mode = FT_OFF;

  espnowStart();
  Serial.println("[FT] stopped");
}

static void wifiFtTask(HardwareSerial& uart) {
  if (!wifi_ft) return;

  if (!ftClient || !ftClient.connected()) {
    ftClient = ftServer.available();
    if (ftClient) {
      ftClient.setNoDelay(true);
      Serial.println("[FT] client connected");
    }
  }
  if (!ftClient || !ftClient.connected()) return;

  while (ftClient.available()) {
    uint8_t b = (uint8_t)ftClient.read();
    uart.write(b);
  }
  while (uart.available()) {
    uint8_t b = (uint8_t)uart.read();
    ftClient.write(&b, 1);
  }
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
  oled_ok = display.begin(SSD1306_SWITCHCAPVCC, OLED_ADDR);
  if (oled_ok) {
    display.clearDisplay();
    display.setTextSize(1);
    display.setTextColor(SSD1306_WHITE);
    display.setCursor(0, 0);
    display.println("OpenAVRc HC05-EMU");
    display.display();
  }
}

static void oledDrawStatus() {
  if (!oled_ok) return;

  uint8_t mymac[6]; WiFi.macAddress(mymac);
  char myMacStr[18]; macToStr(mymac, myMacStr, sizeof(myMacStr));

  char peerStr[18] = "NONE";
  if (linked_peer_set) macToStr(linked_peer_mac, peerStr, sizeof(peerStr));
  else if (bound_peer_set) macToStr(bound_peer_mac, peerStr, sizeof(peerStr));

  const char* roleStr = cfg_role ? "MASTER" : "SLAVE";
  const char* phaseStr =
    (link_phase == PH_CONNECTED)  ? "CONNECTED" :
    (link_phase == PH_CONNECTING) ? "CONNECTING" :
                                   "READY";

  display.clearDisplay();
  display.setCursor(0, 0);
  display.println("OpenAVRc HC05-EMU");

  display.print("ROLE: "); display.println(roleStr);
  display.print("MAC : ");  display.println(myMacStr);
  display.print("LINK: ");  display.println(phaseStr);
  display.print("PEER: ");  display.println(peerStr);

#if USE_KEY_PIN
  display.print("AT  : "); display.println(isATMode() ? "YES" : "NO");
#else
  display.print("AT  : "); display.println("AUTO");
#endif

  display.print("FT  : ");
  if (!wifi_ft) {
    display.println("OFF");
  } else {
    if (ft_mode == FT_AP) {
      display.println("AP  192.168.4.1");
    } else if (ft_mode == FT_STA) {
      IPAddress ip = WiFi.localIP();
      display.print("STA ");
      display.println(ip.toString());
    } else {
      display.println("ON");
    }
    display.print("P   : ");
    display.println("3333");
  }

  display.display();
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
  esp_now_peer_info_t pi{};
  memcpy(pi.peer_addr, mac, 6);
  pi.channel = ESPNOW_CHANNEL;
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
}

static void broadcastPkt(uint8_t type, const void* data, uint16_t len) {
  uint8_t bcast[6] = {0xFF,0xFF,0xFF,0xFF,0xFF,0xFF};
  ensurePeer(bcast);
  sendPkt(bcast, type, data, len);
}

// Core 3.x callback signature:
static void onRecv(const esp_now_recv_info* info, const uint8_t* data, int len) {
  if (!info || !data || len < 4) return;
  const uint8_t* mac = info->src_addr;
  const Packet* p = (const Packet*)data;

  last_rx_ms = millis();

  if (p->type == PKT_HELLO) {
    memcpy(linked_peer_mac, mac, 6);
    linked_peer_set = true;
    link_connected = true;
    link_phase = PH_CONNECTED;
    setStatusPin(true);
    sendPkt(mac, PKT_HELLO_ACK, nullptr, 0);
    return;
  }
  if (p->type == PKT_HELLO_ACK) {
    memcpy(linked_peer_mac, mac, 6);
    linked_peer_set = true;
    link_connected = true;
    link_phase = PH_CONNECTED;
    setStatusPin(true);
    return;
  }
  if (p->type == PKT_DATA) {
    if (p->len) BT.write(p->payload, p->len);

    if (dbg_bt && p->len) {
      for (uint16_t i=0; i<p->len; i++) dataFeedChar((char)p->payload[i]);
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
    }
    return;
  }
}

static void espnowStart() {
  WiFi.mode(WIFI_STA);
  esp_wifi_set_channel(ESPNOW_CHANNEL, WIFI_SECOND_CHAN_NONE);

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
  if (line == "AT+DISC" || line=="AT+INQC") { btOK(); return; }
  if (line == "AT+RMAAD")            { btOK(); return; }
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
    setStatusPin(false);

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

  if (line.startsWith("AT+RNAME?")) {
    uint8_t mac[6];
    if (!parseNapUapLap(line.substring(9).c_str(), mac)) { btERR(); return; }
    int idx = scanFindByMac(mac);
    if (idx >= 0 && scanDev[idx].name[0]) btReplyGet("+RNAME:", scanDev[idx].name);
    else btReplyGet("+RNAME:", "UNKNOWN");
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

#if !USE_KEY_PIN
static char autoLineBuf[200];
static uint16_t autoLineLen = 0;
static void autoFlushAsData() {
  if (autoLineLen == 0) return;
  if (linked_peer_set) sendPkt(linked_peer_mac, PKT_DATA, autoLineBuf, autoLineLen);
  else if (bound_peer_set) sendPkt(bound_peer_mac, PKT_DATA, autoLineBuf, autoLineLen);
  autoLineLen = 0;
}
#endif

static void processUART() {
  while (BT.available()) {
    char c = (char)BT.read();

    if (dbg_bt) dbgFeedChar(c, btRxLine, btRxLen, "[RX]");

#if USE_KEY_PIN
    if (isATMode()) {
      if (c == '\r') continue;
      if (c == '\n') {
        if (atLine.length()) handleATLine(atLine);
        atLine = "";
      } else {
        if (atLine.length() < 96) atLine += c;
      }
    } else {
      if (linked_peer_set) sendPkt(linked_peer_mac, PKT_DATA, &c, 1);
      else if (bound_peer_set) sendPkt(bound_peer_mac, PKT_DATA, &c, 1);
    }
#else
    if (c == '\r' || c == '\n') {
      autoLineBuf[autoLineLen] = 0;

      if (autoLineLen >= 2 && autoLineBuf[0] == 'A' && autoLineBuf[1] == 'T') {
        handleATLine(String((char*)autoLineBuf));
      } else {
        autoFlushAsData();
      }

      autoLineLen = 0;
      continue;
    }

    if (autoLineLen < sizeof(autoLineBuf)-1) autoLineBuf[autoLineLen++] = c;
    else autoFlushAsData();
#endif
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
  Serial.println(F("  m              -> force ROLE=MASTER (1)"));
  Serial.println(F("  s              -> force ROLE=SLAVE  (0)"));
  Serial.println(F("  i              -> info"));
  Serial.println(F("  d              -> toggle BT debug (sniff UART BT, decode tf frames, show DATA-RX)"));
  Serial.println(F("  g              -> toggle TF generator (simulate student data)"));
  Serial.println(F("  w              -> show FT state"));
  Serial.println(F("  w ap           -> start FT in AP mode (OpenAVRc-FT / openavrc123)"));
  Serial.println(F("  w sta          -> start FT in STA mode using saved creds"));
  Serial.println(F("  w sta <s> <p>  -> start FT in STA mode + save creds"));
  Serial.println(F("  w off          -> stop FT and return normal"));
  Serial.println(F("  ssid <name>    -> set/save STA ssid"));
  Serial.println(F("  pass <pass>    -> set/save STA password"));
  Serial.println(F("  creds          -> show saved STA creds (ssid + pass length)"));
  Serial.println(F("  h              -> help"));
  Serial.println();
}

static void usbInfo() {
  uint8_t mymac[6]; WiFi.macAddress(mymac);
  char myMacStr[18]; macToStr(mymac, myMacStr, sizeof(myMacStr));

  char peerStr[18] = "NONE";
  if (linked_peer_set) macToStr(linked_peer_mac, peerStr, sizeof(peerStr));
  else if (bound_peer_set) macToStr(bound_peer_mac, peerStr, sizeof(peerStr));

  const char* atStr =
#if USE_KEY_PIN
    (isATMode() ? "YES" : "NO");
#else
    "AUTO";
#endif

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
  Serial.printf("Gen TF  : %s\r\n", gen_tf ? "ON" : "OFF");
  Serial.printf("FT      : %s\r\n", ftStr);
  Serial.printf("FT Mode : %s\r\n", ftModeStr);

  if (wifi_ft) {
    IPAddress ip = (ft_mode == FT_AP) ? WiFi.softAPIP() : WiFi.localIP();
    Serial.printf("FT IP   : %s\r\n", ip.toString().c_str());
    Serial.println(F("FT Port : 3333"));
  }

  Serial.println(F("===============================\r\n"));
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

  if (op == "g") {
    gen_tf = !gen_tf;
    Serial.print("[USB] TF generator ");
    Serial.println(gen_tf ? "ON" : "OFF");
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
#if USE_KEY_PIN
  pinMode(PIN_KEY, INPUT_PULLDOWN);
  pinMode(PIN_STATUS, OUTPUT);
  setStatusPin(false);
#endif

  ledInit();

  Serial.begin(115200);

  // Timeout USB Serial (ne bloque pas sans USB)
  uint32_t t0 = millis();
  while (!Serial && (millis() - t0 < 1500)) {
    delay(1);
  }

  loadConfig();
  ftLoadCreds();

  oledInit();

  BT.begin(cfg_baud, SERIAL_8N1, UART_RX, UART_TX);

  espnowStart();

  Serial.print("OpenAVRc HC05-EMU ESPNOW (single firmware)");
  Serial.printf(" Version v%.1f\r\n", VERSION);
  Serial.println("USB console ready. Type 'h' + Enter for help.");

  link_phase = link_connected ? PH_CONNECTED : PH_IDLE;

  oledDrawStatus();
}

void loop() {
  processUsbConsole();

  // When FileTransfer is ON: exclusive TCP<->UART bridge
  if (wifi_ft) {
    wifiFtTask(BT);
    ledUpdate();

    static uint32_t tDispFt = 0;
    if (millis() - tDispFt > 300) { tDispFt = millis(); oledDrawStatus(); }

    delay(1);
    return;
  }

  processUART();

  // generate simulated student frames (tf ...) over ESPNOW
  if (gen_tf) {
    if (linked_peer_set || bound_peer_set) {
      uint32_t now = millis();
      if (now - gen_last_ms >= 20) {
        gen_last_ms = now;
        gen_phase++;

        uint16_t ch[8];
        uint16_t tri = (uint16_t)((gen_phase % 200) < 100 ? (gen_phase % 100) : (100 - (gen_phase % 100)));
        ch[0] = 1000 + (tri * 10);
        ch[1] = 1500; ch[2] = 1500; ch[3] = 1500;
        ch[4] = 1500; ch[5] = 1500; ch[6] = 1500; ch[7] = 1500;

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

  setStatusPin(link_connected);
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
