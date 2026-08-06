# BurcAnaTx coder
This module allows to transmit an **RCUL / X-Any** stream via a radio control analog input by replacing the channel's potentiometer with an I²C digital potentiometer.

## Schematic
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/PCB/BurcAnaTx_sch.png)  

## Wiring
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/f14.png)  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/f14_coder.png)  
Here is the interior of an old radio transmitter.  
You can see the wiring for the two proportional sticks.  
This radio also features proportional inputs for additional potentiometers or switches.  
We will use one of these extra inputs to connect our RcilI2CPotTx encoder.  

Each channel of the BurcAnaTx module acts as an interface between four sets of 8 to 16 switches and the radio's proportional inputs.  
The two AD5282 chips are dual digital potentiometers.  
By simulating movements of varying speeds, the AD5282 generate a digital signal that reflects the positions of the various switches.  

It is also possible to use a new potentiometer in parallel with the 8 to 16 switches.  
A final option is to use a 0–360° angular sensor and a potentiometer to control up to 4 azimuth motors.  