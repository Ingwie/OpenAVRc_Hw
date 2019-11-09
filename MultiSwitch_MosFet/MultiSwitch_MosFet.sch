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
LIBS:MultiSwitch_MosFet-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Carte Mosfet 8 voies"
Date "2019-01-05"
Rev "0.1"
Comp "OpenAVRc Team @"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R2
U 1 1 5C192312
P 4100 1600
F 0 "R2" V 4000 1600 50  0000 C CNN
F 1 "10K" V 4100 1600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4030 1600 50  0001 C CNN
F 3 "~" H 4100 1600 50  0001 C CNN
	1    4100 1600
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5C192450
P 3100 1950
F 0 "#PWR0101" H 3100 1700 50  0001 C CNN
F 1 "GND" H 3105 1777 50  0000 C CNN
F 2 "" H 3100 1950 50  0001 C CNN
F 3 "" H 3100 1950 50  0001 C CNN
	1    3100 1950
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5C1923BB
P 3600 1150
F 0 "R3" H 3750 1150 50  0000 R CNN
F 1 "10K" V 3600 1200 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3530 1150 50  0001 C CNN
F 3 "~" H 3600 1150 50  0001 C CNN
	1    3600 1150
	1    0    0    1   
$EndComp
Wire Wire Line
	3600 1800 3600 1900
Wire Wire Line
	3600 1900 3100 1900
Wire Wire Line
	3100 1900 3100 1550
Wire Wire Line
	3600 1400 3600 1350
Wire Wire Line
	3600 1350 3600 1300
Connection ~ 3600 1350
Wire Wire Line
	3600 1000 3600 900 
Wire Wire Line
	3100 1950 3100 1900
Connection ~ 3100 1900
Wire Wire Line
	3900 1600 3950 1600
$Comp
L Device:R R1
U 1 1 5C192A2C
P 4350 1350
F 0 "R1" H 4300 1350 50  0000 R CNN
F 1 "10K" V 4350 1400 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4280 1350 50  0001 C CNN
F 3 "~" H 4350 1350 50  0001 C CNN
	1    4350 1350
	1    0    0    1   
$EndComp
Wire Wire Line
	4250 1600 4350 1600
Wire Wire Line
	4350 1600 4350 1500
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5C193135
P 1950 1000
F 0 "J1" H 1900 950 50  0000 R CNN
F 1 "VExt1" H 1700 950 50  0000 R CNN
F 2 "Connectors:bornier2" H 1950 1000 50  0001 C CNN
F 3 "~" H 1950 1000 50  0001 C CNN
	1    1950 1000
	1    0    0    1   
$EndComp
$Comp
L Device:LED D1
U 1 1 5C1A8F2B
P 2500 800
F 0 "D1" H 2500 700 50  0000 C CNN
F 1 "LED" H 2650 700 50  0000 C CNN
F 2 "Mosfet_lib:LED_D3.0mm" H 2500 800 50  0001 C CNN
F 3 "~" H 2500 800 50  0001 C CNN
	1    2500 800 
	1    0    0    1   
$EndComp
$Comp
L Device:Q_NMOS_GDS Q2
U 1 1 5C1C844B
P 3200 1350
F 0 "Q2" H 3406 1396 50  0000 L CNN
F 1 "IRL2203N" H 3406 1305 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 3400 1450 50  0001 C CNN
F 3 "~" H 3200 1350 50  0001 C CNN
	1    3200 1350
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_CBE Q1
U 1 1 5C1D36A0
P 3700 1600
F 0 "Q1" H 3891 1646 50  0000 L CNN
F 1 "P2N2222A" H 3891 1555 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 3900 1700 50  0001 C CNN
F 3 "~" H 3700 1600 50  0001 C CNN
	1    3700 1600
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NJFET_DGS Q3
U 1 1 5C1C44B6
P 2300 1250
F 0 "Q3" H 2491 1296 50  0000 L CNN
F 1 "BF244B" H 2491 1205 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 2500 1350 50  0001 C CNN
F 3 "~" H 2300 1250 50  0001 C CNN
	1    2300 1250
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male J9
U 1 1 5C1D93A6
P 5650 6100
F 0 "J9" V 5700 6550 50  0000 C CNN
F 1 "Signals/Ms8" V 5600 6050 50  0000 C CNN
F 2 "Mosfet_lib:Pin_Header_Straight_1x08_Pitch2.54mm" H 5650 6100 50  0001 C CNN
F 3 "~" H 5650 6100 50  0001 C CNN
	1    5650 6100
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x08_Male J10
U 1 1 5C279305
P 5650 6550
F 0 "J10" V 5750 7000 50  0000 C CNN
F 1 "VRx/Ms8" V 5576 6477 50  0000 C CNN
F 2 "Mosfet_lib:Pin_Header_Straight_1x08_Pitch2.54mm" H 5650 6550 50  0001 C CNN
F 3 "~" H 5650 6550 50  0001 C CNN
	1    5650 6550
	0    -1   1    0   
$EndComp
Wire Wire Line
	6050 6750 6050 6850
Wire Wire Line
	6050 6850 5950 6850
Wire Wire Line
	5350 6850 5350 6750
Wire Wire Line
	5450 6750 5450 6850
Connection ~ 5450 6850
Wire Wire Line
	5450 6850 5350 6850
Wire Wire Line
	5550 6750 5550 6850
