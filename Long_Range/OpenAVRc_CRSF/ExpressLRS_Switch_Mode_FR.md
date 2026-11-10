# ExpressLRS — Switch Mode / Switch Configuration

> Adaptation française de la documentation ExpressLRS **Switch Configs**.  
> Source : https://www.expresslrs.org/software/switch-config/  
> Page consultée le 30 octobre 2026.  
> Le contenu ci-dessous reprend l'organisation, les notions techniques et les tableaux de la documentation, avec une reformulation en français.

## Avertissement important — Armement

Si vous utilisez **`Arm using CH5`**, placez l'interrupteur d'armement sur **AUX1 / Channel 5** :

- environ **1000 µs = désarmé**
- environ **2000 µs = armé**

Le choix du *Switch Mode* influence directement la résolution et la fréquence d'envoi des voies auxiliaires. C'est donc un paramètre CRSF/ExpressLRS important, en particulier pour l'armement.

---

# Résumé des modes de configuration des switches

| Channel | Côté contrôleur de vol | Hybrid | Wide | Full Res 8ch | Full Res 16ch Rate/2 | Full Res 12ch Mixed |
|---:|---|---|---|---|---|---|
| 1 | Sticks | Normal Range | Normal Range | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits |
| 2 | Sticks | Normal Range | Normal Range | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits |
| 3 | Sticks | Normal Range | Normal Range | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits |
| 4 | Sticks | Normal Range | Normal Range | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits |
| 5 | AUX1 | 2-pos **Arm** | 2-pos **Arm** | CRSF Ext Limits — **Arm*** | CRSF Ext Limits **H** — **Arm*** | CRSF Ext Limits **H** — **Arm*** |
| 6 | AUX2 | 6-pos **RR** | 64-pos **RR** | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 7 | AUX3 | 6-pos **RR** | 64-pos **RR** | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 8 | AUX4 | 6-pos **RR** | 64-pos **RR** | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 9 | AUX5 | 6-pos **RR** | 64-pos **RR** | — | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 10 | AUX6 | 6-pos **RR** | 64-pos **RR** | — | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 11 | AUX7 | 6-pos **RR** | 64-pos **RR** | — | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 12 | AUX8 | 16-pos **RR** | 64-pos **RR** | — | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 13 | AUX9 | — | — | — | CRSF Ext Limits **H** | — |
| 14 | AUX10 | 2-pos **Arm*** | 2-pos **Arm*** | 2-pos **Arm*** | CRSF Ext Limits **H** | 2-pos **Arm*** |
| 15 | AUX11 | LQ% | LQ% | LQ% | CRSF Ext Limits **H** | LQ% |
| 16 | AUX12 | RSSI% | RSSI% | RSSI% | CRSF Ext Limits **H** | RSSI% |
|  | **Packet Rates** | 50 à F1000 | 50 à F1000 | Full Res uniquement | Full Res uniquement | Full Res uniquement |

**\*** : comportement lié aux changements introduits avec ExpressLRS 4.0 et aux nouvelles méthodes d'armement.  
**H** : *Half Rate*, voie envoyée à la moitié du Packet Rate.  
**RR** : *Round Robin*, les voies concernées sont envoyées à tour de rôle.

---

## Résolution / nombre de positions des voies

| Libellé | Description |
|---|---|
| **Normal Range** | Résolution 10 bits, soit 1024 positions, converties sur environ **988 à 2012 µs**. Une unité correspond approximativement à 1 µs. |
| **CRSF Ext Limits** | Résolution 10 bits, soit 1024 positions, converties sur environ **885 à 2115 µs**. Une unité représente environ **1,23046875 µs**. |
| **64-pos** | Résolution 6 bits. Adaptée aux modes de vol, volets, train, sélecteurs, etc. |
| **16-pos** | Résolution 4 bits. Adaptée aux modes de vol, volets, train, sélecteurs, etc. |
| **6-pos** | Résolution 3 bits. Adaptée aux modes de vol, volets, train, sélecteurs, etc. |
| **2-pos** | Résolution 1 bit, principalement prévue pour l'armement : environ **1000 µs désarmé** et **2000 µs armé**. |
| **LQ%** | Qualité de liaison `RQly` exprimée sous forme d'une valeur comprise entre environ **988 et 2012 µs**. |
| **RSSI%** | RSSI en dBm converti en pourcentage (`1RSS/2RSS`), représenté entre environ **988 et 2012 µs**. |

