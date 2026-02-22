# USB OTG Host HID (ESP32‑S3) — Description technique (librairies + architecture du code)

Ce document décrit **comment** le joystick USB est lu sur ESP32‑S3 en **mode Host OTG**, quelles **librairies** sont utilisées, et comment le code est structuré (événements HID → canaux RC → trame TF envoyée via `sendPkt()`).

---

## 1) Contexte matériel (rappel rapide)

- ESP32-S3 utilisé en **USB Host (OTG)**.
- Joystick USB branché via un adaptateur OTG (USB‑A femelle).
- Alimentation **VBUS +5V externe** (ex: 5V / 2A) fournie au port USB pour alimenter le joystick.
- Lignes USB: `VBUS`, `D+`, `D-`, `GND`.

---

## 2) Librairies / composants logiciels utilisés

### 2.1 Arduino‑ESP32 (core Espressif 3.0.7)
- Fournit l’environnement Arduino, FreeRTOS, et l’accès aux headers ESP‑IDF.
- Fournit la base **USB Host** via l’ESP‑IDF:
  - `usb/usb_host.h`
  - `usb_host_install()`
  - `usb_host_lib_handle_events()`
  - gestion de la pile USB host (énumération, endpoints, etc.)

### 2.2 Bibliothèque **ESP32_USB_Host_HID**
Cette bibliothèque fournit le composant **HID Host** manquant dans le core 3.0.7 (ou plus exactement: le header+implémentation HID Host utilisables côté Arduino).

Concrètement, elle fournit:
- `hid_host.h` (types et API HID Host)
- les fonctions et types HID:
  - `hid_host_install()`
  - `hid_host_device_open()`
  - `hid_host_device_start()`
  - événements: `hid_host_driver_event_t`, `hid_host_interface_event_t`
  - handle device: `hid_host_device_handle_t`
  - lecture des rapports: `hid_host_device_get_raw_input_report_data()`

**Point important**: dans un projet Arduino complexe, on peut avoir des collisions de header (`hid_host.h`).  
La version qui marche force l’utilisation de la lib installée en utilisant:
```cpp
#include <hid_host.h>
```
(angle brackets → recherche dans les librairies Arduino)

---

## 3) Architecture logique du code

### 3.1 Deux “niveaux” de traitement
1. **Niveau USB/HID (événementiel)**  
   - Le driver HID reçoit des **événements** (device connecté/déconnecté, input report).
   - À chaque input report, on récupère les octets bruts (RAW).

2. **Niveau RC / TF (périodique)**  
   - On décode le report HID en valeurs “axes/boutons”.
   - On convertit en canaux RC **1000–2000 µs**.
   - On met en forme la trame **TF** via `buildTfFrame()`.
   - On envoie via `sendPkt()` au peer ESPNOW (ou autre transport), typiquement à **50 Hz** (20 ms).

Cette séparation est volontaire:
- Les joysticks HID envoient parfois des reports **uniquement sur changement**.
- Pour un système RC/Trainer, on veut souvent une trame **régulière** (50 Hz).

---

## 4) Détails d’implémentation

### 4.1 Initialisation (ex: `JoystickHidBegin()`)
1. **Installation USB Host**
```cpp
usb_host_install(&host_cfg);
```

2. **Tâche de gestion des événements USB Host**
L’ESP‑IDF impose de pomper les événements USB avec:
```cpp
usb_host_lib_handle_events(portMAX_DELAY, &flags);
```
Dans notre code, on lance une task FreeRTOS dédiée (ex: `usb_lib_task`) qui bloque proprement sur `portMAX_DELAY`.
- Cette task **ne bloque pas** le reste du programme: elle est juste en attente d’événements USB.

3. **Installation du driver HID Host**
```cpp
hid_host_install(&cfg);
```
On fournit un callback driver (événements de connexion) et un callback interface (input reports).

---

### 4.2 Gestion des événements HID

