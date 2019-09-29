EESchema Schematic File Version 4
LIBS:openXsensor-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "2019-09-29"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 5950 2700 1    60   ~ 0
RAW
Text Label 4600 2800 0    60   ~ 0
1(Tx)
Text Label 4600 2900 0    60   ~ 0
0(Rx)
Text Label 4600 3200 0    60   ~ 0
2
Text Label 4600 3300 0    60   ~ 0
3(**)
Text Label 4600 3400 0    60   ~ 0
4
Text Label 4600 3500 0    60   ~ 0
5(**)
Text Label 4600 3600 0    60   ~ 0
6(**)
Text Label 4600 3700 0    60   ~ 0
7
Text Label 4600 3800 0    60   ~ 0
8
Text Label 4600 3900 0    60   ~ 0
9(**)
Text Label 6100 3900 0    60   ~ 0
10(**/SS)
Text Label 6100 3800 0    60   ~ 0
11(**/MOSI)
Text Label 6100 3700 0    60   ~ 0
12(MISO)
Text Label 6100 3600 0    60   ~ 0
13(SCK)
Text Label 6100 3500 0    60   ~ 0
A0
Text Label 6100 3400 0    60   ~ 0
A1
Text Label 6100 3300 0    60   ~ 0
A2
Text Label 6100 3200 0    60   ~ 0
A3
Text Label 5250 4400 3    60   ~ 0
A4
Text Label 5150 4400 3    60   ~ 0
A5
Text Notes 4850 2450 0    60   ~ 0
Shield Arduino Pro Mini \n
Text Label 5550 4400 3    60   ~ 0
A7
Text Label 5650 4400 3    60   ~ 0
A6
$Comp
L Connector_Generic:Conn_01x02 P3
U 1 1 56D74FB3
P 5150 4200
F 0 "P3" H 5150 4300 50  0000 C CNN
F 1 "ADC" V 5250 4150 50  0000 C CNN
F 2 "Socket_Arduino_Pro_Mini:Socket_Strip_Arduino_1x02" H 5150 4200 50  0001 C CNN
F 3 "" H 5150 4200 50  0000 C CNN
	1    5150 4200
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P4
U 1 1 56D7505C
P 5550 4200
F 0 "P4" H 5550 4300 50  0000 C CNN
F 1 "ADC" V 5650 4150 50  0000 C CNN
F 2 "Socket_Arduino_Pro_Mini:Socket_Strip_Arduino_1x02" H 5550 4200 50  0001 C CNN
F 3 "" H 5550 4200 50  0000 C CNN
	1    5550 4200
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x12 P1
U 1 1 56D754D1
P 5150 3300
F 0 "P1" H 5150 3950 50  0000 C CNN
F 1 "Digital" V 5250 3300 50  0000 C CNN
F 2 "Socket_Arduino_Pro_Mini:Socket_Strip_Arduino_1x12" H 5150 3300 50  0001 C CNN
F 3 "" H 5150 3300 50  0000 C CNN
	1    5150 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x12 P2
U 1 1 56D755F3
P 5650 3300
F 0 "P2" H 5650 3950 50  0000 C CNN
F 1 "Analog" V 5750 3300 50  0000 C CNN
F 2 "Socket_Arduino_Pro_Mini:Socket_Strip_Arduino_1x12" H 5650 3300 50  0001 C CNN
F 3 "" H 5650 3300 50  0000 C CNN
	1    5650 3300
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 56D756B8
P 4850 4000
F 0 "#PWR03" H 4850 3750 50  0001 C CNN
F 1 "GND" H 4850 3850 50  0000 C CNN
F 2 "" H 4850 4000 50  0000 C CNN
F 3 "" H 4850 4000 50  0000 C CNN
	1    4850 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3100 4850 3100
Wire Wire Line
	4850 3100 4850 4000
Wire Wire Line
	4600 2900 4950 2900