Connection ~ 5550 6850
Wire Wire Line
	5550 6850 5450 6850
Wire Wire Line
	5650 6750 5650 6850
Connection ~ 5650 6850
Wire Wire Line
	5650 6850 5550 6850
Wire Wire Line
	5750 6750 5750 6850
Connection ~ 5750 6850
Wire Wire Line
	5750 6850 5650 6850
Wire Wire Line
	5850 6750 5850 6850
Connection ~ 5850 6850
Wire Wire Line
	5850 6850 5750 6850
Wire Wire Line
	5950 6750 5950 6850
Connection ~ 5950 6850
Wire Wire Line
	5950 6850 5850 6850
Wire Wire Line
	3600 900  2700 900 
Wire Wire Line
	3600 1350 3400 1350
Wire Wire Line
	2200 1050 2200 800 
Wire Wire Line
	2200 800  2350 800 
Wire Wire Line
	2650 800  2700 800 
Wire Wire Line
	2700 800  2700 900 
Connection ~ 2700 900 
Wire Wire Line
	2700 900  2150 900 
Wire Wire Line
	2500 1250 2550 1250
Wire Wire Line
	2550 1250 2550 1450
Wire Wire Line
	2550 1450 2200 1450
Wire Wire Line
	2550 1250 2550 1000
Connection ~ 2550 1250
Wire Wire Line
	2550 1000 2150 1000
Wire Wire Line
	2550 1000 3100 1000
Wire Wire Line
	3100 1000 3100 1150
Connection ~ 2550 1000
Connection ~ 4350 1600
$Comp
L Device:R R17
U 1 1 5C1FB724
P 7400 3000
F 0 "R17" V 7300 3000 50  0000 C CNN
F 1 "10K" V 7400 3000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7330 3000 50  0001 C CNN
F 3 "~" H 7400 3000 50  0001 C CNN
	1    7400 3000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5C1FB72A
P 8400 3350
F 0 "#PWR0104" H 8400 3100 50  0001 C CNN
F 1 "GND" H 8405 3177 50  0000 C CNN
F 2 "" H 8400 3350 50  0001 C CNN
F 3 "" H 8400 3350 50  0001 C CNN
	1    8400 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5C1FB730
P 7900 2550
F 0 "R18" H 8100 2550 50  0000 R CNN
F 1 "10K" V 7900 2600 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7830 2550 50  0001 C CNN
F 3 "~" H 7900 2550 50  0001 C CNN
	1    7900 2550
	-1   0    0    1   
$EndComp
Wire Wire Line
	7900 3200 7900 3300
Wire Wire Line
	7900 3300 8400 3300
Wire Wire Line
	8400 3300 8400 2950
Wire Wire Line
	7900 2800 7900 2750
Wire Wire Line
	7900 2750 7900 2700
Connection ~ 7900 2750
Wire Wire Line
	7900 2400 7900 2300
Wire Wire Line
	8400 3350 8400 3300
Connection ~ 8400 3300
Wire Wire Line
	7600 3000 7550 3000
$Comp
L Device:R R16
U 1 1 5C1FB740
P 7150 2750
F 0 "R16" H 7100 2750 50  0000 R CNN
F 1 "10K" V 7150 2800 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7080 2750 50  0001 C CNN
F 3 "~" H 7150 2750 50  0001 C CNN
	1    7150 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	7250 3000 7150 3000
Wire Wire Line
	7150 3000 7150 2900
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 5C1FB749
P 9550 2300
F 0 "J6" H 9500 2250 50  0000 R CNN
F 1 "VExt6" H 9350 2250 50  0000 R CNN
F 2 "Connectors:bornier2" H 9550 2300 50  0001 C CNN
F 3 "~" H 9550 2300 50  0001 C CNN
	1    9550 2300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED D6
U 1 1 5C1FB751
P 9000 2200
F 0 "D6" H 9000 2100 50  0000 C CNN
F 1 "LED" H 9150 2100 50  0000 C CNN
F 2 "Mosfet_lib:LED_D3.0mm" H 9000 2200 50  0001 C CNN
F 3 "~" H 9000 2200 50  0001 C CNN
	1    9000 2200
	-1   0    0    1   
$EndComp
$Comp
L Device:Q_NMOS_GDS Q17
U 1 1 5C1FB757
P 8300 2750
F 0 "Q17" H 8506 2796 50  0000 L CNN
F 1 "IRL2203N" H 8506 2705 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 8500 2850 50  0001 C CNN
F 3 "~" H 8300 2750 50  0001 C CNN
	1    8300 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_CBE Q16
U 1 1 5C1FB75D
P 7800 3000
F 0 "Q16" H 7991 3046 50  0000 L CNN
F 1 "P2N2222A" H 7991 2955 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 8000 3100 50  0001 C CNN
F 3 "~" H 7800 3000 50  0001 C CNN
	1    7800 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NJFET_DGS Q18
U 1 1 5C1FB763
P 9200 2650
F 0 "Q18" H 9391 2696 50  0000 L CNN
F 1 "BF244B" H 9391 2605 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 9400 2750 50  0001 C CNN
F 3 "~" H 9200 2650 50  0001 C CNN
	1    9200 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2300 8800 2300
Wire Wire Line
	7900 2750 8100 2750
Wire Wire Line
	9300 2450 9300 2200
