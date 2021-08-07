# PAM8302 Amplifier

![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/PCB%20PAM8302A/pam8302.jpg)

This small but efficient mono amplifier is able to deliver up to **2.5W 4-8 Ω** impedance speakers.  
It features the PAM8302A **Class-D mono** audio amplifier and has a built-in thermal and over-current protection to keep everything safe.*

## Features

 * Output Power: 2.5 W at 4Ω, 10% THD (total harmonic distortion), 1.5 W at 8 Ω, 10% THD, with 5.5 V Supply
 * 50 dB PSRR (power supply rejection ratio) at 1 KHz
 * Filterless design, with ferrite bead + capacitors on output.
 * Fixed 24 dB gain, an onboard trim potentiometer for adjusting input volume.
 * Thermal and short-circuit/over-current protection
 * Low current draw: 4 mA quiescent and 0.5 mA in shutdown (due to pull-up resistor on SD pin)
 
## Wiring

 * Connect **J1** to **P8 on shield**.
   * **J1-1** receive **buzzer** signal from shield.
   * **J1-2** receive **JQ6500** signal from shield.
