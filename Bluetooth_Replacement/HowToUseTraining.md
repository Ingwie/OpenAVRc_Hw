# How to use Training
In these explanations, I'm using a **TX16S MkII radio running EdgeTX** as an alternative radio.  

## First Use

1. With two OpenAVRc radios  
  - Power the radios.  
  - Enter the Bluetooth menu.  
  - Run a Bluetooth scan (on master side only). 
  - Select the student radio.  
  - Pairing is complete.  

2. With one OpenAVRc radio (master) and a compatible **SBUS** or **CPPM** input/output radio (student)  
  - Power the radios.  
  - Define Tx16s radio as student, select **Sbus or Cppm** into model's External Module options.  
  - Define OpenAVRc radio as master, run a scan and select student radio.  
  - Pairing is complete.  
  
3. With one OpenAVRc radio (student) and a compatible **SBUS** or **CPPM** input/output radio (master)  
  - Power the radios.  
  - Define OpenAVRc radio as student.  
  - Define Tx16s radio as master, run a scan by a click on the button, select **Master/Cppm or Master/Sbus** into trainer model's option.
  - Pairing is complete.  
  
4. It is also possible to configure each ESP32 with different commands (see **Use serial commands**).  
  - For a master:
```
m + RETURN
moutput + 0/1/2/3 + RETURN
```  
  - For a slave:
```
s + RETURN
sinput  + 0/1/2/3 + RETURN
```  
The generation of a PPM signal can be generated with positive or negative pulses.  
  
The scan is required once after firmware installation or after the change of student.  
Configure your master radio according to your training habits.  

## Normal Operation
  - Power ON both radios
  - Connection is automatic
  - The paired radio name is displayed
  - No manual action required
  
## Use serial commands
It's possible to configure the two esp32 by serial commands.  
```
  h              -> help
  m              -> force ROLE=MASTER (1)
  s              -> force ROLE=SLAVE  (0)
  moutput  <x>   -> set/save MASTER output: 0=PPM 1=SBUS 2=HC05 3=PPM2PPM (reboot)
  sinput   <x>   -> set/save SLAVE   input: 0=PPM 1=SBUS 2=HC05 3=PPM2PPM (reboot)
  ppmpulse <x>   -> set CPPM pulse mode (0=PPM POS, 1=PPM NEG)
  scan [ms]      -> MASTER: ESPNOW scan (like AT+INQ) and list responders
  scan link      -> MASTER: ESPNOW scan and link to SLAVE
  i              -> info
```
