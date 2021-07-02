# Xany2Misc

Le cordon adaptateur Xany2Misc utilise la carte Xany2Msx.
La seul différence est le firmware qui se nomme Xany2Misc.

Le cordon adaptateur Xany2Msx/Xany2Misc permet d’utiliser des modules Multi-Switches à 
commande par impulsions sur une ou deux voies « X-Any » de l’ensemble RC OpenAVRc. 

Les décodeurs commandés par impulsion du commerce actuellement supportés sont :
* **Conrad Module 7 fonctions**
* **Beier Module son USM-RC-2**
* **NVM Décodeur Multi-Switch**

Note: 
1. Côté émetteur, il n’y a pas besoin du codeur spécifique correspondant au modèle de
décodeur.
2. Le codeur unique et universel est intégré à l’émetteur OpenAVRc et utilise le protocole XAny.  
Il est possible de déclarer jusqu’à 4 instances d’ X-Any côté émetteur afin d’autoriser jusqu’à 64 commandes Tout-Ou-Rien.  
Se reporter à la documentation relative à OpenAVRc pour configurer X-Any côté émetteur.

Pour plus de détails, voir le [manuel](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany2Msx/Xany2Msx_Manuel_Utilisateur.pdf).