### Rappel Arm using CH5

Avec **`Arm using CH5`**, l'armement doit être placé sur **AUX1 / CH5**, avec :

- ~1000 µs : désarmé
- ~2000 µs : armé

### ExpressLRS 3.x et sortie PWM 5

Avec un récepteur possédant des sorties PWM, si l'on souhaite utiliser la **sortie PWM 5** pour un servo, train, etc., il faut remapper un autre canal vers cette sortie dans l'interface Wi‑Fi du récepteur.

Dans ExpressLRS 3.x, la voie Mixer CH5 reste utilisée pour l'armement du module TX et demeure une voie 2 positions.

À partir d'ExpressLRS 4.x, cette contrainte n'est plus nécessaire dans les modes **Full Res** : Channel 5 peut devenir une voie proportionnelle complète comme les autres.

---

# Cadence de mise à jour des voies et Packet Rate

| Libellé | Description |
|---|---|
| **Gras dans le tableau d'origine** | La voie est présente dans chaque paquet. Exemple : Packet Rate 150 Hz → mise à jour de la voie à 150 Hz. |
| **H — Half Rate** | La moitié des voies est envoyée dans chaque paquet. La cadence effective est donc `Packet Rate / 2`. Exemple : 100 Hz → 50 Hz par voie. |
| **RR — Round Robin** | Les voies sont envoyées à tour de rôle. Exemple donné par ExpressLRS : à 150 Hz, une voie concernée peut n'être actualisée qu'environ tous les 7 paquets, soit ~22 Hz. |
| **50 à F1000** | Les modes **Hybrid** et **Wide** sont disponibles avec les Packet Rates 50 Hz, 150 Hz, 250 Hz, 500 Hz, D250, D500, F500 et F1000. |
| **Full Res uniquement** | Les modes **Full Res 8ch**, **16ch Rate/2** et **12ch Mixed** sont disponibles avec les Packet Rates **100 Hz Full** et **333 Hz Full**. |

---

# Description détaillée des Switch Modes

> Le *Switch Mode* ne peut être changé que lorsqu'aucun récepteur n'est connecté au transmetteur et que le transmetteur n'est pas armé.

Le changement s'effectue depuis la configuration Lua sous EdgeTX/OpenTX ou depuis l'interface intégrée du module TX lorsque celle-ci existe.

ExpressLRS propose actuellement les familles suivantes :

- **Hybrid**
- **Wide**
- **Full Res 8ch**
- **Full Res 16ch Rate/2**
- **Full Res 12ch Mixed**

---
# Hybrid et Wide

Ces deux modes sont disponibles avec les Packet Rates :

- 50 Hz
- 150 Hz
- 250 Hz
- 500 Hz
- D250
- D500
- F500
- F1000

## Channels 1 à 4

Les manches, **CH1 à CH4**, sont transmis dans chaque paquet.

Ils utilisent une résolution de **10 bits / 1024 positions**, sur la plage **988 à 2012 µs**, correspondant à la plage normale `-100 %` à `+100 %` d'EdgeTX/OpenTX.

## Channel 5 / AUX1 — Arm

Le premier switch, **CH5 / AUX1**, est envoyé dans **chaque paquet**.

ExpressLRS recommande fortement d'y placer l'armement. Cette information sert également à activer des protections et certains comportements de performance du système.

Dans Hybrid/Wide, cette voie est normalement utilisée en :

- **1 bit**
- **2 positions**
- ~1000 µs : désarmé
- ~2000 µs : armé

## Channels 6 à 12 — Round Robin

Les autres switches sont envoyés en **Round Robin** : une seule de ces voies auxiliaires est insérée dans un paquet donné, puis la suivante est envoyée dans le paquet suivant.

---

## Hybrid — AUX2 à AUX7 / CH6 à CH11

Ces voies utilisent une résolution **3 bits / 6 positions**.

Elles conviennent aussi bien aux interrupteurs 2 positions, 3 positions, qu'aux sélecteurs 6 positions.

