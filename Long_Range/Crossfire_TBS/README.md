# Protocol Crossfire (CRSF) with OpenAVRc

## Crossfire TBS
The [TBS CROSSFIRE](https://www.team-blacksheep.com/products/prod:crossfire_tx) is a long range R/C link based on the newest RF technology,  
capable of self-healing two-way communications and range beyond comprehension.  
With a sensitivity of -130dB, full RF-side diveristy, tiny receivers for FPV quads,  
the TBS CROSSFIRE contains the most modern technology to provide a superior long range control link. 

## Telemetry / CRSF
As a modern R/C link, it has telemetry built in.  
Two-way communication opens up new possibilities.  
From streaming MAVLink to you smart device, to updating your firmware,  
setting your video transmitter channel or adjusting flight control parameters such as PIDs.  
Adaptive bandwidth controls the speed of transmission or optimizes for ultimate range.  
CRSF is a proprietary TBS communication protocol between the Crossfire and R/C and Flight Control.  
It provides ultra-low latency with incredible bandwidth (3x faster, 6x more data than any comparable protocol!).  
With such tight integration, the TBS Crossfire is the logical choice for anyone flying Betaflight, KiSS or ArduPilot/Pixhawk platforms. 


## Our choice for test TBS CROSSFIRE
[TBS Crossfire Micro TX V2 Starter Set](https://www.team-blacksheep.com/products/prod:mtxv2_startset)  
![TBS Crossfire Micro TX V2 combo kit](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Long_Range/Crossfire_TBS/TBS_TX_V2_combo_kit.jpg)  

## Upgrade TBS devices
Three possibilities for update TBS devices existe.  

**TBS AGENT**  
  * Agent M  
        Web based software using Chrome browser
  * Agent X  
        Desktop software for Windows and Mac operating systems
  * Agent Lite  
        LUA based software for radios running FreedomTX, OpenTX or EdgeTX operating system

**Chrome Browser** installed (version: 89 or higher)
  

### TBS Agent M
  * Update and configure your favourite TBS products with the all-new web based interface, simple, fast and reliable.
  * Works on Mac and PC and Android mobile devices with Chrome browser installed.
  * Requires USB connection between the computer and TBS device.  
  * TBS Agent M: [Open AgentM](https://www.team-blacksheep.com/agentm/)  
  * Chrome Browser: [Click to Download](https://www.google.com/chrome/)  

### TBS Agent X
  * [Windows Version](https://agent.team-blacksheep.com/agentx/agentx_v2_win.zip) (Current Version: 3.0.51)
  * [Mac OSX Version](https://agent.team-blacksheep.com/agentx/agentx_v2_macosx.zip) (Current Version: 3.0.51)
  * Unpack the zip file and run the instalation wizard. 

#### Updating
1. Open up **AgentM** or **AgentX**
1. Click three-dots icon in top right corner
1. Click ‘UPDATE TBS AGENT X” icon
1. Follow the steps to complete.

## TX wiring

## Rx wiring
![TBS Nano RX](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Long_Range/Crossfire_TBS/nano-rx-pinout.jpg)  
TBS Crossfire Nano --> Flight controller   
GND -----------------> GND pin  
5V In -----------------> 5V pin  
Ch. Out 1 (TX) -------> RX pin  
Ch. Out 2 (RX) -------> TX pin  

## Videos
[![Crossfire basics for Beginners](https://img.youtube.com/vi/aq4hRkDCuCs/0.jpg)](https://www.youtube.com/watch?v=aq4hRkDCuCs "TBS Crossfire")  

[![TBS Nano Rx RESET](https://img.youtube.com/vi/trO3WAFBIH4/0.jpg)](https://www.youtube.com/watch?v=trO3WAFBIH4 "TBS Nano Rx RESET")  

[![TBS Nano Bind with Agent M/X](https://img.youtube.com/vi/j7zbBpXWZUo/0.jpg)](https://www.youtube.com/watch?v=j7zbBpXWZUo "TBS Nano Bind with Agent M/X")  



@OpenAVRc Team