Wire Wire Line
	4600 3500 4950 3500
Wire Wire Line
	4950 3600 4600 3600
Wire Wire Line
	4600 3700 4950 3700
Wire Wire Line
	5950 2700 5950 2800
Wire Wire Line
	5950 2800 5850 2800
Wire Wire Line
	5850 2900 5950 2900
Wire Wire Line
	5950 2900 5950 4000
$Comp
L power:GND #PWR04
U 1 1 56D75A03
P 5950 4000
F 0 "#PWR04" H 5950 3750 50  0001 C CNN
F 1 "GND" H 5950 3850 50  0000 C CNN
F 2 "" H 5950 4000 50  0000 C CNN
F 3 "" H 5950 4000 50  0000 C CNN
	1    5950 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3100 6050 3100
Wire Wire Line
	6050 3100 6050 2700
$Comp
L power:VCC #PWR05
U 1 1 56D75A9D
P 6050 2700
F 0 "#PWR05" H 6050 2550 50  0001 C CNN
F 1 "VCC" H 6050 2850 50  0000 C CNN
F 2 "" H 6050 2700 50  0000 C CNN
F 3 "" H 6050 2700 50  0000 C CNN
	1    6050 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3200 5850 3200
Wire Wire Line
	5850 3300 6100 3300
Wire Wire Line
	6100 3400 5850 3400
Wire Wire Line
	5850 3500 6100 3500
Wire Wire Line
	5850 3900 6100 3900
Text Notes 5250 2800 0    60   ~ 0
1
$Comp
L Connector_Generic:Conn_01x02 P6
U 1 1 5D73CE7F
P 2250 1750
F 0 "P6" H 2250 1850 50  0000 C CNN
F 1 "HUB/SPORT" H 2550 1700 50  0000 C CNN
F 2 "Pin_Header_Straight_1x02_Pitch2.54mm" H 2250 1750 50  0001 C CNN
F 3 "~" H 2250 1750 50  0001 C CNN
	1    2250 1750
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 P5
U 1 1 5D73CF47
P 2250 1150
F 0 "P5" H 2250 1350 50  0000 C CNN
F 1 "GPS" H 2400 1100 50  0000 C CNN
F 2 "Pin_Header_Straight_1x04_Pitch2.54mm" H 2250 1150 50  0001 C CNN
F 3 "~" H 2250 1150 50  0001 C CNN
	1    2250 1150
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 P8
U 1 1 5D73CFD8
P 2250 2750
F 0 "P8" H 2250 2950 50  0000 C CNN
F 1 "FUEL" H 2400 2750 50  0000 C CNN
F 2 "Pin_Header_Straight_1x03_Pitch2.54mm" H 2250 2750 50  0001 C CNN
F 3 "~" H 2250 2750 50  0001 C CNN
	1    2250 2750
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 P11
U 1 1 5D73D1A7
P 2250 4450
F 0 "P11" H 2150 4750 50  0000 L CNN
F 1 "GY-86" H 2350 4450 50  0000 L CNN
F 2 "Pin_Header_Straight_1x05_Pitch2.54mm" H 2250 4450 50  0001 C CNN
F 3 "~" H 2250 4450 50  0001 C CNN
	1    2250 4450
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P7
U 1 1 5D73E361
P 2250 2200
F 0 "P7" H 2250 2300 50  0000 C CNN
F 1 "PPM" H 2400 2150 50  0000 C CNN
F 2 "Pin_Header_Straight_1x02_Pitch2.54mm" H 2250 2200 50  0001 C CNN
F 3 "~" H 2250 2200 50  0001 C CNN
	1    2250 2200
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 P9
U 1 1 5D73E51B
P 2250 3200
F 0 "P9" H 2250 3400 50  0000 C CNN
F 1 "RPM" H 2400 3200 50  0000 C CNN
F 2 "Pin_Header_Straight_1x03_Pitch2.54mm" H 2250 3200 50  0001 C CNN
F 3 "~" H 2250 3200 50  0001 C CNN
	1    2250 3200
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 P10
U 1 1 5D73E639
P 2250 3750
F 0 "P10" H 2250 3950 50  0000 C CNN
F 1 "VFAS/COURANT" H 2600 3700 50  0000 C CNN
F 2 "Pin_Header_Straight_1x04_Pitch2.54mm" H 2250 3750 50  0001 C CNN
F 3 "~" H 2250 3750 50  0001 C CNN
	1    2250 3750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5D742F24
