# MS8-Xany V3 decoder

MS8-Xany V3 is a new Ms8 version with more features.  
It not only allows you to drive 8 digital outputs, but also allows you to drive up to 8 digital servos including the 2 extreme positions and the speed between these 2 positions are programmable!  
It also provides a booster proportional channel to drive a servo or an ESC. 

## Ms8 V3 schematic
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MultiSwitch_Sw8_V3.1_sch.png)


## Ms8 V3 PCB
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MultiSwitch_Sw8_V3_Top.jpg)  
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MultiSwitch_Sw8_V3_Bot.jpg)  

## Upload Firmware
- Connect your MS8 V3 to your PC with a USB cable  and lauch the cmd file for upload the firmware.  
- Load [Xloader](https://github.com/binaryupdates/xLoader) uploader hex file.  
- Upload the firmware file found below:  
  - [Windows](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MultiSwitch_Sw8_V3/PROG/Windows).  
  - [Linux]().  
- Define Xloader as below:  
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/PROG/Windows/xloader.jpg).  

## Videos
This first video show:

The **MS8-Xany** configuration in case the user wants to access to the **advanced functionalities**, 
such as **driving servos** between 2 limit positions at a preprogrammed motion speed. 

Nice for opening slowly a door or to rotate slowly cannon turrets, just by using a simple Off/On switch of the OpenAVRc transmitter (or by using a simple Logical Switch).

[![Configuration of the MS8-Xany decoder (Part 1)](https://img.youtube.com/vi/y_skDGLVK1A/0.jpg)](https://www.youtube.com/watch?v=y_skDGLVK1A "Ms8-Xany Part 1") 

This second video describes:
- how to control the **MS8-Xany** decoder from the **OpenAVRc** transmitter without adding any hardware, just by using **logical switches**
- how to control the **MS8-Xany** decoder with **physical switches**, by adding an I2C extender on the **OpenAVRc** transmitter
- the multiple **proportional sources** for the **optional proportional channel**
- the **Failsafe** behaviour

[![Configuration of the MS8-Xany decoder (Part 1)](https://img.youtube.com/vi/EJCJJWh63EM/0.jpg)](https://www.youtube.com/watch?v=EJCJJWh63EM "Ms8-Xany Part 2") 

By default, all the outputs are configured in Digital mode (as with regular Multiswitch decoders).
It is necessary to use a TTL USB/Serial converter (FTDI type) to access to the advanced mode for driving servos: it's described in the video.

Ms8 documentation files:
* [MS8-Xany folder in Git repository](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/MultiSwitch_Sw8_V3).
* PCB: [here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MultiSwitch_Sw8_V3_PCB.zip)
* User Manual:  
  - [French](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MS8-Xany-V3_Manuel_Utilisateur.pdf)  
  
## Commands
Type H for see all available commands:  
```
H?              -> Returns this help
<--'            -> If Enter is sent, MS8 Vx.y stays in Terminal Mode and
                   failsafe is disabled (nice, for config and test)
                   Additionally, this command triggers the display of the
                   Welcome Message "MS8 Vx.y" in the Terminal
C?              -> Display the full Configuration with status
                   (all the commands listed below)
T=CRLF/CR       -> Set the Line Terminator to CRLF or to CR
T?              -> Return the configured Line Terminator
I=Interface[Ch] -> Set the RC Interface (P for PWM, C for CPPM, S for SBUS,
                   Ch is channel (not needed for PWM))
I?              -> Return the configured Interface
P=MsProto[;N/F] -> Set the Multi-Switch Protocol (MsProto: R for RCUL with N for
                   Non filtered, F for filtered, F for MS8 Futaba, B for Binary
                   (for OTX and ETX), P for Push-Button, and E for EKMFA)
P?              -> Return the configured Multi-Switch Protocol
S0=XXXX         -> If 988 <= XXXX <= 2008, set Prop Servo to the XXXX position in us
                   If 0 <= XXX <=255, set Prop Value Command
SR=N/Y          -> Apply reverse (Y) or no reverse (N) for Prop Servo (S0)
Sx=D;M          -> Sx is a Digital output in mode M (M=Normal or Pulsed)
                   (x is the id of the ouput from 1 to 8, x = 0 is reserved for
                   the prop Servo)
Sx=S;M;PosA;PosB;A2BDur[;B2ADur] -> Sx is a Servo output in mode M (M=Normal or
                   Pulsed). PosA us when Cmd=0, PosB us when Cmd=1, Duration
                   between Pos A & B are A2BDur & B2ADur (64000 ms Max)
Sx=0/1          -> Simulate a Cmd=0/1 command for Sx (Nice for test without RC)
Sx?             -> Return Sx=D;M:C if output x is Digital, or
                   Sx=S;M;PosA;PosB;A2BDur;B2ADur:C if output x is a Servo, or
                   S0=XXX:CCC for Prop Servo (C is the current Command status)
S8=A;N/I        -> Additionaly to Digital and Servo Type, S8 can be configured
                   as pwm Analog output with Normal(N) or Inverted (I) polarity
S8=xxx[%]       -> When S8 configured as Analog, S8=xxx sets the Cmd Prop Value
                   (0-255) or S8=xxx% sets the percentage of pwm (0%-100%)
S8?             -> When S8 configured as Analog, the answer to the S8? command
                   is S8=A;N/I:PwmPerCent%:PropValue (eg: S8=A;I:100%:000)
B=C             -> Start the Button Calibration process
B?              -> Return the pulse width (in us) associated to each of the
                   8 Buttons: B=xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx
D=DebugLevel    -> Set the Debug Level
D?              -> Return the Debug Level
Q               -> Quit the Terminal Mode and switch to RC Mode.
                   To switch back to Terminal Mode, simply hit Enter
```

RC Navy 