Wire Wire Line
	9300 2200 9150 2200
Wire Wire Line
	8850 2200 8800 2200
Wire Wire Line
	8800 2200 8800 2300
Connection ~ 8800 2300
Wire Wire Line
	8800 2300 9350 2300
Wire Wire Line
	9000 2650 8950 2650
Wire Wire Line
	8950 2650 8950 2850
Wire Wire Line
	8950 2850 9300 2850
Wire Wire Line
	8950 2650 8950 2400
Connection ~ 8950 2650
Wire Wire Line
	8950 2400 9350 2400
Wire Wire Line
	8950 2400 8400 2400
Wire Wire Line
	8400 2400 8400 2550
Connection ~ 8950 2400
Connection ~ 7150 3000
$Comp
L Device:R R20
U 1 1 5C1FCF3A
P 7400 4400
F 0 "R20" V 7300 4400 50  0000 C CNN
F 1 "10K" V 7400 4400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7330 4400 50  0001 C CNN
F 3 "~" H 7400 4400 50  0001 C CNN
	1    7400 4400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5C1FCF40
P 8400 4750
F 0 "#PWR0107" H 8400 4500 50  0001 C CNN
F 1 "GND" H 8405 4577 50  0000 C CNN
F 2 "" H 8400 4750 50  0001 C CNN
F 3 "" H 8400 4750 50  0001 C CNN
	1    8400 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 5C1FCF46
P 7900 3950
F 0 "R21" H 8100 3950 50  0000 R CNN
F 1 "10K" V 7900 4000 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7830 3950 50  0001 C CNN
F 3 "~" H 7900 3950 50  0001 C CNN
	1    7900 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	7900 4600 7900 4700
Wire Wire Line
	7900 4700 8400 4700
Wire Wire Line
	8400 4700 8400 4350
Wire Wire Line
	7900 4200 7900 4150
Wire Wire Line
	7900 4150 7900 4100
Connection ~ 7900 4150
Wire Wire Line
	7900 3800 7900 3700
Wire Wire Line
	8400 4750 8400 4700
Connection ~ 8400 4700
Wire Wire Line
	7600 4400 7550 4400
$Comp
L Device:R R19
U 1 1 5C1FCF56
P 7150 4150
F 0 "R19" H 7100 4150 50  0000 R CNN
F 1 "10K" V 7150 4200 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7080 4150 50  0001 C CNN
F 3 "~" H 7150 4150 50  0001 C CNN
	1    7150 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	7250 4400 7150 4400
Wire Wire Line
	7150 4400 7150 4300
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 5C1FCF5F
P 9550 3700
F 0 "J7" H 9500 3650 50  0000 R CNN
F 1 "VExt7" H 9350 3650 50  0000 R CNN
F 2 "Connectors:bornier2" H 9550 3700 50  0001 C CNN
F 3 "~" H 9550 3700 50  0001 C CNN
	1    9550 3700
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED D7
U 1 1 5C1FCF67
P 9000 3600
F 0 "D7" H 9000 3500 50  0000 C CNN
F 1 "LED" H 9150 3500 50  0000 C CNN
F 2 "Mosfet_lib:LED_D3.0mm" H 9000 3600 50  0001 C CNN
F 3 "~" H 9000 3600 50  0001 C CNN
	1    9000 3600
	-1   0    0    1   
$EndComp
$Comp
L Device:Q_NMOS_GDS Q20
U 1 1 5C1FCF6D
P 8300 4150
F 0 "Q20" H 8506 4196 50  0000 L CNN
F 1 "IRL2203N" H 8506 4105 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 8500 4250 50  0001 C CNN
F 3 "~" H 8300 4150 50  0001 C CNN
	1    8300 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_CBE Q19
U 1 1 5C1FCF73
P 7800 4400
F 0 "Q19" H 7991 4446 50  0000 L CNN
F 1 "P2N2222A" H 7991 4355 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 8000 4500 50  0001 C CNN
F 3 "~" H 7800 4400 50  0001 C CNN
	1    7800 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NJFET_DGS Q21
U 1 1 5C1FCF79
P 9200 4050
F 0 "Q21" H 9391 4096 50  0000 L CNN
F 1 "BF244B" H 9391 4005 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 9400 4150 50  0001 C CNN
F 3 "~" H 9200 4050 50  0001 C CNN
	1    9200 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3700 8800 3700
Wire Wire Line
	7900 4150 8100 4150
Wire Wire Line
	9300 3850 9300 3600
Wire Wire Line
	9300 3600 9150 3600
Wire Wire Line
	8850 3600 8800 3600
Wire Wire Line
	8800 3600 8800 3700
Connection ~ 8800 3700
Wire Wire Line
	8800 3700 9350 3700
Wire Wire Line
	9000 4050 8950 4050
Wire Wire Line
	8950 4050 8950 4250
Wire Wire Line
	8950 4250 9300 4250
Wire Wire Line
	8950 4050 8950 3800
Connection ~ 8950 4050
Wire Wire Line
	8950 3800 9350 3800
Wire Wire Line
	8950 3800 8400 3800
Wire Wire Line
	8400 3800 8400 3950
Connection ~ 8950 3800
Connection ~ 7150 4400
$Comp
L Device:R R23
U 1 1 5C1FCF9E
P 7350 5800
F 0 "R23" V 7250 5800 50  0000 C CNN
F 1 "10K" V 7350 5800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7280 5800 50  0001 C CNN
F 3 "~" H 7350 5800 50  0001 C CNN
	1    7350 5800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5C1FCFA4