P 4450 3600
F 0 "R1" V 4400 3450 50  0000 C CNN
F 1 "10K" V 4450 3600 50  0000 C CNN
F 2 "R_1206" V 4380 3600 50  0001 C CNN
F 3 "~" H 4450 3600 50  0001 C CNN
	1    4450 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 3600 4000 3600
Wire Wire Line
	4000 3600 4000 1150
Wire Wire Line
	4000 1150 2450 1150
Wire Wire Line
	3900 2800 4950 2800
Wire Wire Line
	2450 1350 2550 1350
$Comp
L power:GND #PWR0101
U 1 1 5D744512
P 2550 1350
F 0 "#PWR0101" H 2550 1100 50  0001 C CNN
F 1 "GND" V 2550 1150 50  0000 C CNN
F 2 "" H 2550 1350 50  0000 C CNN
F 3 "" H 2550 1350 50  0000 C CNN
	1    2550 1350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5D744588
P 2550 2200
F 0 "#PWR0103" H 2550 1950 50  0001 C CNN
F 1 "GND" H 2550 2050 50  0000 C CNN
F 2 "" H 2550 2200 50  0000 C CNN
F 3 "" H 2550 2200 50  0000 C CNN
	1    2550 2200
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5D746203
P 2550 1250
F 0 "#PWR0104" H 2550 1100 50  0001 C CNN
F 1 "VCC" V 2550 1450 50  0000 C CNN
F 2 "" H 2550 1250 50  0000 C CNN
F 3 "" H 2550 1250 50  0000 C CNN
	1    2550 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 3400 3800 1850
Wire Wire Line
	3800 3400 4950 3400
Wire Wire Line
	3700 3200 3700 2300
Wire Wire Line
	3700 3200 4950 3200
Wire Wire Line
	3600 3800 4950 3800
Wire Wire Line
	3500 3900 4950 3900
$Comp
L power:GND #PWR0105
U 1 1 5D74C7E6
P 2550 3200
F 0 "#PWR0105" H 2550 2950 50  0001 C CNN
F 1 "GND" V 2550 3000 50  0000 C CNN
F 2 "" H 2550 3200 50  0000 C CNN
F 3 "" H 2550 3200 50  0000 C CNN
	1    2550 3200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5D74C821
P 2550 2750
F 0 "#PWR0106" H 2550 2500 50  0001 C CNN
F 1 "GND" V 2550 2550 50  0000 C CNN
F 2 "" H 2550 2750 50  0000 C CNN
F 3 "" H 2550 2750 50  0000 C CNN
	1    2550 2750
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR0107
U 1 1 5D74E93E
P 2550 3100
F 0 "#PWR0107" H 2550 2950 50  0001 C CNN
F 1 "VCC" V 2550 3300 50  0000 C CNN
F 2 "" H 2550 3100 50  0000 C CNN
F 3 "" H 2550 3100 50  0000 C CNN
	1    2550 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 3100 2450 3100
$Comp
L power:VCC #PWR0108
U 1 1 5D7576E9
P 2550 2650
F 0 "#PWR0108" H 2550 2500 50  0001 C CNN
F 1 "VCC" V 2550 2850 50  0000 C CNN
F 2 "" H 2550 2650 50  0000 C CNN
F 3 "" H 2550 2650 50  0000 C CNN
	1    2550 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 2650 2450 2650