#### 4.2.1 Queue d’événements
Les callbacks HID sont courts: ils poussent un événement dans une queue FreeRTOS (ex: `hid_q`).

- Callback driver: device CONNECTED
- Callback interface: INPUT_REPORT / DISCONNECTED

Cela évite de faire du traitement lourd directement dans un callback.

#### 4.2.2 Dans `JoystickHidTask()` (appelé souvent)
`JoystickHidTask()` vide la queue:
- si CONNECTED:
  - `hid_host_device_open()`
  - `hid_host_device_start()`
  - `g_usb_dev_mounted = true`
- si INPUT_REPORT:
  - lecture RAW via `hid_host_device_get_raw_input_report_data()`
  - `decodeJoyReport(raw, len)`
  - incrément `g_usb_report_count`
- si DISCONNECTED:
  - `g_usb_dev_mounted = false`
  - remise à des valeurs par défaut (failsafe simple)

---

## 5) Décodage HID → canaux RC

### 5.1 Décodage
Le décodage `decodeJoyReport()` est un **parseur** basé sur la taille/structure typique des reports joystick:
- Axes (X, Y, Z, throttle…) sur 8/10/14 bits selon device
- Boutons packés en bits
- Hat switch (souvent 4 bits)

### 5.2 Conversion en microsecondes
On convertit les valeurs brutes vers **1000–2000 µs**:
- `map_u8_to_us(0..255) → 1000..2000`
- `map_u10_to_us(0..1023) → 1000..2000`
- `map_u14_to_us(0..16383) → 1000..2000`

Les canaux sont stockés en mémoire comme “dernières valeurs connues”.

---

## 6) Affichage debug `joydbg 1`

### Problème initial
Sans mouvement, certains joysticks n’émettent pas de report → aucun “nouveau” canal → pas d’affichage.

### Correction appliquée
Quand `joydbg` est actif, on affiche périodiquement (ex: toutes les 200 ms) les 8 canaux courants:
- impression **indépendante** de la réception d’un nouveau report HID
- affichage basé sur les dernières valeurs (`JoystictOut[]`)

---

## 7) Génération et envoi de la trame TF (HC05 / trainer)

### 7.1 Mise en forme TF
On part d’un tableau `uint16_t ch[8]` (1000..2000 µs), puis:
```cpp
buildTfFrame(ch, frame, sizeof(frame));
```

### 7.2 Choix de la destination
Comme dans l’exemple `cmdSg()`:
```cpp
const uint8_t* dst = linked_peer_set ? linked_peer_mac : bound_peer_mac;
```

### 7.3 Envoi
```cpp
sendPkt(dst, PKT_DATA, frame, (uint16_t)strlen(frame));
```

### 7.4 Cadence d’envoi
Pour une cadence RC classique:
- 50 Hz → 20 ms
- un simple rate‑limit:
```cpp
if (now - last_ms >= 20) { ... }
```

---

## 8) Pourquoi FreeRTOS tasks ne “bloquent” pas (si bien utilisées)

- La task USB (`usb_host_lib_handle_events`) est **bloquante** pour ELLE‑MÊME (attente d’événement), pas pour ton programme.
- `JoystickHidTask()` reste non‑bloquant (il draine une queue en non‑block, fait un peu de traitement, puis rend la main).
- Les tâches ne posent problème que si:
  - priorité trop haute + boucle sans attente,
  - sections critiques trop longues,
  - saturations de queue (événements perdus).

---

## 9) Résumé “pipeline”

**Joystick USB**  
→ (USB OTG Host ESP32‑S3, `usb_host.h`)  
→ (HID Host via lib `ESP32_USB_Host_HID`, `hid_host.h`)  
→ événements CONNECTED / INPUT_REPORT  
→ lecture RAW report  
→ décodage axes/boutons  
→ conversion RC 1000–2000 µs  
→ `buildTfFrame()`  
→ `sendPkt()` au peer (ex. 50 Hz)  
→ option debug `joydbg` (canaux affichés périodiquement)

---
