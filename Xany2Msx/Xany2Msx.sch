EESchema Schematic File Version 4
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Xany2Msx-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Carte Xany2Msx"
Date "2019-01-06"
Rev "0.1"
Comp "OpenAVRc Team"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATtiny:ATtiny85-20PU U1
U 1 1 5C30915B
P 6700 3700
F 0 "U1" H 6350 4250 50  0000 R CNN
F 1 "ATtiny85" H 7150 3150 50  0000 R CNN
F 2 "DIP-8_W7.62mm" H 6700 3700 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 6700 3700 50  0001 C CNN
	1    6700 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+VRx #PWR0101
U 1 1 5C309D7E
P 4500 3000
F 0 "#PWR0101" H 4500 2850 50  0001 C CNN
F 1 "+VRx" H 4515 3173 50  0000 C CNN
F 2 "" H 4500 3000 50  0001 C CNN
F 3 "" H 4500 3000 50  0001 C CNN
	1    4500 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2900 6700 3050
$Comp
L power:GND #PWR0102
U 1 1 5C30AB58
P 6700 4500
F 0 "#PWR0102" H 6700 4250 50  0001 C CNN
F 1 "GND" H 6705 4327 50  0000 C CNN
F 2 "" H 6700 4500 50  0001 C CNN
F 3 "" H 6700 4500 50  0001 C CNN
	1    6700 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 4500 6700 4300
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5C309E1A
P 4250 3500
F 0 "J1" H 4250 3700 50  0000 C CNN
F 1 "Xany_Input" H 4250 3300 50  0000 C CNN
F 2 "Pin_Header_Straight_1x03_Pitch2.54mm" H 4250 3500 50  0001 C CNN
F 3 "~" H 4250 3500 50  0001 C CNN
	1    4250 3500
	-1   0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5C309F7F
P 5850 3750
F 0 "Y1" V 5850 3500 50  0000 L CNN
F 1 "16Mhz" V 6000 3450 50  0000 L CNN
F 2 "HC-39" H 5850 3750 50  0001 C CNN
F 3 "~" H 5850 3750 50  0001 C CNN
	1    5850 3750
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 5C30A0DB
P 5350 4150
F 0 "C1" H 5465 4196 50  0000 L CNN
F 1 "22pF" H 5465 4105 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 5388 4000 50  0001 C CNN
F 3 "~" H 5350 4150 50  0001 C CNN
	1    5350 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5C30A176
P 5850 4150
F 0 "C2" H 5965 4196 50  0000 L CNN
F 1 "22pF" H 5965 4105 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 5888 4000 50  0001 C CNN
F 3 "~" H 5850 4150 50  0001 C CNN
	1    5850 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3550 5850 3550
Wire Wire Line
	5850 3550 5850 3600
Wire Wire Line
	6100 3950 5850 3950
Wire Wire Line
	5850 3950 5850 3900
Wire Wire Line
	5350 4000 5350 3550
Wire Wire Line
	5350 3550 5850 3550
Connection ~ 5850 3550
Wire Wire Line
	5850 4000 5850 3950
Connection ~ 5850 3950
Wire Wire Line
	5850 4300 5850 4350
Wire Wire Line
	5350 4300 5350 4350
$Comp
L power:GND #PWR0103
U 1 1 5C30E133
P 5850 4350
F 0 "#PWR0103" H 5850 4100 50  0001 C CNN
F 1 "GND" H 5855 4177 50  0000 C CNN
F 2 "" H 5850 4350 50  0001 C CNN
F 3 "" H 5850 4350 50  0001 C CNN
	1    5850 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5C30E14D
P 5350 4350
F 0 "#PWR0104" H 5350 4100 50  0001 C CNN
F 1 "GND" H 5355 4177 50  0000 C CNN
F 2 "" H 5350 4350 50  0001 C CNN
F 3 "" H 5350 4350 50  0001 C CNN
	1    5350 4350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5C30E301