$Comp
L power:VCC #PWR0109
U 1 1 5D75F7C5
P 2550 3650
F 0 "#PWR0109" H 2550 3500 50  0001 C CNN
F 1 "VCC" V 2550 3850 50  0000 C CNN
F 2 "" H 2550 3650 50  0000 C CNN
F 3 "" H 2550 3650 50  0000 C CNN
	1    2550 3650
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0110
U 1 1 5D75F800
P 2550 4350
F 0 "#PWR0110" H 2550 4200 50  0001 C CNN
F 1 "VCC" V 2550 4550 50  0000 C CNN
F 2 "" H 2550 4350 50  0000 C CNN
F 3 "" H 2550 4350 50  0000 C CNN
	1    2550 4350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5D75F8AB
P 2550 3750
F 0 "#PWR0111" H 2550 3500 50  0001 C CNN
F 1 "GND" V 2550 3550 50  0000 C CNN
F 2 "" H 2550 3750 50  0000 C CNN
F 3 "" H 2550 3750 50  0000 C CNN
	1    2550 3750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5D75F9C4
P 2550 4450
F 0 "#PWR0112" H 2550 4200 50  0001 C CNN
F 1 "GND" V 2550 4250 50  0000 C CNN
F 2 "" H 2550 4450 50  0000 C CNN
F 3 "" H 2550 4450 50  0000 C CNN
	1    2550 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2550 4350 2450 4350
Wire Wire Line
	2550 4450 2450 4450
Wire Wire Line
	2550 3750 2450 3750
Wire Wire Line
	2550 3650 2450 3650
Wire Wire Line
	2450 3850 2700 3850
Wire Wire Line
	2450 3950 2700 3950
Text Label 2700 3850 0    50   ~ 0
A7
Text Label 2700 3950 0    50   ~ 0
A6
$Comp
L power:GND #PWR0113
U 1 1 5D76741B
P 2550 5050
F 0 "#PWR0113" H 2550 4800 50  0001 C CNN
F 1 "GND" V 2550 4850 50  0000 C CNN
F 2 "" H 2550 5050 50  0000 C CNN
F 3 "" H 2550 5050 50  0000 C CNN
	1    2550 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2550 5050 2450 5050
Text Notes 5250 4700 1    50   ~ 0
SDA
Text Notes 5150 4700 1    50   ~ 0
SCL
Wire Wire Line
	3700 3300 3700 4250
Wire Wire Line
	3700 4250 2450 4250
Wire Wire Line
	3700 3300 4950 3300
Wire Wire Line
	2450 4550 2700 4550
Wire Wire Line
	2450 4650 2700 4650
Text Label 2700 4550 0    50   ~ 0
A5
Text Label 2700 4650 0    50   ~ 0
A4
$Comp
L Connector_Generic:Conn_01x05 P16
U 1 1 5D771791
P 2250 5950
F 0 "P16" H 2150 6250 50  0000 L CNN
F 1 "4S" H 2350 5950 50  0000 L CNN
F 2 "Pin_Header_Straight_1x05_Pitch2.54mm" H 2250 5950 50  0001 C CNN
F 3 "~" H 2250 5950 50  0001 C CNN
	1    2250 5950
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x10 P17
U 1 1 5D77D6B7
P 2250 6900
F 0 "P17" H 2250 7400 50  0000 C CNN
F 1 "ADS1115" H 2500 6850 50  0000 C CNN
F 2 "Pin_Header_Straight_1x10_Pitch2.54mm" H 2250 6900 50  0001 C CNN
F 3 "~" H 2250 6900 50  0001 C CNN
	1    2250 6900
	-1   0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0116
U 1 1 5D77DD14
P 2550 6500
F 0 "#PWR0116" H 2550 6350 50  0001 C CNN
F 1 "VCC" V 2550 6700 50  0000 C CNN
F 2 "" H 2550 6500 50  0000 C CNN
F 3 "" H 2550 6500 50  0000 C CNN
	1    2550 6500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5D77DD1A
