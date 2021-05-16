# 360° Hall sensor for X-Any

Non-contact hall angle sensor works through the principle of electromagnetic induction.

The angle is converted to an electrical signal.  
When the rotation angle of the object passed to the axis of rotation sensors,  
P3022 (or P3015) angle sensor outputs an electrical signal (0 to 5V) that is proportional to the rotational angle (0 to 360°).  
This voltage is converted and transmitted to the **OpenAVRc** transmitter via the ***I2C*** port.

**P3022**  
![P3022](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Capteur_Hall_I2C/P3022-V1-CW360.jpg)

**P3015**  
![P3015](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Capteur_Hall_I2C/P3015-V1-CW360.jpg)  
P3015 is really smaller than P3022 and, i think, easier to implant into a transmitter.

These sensors simulate a sensor of the type [Allegro MicroSystems A1335](https://www.allegromicro.com/en/products/sense/linear-and-angular-position/angular-position-sensor-ics/a1335).

**Upload the HEX file:**  
You can found binary file [here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Capteur_Hall_I2C/HallAna2A1335_Attiny85/HallAna2A1335_Attiny85.zip).

**CALIBRATION AND CONFIGURATION OF THE I2C ADDRESS OF THE 360° SENSOR**  

The push button and the LED of this modified sensor make it very easy to:    
- Calibrate the sensor: in fact, the output voltage of the sensor is not exactly 0V for 0°, nor exactly 5V for 360°.  
- Define the I2C address: if several 360 sensors must be connected to the same I²C bus, each of these sensors must have its own address (otherwise, there is an address conflict).  

These 2 operations are only to be carried out once. It is of course possible to redo them as many times as you want, for example to change the I2C address. 

1. **360° Sensor calibration procedure**  
- Keep the push-button pressed and switch on the sensor
- As soon as the LED flashes once, release the push-button
- For 10 seconds, slowly rotate the axis (make several turns)
- That's it: the sensor is calibrated, the angles from 0° to 360° now correspond respectively to the numerical values 0 and 4095! 

2. **Procedure for configuring the I2C address of the 360° sensor**  

The basic 7-bit I2C address of the 360​​° sensor is 0x0C. The push button allows you to add an offset to this value.  
- Keep the push-button pressed and switch on the sensor  
- As soon as the LED has flashed twice, release the push-button: a 10-second window opens to define the offset using the push-button  
- Press the push-button N times and the I2C address becomes 0x0C + N (if the desired offset is 0, do not press)  
- As soon as the desired offset is reached, wait for the end of the 10 second window  
- That's it: the I2C address of the 360° sensor is configured!  

At the end of the 10 second window, a flash is emitted, then the LED lights up with the offset value of the I²C address.  
For example, if the desired offset was 2, so for a desired address of 0x0E (0x0C + 2 = 0x0E), the LED will light up twice after the flash.  
This will be true each time the sensor is powered up: it is thus very easy to check the current I2C address of the 360 ​° sensor.

**VISUALIZATION OF CURRENT ANGLE AND 0° OF THE 360° SENSOR**  
Once calibrated, the more the angle increases, the more the brightness of the LED increases.  
The LED is off for 0° and has the maximum brightness for 360°.  
It is therefore very easy to determine the mechanical 0°: it is at the transition from maximum brightness to the extinction of the LED! 

**Wires**  
See schematic [here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Capteur_Hall_I2C/Capteur_Hall_I2C.pdf).  
See documentation [here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Capteur_Hall_I2C/Hall_360_Sensor.pdf).  
This documentation about wiring is only for the P3022 sensor.
We have developped a [pcb](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Capteur_Hall_I2C/Sensor_Board_3D.jpg) for him only.  
  - [Gerber files](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Capteur_Hall_I2C/Gerber.zip)
  - [Kicad PCB files](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Capteur_Hall_I2C/Kicad_Hall_I2C_sensor.zip).  
  
For the P3015 sensor, you can connect it to the Attiny85 with 3 littles wires.

**Use these sensors for what?**  
X-Any can use these sensors for command by exemple: 
  - an azimutal motor.
  - a gun turret.
  - a camera.

**On the receiver side you need**  
  - a servo modified for accept a 360° rotation.
  - one other hall sensor for read servo angle.
  - an Arduino Pro Micro.

Philippe LOUSSOUARN, [Rc-Navy](http://p.loussouarn.free.fr/), as developped this project.  
For more informations see [here](http://p.loussouarn.free.fr/projet/sensors/angle/i2c_angle_sensor.html).

Good use.

Pierre


