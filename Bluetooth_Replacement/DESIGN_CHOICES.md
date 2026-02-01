# Choix d’architecture et compromis

Ce document explique les décisions techniques prises dans le projet.

---

## 1. Pourquoi ESPNOW ?

- Faible latence
- Pas de connexion préalable
- Parfait pour un lien maître/élève

---

## 2. Pourquoi conserver tf ?

- Compatibilité OpenAVRc
- Débogage simple (ASCII lisible)
- Migration progressive

---

## 3. Pourquoi ajouter des flux binaires ?

- Réduction de latence
- Robustesse accrue
- Adapté aux radios modernes

---

## 4. Pins partagées (GPIO 4 / 7)

- Réutilisation du connecteur BT existant
- Simplification du câblage
- Fonction dépendante du mode actif

---

## 5. Philosophie générale

- Ne jamais casser l’existant
- Ajouter sans remplacer
- Un mode = un chemin clair