P 8350 6150
F 0 "#PWR0110" H 8350 5900 50  0001 C CNN
F 1 "GND" H 8355 5977 50  0000 C CNN
F 2 "" H 8350 6150 50  0001 C CNN
F 3 "" H 8350 6150 50  0001 C CNN
	1    8350 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 5C1FCFAA
P 7850 5350
F 0 "R24" H 8050 5350 50  0000 R CNN
F 1 "10K" V 7850 5400 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7780 5350 50  0001 C CNN
F 3 "~" H 7850 5350 50  0001 C CNN
	1    7850 5350
	-1   0    0    1   
$EndComp
Wire Wire Line
	7850 6000 7850 6100
Wire Wire Line
	7850 6100 8350 6100
Wire Wire Line
	8350 6100 8350 5750
Wire Wire Line
	7850 5600 7850 5550
Wire Wire Line
	7850 5550 7850 5500
Connection ~ 7850 5550
Wire Wire Line
	7850 5200 7850 5100
Wire Wire Line
	8350 6150 8350 6100
Connection ~ 8350 6100
Wire Wire Line
	7550 5800 7500 5800
$Comp
L Device:R R22
U 1 1 5C1FCFBA
P 7100 5550
F 0 "R22" H 7050 5550 50  0000 R CNN
F 1 "10K" V 7100 5600 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7030 5550 50  0001 C CNN
F 3 "~" H 7100 5550 50  0001 C CNN
	1    7100 5550
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 5800 7100 5800
Wire Wire Line
	7100 5800 7100 5700
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 5C1FCFC3
P 9500 5100
F 0 "J8" H 9450 5050 50  0000 R CNN
F 1 "VExt8" H 9250 5050 50  0000 R CNN
F 2 "Connectors:bornier2" H 9500 5100 50  0001 C CNN
F 3 "~" H 9500 5100 50  0001 C CNN
	1    9500 5100
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED D8
U 1 1 5C1FCFCB
P 8950 5000
F 0 "D8" H 8950 4900 50  0000 C CNN
F 1 "LED" H 9100 4900 50  0000 C CNN
F 2 "Mosfet_lib:LED_D3.0mm" H 8950 5000 50  0001 C CNN
F 3 "~" H 8950 5000 50  0001 C CNN
	1    8950 5000
	-1   0    0    1   
$EndComp
$Comp
L Device:Q_NMOS_GDS Q23
U 1 1 5C1FCFD1
P 8250 5550
F 0 "Q23" H 8456 5596 50  0000 L CNN
F 1 "IRL2203N" H 8456 5505 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 8450 5650 50  0001 C CNN
F 3 "~" H 8250 5550 50  0001 C CNN
	1    8250 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_CBE Q22
U 1 1 5C1FCFD7
P 7750 5800
F 0 "Q22" H 7941 5846 50  0000 L CNN
F 1 "P2N2222A" H 7941 5755 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 7950 5900 50  0001 C CNN
F 3 "~" H 7750 5800 50  0001 C CNN
	1    7750 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NJFET_DGS Q24
U 1 1 5C1FCFDD
P 9150 5450
F 0 "Q24" H 9341 5496 50  0000 L CNN
F 1 "BF244B" H 9341 5405 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 9350 5550 50  0001 C CNN
F 3 "~" H 9150 5450 50  0001 C CNN
	1    9150 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 5100 8750 5100
Wire Wire Line
	7850 5550 8050 5550
Wire Wire Line
	9250 5250 9250 5000
Wire Wire Line
	9250 5000 9100 5000
Wire Wire Line
	8800 5000 8750 5000
Wire Wire Line
	8750 5000 8750 5100
Connection ~ 8750 5100
Wire Wire Line
	8750 5100 9300 5100
Wire Wire Line
	8950 5450 8900 5450
Wire Wire Line
	8900 5450 8900 5650
Wire Wire Line
	8900 5650 9250 5650
Wire Wire Line
	8900 5450 8900 5200
Connection ~ 8900 5450
Wire Wire Line
	8900 5200 9300 5200
Wire Wire Line
	8900 5200 8350 5200
Wire Wire Line
	8350 5200 8350 5350
Connection ~ 8900 5200
Connection ~ 7100 5800
$Comp
L Device:R R14
U 1 1 5C2056DF
P 7350 1600
F 0 "R14" V 7250 1600 50  0000 C CNN
F 1 "10K" V 7350 1600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7280 1600 50  0001 C CNN
F 3 "~" H 7350 1600 50  0001 C CNN
	1    7350 1600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5C2056E5
P 8350 1950
F 0 "#PWR0113" H 8350 1700 50  0001 C CNN
F 1 "GND" H 8355 1777 50  0000 C CNN
F 2 "" H 8350 1950 50  0001 C CNN
F 3 "" H 8350 1950 50  0001 C CNN
	1    8350 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5C2056EB
P 7850 1150
F 0 "R15" H 8050 1150 50  0000 R CNN
F 1 "10K" V 7850 1200 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7780 1150 50  0001 C CNN
F 3 "~" H 7850 1150 50  0001 C CNN
	1    7850 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	7850 1800 7850 1900
