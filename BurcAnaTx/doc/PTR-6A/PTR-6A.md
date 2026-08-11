# Protronik PTR-6A
Another RC transmitter we will use for testing is the Protronik PTR-6A.  
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A/PTR-6A_Top.png)  

You can see the wiring for the two proportional sticks and more precisely, the wiring of channels 5 and 6.  
On this PTR-6A, channels 5 and 6 cannot be used because they are not fully proportional; the radio only recognizes the positions 1000, 1500, and 2000 milliseconds.  
The only solution is to repurpose one of the four channels corresponding to the sticks.  

<table border="2">
<tr>
<td><img src="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A/PTR-6A_2.jpg" border="0"/></td>
<td><img src="https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A/PTR-6A_3.jpg" border="0"/></td>
</tr>
<tr>
<td>     CH5</td><td>     CH6</td>
</tr>
</table>

I am going to use channel 3, which corresponds to the right-hand vertical axis.  
However, any of the other three channels could also be used, as they are fully proportional.  

## Derivation of the CH3 channel
![](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/BurcAnaTx/doc/PTR-6A/PTR-6A_Top.png)  

