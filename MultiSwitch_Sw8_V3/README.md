# MS8-Xany V3 decoder

MS8-Xany V3 is a new Ms8 version with more features.  
It not only allows you to drive 8 digital outputs, but also allows you to drive up to 8 digital servos including the 2 extreme positions and the speed between these 2 positions are programmable!  
It also provides a booster proportional channel to drive a servo or an ESC. 

## Ms8 V3 schematic
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MultiSwitch_Sw8_V3.1_sch.png)


## Ms8 V3 PCB
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MultiSwitch_Sw8_V3_Top.png)  
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/MultiSwitch_Sw8_V3_Bot.png)  

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
C=F             -> Set the Factory default parameters (I=P P=E SR=N Sx=D;N)
T=CRLF/CR       -> Set the Line Terminator to CRLF or to CR
T?              -> Return the configured Line Terminator
I=Interf[Ch[;-/+]] -> Set the RC Interface (D for Digital, P for PWM,
                   C for CPPM, S for SBUS,X for SRXL, U for SUMD, I for IBUS,
                   F for CRSF), Ch is thechannel NÂ°, optional - or + tunes the
                   soft serial data rate
I?              -> Return the configured Interface
P=MsProto[;Fl][;l] -> Set the Multi-Switch Protocol (MsProto: S for Sequencial
                   with l=L for Low level and l=H for High level, R for RCUL with
                   l=Filter level (from 0 to 3), F for MS8 Futaba, B for Binary
                   (for OTX and ETX), E for EKMFA, P for Push-Button
P?              -> Return the configured Multi-Switch Protocol
S0=XXXX         -> If 988 <= XXXX <= 2008, set Prop Servo to the XXXX position
                   in us. If 0 <= XXX <= 255, set Prop Value Command
SR=N/Y          -> Apply reverse (Y) or no reverse (N) for Prop Output (S0)
F=FailsafeProp  -> Set the Prop value in case of Failsafe (RC Signal lost)
F?              -> Return the configured Prop value in case of Failsafe
M=MsgMapping    -> Set the Mapping in the RCUL Message (needed with P=R;Fl)
                   For a single MS8 V3, M=PS is recommended. With OpenAVRc
                   it is possible to use 2 x MS8 V3 on the same channel.
                   An X-Any instance shall be configured with Prop.x + Sw.16,
                   M=PIS for the 1st MS8 V3 and M=ISI for the 2nd MS8 V3
M?              -> Return the configured RCUL Message Mapping
Sx=D;M          -> Sx is a Digital output in mode M (M=Normal or Pulsed)
                   (x is the id of the ouput from 1 to 8, x = 0 is reserved for
                   the prop Servo)
Sx=S;M;PosA;PosB;A2BDur[;B2ADur] -> Sx is a Servo output in mode M (M=Normal or
                   Pulsed). PosA us when Cmd=0, PosB us when Cmd=1, Duration
                   between Pos A & B are A2BDur & B2ADur (64000 ms Max)
Sx=B;M;OnDur[;OffDur] -> Sx is a Blink output in mode M (M=Normal or P=Pulsed)
                   OnDur and OffDur are On & Off duration in ms (64000 ms Max)
Sx=0/1          -> Simulate a Cmd=0/1 command for Sx (Nice for test without RC)
Sx?             -> Return Sx=D;M:C if output x is Digital, or
                   Sx=S;M;PosA;PosB;A2BDur;B2ADur:C if output x is a Servo, or
                   S0=XXX:CCC for Prop Servo (C is the current Command status)
                   or Sx=B;M;OnDur;OffDur:C if output x is Blink type
S8=A;N/I        -> Additionaly to Digital and Servo Type, S8 can be configured
                   as pwm Analog output with Normal(N) or Inverted (I) polarity
S8=xxx[%]       -> When S8 configured as Analog, S8=xxx sets the Cmd Prop Value
                   (0-255) or S8=xxx% sets the percentage of pwm (0%-100%)
S8?             -> When S8 configured as Analog, the answer to the S8? command
                   is S8=A;N/I:PwmPerCent%:PropValue (eg: S8=A;I:100%:000)
B=C             -> Start the Button Calibration process
B?              -> Return the pulse width (in us) associated to each of the
                   8 Buttons: B=xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx
EN=xx           -> Set the number of stEps if Protocol is Sequence (xx: 1 to 16)
EN?             -> Return the configured number of stEps of the Sequence
Exx=Sx+Sy+Sz/OFF-> Set outputs to enable for the stEp number xx (xx: 1 to 16)
                   OFF means that all the output are disabled for the stEp Exx
Exx?            -> Return the configured stEp number xx
EC=+/-/R        -> Set the Current stEp: + to go to next stEp, - to go to the
                   previous stEp, R to Reset the sequence (all the outputs are
                   disabled)
EC?             -> Return the Current of stEp number: xx or R for Reset state
D=DebugLevel    -> Set the Debug Level: 1 -> Pulse Width, 2 -> Cmd Change
D?              -> Return the Debug Level
Q               -> Quit the Terminal Mode and switch to RC Mode.
                   To switch back to Terminal Mode, simply hit Enter
```

RC Navy 