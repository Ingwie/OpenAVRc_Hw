# OpenAVRc SD File Transfer over Wi-Fi (ESP32-C3 FT bridge)
**Works with OpenAVRc uCLI + XMODEM + SD (SPI)**  
**Tested with ESP32-C3 “HC05-EMU ESPNOW” firmware (v1.4/v1.5) FT mode**

---

## Français

### 1) Principe
Le transfert de fichiers SD ? PC se fait avec :
- **OpenAVRc uCLI** côté radio (Mega2560)
- **XMODEM** côté PC (Tera Term / Desktop)
- **ESP32-C3** en mode **FT (File Transfer)** : pont **TCP brut ? UART** vers la radio

Le firmware ESP32 ne “comprend” pas XMODEM : il est **transparent**.

---

### 2) Important : Service TCP “brut”
Pour XMODEM, il faut impérativement un flux TCP **brut**, sans négociation.

? Dans Tera Term :
- `TCP/IP`
- **Service : Autre** (RAW TCP)
- Host : `IP_de_l_ESP32`
- Port : `3333`

? Éviter :
- `Telnet` (négociation Telnet = octets en plus)
- `SSH` (protocole non supporté)

---

### 3) Démarrer le mode FT sur l’ESP32
Suivant le firmware :
- `w ap` : AP Wi-Fi de l’ESP32 (si le PC a le Wi-Fi)
- `w sta` : l’ESP32 rejoint le Wi-Fi de la box (PC en Ethernet OK)

Dans les versions avec STA :
- configurer d’abord :
  - `ssid <NomWiFi>`
  - `pass <MotDePasse>`
- puis :
  - `w sta`

L’ESP32 affiche son IP (`w sta ip` si disponible).

---

### 4) Déclencher le transfert côté radio (uCLI)
OpenAVRc ne crée pas un fichier automatiquement : il faut lui dire quel fichier ouvrir via `cp`.

#### PC -> SD (upload)
Dans la console uCLI (via TeraTerm connecté) :
cp xmdm SD/LOGS/TEST.TXT

Puis dans TeraTerm :
- `File ? Transfer ? XMODEM ? Send`
- choisir le fichier PC

#### SD -> PC (download)
Dans la console uCLI :
cp SD/LOGS/TEST.TXT xmdm

Puis dans TeraTerm :
- `File ? Transfer ? XMODEM ? Receive`

---

### 5) IMPORTANT : Casse des noms de fichiers (TEST.TXT vs TEST.txt)
Selon la pile FAT / uCLI, la commande `cp` peut être **sensible à la casse**.

Symptôme typique :
- `cp xmdm SD/LOGS/TEST.TXT` fonctionne
- `cp xmdm SD/LOGS/TEST.txt` échoue ou ne crée rien

? Recommandation :
- Utiliser des chemins et extensions en **MAJUSCULES** :
  - `TEST.TXT`, `MODEL01.BIN`, etc.

?? Amélioration possible (ESP32/Desktop) :
- forcer automatiquement la casse en MAJUSCULE dans la commande envoyée.

---

### 6) Répertoires SD conseillés
Exemples :
- `SD/LOGS/`
- `SD/MODELS/`
- `SD/EEPROM/`
- `SD/FIRMWARE/`

---

### 7) Trames “tf” (trainer) qui polluent la console
Si la radio est en mode “élève” / trainer actif, elle peut envoyer des trames `tf ...` en continu,
ce qui rend la saisie des commandes uCLI difficile.

Solutions :
- mettre la radio en **mode maître**
- ou désactiver le trainer / BT avant transfert
- ou utiliser un mode FT exclusif côté ESP32 (recommandé)

---

---

## English

### 1) Concept
File transfer SD ? PC uses:
- **OpenAVRc uCLI** on the radio (Mega2560)
- **XMODEM** on the PC (Tera Term / Desktop)
- **ESP32-C3** in **FT mode**: transparent **RAW TCP ? UART** bridge to the radio

ESP32 does not implement XMODEM. It just forwards bytes.

---

### 2) IMPORTANT: Use RAW TCP
XMODEM requires a pure byte stream.

? In Tera Term:
- `TCP/IP`
- **Service: Other** (RAW TCP)
- Host: `ESP32 IP`
- Port: `3333`

? Avoid:
- `Telnet` (telnet negotiation injects bytes)
- `SSH` (not supported)

---

### 3) Start FT on ESP32
Depending on firmware:
- `w ap` : ESP32 creates a Wi-Fi AP (PC needs Wi-Fi)
- `w sta` : ESP32 joins router Wi-Fi (PC can be Ethernet)

STA mode:
- `ssid <Name>`
- `pass <Password>`
- `w sta`

ESP32 prints its IP (or `w sta ip`).

---

### 4) Trigger transfer on the radio (uCLI)
OpenAVRc must open the destination/source file via `cp`.

PC ? SD (upload):
cp xmdm SD/LOGS/TEST.TXT

Then in Tera Term: `XMODEM Send`

SD ? PC (download):
cp SD/LOGS/TEST.TXT xmdm

Then in Tera Term: `XMODEM Receive`

---

### 5) IMPORTANT: filename case (TEST.TXT vs TEST.txt)
Depending on the FAT/uCLI stack, `cp` may be **case sensitive**.

? Recommendation:
- Use **UPPERCASE** paths/extensions:
  - `TEST.TXT`, `MODEL01.BIN`, etc.

Enhancement idea:
- auto-uppercase filenames in ESP32/Desktop.

---

### 6) Suggested SD folders
- `SD/LOGS/`, `SD/MODELS/`, `SD/EEPROM/`, `SD/FIRMWARE/`

---

### 7) Trainer “tf” frames
If the radio is in student/trainer mode, `tf ...` frames may flood the link.

Fix:
- use Master mode / disable trainer before transfer
- or use an ESP32 FT exclusive mode

---