Wire Wire Line
	7850 1900 8350 1900
Wire Wire Line
	8350 1900 8350 1550
Wire Wire Line
	7850 1400 7850 1350
Wire Wire Line
	7850 1350 7850 1300
Connection ~ 7850 1350
Wire Wire Line
	7850 1000 7850 900 
Wire Wire Line
	8350 1950 8350 1900
Connection ~ 8350 1900
Wire Wire Line
	7550 1600 7500 1600
$Comp
L Device:R R13
U 1 1 5C2056FB
P 7100 1350
F 0 "R13" H 7050 1350 50  0000 R CNN
F 1 "10K" V 7100 1400 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7030 1350 50  0001 C CNN
F 3 "~" H 7100 1350 50  0001 C CNN
	1    7100 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 1600 7100 1600
Wire Wire Line
	7100 1600 7100 1500
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5C205704
P 9500 900
F 0 "J5" H 9450 850 50  0000 R CNN
F 1 "VExt5" H 9250 850 50  0000 R CNN
F 2 "Connectors:bornier2" H 9500 900 50  0001 C CNN
F 3 "~" H 9500 900 50  0001 C CNN
	1    9500 900 
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED D5
U 1 1 5C20570C
P 8950 800
F 0 "D5" H 8950 700 50  0000 C CNN
F 1 "LED" H 9100 700 50  0000 C CNN
F 2 "Mosfet_lib:LED_D3.0mm" H 8950 800 50  0001 C CNN
F 3 "~" H 8950 800 50  0001 C CNN
	1    8950 800 
	-1   0    0    1   
$EndComp
$Comp
L Device:Q_NMOS_GDS Q14
U 1 1 5C205712
P 8250 1350
F 0 "Q14" H 8456 1396 50  0000 L CNN
F 1 "IRL2203N" H 8456 1305 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 8450 1450 50  0001 C CNN
F 3 "~" H 8250 1350 50  0001 C CNN
	1    8250 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_CBE Q13
U 1 1 5C205718
P 7750 1600
F 0 "Q13" H 7941 1646 50  0000 L CNN
F 1 "P2N2222A" H 7941 1555 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 7950 1700 50  0001 C CNN
F 3 "~" H 7750 1600 50  0001 C CNN
	1    7750 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NJFET_DGS Q15
U 1 1 5C20571E
P 9150 1250
F 0 "Q15" H 9341 1296 50  0000 L CNN
F 1 "BF244B" H 9341 1205 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 9350 1350 50  0001 C CNN
F 3 "~" H 9150 1250 50  0001 C CNN
	1    9150 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 900  8750 900 
Wire Wire Line
	7850 1350 8050 1350
Wire Wire Line
	9250 1050 9250 800 
Wire Wire Line
	9250 800  9100 800 
Wire Wire Line
	8800 800  8750 800 
Wire Wire Line
	8750 800  8750 900 
Connection ~ 8750 900 
Wire Wire Line
	8750 900  9300 900 
Wire Wire Line
	8950 1250 8900 1250
Wire Wire Line
	8900 1250 8900 1450
Wire Wire Line
	8900 1450 9250 1450
Wire Wire Line
	8900 1250 8900 1000
Connection ~ 8900 1250
Wire Wire Line
	8900 1000 9300 1000
Wire Wire Line
	8900 1000 8350 1000
Wire Wire Line
	8350 1000 8350 1150
Connection ~ 8900 1000
Connection ~ 7100 1600
$Comp
L Device:R R5
U 1 1 5C205743
P 4100 3000
F 0 "R5" V 4000 3000 50  0000 C CNN
F 1 "10K" V 4100 3000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4030 3000 50  0001 C CNN
F 3 "~" H 4100 3000 50  0001 C CNN
	1    4100 3000
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5C205749
P 3100 3350
F 0 "#PWR0116" H 3100 3100 50  0001 C CNN
F 1 "GND" H 3105 3177 50  0000 C CNN
F 2 "" H 3100 3350 50  0001 C CNN
F 3 "" H 3100 3350 50  0001 C CNN
	1    3100 3350
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5C20574F
P 3600 2550
F 0 "R6" H 3750 2550 50  0000 R CNN
F 1 "10K" V 3600 2600 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3530 2550 50  0001 C CNN
F 3 "~" H 3600 2550 50  0001 C CNN
	1    3600 2550
	1    0    0    1   
$EndComp
Wire Wire Line
	3600 3200 3600 3300
Wire Wire Line
	3600 3300 3100 3300
Wire Wire Line
	3100 3300 3100 2950
Wire Wire Line
	3600 2800 3600 2750
Wire Wire Line
	3600 2750 3600 2700
Connection ~ 3600 2750
Wire Wire Line
	3600 2400 3600 2300
Wire Wire Line
	3100 3350 3100 3300
Connection ~ 3100 3300
Wire Wire Line
	3900 3000 3950 3000
$Comp
L Device:R R4
U 1 1 5C20575F
P 4350 2750
F 0 "R4" H 4300 2750 50  0000 R CNN
F 1 "10K" V 4350 2800 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4280 2750 50  0001 C CNN
F 3 "~" H 4350 2750 50  0001 C CNN
	1    4350 2750
	1    0    0    1   
$EndComp
Wire Wire Line
	4250 3000 4350 3000
