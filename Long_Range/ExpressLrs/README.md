# Protocol ExpressLRS (Long Range) with OpenAVRc

ExpressLRS uses the Crossfire serial protocol (AKA CRSF protocol) to communicate  
between the receiver and a flight controller board.  
So make sure your flight controller board supports the CRSF serial protocol.   

## Quick Start Guide
If you have hardware that you want to flash, please refer to our guides on the [website](https://www.expresslrs.org/2.0/), and our [FAQ](https://www.expresslrs.org/2.0/faq/).

## High Performance LoRa Radio Link
[ExpressLRS](https://github.com/ExpressLRS/ExpressLRS) is an open source RC link for RC applications.  
It is based on the fantastic semtech SX127x/SX1280 hardware combined with an ESP8285, ESP32 or STM32.  
ExpressLRS supports a wide range of hardware platforms as well as both 900 MHz and 2.4 GHz frequency options.  
ExpressLRS uses LoRa modulation as well as reduced packet size to achieve  
best in class range and latency compared to current commercial offerings.

ExpressLRS can run at various packet rates, up to 500hz or down to 25hz depending on your  
preference of range or low latency. At 900 MHz a maximum of 200 Hz packet rate is supported.  
At 2.4 GHz a blistering 500 Hz is currently supported with a custom openTX binary with future plans to extend this to 1000 Hz.

ExpressLRS supports telemetry as optional feature.  
Enabling telemetry also adds support for the betaflight lua script.

ExpressLRS can be flashed into existing Frsky R9M hardware (RX and TX), Jumper R900 RXs,  
SiYi FM30 Hardware (Rx and TX), GHOST hardware (RX and TX) or Custom PCBs can be made if you enjoy tinkering.  
Happy Model released official ExpressLRS hardware (RX and TX) and several other manufacturers  
are preparing to offer offical ELRS hardware soon so stay tuned.

![Express](https://github.com/ExpressLRS/ExpressLRS-Hardware/blob/master/img/Average%20Total%20Latency.png)  

ExpressLRS aims to achieve the best possible link performance for both latency and range.  
This is achieved with an optimised over the air packet structure.  
This compromise allows ExpressLRS to achieve simultaneous better latency AND range compared to other options in the market.  
For example, ExpressLRS 2.4GHz 150Hz mode offers the same range as GHST Normal while delivering near triple the packet update rate.  
Similarly, ExpressLRS 900MHz 200Hz will dramatically out-range Crossfire 150Hz and ExpressLRS 50Hz will out-range Crossfire 50Hz watt per watt.  

![ExpressLRS | Range vs Packet Rate](https://github.com/ExpressLRS/ExpressLRS-Hardware/blob/master/img/pktrate_vs_sens.png)  

More information can be found on the [website](https://www.expresslrs.org/2.0/).

## Supported Hardware
1. [900 MHz Hardware:](https://github.com/ExpressLRS/ExpressLRS#900-mhz-hardware)  
1. [2.4 GHz Hardware:](https://github.com/ExpressLRS/ExpressLRS#24-ghz-hardware)  

## Our choose for test ExpressLRS
[ES900TX and ES900Rx combo Kit](http://www.happymodel.cn/index.php/2021/02/19/expresslrs-module-es915tx-long-range-915mhz-transmitter-and-es915rx-receiver/2-94/)  
[ES900TX/ES900Rx document](http://www.happymodel.cn/index.php/2021/02/19/expresslrs-module-es915tx-long-range-915mhz-transmitter-and-es915rx-receiver/)   
* [HappyModel ES900TX](http://www.happymodel.cn/index.php/2021/02/19/expresslrs-module-es915tx-long-range-915mhz-transmitter-and-es915rx-receiver/3-89/)   
* [HappyModel ES900RX](http://www.happymodel.cn/index.php/2021/02/19/expresslrs-module-es915tx-long-range-915mhz-transmitter-and-es915rx-receiver/4-64/)  
[BETAFPV Nano RX868](https://betafpv.com/products/elrs-nano-receiver?variant=39416123981958)

## Flashing
1. Flashing ES900TX via [FTDI interface](https://www.expresslrs.org/1.0/quick-start/rx-betafpv900/#flashing-via-ftdi). 
1. ES900RX

1. BetaFpv Nano Rx868 

## Wiring
1. ES900TX  
![Tx connection with Transmitter]()  
1. ES900RX  
![Rx connections with flight controller](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Long_Range/ExpressLrs/ES900RX_Wiring.jpg) 
1. BETAFPV Nano RX   
![BETAFPV Nano RX connections with flight controller](https://github.com/Ingwie/OpenAVRc_Hw/blob/V3/Long_Range/ExpressLrs/BetaFpv_NanoRx868_wiring.jpg)

@OpenAVRc Team