P 2550 6600
F 0 "#PWR0117" H 2550 6350 50  0001 C CNN
F 1 "GND" V 2550 6400 50  0000 C CNN
F 2 "" H 2550 6600 50  0000 C CNN
F 3 "" H 2550 6600 50  0000 C CNN
	1    2550 6600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2550 6600 2450 6600
Wire Wire Line
	2550 6500 2450 6500
Wire Wire Line
	2450 6700 2700 6700
Wire Wire Line
	2450 6800 2700 6800
Text Label 2700 6700 0    50   ~ 0
A5
Text Label 2700 6800 0    50   ~ 0
A4
Wire Wire Line
	2450 2300 3700 2300
Wire Wire Line
	2450 1850 3800 1850
Wire Wire Line
	2450 2200 2550 2200
Wire Wire Line
	2550 2750 2450 2750
Wire Wire Line
	2450 2850 3500 2850
Wire Wire Line
	3500 2850 3500 3900
Wire Wire Line
	2450 3300 3600 3300
Wire Wire Line
	3600 3300 3600 3800
Wire Wire Line
	2450 3200 2550 3200
Wire Wire Line
	2550 1250 2450 1250
Wire Wire Line
	3900 1050 2450 1050
Wire Wire Line
	3900 1050 3900 2800
$Comp
L Connector_Generic:Conn_01x04 P18
U 1 1 5D879E98
P 3100 7200
F 0 "P18" H 3100 7400 50  0000 C CNN
F 1 "ADS_IN" H 3300 7150 50  0000 C CNN
F 2 "Pin_Header_Straight_1x04_Pitch2.54mm" H 3100 7200 50  0001 C CNN
F 3 "~" H 3100 7200 50  0001 C CNN
	1    3100 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 7100 2900 7100
Wire Wire Line
	2450 7200 2900 7200
Wire Wire Line
	2450 7300 2900 7300
Wire Wire Line
	2450 7400 2900 7400
Wire Wire Line
	2450 4950 2600 4950
Wire Wire Line
	2450 5300 2600 5300
Text Label 2600 4950 0    50   ~ 0
NTC1
Text Label 2600 5300 0    50   ~ 0
NTC2
$Comp
L Connector_Generic:Conn_01x02 P4-2
U 1 1 5D909028
P 5550 4700
F 0 "P4-2" H 5550 4850 50  0000 C CNN
F 1 "ADC" V 5650 4650 50  0000 C CNN
F 2 "Socket_Arduino_Pro_Mini:Socket_Strip_Arduino_1x02" H 5550 4700 50  0001 C CNN
F 3 "" H 5550 4700 50  0000 C CNN
	1    5550 4700
	0    -1   -1   0   
$EndComp
Text Label 5550 4900 3    60   ~ 0
A7
Text Label 5650 4900 3    60   ~ 0
A6
Wire Wire Line
	5850 3600 6100 3600
Wire Wire Line
	5850 3700 6100 3700
Wire Wire Line
	5850 3800 6100 3800
$Comp
L Device:R R6
U 1 1 5D92216D
P 3050 5750
F 0 "R6" V 3000 5600 50  0000 C CNN
F 1 "51K" V 3050 5750 50  0000 C CNN
F 2 "R_1206" V 2980 5750 50  0001 C CNN
F 3 "~" H 3050 5750 50  0001 C CNN
	1    3050 5750
	0    -1   1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5D922625
P 3300 6300
F 0 "R2" V 3250 6150 50  0000 C CNN
F 1 "20K" V 3300 6300 50  0000 C CNN
F 2 "R_1206" V 3230 6300 50  0001 C CNN
F 3 "~" H 3300 6300 50  0001 C CNN
	1    3300 6300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3600 6450 3600 6550