Wire Wire Line
	4350 3000 4350 2900
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5C205768
P 1950 2400
F 0 "J2" H 1900 2350 50  0000 R CNN
F 1 "VExt2" H 1750 2350 50  0000 R CNN
F 2 "Connectors:bornier2" H 1950 2400 50  0001 C CNN
F 3 "~" H 1950 2400 50  0001 C CNN
	1    1950 2400
	1    0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 5C205770
P 2500 2200
F 0 "D2" H 2500 2100 50  0000 C CNN
F 1 "LED" H 2650 2100 50  0000 C CNN
F 2 "Mosfet_lib:LED_D3.0mm" H 2500 2200 50  0001 C CNN
F 3 "~" H 2500 2200 50  0001 C CNN
	1    2500 2200
	1    0    0    1   
$EndComp
$Comp
L Device:Q_NMOS_GDS Q5
U 1 1 5C205776
P 3200 2750
F 0 "Q5" H 3406 2796 50  0000 L CNN
F 1 "IRL2203N" H 3406 2705 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 3400 2850 50  0001 C CNN
F 3 "~" H 3200 2750 50  0001 C CNN
	1    3200 2750
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_CBE Q4
U 1 1 5C20577C
P 3700 3000
F 0 "Q4" H 3891 3046 50  0000 L CNN
F 1 "P2N2222A" H 3891 2955 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 3900 3100 50  0001 C CNN
F 3 "~" H 3700 3000 50  0001 C CNN
	1    3700 3000
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NJFET_DGS Q6
U 1 1 5C205782
P 2300 2650
F 0 "Q6" H 2491 2696 50  0000 L CNN
F 1 "BF244B" H 2491 2605 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 2500 2750 50  0001 C CNN
F 3 "~" H 2300 2650 50  0001 C CNN
	1    2300 2650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3600 2300 2700 2300
Wire Wire Line
	3600 2750 3400 2750
Wire Wire Line
	2200 2450 2200 2200
Wire Wire Line
	2200 2200 2350 2200
Wire Wire Line
	2650 2200 2700 2200
Wire Wire Line
	2700 2200 2700 2300
Connection ~ 2700 2300
Wire Wire Line
	2700 2300 2150 2300
Wire Wire Line
	2500 2650 2550 2650
Wire Wire Line
	2550 2650 2550 2850
Wire Wire Line
	2550 2850 2200 2850
Wire Wire Line
	2550 2650 2550 2400
Connection ~ 2550 2650
Wire Wire Line
	2550 2400 2150 2400
Wire Wire Line
	2550 2400 3100 2400
Wire Wire Line
	3100 2400 3100 2550
Connection ~ 2550 2400
Connection ~ 4350 3000
$Comp
L Device:R R8
U 1 1 5C2057A7
P 4100 4400
F 0 "R8" V 4000 4400 50  0000 C CNN
F 1 "10K" V 4100 4400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4030 4400 50  0001 C CNN
F 3 "~" H 4100 4400 50  0001 C CNN
	1    4100 4400
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5C2057AD
P 3100 4750
F 0 "#PWR0119" H 3100 4500 50  0001 C CNN
F 1 "GND" H 3105 4577 50  0000 C CNN
F 2 "" H 3100 4750 50  0001 C CNN
F 3 "" H 3100 4750 50  0001 C CNN
	1    3100 4750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5C2057B3
P 3600 3950
F 0 "R9" H 3750 3950 50  0000 R CNN
F 1 "10K" V 3600 4000 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3530 3950 50  0001 C CNN
F 3 "~" H 3600 3950 50  0001 C CNN
	1    3600 3950
	1    0    0    1   
$EndComp
Wire Wire Line
	3600 4600 3600 4700
Wire Wire Line
	3600 4700 3100 4700
Wire Wire Line
	3100 4700 3100 4350
Wire Wire Line
	3600 4200 3600 4150
Wire Wire Line
	3600 4150 3600 4100
Connection ~ 3600 4150
Wire Wire Line
	3600 3800 3600 3700
Wire Wire Line
	3100 4750 3100 4700
Connection ~ 3100 4700
Wire Wire Line
	3900 4400 3950 4400
$Comp
L Device:R R7
U 1 1 5C2057C3
P 4350 4150
F 0 "R7" H 4300 4150 50  0000 R CNN
F 1 "10K" V 4350 4200 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4280 4150 50  0001 C CNN
F 3 "~" H 4350 4150 50  0001 C CNN
	1    4350 4150
	1    0    0    1   
$EndComp
Wire Wire Line
	4250 4400 4350 4400
Wire Wire Line
	4350 4400 4350 4300
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5C2057CC
P 1950 3800
F 0 "J3" H 1900 3750 50  0000 R CNN
F 1 "VExt3" H 1750 3750 50  0000 R CNN
F 2 "Connectors:bornier2" H 1950 3800 50  0001 C CNN
F 3 "~" H 1950 3800 50  0001 C CNN
	1    1950 3800
	1    0    0    1   
$EndComp
$Comp
L Device:LED D3
U 1 1 5C2057D4
P 2500 3600
F 0 "D3" H 2500 3500 50  0000 C CNN
F 1 "LED" H 2650 3500 50  0000 C CNN
F 2 "Mosfet_lib:LED_D3.0mm" H 2500 3600 50  0001 C CNN
F 3 "~" H 2500 3600 50  0001 C CNN
	1    2500 3600
	1    0    0    1   
