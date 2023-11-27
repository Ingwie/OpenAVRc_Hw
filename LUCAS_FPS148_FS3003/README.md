# LUCAS: Looped Universal Controlled Angle Servo

## Why a new board
This new board replace the original board of a Futaba servo FP-S148 or S3003.  
This printed circuit allows you to control the servo over an I2C bus or with your receiver by an output PWM, PPM, SBUS and more.  
This board is managed by an ATMEGA328PB and an AS5600 hall sensor. The hall sensor replaces the original potentiometer.  
With this board, it's possible to command a cannon turret or a [schottle motor](https://www.sud-rc.fr/gouvernail-acces-de-barre/721-propulsion-schottel-ii-graupner-2335.html) with a 360 degrees rotation.
The board include an ICSP port for upload the bootloader and a FTDI serial port to configure the servo.  
 
## The FP-S148 board
<table border="2">
<tr>
<td><img src="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/LUCAS_FPS148_FS3003/LUCAS_FPS148_FS3003_Top.jpg" border="0"/></td>
<td><img src="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/LUCAS_FPS148_FS3003/LUCAS_FPS148_FS3003_Bottom.jpg" border="0"/></td>
<tr>
<td>     Top View</td><td>     Bottom view</td><td>
</tr>
</table>

### Schematic
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/LUCAS_FPS148_FS3003/LUCAS_FPS148_FS3003.jpg)  

## The MG946R board
Once all the tests have been carried out with the FP-S148, we will manufacture a board for an MG946R type servo.  
It's features are:  
10.5 Kg/cm (4.8 V) - 13 kg/cm (6 V)

## Example of use
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/LUCAS_FPS148_FS3003/Graupner1769.11_Schottle_Motor.jpg)  

