# BurcAnaTx coder
In an RC transmitter, the BurcAnaTx module can connect to up to 4 proportional channels.  
The proportional channels can be spare ones, or can reuse accessories potentiometers channels or unused stick potentiometers.  

BurcAnaTx injects in each connected proportional channel a digital data stream (RCUL / X-Any protocol) which allows adding to the transmitter the following RC extensions:  
- 8 native contacts, or 8/16 contact I/O I2C extenders  
- An Analog poportional value (the accessorie potentiometer can be reused!)  
- A 360° angular I2C Sensor  

When using 4 proportional channels, the BurcAnaTx can transmit simultanously and independantly up to:  
- 4 x 16 Contacts states (64 contacts)  
- 4 x analog values  
- 4 x 360° angular values  

At receiver side, on each used channel, a decoder shall be connected to retrieve the sent informations:  
- For 8   Contacts + 1 x Analog value: MS8-Any Mulitswitch decoder  
- For 16 Contacts + 1 x Analog value: MS16-Any Mulitswitch decoder  
- For 360° Angle value: Decoder still under development  

![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/Switch.png)  

## Which transmitter should I use
I have selected several potential candidates for this project.  
The key is to choose a transmitter that allows for the addition of at least eight switches. Here are several suitable transmitters.  
In the case of the Protronik PTR-6A, it is impossible to integrate the switches into the transmitter's front panel.  
The solution is to add a housing containing the switches and attach and connect it to the transmitter.  

<table cellspacing=0>
  <tr>
    <td align=center width=200><a href="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/F14/Futaba_F14.md"><img src="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/F14/F14_Top.jpg" border="0" name="submit" title="Futaba F14 Navy" alt="Futaba F14 Navy"/></a><br><b>Futaba F14 Navy</b></td>
	<td align=center width=200><a href="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/6014/6014.md"><img src="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/6014/6014_Top.png" border="0" name="submit" title="Varioprop 6014" alt="Varioprop 6014"/></a><br><b>Varioprop 6014</b></td>
	<td align=center width=200><a href="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/MULTIPLEX/Multiplex.md"><img src="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/MULTIPLEX/Multiplex_Top.jpg" border="0" name="submit" title="Multiplex" alt="Multiplex"/></a><br><b>Multiplex</b></td>
	<td align=center width=200><a href="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A/PTR-6A.md"><img src="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A/PTR-6A_Top.png" border="0" name="submit" title="PTR-6A_1" alt="PTR-6A"/></a><br><b>PTR-6A</b></td>
  </tr>
</table>

## Schematic
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/PCB/BurcAnaTx_sch.png)  

## Wiring
The module's four outputs support radios with potentiometers powered by voltages ranging from +5V up to a maximum of 15V.  
Each output is polarized; the positive (+) pin must be connected to the input's positive terminal, and the negative (-) pin to the input's negative terminal.  

## Calibration
Every RC transmitter is different.  
The RculAnaTx module must be synchronized as precisely as possible with the radio system.  
The module features a calibration mode that allows for optimizing the quality of messages received by the receiver.  
The process involves sending several messages to the receiver and reading back the message returned by the receiver.  
It is still possible to improve the quality of received messages by repeating the message several times.  
However, this causes the message to take longer to reach the receiver.  

## Synchronization
To improve the receiver's reception quality for the RCUL message, the encoder repeats the same message multiple times, which increases the time required to receive it.  
To mitigate this delay, the module can be synchronized with either a standard CPPM signal (positive or negative) or another type of signal (depending on the radio used); this is known as **CallBack mode**.  

### CPPM Synchronization
**The CPPM signal from some older radios can exceed 5V, the maximum level supported by an Arduino**.  
**For ESP32s, the maximum level is even lower, at 3.3V. It is important to use a voltage divider made up of two resistors**.  
You can use the Digi-Key page to calculate this [resistor divider](https://www.digikey.fr/en/resources/conversion-calculators/conversion-calculator-voltage-divider?_gl=1*nquchn*_up*MQ..&gclid=Cj0KCQjw6_HSBhCpARIsANvVltZ6PM05v1tbt--6IqpEt2y5AXY3PxShBSuO0Jg-KN0VGJ7S6ODAo6AaAkwBEALw_wcB&gclsrc=aw.ds).  
```
EXAMPLE OF POSITIVE AND NEGATIVE CPPM FRAME TRANSPORTING 2 RC CHANNELS
======================================================================

 Positive CPPM
       .-----.                 .-----.         .-----.                                  .-----.                 .-----.         .-----. 
       |     |                 |     |         |     |                                  |     |                 |     |         |     |
       |     |                 |     |         |     |                                  |     |                 |     |         |     |
       |     |                 |     |         |     |                                  |     |                 |     |         |     |
    ---'     '-----------------'     '---------'     '----------------//----------------'     '-----------------'     '---------'     '----
       <-----------------------><--------------><---------------------//---------------><-----------------------><-------------->
               Channel#1           Channel#2                       Synchro                       Channel#1           Channel#2
             <-----------------------><--------------><---------------------//---------------><-----------------------><-------------->
                     Channel#1           Channel#2                       Synchro                       Channel#1           Channel#2
                        
 Negative CPPM
    ---.     .-----------------.     .---------.     .----------------//----------------.     .-----------------.     .---------'     .----       
       |     |                 |     |         |     |                                  |     |                 |     |         |     |
       |     |                 |     |         |     |                                  |     |                 |     |         |     |
       |     |                 |     |         |     |                                  |     |                 |     |         |     |
       '-----'                 '-----'         '-----'                                  '-----'                 '-----'         '-----' 
       <-----------------------><--------------><---------------------//---------------><-----------------------><-------------->
               Channel#1           Channel#2                       Synchro                       Channel#1           Channel#2
             <-----------------------><--------------><---------------------//---------------><-----------------------><-------------->
                     Channel#1           Channel#2                       Synchro                       Channel#1           Channel#2
```
### CallBack Synchronization
The "CallBack" synchronization mode allows for synchronization with an arbitrary signal.  
For the Protronik PTR-6A transmitter, I identified a signal at a test point labeled GDO0.  
This signal controls the transmitter's CC2500 RF module (using the FlyDream V3 format) and is specific to this transmitter.  
Analysis made it possible to synchronize with this signal in order to transmit RCUL messages at the optimal moment.  
As each transmitter is different, this mode requires creating a specific CallBack mode.
Currently, only the (PTR-6A)[doc/PTR-6A/PTR-6A.md] offers this option.  

## Compatibles modules usable with BURC
All these modules behind
- [Ms8 v3](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MultiSwitch_Sw8_V3)  
- [Ms16](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MultiSwitch_Sw16-ProMicro)  
- [Sound&SmokeModule](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Sound%26SmokeModule)  
- [Xany2Msx](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Xany2Msx/Firmware_Msx)  
- [Xany2Misc](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Xany2Msx/Firmware_Misc)  
- Hall sensor:  
  * [Hall I2C sensor](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Capteur_Hall_I2C)  
  * [Hall I2C sensor mini](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Capteur_Hall_I2C_Mini)  
- [MultiSwitch_MosFet](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MultiSwitch_MosFet)  
- [Ms8 Pulseq](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/PulseSeq) 
- [Servo 360°]() 