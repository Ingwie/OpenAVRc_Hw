# Schémas de timing – tf / SBUS / PPM

Ce document décrit les **relations temporelles** entre les différents formats
utilisés dans le projet.

---

## 1. Trame tf (ASCII)

```
|<-------------------- variable -------------------->|
tf sXXX sXXX sXXX sXXX sXXX sXXX sXXX sXXX:CC\r
^                                                    ^
|                                                    |
début                                                fin
```

- Dépend du débit série (ex: 115200 bauds)
- Temps de transmission non déterministe
- Parsing ASCII côté réception

---

## 2. SBUS

```
|<-- 3 ms -->|
[ 25 octets ][ 25 octets ][ 25 octets ] ...
```

- Fréquence fixe ≈ 333 Hz
- Latence stable
- Encodage binaire compact

---

## 3. PPM

```
|<------------- 18 à 22 ms ------------->|  (frame)
| ch1 | ch2 | ch3 | ch4 | ch5 | ch6 | ch7 | ch8 | sync |
```

- Lecture basée sur interruptions
- Latence très faible
- Sensible au jitter

---

## Conclusion

| Format | Latence | Déterminisme |
|-------|---------|--------------|
| tf    | élevée  | faible       |
| SBUS  | faible  | élevé        |
| PPM   | très faible | moyen   |