| Switch 2-pos | Switch 3-pos | Switch 6-pos | Entrée voie approx. (µs) | Sortie voie (µs) | Mode ArduPilot |
|---:|---:|---:|---:|---:|---|
| 1 | 1 | 1 | 988 | 1000 | Mode 1 — position haute pour un switch 2/3 positions |
|  |  | 2 | 1192 | 1275 | Mode 2 |
|  |  | 3 | 1398 | 1425 | Mode 3 |
|  | 2 | — | 1500 | 1500 | Mode 4 — position centrale d'un switch 3 positions |
|  |  | 4 | 1602 | 1575 | Mode 4 |
|  |  | 5 | 1807 | 1725 | Mode 5 |
| 2 | 3 | 6 | 2012 | 2000 | Mode 6 — position basse pour un switch 2/3 positions |

---

## Hybrid — AUX8 / CH12

AUX8 / CH12 utilise **4 bits / 16 positions**.

L'ensemble des switches Round Robin nécessite 7 paquets avant que le cycle revienne à AUX2.

Cette voie peut par exemple servir à regrouper de nombreux modes ou à créer une commande multi-position à faible résolution.

Il n'existe pas de position centrale exacte à 1500 µs dans une quantification à 16 positions. Un switch 3 positions appliqué sur AUX8 peut donc produire environ **1533 µs** au centre côté contrôleur de vol.

| Position | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| **Entrée approx. (µs)** | 988 | 1056 | 1125 | 1193 | 1261 | 1329 | 1398 | 1466 | 1534 | 1602 | 1671 | 1739 | 1807 | 1875 | 1944 | 2012 |
| **Sortie (µs)** | 1000 | 1066 | 1133 | 1200 | 1266 | 1333 | 1400 | 1467 | 1533 | 1600 | 1666 | 1733 | 1800 | 1866 | 1933 | 2000 |

---

# Wide

En mode **Wide**, AUX2 à AUX8 / CH6 à CH12 utilisent une résolution de **6 bits / 64 positions**.

Il faut 8 paquets pour parcourir le cycle complet avant de revenir à AUX2. Le huitième emplacement sert aussi à transmettre des informations supplémentaires vers le récepteur, notamment la puissance TX courante.

### Particularité ExpressLRS 3.x

Dans ExpressLRS 3.x :

- Wide utilise **64 positions** avec les ratios de télémétrie `1:2` et `1:4`;
- avec les autres ratios de télémétrie, Wide peut utiliser **128 positions**.

### ArduPilot et Wide

Avec ArduPilot, les niveaux d'un sélecteur 6 positions ne coïncident pas toujours idéalement avec la plage standard `988–2012 µs`.

La documentation ExpressLRS recommande, si nécessaire, d'ajuster les limites de sortie de la voie dans EdgeTX/OpenTX à environ :

- minimum : **-75 %**
- maximum : **+75 %**

Cela permet de mieux répartir les six modes ArduPilot.

---
# Modes Full Resolution

Les modes **Full Resolution** sont disponibles uniquement avec :

- **100 Hz Full**
- **333 Hz Full**

Ils utilisent des voies à **10 bits / 1024 positions**, avec la plage **CRSF Extended Limits : 885 à 2115 µs**.

## ExpressLRS 4.0

| Mode | Comportement |
|---|---|
| **Full Res 8ch** | CH1 à CH8 sont envoyés en 10 bits à la cadence complète du Packet Rate sélectionné. |
| **Full Res 16ch Rate/2** | Les 16 voies sont envoyées en 10 bits, chacune à la moitié du Packet Rate. |
| **Full Res 12ch Mixed** | CH1 à CH4 sont envoyés en 10 bits à la cadence complète. CH5 à CH12 sont envoyés en 10 bits à demi-cadence. |

## ExpressLRS 3.x

| Mode | Comportement |
|---|---|
| **Full Res 8ch** | CH1 à CH4 et CH6 à CH9 sont envoyés en 10 bits à la cadence complète. CH5 / AUX1 reste une voie 1 bit / 2 positions pour l'armement. |
| **Full Res 16ch Rate/2** | Toutes les voies sont envoyées en 10 bits à demi-cadence. |
| **Full Res 12ch Mixed** | CH1 à CH4 sont envoyés en 10 bits, CH5 / AUX1 reste un Arm 1 bit à cadence complète, et CH6 à CH13 sont envoyés en 10 bits à demi-cadence. |

---

# FAQ