Wire Wire Line
	3600 6550 3500 6550
Wire Wire Line
	3300 6550 3300 6450
Wire Wire Line
	3400 6450 3400 6550
Connection ~ 3400 6550
Wire Wire Line
	3400 6550 3300 6550
Wire Wire Line
	3500 6450 3500 6550
Connection ~ 3500 6550
Wire Wire Line
	3500 6550 3400 6550
Wire Wire Line
	3600 6550 3600 6600
Connection ~ 3600 6550
$Comp
L power:GND #PWR0114
U 1 1 5D92CC17
P 3600 6600
F 0 "#PWR0114" H 3600 6350 50  0001 C CNN
F 1 "GND" V 3600 6400 50  0000 C CNN
F 2 "" H 3600 6600 50  0000 C CNN
F 3 "" H 3600 6600 50  0000 C CNN
	1    3600 6600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3600 6050 3600 6150
Wire Wire Line
	3500 5950 3500 6150
Wire Wire Line
	3400 5850 3400 6150
Wire Wire Line
	3300 5750 3300 6150
Text Label 3750 5750 0    50   ~ 0
A0
Text Label 3750 5850 0    50   ~ 0
A1
Text Label 3750 5950 0    50   ~ 0
A2
Text Label 3750 6050 0    50   ~ 0
A3
$Comp
L Device:R R7
U 1 1 5D95CD07
P 3050 5850
F 0 "R7" V 3000 5700 50  0000 C CNN
F 1 "51K" V 3050 5850 50  0000 C CNN
F 2 "R_1206" V 2980 5850 50  0001 C CNN
F 3 "~" H 3050 5850 50  0001 C CNN
	1    3050 5850
	0    -1   1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5D95CD3F
P 3050 5950
F 0 "R8" V 3000 5800 50  0000 C CNN
F 1 "51K" V 3050 5950 50  0000 C CNN
F 2 "R_1206" V 2980 5950 50  0001 C CNN
F 3 "~" H 3050 5950 50  0001 C CNN
	1    3050 5950
	0    -1   1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5D95CD7D
P 3050 6050
F 0 "R9" V 3000 5900 50  0000 C CNN
F 1 "51K" V 3050 6050 50  0000 C CNN
F 2 "R_1206" V 2980 6050 50  0001 C CNN
F 3 "~" H 3050 6050 50  0001 C CNN
	1    3050 6050
	0    -1   1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5D95CDB9
P 3400 6300
F 0 "R3" V 3350 6150 50  0000 C CNN
F 1 "20K" V 3400 6300 50  0000 C CNN
F 2 "R_1206" V 3330 6300 50  0001 C CNN
F 3 "~" H 3400 6300 50  0001 C CNN
	1    3400 6300
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5D95CDF7
P 3500 6300
F 0 "R4" V 3450 6150 50  0000 C CNN
F 1 "20K" V 3500 6300 50  0000 C CNN
F 2 "R_1206" V 3430 6300 50  0001 C CNN
F 3 "~" H 3500 6300 50  0001 C CNN
	1    3500 6300
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5D95CE3B
P 3600 6300
F 0 "R5" V 3550 6150 50  0000 C CNN
F 1 "20K" V 3600 6300 50  0000 C CNN
F 2 "R_1206" V 3530 6300 50  0001 C CNN
F 3 "~" H 3600 6300 50  0001 C CNN
	1    3600 6300
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P12
U 1 1 5D95DED9
P 2250 4950
F 0 "P12" H 2250 5050 50  0000 C CNN
F 1 "NTC1" H 2400 4900 50  0000 C CNN
F 2 "Pin_Header_Straight_1x02_Pitch2.54mm" H 2250 4950 50  0001 C CNN
F 3 "~" H 2250 4950 50  0001 C CNN
	1    2250 4950
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P13
U 1 1 5D95E150
P 2250 5300
F 0 "P13" H 2250 5400 50  0000 C CNN
F 1 "NTC2" H 2400 5250 50  0000 C CNN
F 2 "Pin_Header_Straight_1x02_Pitch2.54mm" H 2250 5300 50  0001 C CNN
F 3 "~" H 2250 5300 50  0001 C CNN
	1    2250 5300
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5D964F93
P 2550 5400
F 0 "#PWR0118" H 2550 5150 50  0001 C CNN
F 1 "GND" V 2550 5200 50  0000 C CNN
F 2 "" H 2550 5400 50  0000 C CNN
F 3 "" H 2550 5400 50  0000 C CNN
	1    2550 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2450 5400 2550 5400
