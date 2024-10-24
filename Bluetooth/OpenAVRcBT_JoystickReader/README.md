# Bluetooth details
Les radios OpenAVRc sont équipées d'un module Bluetooth de type HC-05.
Elles peuvent être configurées soit en 'maître' soit en 'esclave'.
Seule une radio définie en 'maître' peut lancer un scan afin de trouver une autre radio autour d'elle, qui elle, devra être définie en 'esclave'.

L'option Bluetooh permet de connecter deux radios en mode écolage.
Grâce à cette option, on peut commander la radio à partir d'un joystick USB de type Logitech 3D Pro.

Le code Arduino est téléchargeable [ici](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Bluetooth/OpenAVRcBT_JoystickReader/OpenAVRcBT_JoystickReader.ino).

Deux options sont possibles:
1. L'interface simule un signal **CPPM**.
2. L'interface via le **Bluetooth** génère une trame compatible avec la radio.
 

## Utiliser le module réception en mode PPM
 Configurer dans le code OpenAVRcBT_JoystickReader, ligne 51,  **#define MODE PPM**

## Utiliser le module réception en mode Bluetooth
 Configurer dans le code OpenAVRcBT_JoystickReader, ligne 51,  **#define MODE BLUETOOTH**
 
# Réaliser le câblage

## A. Carte Uno ou Leonardo

Cette solution utilise un shield Arduino de type *USB Host Shield v2.0*.

![ici](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth/OpenAVRcBT_JoystickReader/UsbHostShieldv2.0.jpg)     ![ici](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth/OpenAVRcBT_JoystickReader/UsbHostShield&Uno.jpg)

La plupart des shields Usb sont des copies. Sur presque toutes, il faut réaliser trois ponts de soudures ainsi:

![ainsi](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth/OpenAVRcBT_JoystickReader/UsbHostShield_link.jpg)

Utiliser l'un des croquis suivants:

![ainsi](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth/OpenAVRcBT_JoystickReader/BTSIMUno.jpg)

![ainsi](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth/OpenAVRcBT_JoystickReader/BTSIMLeonardo.jpg)

## B. Carte Pro Mini 3,3v/8Mhz

Cette solution utilise un Pro Mini 3,3v/8Mhz car le mini shield usb ne supporte que 3,3v.

![ainsi](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth/OpenAVRcBT_JoystickReader/BTSIMProMini.jpg) .

## Screen Option

Vous pouvez utiliser un écran LCD 20x4 ou SSD1306/SSD1309.

A la ligne 58, décommentez #define DISPLAY_TYPE **LCD_TYPE** // ou **SSD_TYPE**

## Configurer le module réception
1. Installer les bibliothèques [USB Host Shield Library 2.0](https://www.arduinolibraries.info/libraries/usb-host-shield-library-2-0) et [DigisparkTinyCppmGen](https://github.com/RC-Navy/DigisparkArduinoIntegration/tree/master/libraries/DigisparkTinyCppmGen) dans l'IDE Arduino.
2. Décommenter à la ligne 46 **#define AT_INIT** .
3. Compiler et Télécharger le code.
4. Au premier lancement, le Uno ou Pro Mini devrait configurer en **'Slave'** et en **'57600'**, (ou en **115200** pour un board Leonardo)
5. Commenter à nouveau à la ligne 46  **//#define AT_INIT** .
6. Compiler et Télécharger le code. Le module réception est prét.
7. Par défaut, le code est configuré pour fonctionner avec un module BLUETOOTH HC-05 mais vous pouvez utiliser le mode PPM.  
 **#define MODE PPM** //Selectionnez PPM ou BLUETOOTH ligne 51
8. Configurer le fichier TinyCppmGen.h lignes 49 et 50.  
* Atmega328p:  
#define OC_TIMER      TIMER(2)    /* <-- Choose here the timer   between TIMER(0), TIMER(1) or TIMER(2) */  
#define OC_CHANNEL    CHANNEL(B)  /* <-- Choose here the channel between CHANNEL(A) and CHANNEL(B) */

* Atmega32U4:  
#define OC_TIMER      TIMER(0)    /* <-- Choose here the timer   between TIMER(0), TIMER(1) or TIMER(2) */  
#define OC_CHANNEL    CHANNEL(B)  /* <-- Choose here the channel between CHANNEL(A) and CHANNEL(B) */


## Configurer la radio.
1. Aller dans l'écran Bluetooth de la radio.
2. Configurer en mode 'Master'.
3. Lancer un **'Scan'**, vous devriez voir un **BT/SIM**.  Sélectionnez le.

![ainsi](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth/OpenAVRcBT_JoystickReader/BTScanResult.jpg)

4. Validez **'Auto Connect'**.
5. Créer un modèle et choisir autre chose que SIM/BT (par exemple **PPM** ou **Frsky-X**).

![ainsi](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth/OpenAVRcBT_JoystickReader/model.jpg)

6. Configurer le mixer du modèle, par exemple, ainsi.

![ainsi](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth/OpenAVRcBT_JoystickReader/mixer.jpg)   ![ainsi](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth/OpenAVRcBT_JoystickReader/mixer2.jpg)

7. Eteindre puis redémarrer la radio, celle-ci devrait alors ce connecter au module réception, les leds des deux modules se mettront alors à clignoter toutes les 2 secondes.

Dans tous les cas, démarrer le module réception en premier.

## Utilisation du Joystick Logitech 3D Pro
- Le bouton **HAT** permet de gérer une caméra en direction (gauche/droite) et hauteur (hat/bas).  
- 3 **MODES** sont possibles:  
  * `exponentiel`, bouton 5(passage de haut en bas ou droite à gauche rapide)  
  * `lent`, bouton 4 (passage de haut en bas ou droite à gauche lent)  
  * `min max`, bouton 3  (passage de haut en bas ou droite à gauche d'un coup)  

* Le bouton 1 recentre la caméra.  
* Le bouton 6 met en route l'auto centrage de la caméra. 

* Les boutons 8,10 et 12 commandent la voie 5.
* Les boutons 7,9 et 11 commandent la voie 6. 

La caméra en connectée sur les voies 7 et 8.

![ainsi](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Bluetooth/OpenAVRcBT_JoystickReader/LE3DP_ButtonsMapping.jpg)







