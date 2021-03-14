# Capteur Hall I2C

Ce capteur d'angle retourne une tension comprise entre 0v et 5v.
Cette tension est convertie et transmise à l'émetteur **OpenAVRc** via le port I2C.

Ce capteur simule un capteur de type [Allegro MicroSystems A1335](https://www.allegromicro.com/en/products/sense/linear-and-angular-position/angular-position-sensor-ics/a1335).

L'ensemble est construit sur un Attiny85 qui lit la tension et la convertit en donnée I2C.