P 8050 3700
F 0 "J2" H 8000 3500 50  0000 L CNN
F 1 "S" H 8000 3900 50  0000 L CNN
F 2 "Pin_Header_Straight_1x03_Pitch2.54mm" H 8050 3700 50  0001 C CNN
F 3 "~" H 8050 3700 50  0001 C CNN
	1    8050 3700
	1    0    0    1   
$EndComp
Wire Wire Line
	7300 3900 7550 3900
Wire Wire Line
	7550 3900 7550 3800
Wire Wire Line
	7550 3800 7850 3800
Wire Wire Line
	7850 3700 7300 3700
Wire Wire Line
	7850 3600 7550 3600
Wire Wire Line
	7550 3600 7550 3500
Wire Wire Line
	7550 3500 7300 3500
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5C30E697
P 8550 3700
F 0 "J3" H 8500 3500 50  0000 L CNN
F 1 "+V" H 8500 3900 50  0000 L CNN
F 2 "Pin_Header_Straight_1x03_Pitch2.54mm" H 8550 3700 50  0001 C CNN
F 3 "~" H 8550 3700 50  0001 C CNN
	1    8550 3700
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 5C30E787
P 9050 3700
F 0 "J4" H 9000 3500 50  0000 L CNN
F 1 "GND" H 9000 3900 50  0000 L CNN
F 2 "Pin_Header_Straight_1x03_Pitch2.54mm" H 9050 3700 50  0001 C CNN
F 3 "~" H 9050 3700 50  0001 C CNN
	1    9050 3700
	1    0    0    1   
$EndComp
Wire Wire Line
	8350 3600 8300 3600
Wire Wire Line
	8300 3600 8300 3700
Wire Wire Line
	8300 3800 8350 3800
Wire Wire Line
	8350 3700 8300 3700
Connection ~ 8300 3700
Wire Wire Line
	8300 3700 8300 3800
Wire Wire Line
	8850 3800 8800 3800
Wire Wire Line
	8800 3800 8800 3700
Wire Wire Line
	8800 3600 8850 3600
Wire Wire Line
	8850 3700 8800 3700
Connection ~ 8800 3700
Wire Wire Line
	8800 3700 8800 3600
Wire Wire Line
	8800 3800 8800 3850
Connection ~ 8800 3800
Wire Wire Line
	8300 3600 8300 3500
Connection ~ 8300 3600
$Comp
L power:GND #PWR0106
U 1 1 5C30F619
P 8800 3850
F 0 "#PWR0106" H 8800 3600 50  0001 C CNN
F 1 "GND" H 8805 3677 50  0000 C CNN
F 2 "" H 8800 3850 50  0001 C CNN
F 3 "" H 8800 3850 50  0001 C CNN
	1    8800 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5C30F91A
P 5600 3400
F 0 "R1" V 5500 3400 50  0000 C CNN
F 1 "1K" V 5600 3400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5530 3400 50  0001 C CNN
F 3 "~" H 5600 3400 50  0001 C CNN
	1    5600 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 3400 6100 3400
$Comp
L Device:D_ALT D1
U 1 1 5C3102C6
P 4800 3500
F 0 "D1" H 4950 3450 50  0000 C CNN
F 1 "1N4148" H 4800 3600 50  0000 C CNN
F 2 "Diodes_THT:D_A-405_P2.54mm_Vertical_KathodeUp" H 4800 3500 50  0001 C CNN
F 3 "~" H 4800 3500 50  0001 C CNN
	1    4800 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 3500 4500 3500
Wire Wire Line
	4950 3500 5050 3500
Connection ~ 6700 3050
Wire Wire Line
	6700 3050 6700 3100
Wire Wire Line
	4450 3600 4500 3600
Wire Wire Line
	4500 3600 4500 3750
$Comp
L power:GND #PWR0107
U 1 1 5C3113CB
P 4500 3750
F 0 "#PWR0107" H 4500 3500 50  0001 C CNN
F 1 "GND" H 4505 3577 50  0000 C CNN
F 2 "" H 4500 3750 50  0001 C CNN
F 3 "" H 4500 3750 50  0001 C CNN
	1    4500 3750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 5C3124D5
