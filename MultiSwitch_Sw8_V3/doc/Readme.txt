Bonjour Pierrot,

en PJ, 2 photos expliquant la modif à faire sur le mini Nano V3 pour
récupérer le RX de l'UART pour les protocoles RC séries.

1) Côté cuivre, au scalpel, couper la piste qui va à la LED D3 (couper
entre le via qui va à la LED D3 et le 'S' de la sérigraphie RST: on
distingue à peine le cuivre de la piste coupée sous le fil émaillé sur
la photo IMG_20251229_120408.jpg)
2) En face de la LED D3, faire une petite encoche au scalpel sur le bord
du PCB pour laisser passer le futur fil émaillé (3/10e de mm)
3) Côté cuivre, coller la barrette 3 points au pas de 2.54 mm (moi, j'ai
utilisé de la "Super Glue"). Laisser dépasser les 3 pins de la barrette
de 1.5mm du bord du PCB.
4) Souder un fil émaillé (3/10e de mm) entre le point milieu de la
barrette 3 points et la LED D3 (le fil passe par l'encoche). Mettre une
goutte de glue au niveau de l'encoche
5) Souder un fil émaillé (3/10e de mm) entre le point de la barrette 3
points qui est en face de D12 et la pin D12
6) Souder la résistance de protection de 220 Ohm entre le point de la
barrette 3 points qui est en face de RX et la pin RX

Le plus dur, c'est de souder le fil émaillé sur la LED D3.

Procédure de chargement du sketch:
1) Mettre un cavalier entre le point milieu et la résistance de 220 Ohm
qui va sur RX
2) Téléverser le sketch
3) Une fois le sketch téléversé, mettre le cavalier entre le point
milieu et la pin D12
4) Utiliser un *vrai* Terminal configuré à 19200 bauds (19200,N,8,1)
pour dialoguer avec le sketch

Le sketch utiliser la pin RX pour recevoir les protocoles RC série de
manière fiable. C'est cette même pin RX qui est aussi utilisée pour le
PWM et le CPPM.
