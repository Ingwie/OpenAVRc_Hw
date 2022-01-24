# The MS8-Xany card used as an Impulse Sequencer
By loading the PulseSeq firmware into the MS8-Xany card, it behaves as a Pulse Sequencer.  

The PulseSeq pulse sequencer can be configured to operate in 2 modes:  
  * Controlled by a channel of an RC receiver. The command is then made by pressing the sleeves on the transmitter side.  
  * Controlled by a digital signal, for example by an output of a Multiswitch decoder. The command is then a push button on the transmitter side.  

Whether the PulseSeq sequencer is controlled by a transmitter stick or by a push button via a Multiswitch type MS8-Xany:  
  * a very short pulse (< 600 ms) advances one step,  
  * a short pulse (>= 600 ms and < 2000 ms) moves one step back,  
  * a long pulse (>= 2000 ms) switches to step 0 (all outputs deactivated).  

## PulseSeq pulse sequencer controlled by any RC transmitter
<div style="margin-left: 40px;">
  <table style="text-align: left; width: 282px; height: 193px;" cellspacing="2" cellpadding="2" border="1">
	<tbody>
	  <tr>
		<td style="vertical-align: top; height: 175px;"><img src="http://p.loussouarn.free.fr/projet/radio/photos/PulseSeqRegular.png" style="width: 547px; height: 198px;" alt="PulseSeq pulse sequencer controlled by any RC transmitter" title="PulseSeq pulse sequencer controlled by any RC transmitter"></td>
	  </tr>
	  <tr>
		<td style="vertical-align: top; height: 12px; text-align: center;">Le
		  séquenceur impulsionnel<b> PulseSeq</b> commandé par le manche
		  d'un émetteur RC<br>
		  <span style="font-weight: bold; font-style: italic;"></span></td>
	  </tr>
	</tbody>
  </table>
</div>  


Example of PulseSeq configuration to sequence the switching on of a trawler's lights: (command by a PWM burst type RC signal)  
<div style="color: black; background-color: pink; font-weight: normal; font-size: 14px; line-height: 19px; white-space: pre;"><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">CMD.MODE</span><span style="color: #000000;">=PWM.BURST</span></span></div><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">S1.DESC</span><span style="color: #000000;">=Radar</span></span></div><div style="width: 1303px;"><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">S2.DESC</span><span style="color: #000000;">=Feux Pos Vert/Rouge</span></span></div><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">S3.DESC</span><span style="color: #000000;">=Feux Route Proue/Poupe</span></span></div><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">S4.DESC</span><span style="color: #000000;">=Feux Peche Vert/Blanc</span></span></div><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">S5.DESC</span><span style="color: #000000;">=Feux Imp.Man Rouge/Rouge</span></span></div><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">S6.DESC</span><span style="color: #000000;">=Projecteurs</span></span></div><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">STAGE.NB</span><span style="color: #000000;">=06</span></span></div><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">STAGE01</span><span style="color: #000000;">=S1</span></span></div><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">STAGE02</span><span style="color: #000000;">=S1+S2+S3</span></span></div><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">STAGE03</span><span style="color: #000000;">=S1+S2+S4+S5+S6</span></span></div><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">STAGE04</span><span style="color: #000000;">=S1+S2+S4</span></span></div><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">STAGE05</span><span style="color: #000000;">=S1+S2+S4+S5+S6</span></span></div><div><span style="font-family: Courier New,Courier,monospace;"><span style="color: #0000ff;">STAGE06</span><span style="color: #000000;">=S1+S2+S3</span></span></div></div>  

## PulseSeq pulse sequencer controlled by an output of the MS8-Xany Multiswitch decoder
<div style="margin-left: 40px;">
  <table style="text-align: left; width: 282px; height: 193px;" cellspacing="2" cellpadding="2" border="1">
	<tbody>
	  <tr>
		<td style="vertical-align: top; height: 175px;"><img src="http://p.loussouarn.free.fr/projet/radio/photos/PulseSeqMultiswitch.png" style="width: 550px; height: 253px;" alt="Impulse Sequencer with Multiswitch" title="Impulse Sequencer with Multiswitch"></td>
	  </tr>
	  <tr>
		<td style="vertical-align: top; height: 12px; text-align: center;">Le
		  séquenceur impulsionnel<b> PulseSeq </b>commandé par une sortie
		  Multiswitch <i><b>MS8-Xany</b></i>.<span style="font-weight: bold; font-style: italic;"></span></td>
	  </tr>
	</tbody>
  </table>
</div>  

Example of PulseSeq configuration to sequence the switching on of a trawler's lights: (control by a pulsed digital signal)  
<div style="color: #000000;background-color: pink;font-family: 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback';font-weight: normal;font-size: 14px;line-height: 19px;white-space: pre;"><div><span style="color: #0000ff;">CMD.MODE</span><span style="color: #000000;">=DIGITAL.PULSE</span></div><div><span style="color: #0000ff;">S1.DESC</span><span style="color: #000000;">=Radar</span></div><div><span style="color: #0000ff;">S2.DESC</span><span style="color: #000000;">=Feux Pos Vert/Rouge</span></div><div><span style="color: #0000ff;">S3.DESC</span><span style="color: #000000;">=Feux Route Proue/Poupe</span></div><div><span style="color: #0000ff;">S4.DESC</span><span style="color: #000000;">=Feux Peche Vert/Blanc</span></div><div><span style="color: #0000ff;">S5.DESC</span><span style="color: #000000;">=Feux Imp.Man Rouge/Rouge</span></div><div><span style="color: #0000ff;">S6.DESC</span><span style="color: #000000;">=Projecteurs</span></div><div><span style="color: #0000ff;">STAGE.NB</span><span style="color: #000000;">=06</span></div><div><span style="color: #0000ff;">STAGE01</span><span style="color: #000000;">=S1</span></div><div><span style="color: #0000ff;">STAGE02</span><span style="color: #000000;">=S1+S2+S3</span></div><div><span style="color: #0000ff;">STAGE03</span><span style="color: #000000;">=S1+S2+S4+S5+S6</span></div><div><span style="color: #0000ff;">STAGE04</span><span style="color: #000000;">=S1+S2+S4</span></div><div><span style="color: #0000ff;">STAGE05</span><span style="color: #000000;">=S1+S2+S4+S5+S6</span></div><div><span style="color: #0000ff;">STAGE06</span><span style="color: #000000;">=S1+S2+S3</span></div></div>


## Ms8 schematic
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8/D%C3%A9codeur%20MS8_X-Any.jpg)

## Ms8 PCB:
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8/D%C3%A9codeur%20MS8_X-Any_3D.jpg)

## Upload Firmware with UsbAsp dongle
  - Wiring:  
  ![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8/Attiny84.jpg)
  - Upload firmware:  
  ![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8/Avrdudess_Attiny84.jpg)
  - [AVRDUDESS](https://blog.zakkemble.net/avrdudess-a-gui-for-avrdude/):
  
#Sequencer files
* [PulseSeq folder in Git repository](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/PulseSeq).
* PCB: [here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8/MultiSwitch_Sw8-KICAD.zip)
* User Manual:  
  - [French](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/PulseSeq/PulseSeq_Manuel_Utilisateur.pdf)
* HEX file to be loaded in the ATtiny84 microcontroller:  
  - [Hex File](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/PulseSeq/PulseSeq_V0_1._HEX)  

RC Navy 