P 4850 2750
F 0 "J5" V 4850 2900 50  0000 L CNN
F 1 "5v/6v" V 4950 2650 50  0000 L CNN
F 2 "Pin_Header_Straight_1x03_Pitch2.54mm" H 4850 2750 50  0001 C CNN
F 3 "~" H 4850 2750 50  0001 C CNN
	1    4850 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4950 2950 4950 3050
Wire Wire Line
	4950 3050 5050 3050
Wire Wire Line
	4850 2950 4850 3050
Wire Wire Line
	4850 3050 4950 3050
Connection ~ 4950 3050
Connection ~ 4500 3500
Wire Wire Line
	4500 3500 4450 3500
Wire Wire Line
	4750 2950 4750 3050
Wire Wire Line
	4750 3050 4500 3050
Wire Wire Line
	4500 3050 4500 3500
$Comp
L Device:C C3
U 1 1 5C314F06
P 7050 3050
F 0 "C3" V 6798 3050 50  0000 C CNN
F 1 "100nF" V 6889 3050 50  0000 C CNN
F 2 "Capacitors_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 7088 2900 50  0001 C CNN
F 3 "~" H 7050 3050 50  0001 C CNN
	1    7050 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 3050 6700 3050
Wire Wire Line
	7200 3050 7350 3050
$Comp
L power:GND #PWR0108
U 1 1 5C3164AC
P 7350 3050
F 0 "#PWR0108" H 7350 2800 50  0001 C CNN
F 1 "GND" H 7355 2877 50  0000 C CNN
F 2 "" H 7350 3050 50  0001 C CNN
F 3 "" H 7350 3050 50  0001 C CNN
	1    7350 3050
	0    -1   -1   0   
$EndComp
Text Notes 9205 3825 0    50   ~ 0
S1
Text Notes 9205 3725 0    50   ~ 0
S2
Text Notes 9205 3625 0    50   ~ 0
S3
Wire Notes Line
	9300 3850 9350 3800
Wire Notes Line
	9350 3800 9350 3550
Wire Notes Line
	9350 3550 9300 3500
Text Notes 9400 3700 0    50   ~ 0
Multi-Switch Output #1 to #3
$Comp
L power:+5V #PWR0105
U 1 1 5C30E065
P 6700 2900
F 0 "#PWR0105" H 6700 2750 50  0001 C CNN
F 1 "+5V" H 6715 3073 50  0000 C CNN
F 2 "" H 6700 2900 50  0001 C CNN
F 3 "" H 6700 2900 50  0001 C CNN
	1    6700 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3050 4500 3000
Connection ~ 4500 3050
$Comp
L power:+5V #PWR0109
U 1 1 5C31080B
P 8300 3500
F 0 "#PWR0109" H 8300 3350 50  0001 C CNN
F 1 "+5V" H 8315 3673 50  0000 C CNN
F 2 "" H 8300 3500 50  0001 C CNN
F 3 "" H 8300 3500 50  0001 C CNN
	1    8300 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J6
U 1 1 5C30EA37
P 1800 3700
F 0 "J6" H 1800 4000 50  0000 C CNN
F 1 "FTDI" H 1950 3650 50  0000 C CNN
F 2 "Pin_Header_Straight_2x03_Pitch2.54mm" H 1800 3700 50  0001 C CNN
F 3 "~" H 1800 3700 50  0001 C CNN
	1    1800 3700
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5C30F68F
P 3250 3150
F 0 "R3" V 3150 3150 50  0000 C CNN
F 1 "10K" V 3250 3150 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3180 3150 50  0001 C CNN
F 3 "~" H 3250 3150 50  0001 C CNN
	1    3250 3150
	-1   0    0    1   
$EndComp
$Comp
L Device:D_ALT D2
U 1 1 5C30F8CB
P 2400 3600
F 0 "D2" H 2550 3550 50  0000 C CNN
F 1 "1N4148" H 2200 3550 50  0000 C CNN
F 2 "Diodes_THT:D_A-405_P2.54mm_Vertical_KathodeUp" H 2400 3600 50  0001 C CNN
F 3 "~" H 2400 3600 50  0001 C CNN
	1    2400 3600
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 5C30F950
P 2800 3400
F 0 "R2" V 2900 3400 50  0000 C CNN
F 1 "1K" V 2800 3400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2730 3400 50  0001 C CNN
F 3 "~" H 2800 3400 50  0001 C CNN
	1    2800 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3250 3300 3250 3400
