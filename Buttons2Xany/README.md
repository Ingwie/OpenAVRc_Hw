# Buttons2Xany

## There are two firmware versions for the *Xany2Msx* interface

  This module converts push-button commands to Xany message for controling [Sound&Smoke](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Sound%26SmokeModule) module from a "keyboard" of 10 push-buttons.
  - The first 8 buttons command 8 sound tracks
  - The 9th and 10th buttons control the volume (V-/V+)
  - The generated Xany message is: [Prop][Sw][Chks]

## Upload Firmware with UsbAsp dongle
  - Wiring:  
  ![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany2Msx/Attiny85.jpg)
  - Upload firmware:  
  ![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Xany2Msx/Avrdudess_Attiny85.jpg)
  - [AVRDUDESS](https://blog.zakkemble.net/avrdudess-a-gui-for-avrdude/):

### Configure your Handset
Add a 10 buttons Keyboard into the handset.

Don't forget to wire a mini programming push button between the "Signal" and "-" pins of J2.

The pulse width association calibration procedure is as follows: (Xany2Misc must obviously be connected to the receiver channel)
1. Hold down the push button connected to J2
2. Power on Xany2Misc
3. As soon as the LED flashes ONE, release the push button connected to J2: we have just entered the push button calibration mode and the 1st push button is internally selected.  
4. On the transmitter keypad, keep the 1st pushbutton pressed, then press the Prog pushbutton connected to J2: the LED reflashes ONE time and the next pushbutton is automatically selected internally.  
5. Repeat the operation for the next 9 push buttons. Once the 10th push button is calibrated, a series of FOUR flashes is emitted to signal the end of the calibration.  

To be able to configure the control mode of each push button: Normal mode or impulse mode.
The calibration procedure is as follows:
1. Hold down the push button connected to J2
2. Power on Xany2Misc
3. As soon as the LED flashes TWO times, release the push button connected to J2: you have just entered the mode setting mode for each push button  
4. At this time, the 1st push button is selected internally, to choose the mode of this push button, press VOL- to switch the button to Normal mode or press VOL+ to switch to pulse mode: TWO flashes are issued. The next push button is automatically selected internally.  
5. Repeat the operation for the next 7 push buttons. Once the mode of the 8th push button is set, a series of FOUR flashes is emitted to signal the end of the calibration.  
Pushbuttons 9 and 10 (VOL- and VOL+) are always in Normal mode, they cannot be switched to impulse mode.  







