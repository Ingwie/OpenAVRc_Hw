
---

### ?? Câblage (carte de test)

Carte **sans KEY ni STATUS** (mode AUTO).

| Fonction | ESP32-C3 GPIO | Remarque |
|--------|---------------|---------|
| UART RX | GPIO4 | RX ESP ? TX1 Mega (pont résistif déjà présent) |
| UART TX | GPIO7 | TX ESP ? RX1 Mega |
| OLED SDA | GPIO5 | I2C |
| OLED SCL | GPIO6 | I2C |
| LED | GPIO8 | LED état |
| Alimentation | 5 V / GND | Via `BT_OnOff` |

---

### ?? Mode AT / DATA (IMPORTANT)

Sur la carte de test, **pas de pin KEY**.

?? Le firmware fonctionne en **AUTO mode** :

- Toute ligne commençant par `AT` ? traitée comme **commande AT**
- Toute autre donnée ? transmise comme **DATA**

Ce comportement est **100 % compatible OpenAVRc**.

---

### ??? Console USB (115200 bauds)

Commande | Description
--------|------------
`m` | Forcer rôle MASTER
`s` | Forcer rôle SLAVE
`i` | Informations système
`d` | Activer / désactiver debug UART BT
`h` | Aide

#### Debug BT (`d`)
- `[RX]` : données reçues du port BT (radio ? ESP)
- `[TX]` : données envoyées vers la radio
- Décodage automatique des trames OpenAVRc `tf ...`
  - Valeurs des 8 canaux
  - Vérification checksum

---

### ?? OLED – Informations affichées

- Nom du firmware
- Rôle (MASTER / SLAVE)
- MAC locale
- État de la liaison
- MAC peer
- Mode AT (`AUTO` sur carte test)

---

### ?? Versioning

?? **Cette version est figée.**

- **Version : v1.0**
- Toute évolution future devra :
  - créer **v1.1, v1.2, …**
  - **ne jamais modifier v1.0**

---

### ?? Limitations connues (v1.0)

- Pas de chiffrement ESP-NOW
- Un seul lien actif à la fois
- Scan limité à 3 périphériques (comme OpenAVRc)
- Pas de simulation du Bluetooth classique (SPP réel)

---

### ? Compatibilité validée

- OpenAVRc (liaison radio ? radio)
- Format trames `tf` (8 canaux)
- Mode maître / esclave OpenAVRc
- Cartes de test et cartes complètes

---

---

## ???? English

### ?? Overview

This project implements a **partial HC-05 / HM-10 Bluetooth module emulator** based on **ESP32-C3**, designed for **OpenAVRc radios**.

Its goal is to **replace unreliable HC-05 clone modules** with a **fully controlled, deterministic and reproducible solution**, while remaining **fully compatible with existing OpenAVRc firmware**, with **no modification on the radio side**.

Radio-to-radio communication is handled via **ESP-NOW**, while OpenAVRc sees a **standard UART HC-05-like interface**.

---

### ?? Main Features

- **HC-05 UART emulation**
  - AT command subset used by OpenAVRc
  - MASTER / SLAVE modes
  - Supported commands:
    `AT`, `AT+ROLE`, `AT+INQ`, `AT+RNAME?`, `AT+LINK`, `AT+STATE?`,
    `AT+NAME`, `AT+PSWD`, `AT+UART`, …
- **ESP-NOW** radio transport
- Slave discovery (INQ)
- MAC ? NAME resolution (RNAME)
- Point-to-point master/slave link
- Transparent UART data bridge
- **OpenAVRc frame decoding** (8 channels)
- **SSD1306 OLED**
- **Status LED**
- **USB debug console**

---

### ?? Wiring (test board)

AUTO mode (no KEY / STATUS pins).

| Signal | ESP32-C3 GPIO |
|------|---------------|
| UART RX | GPIO4 |
| UART TX | GPIO7 |
| OLED SDA | GPIO5 |
| OLED SCL | GPIO6 |
| LED | GPIO8 |
| Power | 5 V / GND |

---

### ?? AT / DATA Mode

AUTO detection:

- Lines starting with `AT` ? AT command
- Everything else ? DATA bridge

Fully OpenAVRc compatible.

---

### ??? USB Console (115200 baud)

Command | Function
--------|---------
`m` | Force MASTER role
`s` | Force SLAVE role
`i` | System info
`d` | Toggle BT UART debug
`h` | Help

---

### ?? OLED Display

- Firmware name
- Role
- Local MAC
- Link state
- Peer MAC
- AT mode (AUTO)

---

### ?? Versioning Policy

?? **This version is frozen.**

- **Version: v1.0**
- Any future change must:
  - create **v1.1, v1.2, …**
  - never modify v1.0

---

### ?? Known Limitations (v1.0)

- No ESP-NOW encryption
- Single active link
- Scan limited to 3 devices
- Not a real Bluetooth SPP stack

---

### ?? Author / Context

Developed for **OpenAVRc** ecosystem  
ESP32-C3 firmware replacing HC-05 Bluetooth modules

---

**End of document**
