# ESP32C3 – Architecture fonctionnelle des modes

Ce document décrit **la cartographie logique** des modes SLAVE et MASTER du projet  
ESP32C3 HC05 / SBUS / PPM Bridge.


---

## Vue générale

```
Radio SLAVE
    ↓
 Interface SLAVE
    ↓
  ESPNOW
    ↓
 Interface MASTER
    ↓
Radio MASTER
```

- Le **transport interne** entre ESP32 se fait via **ESPNOW**
- Le **format transporté** dépend du couple de modes sélectionnés
- Un seul mode est actif à la fois par côté

---

## Modes SLAVE (Entrée radio)

### HC05_SLAVE

```
Radio OpenAVRc
   |
   | UART (BT)
   v
Trame tf (ASCII)
   |
   v
ESPNOW (tf ASCII)
```

- Lecture directe des trames `tf` générées par OpenAVRc
- Aucun décodage de canaux nécessaire
- Mode historiquement présent dans OpenAVRc

---

### SBUS_SLAVE

```
Radio EdgeTX / TX16S
   |
   | SBUS (UART)
   v
Trame SBUS
   |
   v
Décodage canaux (11 bits)
   |
   v
Trame tf (ASCII)
   |
   v
ESPNOW (tf ASCII)
```

- Décodage SBUS réel (100 kbaud, 8E2)
- Conversion SBUS → canaux → `tf`
- Compatible radios modernes EdgeTX

---

### CPPM_SLAVE

```
Radio quelconque
   |
   | PPM (GPIO + interruption)
   v
Durées d'impulsions (µs)
   |
   v
Canaux (µs)
   |
   v
ESPNOW (binaire canaux + CRC)
```

- Lecture PPM réel par interruption
- Reconstruction des canaux en microsecondes
- Envoi ESPNOW en **paquet binaire sécurisé (CRC)**

---

## Modes MASTER (Sortie radio)

### HC05_MASTER

```
ESPNOW (tf ASCII)
   |
   v
Trame tf
   |
   | UART (BT)
   v
Radio OpenAVRc
```

- Injection directe des trames `tf`
- Comportement identique à un module HC05 réel

---

### SBUS_MASTER

```
ESPNOW (tf ASCII)
   |
   v
Décodage trame tf
   |
   v
Canaux
   |
   | Encodage SBUS
   v
Radio SBUS
```

- Conversion `tf` → canaux → SBUS
- Génération SBUS en sortie UART

---

### CPPM_MASTER

```
ESPNOW (binaire canaux + CRC)
   |
   v
Canaux (µs)
   |
   | Génération PPM
   v
Radio PPM
```

- Utilisé pour les liaisons PPM → PPM
- Aucun passage par le format `tf`
- Latence minimale

---

## Structure et génération de la trame `tf`

### Rôle de la trame `tf`

La trame `tf` est le **format historique OpenAVRc** utilisé pour transporter les
positions des voies entre radios via une liaison série (HC05 à l’origine).

Dans ce projet, elle sert :
- de **format de compatibilité** avec OpenAVRc
- de **payload ESPNOW** dans les modes HC05 et SBUS

---

### Format général

```
tf sXXX sXXX sXXX sXXX sXXX sXXX sXXX sXXX:CC
```

- `tf` : identifiant fixe de début de trame
- `sXXX` : valeur d’un canal sur 12 bits, codée en hexadécimal
- `:` : séparateur données / CRC
- `CC` : CRC 8 bits, codé sur 2 hex

La trame est terminée par `\r`.

---

### Exemple réel

```
tf s513 s5DC s3DC s5E0 s5A0 s59C s595 s5DC:71
```

| Élément | Signification |
|-------|--------------|
| tf | Début de trame |
| s513 | Canal 1 |
| s5DC | Canal 2 |
| s3DC | Canal 3 |
| s5E0 | Canal 4 |
| s5A0 | Canal 5 |
| s59C | Canal 6 |
| s595 | Canal 7 |
| s5DC | Canal 8 |
| 71 | CRC |

---

### Codage des canaux

- Valeurs hexadécimales sur 12 bits (`0x000` – `0xFFF`)
- Valeurs usuelles :
  - Min ≈ `0x3DC`
  - Neutre ≈ `0x5DC`
  - Max ≈ `0x7DC`

Le mapping exact est conservé tel quel pour rester compatible OpenAVRc.

---

### Calcul du CRC

- CRC simple sur 8 bits
- Calculé sur tous les caractères ASCII :
  - depuis `t` de `tf`
  - jusqu’au dernier caractère du dernier `sXXX`
- Ajouté après `:` sous forme hexadécimale

Il permet de détecter les erreurs de transmission.

---

### Génération de la trame `tf` dans le projet

Selon le mode SLAVE actif :
- **HC05_SLAVE** : trame reçue telle quelle
- **SBUS_SLAVE** : SBUS → canaux → `tf`
- **CPPM_SLAVE** : PPM → canaux → `tf` (si mode ASCII utilisé)

Étapes communes :
1. Normalisation des canaux
2. Conversion en `sXXX`
3. Concaténation ASCII
4. Calcul CRC
5. Envoi UART ou ESPNOW

---

## Notes matérielles importantes

- Le **port BT (GPIO 4 / GPIO 7)** est multi-usage :
  - UART en modes HC05 / SBUS
  - GPIO en modes PPM
- L'UART est désactivé en modes PPM
- Un seul mode actif à la fois par côté

---

## Résumé

| SLAVE \ MASTER | HC05 | SBUS | PPM |
|-----------------|------|------|-----|
| **HC05**        | ✔️   | ✔️   | ✔️  |
| **SBUS**        | ✔️   | —    | —   |
| **PPM**         | ✔️   | —    | ✔️  |

✔️ = implémenté ou prévu  
— = non pertinent

---

Ce document sert de **référence d’architecture** pour toute évolution future.
