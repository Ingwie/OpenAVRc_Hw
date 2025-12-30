## Mini Nano modification
1. On the copper side, using a scalpel, cut the trace that goes to LED D3 (cut between the via going to LED D3 and the 'S' of the RST silkscreen: the copper of the cut trace is barely visible under the enameled wire in the photo IMG_20251229_120408.jpg).  
2. Opposite LED D3, make a small notch with a scalpel on the edge of the PCB to allow the future enameled wire (0.3 mm) to pass through.  
3. On the copper side, glue the 3-pin header with a 2.54 mm pitch (I used super glue).  
   Leave the 3 pins of the header protruding 1.5 mm from the edge of the PCB.  

4. Solder an enameled wire (0.3 mm) between the center point of the 3-pin header and LED D3 (the wire passes through the notch).  
   Apply a drop of glue to the notch.  
5. Solder a 0.3 mm enameled wire between the point on the 3-pin header opposite D12 and pin D12.  
6. Solder the 220 Ohm protection resistor between the point on the 3-pin header opposite RX and pin RX.  

Cut the trace according to the red marker above:  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/doc/cute_wire.jpg)  

Wiring:  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/doc/Bottom.jpg)
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/MultiSwitch_Sw8_V3/doc/Top.jpg)  

## Sketch upload procedure
1. Place a jumper between the midpoint and the 220 Ohm resistor that connects to RX  
2. Upload the sketch  
3. Once the sketch is uploaded, place the jumper between the midpoint and pin D12  
4. Use a *real* terminal configured at 19200 baud (19200,N,8,1) to communicate with the sketch  

The sketch uses the RX pin to reliably receive serial RC protocols.  
This same RX pin is also used for PWM and CPPM.  