## Pourquoi l'état Arm est-il si important ?

Le transmetteur et le récepteur ExpressLRS n'ont pas exactement le même comportement lorsqu'ils sont **armés** et **désarmés**.

Lorsqu'ils sont désarmés, ExpressLRS peut privilégier certaines opérations de configuration afin que le Lua et les changements de paramètres restent réactifs.

Une fois armé, différentes protections et optimisations sont activées.

### Protections activées lorsque le système est armé

Certaines fonctions susceptibles de perturber la liaison radio sont bloquées, notamment :

- les boutons des modules TX externes;
- le joystick / bouton 5 directions des modules TX externes;
- *Bump to Share*;
- *VTX Admin*;
- les changements de canal VTX intégrés.

Ces restrictions évitent qu'une opération de configuration ne perturbe le trafic OTA et ne provoque une coupure ou un failsafe.

### Fonctions de performance liées à l'état Arm

Lorsque le système est armé :

- **Dynamic Power** peut fonctionner pleinement;
- une perte de paquet de télémétrie peut pousser la puissance TX vers le maximum;
- une déconnexion brutale ou un failsafe peut également forcer la puissance maximale;
- le mode **Race Telemetry** peut désactiver la télémétrie afin de consacrer tous les paquets au contrôle;
- certains modules peuvent activer une régulation thermique du ventilateur.

---

## Pourquoi ExpressLRS recommande-t-il AUX1 / CH5 pour l'Arm ?

AUX1 est envoyé **dans chaque paquet** dans les modes où il sert à l'armement.

C'est donc la voie la plus fiable pour transmettre immédiatement l'ordre de désarmement.

Si l'armement était placé sur une voie Round Robin, il pourrait s'écouler plusieurs paquets avant que son nouvel état soit transmis. Lorsque la qualité de liaison est faible, le paquet contenant précisément cette voie pourrait également être perdu.

Avec l'Arm sur AUX1, la réception de n'importe quel paquet valide contenant cette information permet de mettre à jour immédiatement l'état d'armement.

ExpressLRS recommande donc :

- **AUX1 / CH5**
- ~1000 µs = désarmé
- ~2000 µs = armé

---

## Peut-on utiliser un interrupteur 3 positions pour l'Arm ?

Oui.

Il faut configurer le mixage dans EdgeTX/OpenTX afin que la voie AUX1 vue par ExpressLRS se comporte comme une commande **2 positions ON/OFF**.

Si la troisième position de l'interrupteur est aussi utilisée pour une autre fonction, le même switch peut être envoyé sur une seconde voie pour cette fonction supplémentaire.

---

## Qu'est devenu l'ancien mode « Normal » 1 bit ?

ExpressLRS 1.0 proposait un mode **Normal** avec huit switches 1 bit transmis dans chaque paquet.

Ce mode a été supprimé à partir d'ExpressLRS 2.0, principalement parce qu'il était peu utilisé et que l'espace Flash pouvait servir à d'autres fonctions.

Les modes recommandés sont désormais **Hybrid**, **Wide** ou les différents modes **Full Resolution**.

---

## Pourquoi le Switch Mode revient-il à son ancienne valeur après une modification dans le Lua ?

Ce comportement est volontaire.

Le *Switch Mode* ne peut être modifié que lorsque :

1. le récepteur **n'est pas connecté** au transmetteur;
2. le transmetteur **n'est pas armé**.

Cette restriction garantit que TX et RX interprètent toujours les données de switches avec le même format.

Procédure recommandée :

1. éteindre le récepteur;
2. attendre l'annonce **Telemetry Lost**;
3. modifier le **Switch Mode**;
4. rallumer ensuite le récepteur.

Au démarrage suivant, TX et RX effectuent leur échange de configuration avec le nouveau mode.

---

# Point important pour une intégration OpenAVRc / CRSF

Pour une interface CRSF complète, **Switch Mode doit être exposé comme un paramètre configurable** du module ExpressLRS.

Les choix disponibles dépendent notamment :

- de la version ExpressLRS;
- du Packet Rate sélectionné;
- de l'état de connexion du récepteur;
- de l'état Arm/Disarm;
- des capacités du module TX.

Le *Switch Mode* ne constitue donc pas une simple préférence d'affichage : il change réellement la façon dont les voies auxiliaires sont encodées et transmises.
