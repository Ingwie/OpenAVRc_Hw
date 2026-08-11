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

## Schematic
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/PCB/BurcAnaTx_sch.png)  

## Wiring
<table cellspacing=0>
  <tr>
    <td align=center width=200><a href="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/Futaba_F14.md"><img src="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/F14_Top.jpg" border="0" name="submit" title="Futaba F14 Navy" alt="Futaba F14 Navy"/></a><br><b>Futaba F14 Navy</b></td>
	<td align=center width=200><a href="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A.md"><img src="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A_Top.png" border="0" name="submit" title="PTR-6A_1" alt="PTR-6A_1"/></a><br><b>PTR-6A_1</b></td>
	<td align=center width=200><a href="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/x.md"><img src="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/x.jpg" border="0" name="submit" title="Beier USM_RC_2" alt="Beier USM_RC_2"/></a><br><b>Beier USM_RC_2</b></td>
	<td align=center width=200><a href="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/y.md"><img src="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/y.jpg" border="0" name="submit" title="Graupner 2-16K Nautic Expert" alt="Graupner 2-16K Nautic Expert"/></a><br><b>2-16K Nautic Expert (Project in progress)</b></td>
  </tr>
</table>
Here is the interior of a Futaba F14 radio transmitter.  
You can see the wiring for the two proportional sticks and the coder board.  
This radio controller also features proportional inputs for additional potentiometers or switches.  
We will use one of the 7 inputs on the encoder board. It is best to use channels 5 through 7 to keep the stick channels functional.  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/f14.png)  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/f14_coder.jpg)  

Another RC transmitter we will use for testing is the Protronik PTR-6A.  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A_1.jpg)  

You can see the wiring for the two proportional sticks and more precisely, the wiring of channels 5 and 6.  
On this PTR-6A, channels 5 and 6 cannot be used because they are not fully proportional; the radio only recognizes the positions 1000, 1500, and 2000 milliseconds.  
The only solution is to repurpose one of the four channels corresponding to the sticks. I am going to use channel 3, which corresponds to the right-hand vertical axis.  
However, any of the other three channels could also be used, as they are fully proportional.  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A_2.jpg)  ![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A_3.jpg)  

The module's four outputs support radios with potentiometers powered by voltages ranging from +5V up to a maximum of 15V.  
Each output is polarized; the positive (+) pin must be connected to the input's positive terminal, and the negative (-) pin to the input's negative terminal.  

## Calibration
Every RC transmitter is different.  
The RculAnaTx module must be synchronized as precisely as possible with the radio system.  
The module features a calibration mode that allows for optimizing the quality of messages received by the receiver.  
The process involves sending several messages to the receiver and reading back the message returned by the receiver.  
It is still possible to improve the quality of received messages by repeating the message several times.  
However, this causes the message to take longer to reach the receiver.  

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