$EndComp
$Comp
L Device:Q_NMOS_GDS Q8
U 1 1 5C2057DA
P 3200 4150
F 0 "Q8" H 3406 4196 50  0000 L CNN
F 1 "IRL2203N" H 3406 4105 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 3400 4250 50  0001 C CNN
F 3 "~" H 3200 4150 50  0001 C CNN
	1    3200 4150
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_CBE Q7
U 1 1 5C2057E0
P 3700 4400
F 0 "Q7" H 3891 4446 50  0000 L CNN
F 1 "P2N2222A" H 3891 4355 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 3900 4500 50  0001 C CNN
F 3 "~" H 3700 4400 50  0001 C CNN
	1    3700 4400
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NJFET_DGS Q9
U 1 1 5C2057E6
P 2300 4050
F 0 "Q9" H 2491 4096 50  0000 L CNN
F 1 "BF244B" H 2491 4005 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 2500 4150 50  0001 C CNN
F 3 "~" H 2300 4050 50  0001 C CNN
	1    2300 4050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3600 3700 2700 3700
Wire Wire Line
	3600 4150 3400 4150
Wire Wire Line
	2200 3850 2200 3600
Wire Wire Line
	2200 3600 2350 3600
Wire Wire Line
	2650 3600 2700 3600
Wire Wire Line
	2700 3600 2700 3700
Connection ~ 2700 3700
Wire Wire Line
	2700 3700 2150 3700
Wire Wire Line
	2500 4050 2550 4050
Wire Wire Line
	2550 4050 2550 4250
Wire Wire Line
	2550 4250 2200 4250
Wire Wire Line
	2550 4050 2550 3800
Connection ~ 2550 4050
Wire Wire Line
	2550 3800 2150 3800
Wire Wire Line
	2550 3800 3100 3800
Wire Wire Line
	3100 3800 3100 3950
Connection ~ 2550 3800
Connection ~ 4350 4400
$Comp
L Device:R R11
U 1 1 5C20580B
P 4150 5800
F 0 "R11" V 4050 5800 50  0000 C CNN
F 1 "10K" V 4150 5800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4080 5800 50  0001 C CNN
F 3 "~" H 4150 5800 50  0001 C CNN
	1    4150 5800
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 5C205811
P 3150 6150
F 0 "#PWR0123" H 3150 5900 50  0001 C CNN
F 1 "GND" H 3155 5977 50  0000 C CNN
F 2 "" H 3150 6150 50  0001 C CNN
F 3 "" H 3150 6150 50  0001 C CNN
	1    3150 6150
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5C205817
P 3650 5350
F 0 "R12" H 3850 5350 50  0000 R CNN
F 1 "10K" V 3650 5400 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3580 5350 50  0001 C CNN
F 3 "~" H 3650 5350 50  0001 C CNN
	1    3650 5350
	1    0    0    1   
$EndComp
Wire Wire Line
	3650 6000 3650 6100
Wire Wire Line
	3650 6100 3150 6100
Wire Wire Line
	3150 6100 3150 5750
Wire Wire Line
	3650 5600 3650 5550
Wire Wire Line
	3650 5550 3650 5500
Connection ~ 3650 5550
Wire Wire Line
	3650 5200 3650 5100
Wire Wire Line
	3150 6150 3150 6100
Connection ~ 3150 6100
Wire Wire Line
	3950 5800 4000 5800
$Comp
L Device:R R10
U 1 1 5C205827
P 4400 5550
F 0 "R10" H 4350 5550 50  0000 R CNN
F 1 "10K" V 4400 5600 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4330 5550 50  0001 C CNN
F 3 "~" H 4400 5550 50  0001 C CNN
	1    4400 5550
	1    0    0    1   
$EndComp
Wire Wire Line
	4300 5800 4400 5800
Wire Wire Line
	4400 5800 4400 5700
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5C205830
P 2000 5200
F 0 "J4" H 1950 5150 50  0000 R CNN
F 1 "VExt4" H 1750 5150 50  0000 R CNN
F 2 "Connectors:bornier2" H 2000 5200 50  0001 C CNN
F 3 "~" H 2000 5200 50  0001 C CNN
	1    2000 5200
	1    0    0    1   
$EndComp
$Comp
L Device:LED D4
U 1 1 5C205838
P 2550 5000
F 0 "D4" H 2550 4900 50  0000 C CNN
F 1 "LED" H 2700 4900 50  0000 C CNN
F 2 "Mosfet_lib:LED_D3.0mm" H 2550 5000 50  0001 C CNN
F 3 "~" H 2550 5000 50  0001 C CNN
	1    2550 5000
	1    0    0    1   
$EndComp
$Comp
L Device:Q_NMOS_GDS Q11
U 1 1 5C20583E
P 3250 5550
F 0 "Q11" H 3456 5596 50  0000 L CNN
F 1 "IRL2203N" H 3456 5505 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 3450 5650 50  0001 C CNN
F 3 "~" H 3250 5550 50  0001 C CNN
	1    3250 5550
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_CBE Q10
U 1 1 5C205844
P 3750 5800
F 0 "Q10" H 3941 5846 50  0000 L CNN
F 1 "P2N2222A" H 3941 5755 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 3950 5900 50  0001 C CNN
F 3 "~" H 3750 5800 50  0001 C CNN
	1    3750 5800
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NJFET_DGS Q12
U 1 1 5C20584A
P 2350 5450
F 0 "Q12" H 2541 5496 50  0000 L CNN
F 1 "BF244B" H 2541 5405 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 2550 5550 50  0001 C CNN
F 3 "~" H 2350 5450 50  0001 C CNN
	1    2350 5450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3650 5100 2750 5100