Text Notes 6100 3000 0    50   ~ 0
RESET
Text Notes 4600 3000 0    50   ~ 0
RESET
$Comp
L Connector_Generic:Conn_01x03 P14
U 1 1 5D90B9A9
P 5150 5450
F 0 "P14" H 5150 5650 50  0000 C CNN
F 1 "ALIM" H 5300 5450 50  0000 C CNN
F 2 "Pin_Header_Straight_1x03_Pitch2.54mm" H 5150 5450 50  0001 C CNN
F 3 "~" H 5150 5450 50  0001 C CNN
	1    5150 5450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5350 5350 5550 5350
Wire Wire Line
	5350 5450 5550 5450
Wire Wire Line
	5350 5550 5450 5550
Wire Wire Line
	5450 5550 5450 5600
$Comp
L power:GND #PWR0119
U 1 1 5D9165DD
P 5450 5600
F 0 "#PWR0119" H 5450 5350 50  0001 C CNN
F 1 "GND" H 5450 5450 50  0000 C CNN
F 2 "" H 5450 5600 50  0000 C CNN
F 3 "" H 5450 5600 50  0000 C CNN
	1    5450 5600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0120
U 1 1 5D91666F
P 5550 5450
F 0 "#PWR0120" H 5550 5300 50  0001 C CNN
F 1 "VCC" H 5550 5600 50  0000 C CNN
F 2 "" H 5550 5450 50  0000 C CNN
F 3 "" H 5550 5450 50  0000 C CNN
	1    5550 5450
	0    1    1    0   
$EndComp
Text Label 5550 5350 0    50   ~ 0
RAW
Wire Wire Line
	2900 5750 2450 5750
Wire Wire Line
	3200 5750 3300 5750
Connection ~ 3300 5750
Wire Wire Line
	3200 5850 3400 5850
Connection ~ 3400 5850
Wire Wire Line
	3200 5950 3500 5950
Connection ~ 3500 5950
Wire Wire Line
	3200 6050 3600 6050
Connection ~ 3600 6050
Wire Wire Line
	2900 5850 2450 5850
Wire Wire Line
	2900 5950 2450 5950
Wire Wire Line
	2900 6050 2450 6050
Wire Wire Line
	3300 5750 3750 5750
Wire Wire Line
	3400 5850 3750 5850
Wire Wire Line
	3500 5950 3750 5950
Wire Wire Line
	3600 6050 3750 6050
$Comp
L Device:R R10
U 1 1 5D947CEB
P 2700 1750
F 0 "R10" V 2650 1550 50  0000 C CNN
F 1 "220" V 2700 1750 50  0000 C CNN
F 2 "R_1206" V 2630 1750 50  0001 C CNN
F 3 "~" H 2700 1750 50  0001 C CNN
	1    2700 1750
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5D74454D
P 3000 1750
F 0 "#PWR0102" H 3000 1500 50  0001 C CNN
F 1 "GND" H 3000 1600 50  0000 C CNN
F 2 "" H 3000 1750 50  0000 C CNN
F 3 "" H 3000 1750 50  0000 C CNN
	1    3000 1750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3000 1750 2850 1750
Wire Wire Line
	2550 1750 2450 1750
$EndSCHEMATC