Wire Wire Line
	3250 3400 2950 3400
Connection ~ 3250 3400
Wire Wire Line
	5050 3500 5050 3050
Connection ~ 5050 3050
Wire Wire Line
	5050 3050 6700 3050
Wire Wire Line
	2550 3600 2650 3600
Wire Wire Line
	2650 3600 2650 3700
Wire Wire Line
	2650 3700 2000 3700
Wire Wire Line
	2250 3600 2150 3600
Wire Wire Line
	2650 3400 2150 3400
Wire Wire Line
	2150 3400 2150 3600
Connection ~ 2150 3600
Wire Wire Line
	2150 3600 2000 3600
Wire Wire Line
	2250 3800 2000 3800
Wire Wire Line
	2250 4000 2000 4000
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 5C30FBD9
P 3700 3500
F 0 "J7" H 3700 3700 50  0000 C CNN
F 1 "FTDI_3" H 3700 3300 50  0000 C CNN
F 2 "Pin_Header_Straight_1x03_Pitch2.54mm" H 3700 3500 50  0001 C CNN
F 3 "~" H 3700 3500 50  0001 C CNN
	1    3700 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3400 5450 3400
$Comp
L power:+5VP #PWR0110
U 1 1 5C315230
P 3250 2900
F 0 "#PWR0110" H 3250 2750 50  0001 C CNN
F 1 "+5VP" H 3265 3073 50  0000 C CNN
F 2 "" H 3250 2900 50  0001 C CNN
F 3 "" H 3250 2900 50  0001 C CNN
	1    3250 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+5VP #PWR0111
U 1 1 5C3152A8
P 2250 3800
F 0 "#PWR0111" H 2250 3650 50  0001 C CNN
F 1 "+5VP" V 2265 3928 50  0000 L CNN
F 2 "" H 2250 3800 50  0001 C CNN
F 3 "" H 2250 3800 50  0001 C CNN
	1    2250 3800
	0    1    1    0   
$EndComp
$Comp
L power:GNDD #PWR0112
U 1 1 5C3153A6
P 2250 4000
F 0 "#PWR0112" H 2250 3750 50  0001 C CNN
F 1 "GNDD" V 2254 3890 50  0000 R CNN
F 2 "" H 2250 4000 50  0001 C CNN
F 3 "" H 2250 4000 50  0001 C CNN
	1    2250 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3250 3400 3500 3400
Wire Wire Line
	3250 3000 3250 2900
Wire Wire Line
	3500 3500 3400 3500
Wire Wire Line
	3500 3600 3400 3600
$Comp
L power:+5VP #PWR0113
U 1 1 5C31D110
P 3400 3500
F 0 "#PWR0113" H 3400 3350 50  0001 C CNN
F 1 "+5VP" V 3415 3628 50  0000 L CNN
F 2 "" H 3400 3500 50  0001 C CNN
F 3 "" H 3400 3500 50  0001 C CNN
	1    3400 3500
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDD #PWR0114
U 1 1 5C31D1A3
P 3400 3600
F 0 "#PWR0114" H 3400 3350 50  0001 C CNN
F 1 "GNDD" V 3404 3490 50  0000 R CNN
F 2 "" H 3400 3600 50  0001 C CNN
F 3 "" H 3400 3600 50  0001 C CNN
	1    3400 3600
	0    1    1    0   
$EndComp
Wire Notes Line width 12 style dash_dot
	3950 2600 3950 4450
Wire Notes Line style solid
	1650 4150 1700 4200
Wire Notes Line style solid
	1700 4200 3750 4200
Wire Notes Line style solid
	3750 4200 3800 4150
Text Notes 2200 4350 0    50   ~ 0
ADAPTATEUR FTDI/XANYMSX
$EndSCHEMATC
