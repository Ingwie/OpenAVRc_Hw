# Sound and Smoke module

This Sound and Smoke Module has the following features:

    General:
        Powered by 2S to 7S LiPo (from 7.2V to 30V)
        Based on an Arduino Pro Micro (5V/16MHz model)
        1st RC input connected in parallel on the RC channel of the receiver which drives the variable speed drive (ESC) for proportionality management
        2nd RC input connected to a free RC channel of the receiver to control the volume and the auxiliary sounds (optional)
    Engine noise generation:
        Startup and idle sounds (in .wav format) stored on an SD card managed by the Arduino Pro Micro
        Possibility to store several start and idle sounds → possible choice of engine type
        Choice of the motor by the USB link of the Arduino Pro Micro
        Boot simulation by playing the boot sound
        Simulation of accelerations/decelerations by playing the idle sound with a sampling frequency proportional to the engine throttle
    Smoke generation:
        90-110KHz output to drive the piezo atomizer to produce smoke proportional to engine throttle
        Piezo Atomizer Frequency Proportional to Engine Gas
        Definition of Min and Max frequencies by the USB link of the Arduino Pro Micro in order to adapt to the frequency tolerances of piezo atomizers

    Auxiliary sounds:
        Based on a DF player mini module
        Sounds (in .mp3 format) stored on the SD card of the DF player mini module
        14 auxiliary sounds that can be played alongside the engine sound:
            1st group of 8 auxiliary sounds selectable from the transmitter
            2nd group of 6 auxiliary sounds selectable directly in hardware from 6 pins of the Sound and Smoke Module (Ex: waterway alarm)
        Test of the different auxiliary sounds by the USB link of the Arduino Pro Micro
    Mixing/Amplification
        Engine noise generation sound mixed with the auxiliary sound produced by the DF player mini module and uses the audio amplifier built into the DF player mini module
        Volume of the DF player mini module adjustable from the transmitter
        If little sound power is required, the integrated audio amplifier (3W) can directly power a loudspeaker
        If a lot of sound power is required, a "line" level audio output for an external amplifier is available
    Control/selection of each of the 8 auxiliary sounds and volume control from the RC transmitter
        Auxiliary input connected to an auxiliary RC output of the receiver using the RCUL/Xany protocol (directly supported by the OpenAVRc transmitter)
        Auxiliary input connected to an auxiliary RC output of the receiver using the EKMFA protocol (supported by all RC transmitters → joystick control)
        The sound volume can be adjusted from the transmitter regardless of the protocol used (RCUL/Xany or EKMFA).
    Auxiliary sound priority management
	
A sound has priority when it can interrupt a sound already in progress.

        3 priority levels:
            The 8 "launchable" sounds from the transmitter → no priority: any sound can interrupt the current sound
            The 6 sounds "launchable" in hardware from 6 pins of the Sound and Smoke Module configurable in priority:
                Medium priority: can be interrupted by a sound configured as high priority
                High priority: a sound configured in high priority can interrupt any sound in progress, except if this one is already in high priority
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Sound&Smoke_Module/Sound&Smoke_Module.jpg)

## Sound&Smoke_Module PCB:
![here](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Sound&Smoke_Module/S&SM1.png)

## User manual
[Configuration of the Sound&Smoke Module](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Sound&Smoke_Module/Sound&Smoke_Module_Manuel_Utilisateur.pdf)

## Upload the HEX file
We don't give sources, because X-Any libraries are not Open Source for the receive side.   
You can found binary file [MS16_ProMicro-Xany](https://github.com/Ingwie/OpenAVRc_Hw/tree/V3/Sound&Smoke_Module/Firmware_Sound&Smoke_Module)   

The **Arduino Pro Micro** board use a particular method for upload a code.  
You can use the program [32u4_hexuploader](https://github.com/uriba107/32u4_hexuploader).

 


## Video
 

RC Navy 