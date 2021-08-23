# Xany2Msx

Le cordon adaptateur **Xany2Msx** permet de connecter, en simultané, sur une seule voie du
récepteur, jusqu’à 2 décodeurs **Multi-Switch** du commerce sur une voie « X-Any » de l’ensemble
RC OpenAVRc.
Les décodeurs Multi-Switches/Prop du commerce actuellement supportés sont :
* **Robbe Multi Switch Decoder** No 8369 ***(MS16)***
* **Robbe Multi Decoder Switch + Prop** No 8370 ***(MS12 + 2 PROP)***
* **Robbe-Futaba Multi Switch Decoder** No F1513 ***(MS8)***
* **MULTIPLEX MULTInaut top** ***(MS12 + 2 MoTeurs)***
* **GRAUPNER NAUTIC Expert** ***(MS16)***


Note :
1. Côté émetteur, il n’y a pas besoin du codeur spécifique correspondant au modèle de
décodeur.
2. Le codeur unique et universel est intégré à l’émetteur **OpenAVRc** et utilise le protocole **XAny**.  
Il est possible de déclarer jusqu’à **4 instances d’X-Any** côté émetteur afin d’autoriser
jusqu’à **64 commandes Tout-Ou-Rien**.

   Soient côté réception:
   * **4 x décodeurs Multi-Switches 16 sorties**
   * ou **8 x décodeurs Multi-Switches 8 sorties**
   * ou un mélange des 2 combinaisons

3. Pour les modules décodeurs de type Multi-Prop, les sorties proportionnelles sont gérées en
Tout-Ou-Rien. Le cordon adaptateur **Xany2Msx** utilise l’état des contacts 13, 14, 15 et 16 :
* Contacts 13 et 14 pour les 2 voies proportionnelles du Multi Decoder Switch + Prop :  
chaque sortie proportionnelle pouvant prendre 2 valeurs fixes (mais paramétrables)
* Contacts 13, 14, 15 et 16 pour les 2 commandes de moteurs du MULTInaut top :  
chaque commande de moteur prendre 3 valeurs fixes (mais paramétrables) : Marche
Avant/Stop/Marche arrière

Pour plus de détails, voir le [manuel](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany2Msx/Xany2Msx_Manuel_Utilisateur.pdf).