Wire Wire Line
	3650 5550 3450 5550
Wire Wire Line
	2250 5250 2250 5000
Wire Wire Line
	2250 5000 2400 5000
Wire Wire Line
	2700 5000 2750 5000
Wire Wire Line
	2750 5000 2750 5100
Connection ~ 2750 5100
Wire Wire Line
	2750 5100 2200 5100
Wire Wire Line
	2550 5450 2600 5450
Wire Wire Line
	2600 5450 2600 5650
Wire Wire Line
	2600 5650 2250 5650
Wire Wire Line
	2600 5450 2600 5200
Connection ~ 2600 5450
Wire Wire Line
	2600 5200 2200 5200
Wire Wire Line
	2600 5200 3150 5200
Wire Wire Line
	3150 5200 3150 5350
Connection ~ 2600 5200
Connection ~ 4400 5800
Wire Wire Line
	5350 5900 5350 1600
Wire Wire Line
	4350 1600 5350 1600
Wire Wire Line
	5450 3000 5450 5900
Wire Wire Line
	4350 3000 5450 3000
Wire Wire Line
	5550 5900 5550 4400
Wire Wire Line
	4350 4400 5550 4400
Wire Wire Line
	5650 5900 5650 5800
Wire Wire Line
	4400 5800 5650 5800
Wire Wire Line
	5750 5900 5750 1600
Wire Wire Line
	5750 1600 7100 1600
Wire Wire Line
	5850 3000 5850 5900
Wire Wire Line
	5850 3000 7150 3000
Wire Wire Line
	5950 4400 5950 5900
Wire Wire Line
	5950 4400 7150 4400
Wire Wire Line
	6050 5900 6050 5800
Wire Wire Line
	6050 5800 7100 5800
$Comp
L Connector:Conn_01x02_Male J11
U 1 1 5C33CD59
P 4750 6550
F 0 "J11" V 4850 6750 50  0000 R CNN
F 1 "VExt_GND" V 4700 6700 50  0000 R CNN
F 2 "Connectors:bornier2" H 4750 6550 50  0001 C CNN
F 3 "~" H 4750 6550 50  0001 C CNN
	1    4750 6550
	0    -1   1    0   
$EndComp
Wire Wire Line
	4750 6750 4750 6850
Wire Wire Line
	4750 6850 4650 6850
$Comp
L power:GND #PWR0122
U 1 1 5C35F59A
P 4650 6850
F 0 "#PWR0122" H 4650 6600 50  0001 C CNN
F 1 "GND" H 4655 6677 50  0000 C CNN
F 2 "" H 4650 6850 50  0001 C CNN
F 3 "" H 4650 6850 50  0001 C CNN
	1    4650 6850
	0    1    1    0   
$EndComp
$Comp
L power:+VRx #PWR0103
U 1 1 5C31BEFF
P 6150 6850
F 0 "#PWR0103" H 6150 6700 50  0001 C CNN
F 1 "+VRx" V 6165 6978 50  0000 L CNN
F 2 "" H 6150 6850 50  0001 C CNN
F 3 "" H 6150 6850 50  0001 C CNN
	1    6150 6850
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 6850 6050 6850
Connection ~ 6050 6850
Wire Wire Line
	4850 6750 4850 6850
Wire Wire Line
	4850 6850 4750 6850
Connection ~ 4750 6850
Text Notes 800  1450 0    197  ~ 0
1
Text Notes 800  2800 0    197  ~ 0
2
Text Notes 800  4250 0    197  ~ 0
3
Text Notes 800  5650 0    197  ~ 0
4
Text Notes 10550 1400 0    197  ~ 0
5
Text Notes 10550 2850 0    197  ~ 0
6
Text Notes 10500 4250 0    197  ~ 0
7
Text Notes 10500 5700 0    197  ~ 0
8
Wire Wire Line
	4350 900  3600 900 
Wire Wire Line
	4350 900  4350 1200
Connection ~ 3600 900 
Wire Wire Line
	4350 2300 3600 2300
Wire Wire Line
	4350 2300 4350 2600
Connection ~ 3600 2300
Wire Wire Line
	4350 3700 3600 3700
Wire Wire Line
	4350 3700 4350 4000
Connection ~ 3600 3700
Wire Wire Line
	4400 5100 3650 5100
Wire Wire Line
	4400 5100 4400 5400
Connection ~ 3650 5100
Wire Wire Line
	7100 5100 7850 5100
Wire Wire Line
	7100 5100 7100 5400
Connection ~ 7850 5100
Wire Wire Line
	7900 3700 7150 3700
Wire Wire Line
	7150 3700 7150 4000
Connection ~ 7900 3700
Wire Wire Line
	7900 2300 7150 2300
Wire Wire Line
	7150 2300 7150 2600
Connection ~ 7900 2300
Wire Wire Line
	7850 900  7100 900 
Wire Wire Line
	7100 900  7100 1200
Connection ~ 7850 900 
$EndSCHEMATC
