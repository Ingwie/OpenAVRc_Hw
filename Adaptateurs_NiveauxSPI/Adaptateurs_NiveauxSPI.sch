EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Adaptateur Niveaux SPI 5v/3,3v"
Date "2021-05-15"
Rev "0.2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	5300 4600 5400 4600
Wire Wire Line
	4500 4700 4500 5050
Wire Wire Line
	3150 6850 3250 6850
Wire Wire Line
	3150 6950 3250 6950
Wire Wire Line
	4350 5150 4500 5150
Wire Wire Line
	5300 5500 5400 5500
Wire Wire Line
	3150 5050 3250 5050
Wire Wire Line
	3150 5150 3250 5150
Connection ~ 5300 4600
Connection ~ 4500 4700
Wire Wire Line
	4750 4700 4500 4700
Wire Wire Line
	4850 4600 4750 4700
Wire Wire Line
	4850 7400 5400 7400
Wire Wire Line
	4600 7150 4850 7400
Wire Wire Line
	4250 7150 4600 7150
Wire Wire Line
	4800 7200 5400 7200
Wire Wire Line
	4650 7050 4800 7200
Wire Wire Line
	4250 7050 4650 7050
Wire Wire Line
	4700 6800 5400 6800
Wire Wire Line
	4650 6750 4700 6800
Wire Wire Line
	4250 6750 4650 6750
Wire Wire Line
	4700 6600 5400 6600
Wire Wire Line
	4650 6650 4700 6600
Wire Wire Line
	4250 6650 4650 6650
$Comp
L Adaptateurs_NiveauxSPI-rescue:AGND-power1 #PWR040
U 1 1 5B924863
P 5250 7500
F 0 "#PWR040" H 5250 7500 40  0001 C CNN
F 1 "AGND" H 5250 7430 30  0000 C CNN
F 2 "" H 5250 7500 60  0001 C CNN
F 3 "" H 5250 7500 60  0001 C CNN
	1    5250 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 7000 5250 7500
Wire Wire Line
	5400 7000 5250 7000
$Comp
L Adaptateurs_NiveauxSPI-rescue:+5C-power1 #PWR039
U 1 1 5B9244FF
P 5250 6400
F 0 "#PWR039" H 5250 6350 20  0001 C CNN
F 1 "+5C" H 5250 6500 30  0000 C CNN
F 2 "" H 5250 6400 60  0001 C CNN
F 3 "" H 5250 6400 60  0001 C CNN
	1    5250 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 6500 5250 6400
Wire Wire Line
	5400 6500 5250 6500
$Comp
L Mega_2560-core-mini_full_2.1:CONN_01X10 P8
U 1 1 5B92420B
P 5550 7050
F 0 "P8" H 5600 7700 50  0000 C CNN
F 1 "CONN_01X10" V 5700 7050 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 5600 6850 50  0001 C CNN
F 3 "" H 5600 6850 50  0000 C CNN
	1    5550 7050
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:AGND-power1 #PWR034
U 1 1 5B813888
P 4400 7550
F 0 "#PWR034" H 4400 7550 40  0001 C CNN
F 1 "AGND" H 4400 7480 30  0000 C CNN
F 2 "" H 4400 7550 60  0001 C CNN
F 3 "" H 4400 7550 60  0001 C CNN
	1    4400 7550
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:AGND-power1 #PWR030
U 1 1 5B81383E
P 3450 7550
F 0 "#PWR030" H 3450 7550 40  0001 C CNN
F 1 "AGND" H 3450 7480 30  0000 C CNN
F 2 "" H 3450 7550 60  0001 C CNN
F 3 "" H 3450 7550 60  0001 C CNN
	1    3450 7550
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:AGND-power1 #PWR038
U 1 1 5B8137F4
P 4500 7300
F 0 "#PWR038" H 4500 7300 40  0001 C CNN
F 1 "AGND" H 4500 7230 30  0000 C CNN
F 2 "" H 4500 7300 60  0001 C CNN
F 3 "" H 4500 7300 60  0001 C CNN
	1    4500 7300
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:AGND-power1 #PWR026
U 1 1 5B813589
P 3150 7300
F 0 "#PWR026" H 3150 7300 40  0001 C CNN
F 1 "AGND" H 3150 7230 30  0000 C CNN
F 2 "" H 3150 7300 60  0001 C CNN
F 3 "" H 3150 7300 60  0001 C CNN
	1    3150 7300
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+5C-power1 #PWR029
U 1 1 5B81353D
P 2950 7550
F 0 "#PWR029" H 2950 7500 20  0001 C CNN
F 1 "+5C" H 2950 7650 30  0000 C CNN
F 2 "" H 2950 7550 60  0001 C CNN
F 3 "" H 2950 7550 60  0001 C CNN
	1    2950 7550
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+5C-power1 #PWR025
U 1 1 5B813477
P 3150 6400
F 0 "#PWR025" H 3150 6350 20  0001 C CNN
F 1 "+5C" H 3150 6500 30  0000 C CNN
F 2 "" H 3150 6400 60  0001 C CNN
F 3 "" H 3150 6400 60  0001 C CNN
	1    3150 6400
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+3.3VDAC-power1 #PWR037
U 1 1 5B81342B
P 4500 6400
F 0 "#PWR037" H 4500 6520 20  0001 C CNN
F 1 "+3.3VDAC" H 4500 6490 30  0000 C CNN
F 2 "" H 4500 6400 60  0001 C CNN
F 3 "" H 4500 6400 60  0001 C CNN
	1    4500 6400
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+3.3VDAC-power1 #PWR033
U 1 1 5B8133E1
P 3900 7550
F 0 "#PWR033" H 3900 7670 20  0001 C CNN
F 1 "+3.3VDAC" H 3900 7640 30  0000 C CNN
F 2 "" H 3900 7550 60  0001 C CNN
F 3 "" H 3900 7550 60  0001 C CNN
	1    3900 7550
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+3.3VDAC-power1 #PWR022
U 1 1 5B8131F4
P 2750 6400
F 0 "#PWR022" H 2750 6520 20  0001 C CNN
F 1 "+3.3VDAC" H 2750 6490 30  0000 C CNN
F 2 "" H 2750 6400 60  0001 C CNN
F 3 "" H 2750 6400 60  0001 C CNN
	1    2750 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 6950 4250 6950
Wire Notes Line
	2200 6100 5800 6100
Wire Wire Line
	3400 7550 3450 7550
Wire Wire Line
	3000 7550 2950 7550
$Comp
L Adaptateurs_NiveauxSPI-rescue:C-device C7
U 1 1 5B812A6B
P 3200 7550
F 0 "C7" H 3200 7650 40  0000 L CNN
F 1 "100nF" H 3206 7465 40  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3238 7400 30  0001 C CNN
F 3 "" H 3200 7550 60  0000 C CNN
	1    3200 7550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4350 7550 4400 7550
Wire Wire Line
	3950 7550 3900 7550
$Comp
L Adaptateurs_NiveauxSPI-rescue:C-device C8
U 1 1 5B812A5D
P 4150 7550
F 0 "C8" H 4150 7650 40  0000 L CNN
F 1 "100nF" H 4156 7465 40  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4188 7400 30  0001 C CNN
F 3 "" H 4150 7550 60  0000 C CNN
	1    4150 7550
	0    -1   -1   0   
$EndComp
Text Notes 2500 6050 0    60   ~ 0
Adaptateur 5v/3,3v SPI pour le CYRF6936 (WK-DEVO-S-MOD)
Connection ~ 3150 6850
Wire Wire Line
	2750 6550 2650 6550
Wire Wire Line
	2750 6400 2750 6550
Connection ~ 3150 6950
Wire Wire Line
	3150 7300 3150 6950
Wire Wire Line
	3150 6400 3150 6850
Wire Wire Line
	4500 6400 4500 6850
Wire Wire Line
	4500 6950 4500 7300
Wire Wire Line
	4500 6850 4250 6850
Wire Wire Line
	3250 7150 2650 7150
Wire Wire Line
	2650 7050 3250 7050
Wire Wire Line
	2650 6950 3150 6950
Wire Wire Line
	2650 6850 3150 6850
Wire Wire Line
	2650 6750 3250 6750
Wire Wire Line
	3250 6650 2650 6650
$Comp
L Adaptateurs_NiveauxSPI-rescue:CON_5V_3-3V U4
U 1 1 5B812A0D
P 3750 6900
F 0 "U4" H 3450 7300 40  0000 C CNN
F 1 "CONV_5V/3.3V" H 3850 7300 40  0000 C CNN
F 2 "Level_Convertissor_W10.16mm" H 3750 6900 30  0001 C CIN
F 3 "" H 3750 6900 60  0001 C CNN
	1    3750 6900
	-1   0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.1:CONN_01X07 P7
U 1 1 5B812A07
P 2450 6850
F 0 "P7" H 2450 7250 50  0000 C CNN
F 1 "CONN_01X07" V 2550 6800 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x07_P2.54mm_Vertical" H 2450 6800 50  0001 C CNN
F 3 "" H 2450 6800 50  0000 C CNN
	1    2450 6850
	-1   0    0    -1  
$EndComp
Wire Notes Line
	2200 4300 5800 4300
$Comp
L Adaptateurs_NiveauxSPI-rescue:+3.3V-power1 #PWR031
U 1 1 5B802B21
P 4150 5750
F 0 "#PWR031" H 4150 5710 30  0001 C CNN
F 1 "+3.3V" H 4150 5860 30  0000 C CNN
F 2 "" H 4150 5750 60  0001 C CNN
F 3 "" H 4150 5750 60  0001 C CNN
	1    4150 5750
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:GND-power1 #PWR028
U 1 1 5B802B1B
P 3450 5750
F 0 "#PWR028" H 3450 5750 30  0001 C CNN
F 1 "GND" H 3450 5680 30  0000 C CNN
F 2 "" H 3450 5750 60  0001 C CNN
F 3 "" H 3450 5750 60  0001 C CNN
	1    3450 5750
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+5V-power1 #PWR027
U 1 1 5B802B15
P 2950 5750
F 0 "#PWR027" H 2950 5840 20  0001 C CNN
F 1 "+5V" H 2950 5850 30  0000 C CNN
F 2 "" H 2950 5750 60  0001 C CNN
F 3 "" H 2950 5750 60  0001 C CNN
	1    2950 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3400 5750 3450 5750
Wire Wire Line
	3000 5750 2950 5750
$Comp
L Adaptateurs_NiveauxSPI-rescue:C-device C3
U 1 1 5B802B0D
P 3200 5750
F 0 "C3" H 3200 5850 40  0000 L CNN
F 1 "100nF" H 3206 5665 40  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3238 5600 30  0001 C CNN
F 3 "" H 3200 5750 60  0000 C CNN
	1    3200 5750
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:GND-power1 #PWR032
U 1 1 5B802B07
P 4650 5750
F 0 "#PWR032" H 4650 5750 30  0001 C CNN
F 1 "GND" H 4650 5680 30  0000 C CNN
F 2 "" H 4650 5750 60  0001 C CNN
F 3 "" H 4650 5750 60  0001 C CNN
	1    4650 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4600 5750 4650 5750
Wire Wire Line
	4200 5750 4150 5750
$Comp
L Adaptateurs_NiveauxSPI-rescue:C-device C4
U 1 1 5B802AFF
P 4400 5750
F 0 "C4" H 4400 5850 40  0000 L CNN
F 1 "100nF" H 4406 5665 40  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4438 5600 30  0001 C CNN
F 3 "" H 4400 5750 60  0000 C CNN
	1    4400 5750
	0    -1   -1   0   
$EndComp
Text Notes 3000 4250 0    60   ~ 0
Adaptateur 5v/3,3v SPI pour le CC2500
Connection ~ 4350 5150
Connection ~ 5300 5500
Wire Wire Line
	4500 5150 4850 5500
Wire Wire Line
	4950 4700 5400 4700
Wire Wire Line
	4800 4850 4950 4700
Wire Wire Line
	4900 4900 5400 4900
Wire Wire Line
	4850 4950 4900 4900
Wire Wire Line
	5200 5000 5400 5000
Wire Wire Line
	4850 5350 5200 5000
Wire Wire Line
	4250 5350 4850 5350
Wire Wire Line
	5250 4800 5400 4800
Wire Wire Line
	4800 5250 5250 4800
Wire Wire Line
	4250 5250 4800 5250
Wire Wire Line
	4250 4950 4850 4950
Wire Wire Line
	4250 4850 4800 4850
Wire Wire Line
	5300 5600 5400 5600
Wire Wire Line
	5300 5500 5300 5600
Wire Wire Line
	4850 5500 5300 5500
Wire Wire Line
	5350 5200 5400 5200
Wire Wire Line
	5350 5300 5350 5200
Wire Wire Line
	5400 5300 5350 5300
Wire Wire Line
	5300 5400 5400 5400
Wire Wire Line
	5300 5100 5300 5400
Wire Wire Line
	5400 5100 5300 5100
Wire Wire Line
	4850 4600 5300 4600
Wire Wire Line
	5300 4500 5300 4600
Wire Wire Line
	5400 4500 5300 4500
Connection ~ 3150 5050
Wire Wire Line
	2750 4750 2650 4750
Wire Wire Line
	2750 4600 2750 4750
$Comp
L Adaptateurs_NiveauxSPI-rescue:+3.3V-power1 #PWR021
U 1 1 5B801BF5
P 2750 4600
F 0 "#PWR021" H 2750 4560 30  0001 C CNN
F 1 "+3.3V" H 2750 4710 30  0000 C CNN
F 2 "" H 2750 4600 60  0001 C CNN
F 3 "" H 2750 4600 60  0001 C CNN
	1    2750 4600
	1    0    0    -1  
$EndComp
Connection ~ 3150 5150
Wire Wire Line
	3150 5500 3150 5150
Wire Wire Line
	3150 4600 3150 5050
Wire Wire Line
	4500 4600 4500 4700
Wire Wire Line
	4350 5150 4350 5500
Wire Wire Line
	4250 5150 4350 5150
Wire Wire Line
	4500 5050 4250 5050
Wire Wire Line
	3250 5350 2650 5350
Wire Wire Line
	2650 5250 3250 5250
Wire Wire Line
	2650 5150 3150 5150
Wire Wire Line
	2650 5050 3150 5050
Wire Wire Line
	2650 4950 3250 4950
Wire Wire Line
	3250 4850 2650 4850
$Comp
L Adaptateurs_NiveauxSPI-rescue:+5V-power1 #PWR023
U 1 1 5B8013DA
P 3150 4600
F 0 "#PWR023" H 3150 4690 20  0001 C CNN
F 1 "+5V" H 3150 4690 30  0000 C CNN
F 2 "" H 3150 4600 60  0001 C CNN
F 3 "" H 3150 4600 60  0001 C CNN
	1    3150 4600
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+3.3V-power1 #PWR036
U 1 1 5B8013D4
P 4500 4600
F 0 "#PWR036" H 4500 4560 30  0001 C CNN
F 1 "+3.3V" H 4500 4710 30  0000 C CNN
F 2 "" H 4500 4600 60  0001 C CNN
F 3 "" H 4500 4600 60  0001 C CNN
	1    4500 4600
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:GND-power1 #PWR024
U 1 1 5B8013C2
P 3150 5500
F 0 "#PWR024" H 3150 5500 30  0001 C CNN
F 1 "GND" H 3150 5430 30  0000 C CNN
F 2 "" H 3150 5500 60  0001 C CNN
F 3 "" H 3150 5500 60  0001 C CNN
	1    3150 5500
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:GND-power1 #PWR035
U 1 1 5B8013BC
P 4350 5500
F 0 "#PWR035" H 4350 5500 30  0001 C CNN
F 1 "GND" H 4350 5430 30  0000 C CNN
F 2 "" H 4350 5500 60  0001 C CNN
F 3 "" H 4350 5500 60  0001 C CNN
	1    4350 5500
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:CON_5V_3-3V U2
U 1 1 5B8013B6
P 3750 5100
F 0 "U2" H 3450 5500 40  0000 C CNN
F 1 "CONV_5V/3.3V" H 3850 5500 40  0000 C CNN
F 2 "Level_Convertissor_W10.16mm" H 3750 5100 30  0001 C CIN
F 3 "" H 3750 5100 60  0001 C CNN
	1    3750 5100
	-1   0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.1:CONN_01X07 P3
U 1 1 5B8013B0
P 2450 5050
F 0 "P3" H 2450 5450 50  0000 C CNN
F 1 "SpirfMod" V 2550 5000 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x07_P2.54mm_Vertical" H 2450 5000 50  0001 C CNN
F 3 "" H 2450 5000 50  0000 C CNN
	1    2450 5050
	-1   0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.1:CONN_01X12 P4
U 1 1 5B80123F
P 5550 5050
F 0 "P4" H 5600 5700 50  0000 C CNN
F 1 "CC2500" V 5700 5050 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x06_P2.54mm_Vertical" H 5600 4850 50  0001 C CNN
F 3 "" H 5600 4850 50  0000 C CNN
	1    5550 5050
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.1:CONN_01X07 P1
U 1 1 5B8003DA
P 2400 1450
F 0 "P1" H 2400 1850 50  0000 C CNN
F 1 "SpirfMod" V 2500 1400 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x07_P2.54mm_Vertical" H 2400 1400 50  0001 C CNN
F 3 "" H 2400 1400 50  0000 C CNN
	1    2400 1450
	-1   0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.1:CONN_01X08 P2
U 1 1 5B800BE1
P 5500 1300
F 0 "P2" H 5500 1750 50  0000 C CNN
F 1 "NRF24L01" V 5600 1300 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 5500 1300 50  0001 C CNN
F 3 "" H 5500 1300 50  0000 C CNN
	1    5500 1300
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:R-device R1
U 1 1 5B800E91
P 4850 1150
F 0 "R1" V 4800 950 40  0000 C CNN
F 1 "20K" V 4857 1151 40  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 4780 1150 30  0001 C CNN
F 3 "" H 4850 1150 30  0000 C CNN
	1    4850 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	3200 1250 2600 1250
Wire Wire Line
	2600 1350 3200 1350
Wire Wire Line
	2600 1450 3100 1450
Wire Wire Line
	2600 1550 3100 1550
Wire Wire Line
	2600 1650 3200 1650
Wire Wire Line
	3200 1750 2600 1750
Wire Wire Line
	4200 1250 4800 1250
Wire Wire Line
	4800 1250 4900 1350
Wire Wire Line
	4900 1350 5300 1350
Wire Wire Line
	4200 1350 4800 1350
Wire Wire Line
	4800 1350 4900 1250
Wire Wire Line
	4900 1250 5300 1250
Wire Wire Line
	4450 1450 4200 1450
Wire Wire Line
	4200 1550 4300 1550
Wire Wire Line
	4300 1550 4300 1900
Wire Wire Line
	4200 1650 4450 1650
Wire Wire Line
	4450 1650 4650 1450
Wire Wire Line
	4650 1450 5300 1450
Wire Wire Line
	4200 1750 4550 1750
Wire Wire Line
	4550 1750 4750 1550
Wire Wire Line
	4750 1550 5300 1550
Wire Wire Line
	4450 1050 5300 1050
Wire Wire Line
	5300 950  5200 950 
Wire Wire Line
	5200 950  5200 1700
Wire Wire Line
	4450 1000 4450 1050
Connection ~ 4450 1050
Wire Wire Line
	3100 1000 3100 1450
Wire Wire Line
	3100 1900 3100 1550
Connection ~ 3100 1550
Wire Wire Line
	5100 1150 5300 1150
Wire Wire Line
	4600 1150 4450 1150
Connection ~ 4450 1150
Connection ~ 3100 1450
Wire Wire Line
	2700 1000 2700 1150
Wire Wire Line
	2700 1150 2600 1150
Text Notes 2900 650  0    60   ~ 0
Adaptateur 5v/3,3v SPI pour le NRF24L01
$Comp
L Adaptateurs_NiveauxSPI-rescue:C-device C1
U 1 1 5B8028D5
P 3250 2150
F 0 "C1" H 3250 2250 40  0000 L CNN
F 1 "100nF" H 3256 2065 40  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3288 2000 30  0001 C CNN
F 3 "" H 3250 2150 60  0000 C CNN
	1    3250 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3050 2150 3000 2150
Wire Wire Line
	3450 2150 3500 2150
Wire Notes Line
	2200 700  5700 700 
$Comp
L Adaptateurs_NiveauxSPI-rescue:+3.3VADC-power1 #PWR01
U 1 1 5B802CA6
P 2700 1000
F 0 "#PWR01" H 2700 1120 20  0001 C CNN
F 1 "+3.3VADC" H 2700 1090 30  0000 C CNN
F 2 "" H 2700 1000 60  0001 C CNN
F 3 "" H 2700 1000 60  0001 C CNN
	1    2700 1000
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+5VP-power1 #PWR03
U 1 1 5B802CDB
P 3100 1000
F 0 "#PWR03" H 3100 1090 20  0001 C CNN
F 1 "+5VP" H 3100 1090 30  0000 C CNN
F 2 "" H 3100 1000 60  0001 C CNN
F 3 "" H 3100 1000 60  0001 C CNN
	1    3100 1000
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+5VP-power1 #PWR07
U 1 1 5B802DC0
P 3000 2150
F 0 "#PWR07" H 3000 2240 20  0001 C CNN
F 1 "+5VP" H 3000 2240 30  0000 C CNN
F 2 "" H 3000 2150 60  0001 C CNN
F 3 "" H 3000 2150 60  0001 C CNN
	1    3000 2150
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+3.3VADC-power1 #PWR017
U 1 1 5B802EB8
P 4450 1000
F 0 "#PWR017" H 4450 1120 20  0001 C CNN
F 1 "+3.3VADC" H 4450 1090 30  0000 C CNN
F 2 "" H 4450 1000 60  0001 C CNN
F 3 "" H 4450 1000 60  0001 C CNN
	1    4450 1000
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:GNDA-power1 #PWR020
U 1 1 5B803200
P 5200 1700
F 0 "#PWR020" H 5200 1700 40  0001 C CNN
F 1 "GNDA" H 5200 1630 40  0000 C CNN
F 2 "" H 5200 1700 60  0001 C CNN
F 3 "" H 5200 1700 60  0001 C CNN
	1    5200 1700
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:GNDA-power1 #PWR015
U 1 1 5B80326F
P 4300 1900
F 0 "#PWR015" H 4300 1900 40  0001 C CNN
F 1 "GNDA" H 4300 1830 40  0000 C CNN
F 2 "" H 4300 1900 60  0001 C CNN
F 3 "" H 4300 1900 60  0001 C CNN
	1    4300 1900
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:GNDA-power1 #PWR08
U 1 1 5B8032C7
P 3500 2150
F 0 "#PWR08" H 3500 2150 40  0001 C CNN
F 1 "GNDA" H 3500 2080 40  0000 C CNN
F 2 "" H 3500 2150 60  0001 C CNN
F 3 "" H 3500 2150 60  0001 C CNN
	1    3500 2150
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:GNDA-power1 #PWR04
U 1 1 5B8032F3
P 3100 1900
F 0 "#PWR04" H 3100 1900 40  0001 C CNN
F 1 "GNDA" H 3100 1830 40  0000 C CNN
F 2 "" H 3100 1900 60  0001 C CNN
F 3 "" H 3100 1900 60  0001 C CNN
	1    3100 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1050 4450 1150
Wire Wire Line
	3100 1550 3200 1550
Wire Wire Line
	4450 1150 4450 1450
Wire Wire Line
	3100 1450 3200 1450
$Comp
L Adaptateurs_NiveauxSPI-rescue:GNDA-power1 #PWR012
U 1 1 5B80329B
P 4750 2150
F 0 "#PWR012" H 4750 2150 40  0001 C CNN
F 1 "GNDA" H 4750 2080 40  0000 C CNN
F 2 "" H 4750 2150 60  0001 C CNN
F 3 "" H 4750 2150 60  0001 C CNN
	1    4750 2150
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+3.3VADC-power1 #PWR011
U 1 1 5B802D88
P 4250 2150
F 0 "#PWR011" H 4250 2270 20  0001 C CNN
F 1 "+3.3VADC" H 4250 2240 30  0000 C CNN
F 2 "" H 4250 2150 60  0001 C CNN
F 3 "" H 4250 2150 60  0001 C CNN
	1    4250 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 2150 4750 2150
Wire Wire Line
	4300 2150 4250 2150
$Comp
L Adaptateurs_NiveauxSPI-rescue:C-device C2
U 1 1 5B8026A8
P 4500 2150
F 0 "C2" H 4500 2250 40  0000 L CNN
F 1 "100nF" H 4506 2065 40  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4538 2000 30  0001 C CNN
F 3 "" H 4500 2150 60  0000 C CNN
	1    4500 2150
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:CON_5V_3-3V U1
U 1 1 5B80076F
P 3700 1500
F 0 "U1" H 3400 1900 40  0000 C CNN
F 1 "CONV_5V/3.3V" H 3800 1900 40  0000 C CNN
F 2 "Level_Convertissor_W10.16mm" H 3700 1500 30  0001 C CIN
F 3 "" H 3700 1500 60  0001 C CNN
	1    3700 1500
	-1   0    0    -1  
$EndComp
Wire Notes Line
	2200 2300 5700 2300
Wire Notes Line
	2200 2300 2200 700 
Wire Notes Line
	5700 2300 5700 700 
$Comp
L Mega_2560-core-mini_full_2.1:CONN_01X07 P5
U 1 1 5B810C78
P 2400 3250
F 0 "P5" H 2400 3650 50  0000 C CNN
F 1 "SpirMod" V 2500 3200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x07_P2.54mm_Vertical" H 2400 3200 50  0001 C CNN
F 3 "" H 2400 3200 50  0000 C CNN
	1    2400 3250
	-1   0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:CON_5V_3-3V U3
U 1 1 5B810C7E
P 3700 3300
F 0 "U3" H 3400 3700 40  0000 C CNN
F 1 "CONV_5V/3.3V" H 3800 3700 40  0000 C CNN
F 2 "Level_Convertissor_W10.16mm" H 3700 3300 30  0001 C CIN
F 3 "" H 3700 3300 60  0001 C CNN
	1    3700 3300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3200 3050 2600 3050
Wire Wire Line
	2600 3150 3200 3150
Wire Wire Line
	2600 3250 3100 3250
Wire Wire Line
	2600 3350 3100 3350
Wire Wire Line
	2600 3450 3200 3450
Wire Wire Line
	3200 3550 2600 3550
Wire Wire Line
	4450 3250 4200 3250
Wire Wire Line
	4200 3350 4300 3350
Wire Wire Line
	4300 3350 4300 3700
Wire Wire Line
	4200 3450 4450 3450
Wire Wire Line
	4200 3550 4550 3550
Wire Wire Line
	4450 2800 4450 2950
Wire Wire Line
	3100 2800 3100 3250
Wire Wire Line
	3100 3700 3100 3350
Connection ~ 3100 3350
Connection ~ 3100 3250
Wire Wire Line
	2700 2800 2700 2950
Wire Wire Line
	2700 2950 2600 2950
Text Notes 2900 2450 0    60   ~ 0
Adaptateur 5v/3,3v SPI pour le A7105
$Comp
L Adaptateurs_NiveauxSPI-rescue:C-device C6
U 1 1 5B810CB4
P 4450 3950
F 0 "C6" H 4450 4050 40  0000 L CNN
F 1 "100nF" H 4456 3865 40  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4488 3800 30  0001 C CNN
F 3 "" H 4450 3950 60  0000 C CNN
	1    4450 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4250 3950 4200 3950
Wire Wire Line
	4650 3950 4700 3950
$Comp
L Adaptateurs_NiveauxSPI-rescue:C-device C5
U 1 1 5B810CBC
P 3200 3950
F 0 "C5" H 3200 4050 40  0000 L CNN
F 1 "100nF" H 3206 3865 40  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3238 3800 30  0001 C CNN
F 3 "" H 3200 3950 60  0000 C CNN
	1    3200 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3000 3950 2950 3950
Wire Wire Line
	3400 3950 3450 3950
Wire Notes Line
	2200 2500 5700 2500
$Comp
L Adaptateurs_NiveauxSPI-rescue:+3.3VP-power1 #PWR02
U 1 1 5B8112A4
P 2700 2800
F 0 "#PWR02" H 2750 2830 20  0001 C CNN
F 1 "+3.3VP" H 2700 2900 30  0000 C CNN
F 2 "" H 2700 2800 60  0001 C CNN
F 3 "" H 2700 2800 60  0001 C CNN
	1    2700 2800
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+3.3VP-power1 #PWR013
U 1 1 5B811390
P 4200 3950
F 0 "#PWR013" H 4250 3980 20  0001 C CNN
F 1 "+3.3VP" H 4200 4050 30  0000 C CNN
F 2 "" H 4200 3950 60  0001 C CNN
F 3 "" H 4200 3950 60  0001 C CNN
	1    4200 3950
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+3.3VP-power1 #PWR018
U 1 1 5B8113C8
P 4450 2800
F 0 "#PWR018" H 4500 2830 20  0001 C CNN
F 1 "+3.3VP" H 4450 2900 30  0000 C CNN
F 2 "" H 4450 2800 60  0001 C CNN
F 3 "" H 4450 2800 60  0001 C CNN
	1    4450 2800
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+5VD-power1 #PWR05
U 1 1 5B811402
P 3100 2800
F 0 "#PWR05" H 3100 2750 20  0001 C CNN
F 1 "+5VD" H 3100 2900 30  0000 C CNN
F 2 "" H 3100 2800 60  0001 C CNN
F 3 "" H 3100 2800 60  0001 C CNN
	1    3100 2800
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:+5VD-power1 #PWR09
U 1 1 5B811498
P 2950 3950
F 0 "#PWR09" H 2950 3900 20  0001 C CNN
F 1 "+5VD" H 2950 4050 30  0000 C CNN
F 2 "" H 2950 3950 60  0001 C CNN
F 3 "" H 2950 3950 60  0001 C CNN
	1    2950 3950
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:DGND-power1 #PWR06
U 1 1 5B8115C4
P 3100 3700
F 0 "#PWR06" H 3100 3700 40  0001 C CNN
F 1 "DGND" H 3100 3630 40  0000 C CNN
F 2 "" H 3100 3700 60  0001 C CNN
F 3 "" H 3100 3700 60  0001 C CNN
	1    3100 3700
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:DGND-power1 #PWR010
U 1 1 5B8116A8
P 3450 3950
F 0 "#PWR010" H 3450 3950 40  0001 C CNN
F 1 "DGND" H 3450 3880 40  0000 C CNN
F 2 "" H 3450 3950 60  0001 C CNN
F 3 "" H 3450 3950 60  0001 C CNN
	1    3450 3950
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:DGND-power1 #PWR014
U 1 1 5B8116E0
P 4700 3950
F 0 "#PWR014" H 4700 3950 40  0001 C CNN
F 1 "DGND" H 4700 3880 40  0000 C CNN
F 2 "" H 4700 3950 60  0001 C CNN
F 3 "" H 4700 3950 60  0001 C CNN
	1    4700 3950
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:DGND-power1 #PWR016
U 1 1 5B811718
P 4300 3700
F 0 "#PWR016" H 4300 3700 40  0001 C CNN
F 1 "DGND" H 4300 3630 40  0000 C CNN
F 2 "" H 4300 3700 60  0001 C CNN
F 3 "" H 4300 3700 60  0001 C CNN
	1    4300 3700
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:DGND-power1 #PWR019
U 1 1 5B811750
P 5100 3850
F 0 "#PWR019" H 5100 3850 40  0001 C CNN
F 1 "DGND" H 5100 3780 40  0000 C CNN
F 2 "" H 5100 3850 60  0001 C CNN
F 3 "" H 5100 3850 60  0001 C CNN
	1    5100 3850
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.1:CONN_01X09 P6
U 1 1 5B811A3C
P 5500 3350
F 0 "P6" H 5500 3850 50  0000 C CNN
F 1 "A7105" V 5600 3350 50  0000 C CNN
F 2 "Conv_SPI:Pin_Header_Straight_1x09_Pitch2mm" H 5500 3350 50  0001 C CNN
F 3 "" H 5500 3350 50  0000 C CNN
	1    5500 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2950 4450 2950
Connection ~ 4450 2950
Wire Wire Line
	4200 3050 5300 3050
Wire Wire Line
	4450 3450 4650 3250
Wire Wire Line
	4650 3250 5300 3250
Wire Wire Line
	4550 3550 4750 3350
Wire Wire Line
	4750 3350 5300 3350
Wire Wire Line
	5100 3850 5100 3150
Wire Wire Line
	5100 3150 5300 3150
Wire Wire Line
	5300 3550 5250 3550
Wire Wire Line
	5250 3550 5250 3650
Wire Wire Line
	5250 3650 5300 3650
Wire Wire Line
	5300 3750 5200 3750
Wire Wire Line
	5200 3750 5200 3450
Wire Wire Line
	5200 3450 5300 3450
Wire Wire Line
	3100 3350 3200 3350
Wire Wire Line
	3100 3250 3200 3250
Wire Wire Line
	4450 2950 4450 3250
Wire Notes Line
	2200 4100 5700 4100
Wire Notes Line
	2200 2500 2200 4100
Wire Notes Line
	5700 2500 5700 4100
Wire Notes Line
	2200 5900 5800 5900
Wire Notes Line
	5800 4300 5800 5900
Wire Notes Line
	2200 5900 2200 4300
Wire Notes Line
	2200 7700 5800 7700
Wire Notes Line
	5800 6100 5800 7700
Wire Notes Line
	2200 6100 2200 7700
$Comp
L Mega_2560-core-mini_full_2.1:CONN_01X07 P9
U 1 1 60B95E39
P 6650 1550
F 0 "P9" H 6650 1950 50  0000 C CNN
F 1 "SpirfMod" V 6750 1500 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x07_P2.54mm_Vertical" H 6650 1500 50  0001 C CNN
F 3 "" H 6650 1500 50  0000 C CNN
	1    6650 1550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7450 1250 6850 1250
Wire Wire Line
	6850 1350 7450 1350
Wire Wire Line
	6850 1450 7350 1450
Wire Wire Line
	6850 1550 7350 1550
Wire Wire Line
	6850 1650 7450 1650
Wire Wire Line
	7450 1750 6850 1750
Wire Wire Line
	8700 1450 8450 1450
Wire Wire Line
	8450 1550 8550 1550
Wire Wire Line
	8550 1550 8550 1800
Wire Wire Line
	7350 1200 7350 1450
Wire Wire Line
	7350 1800 7350 1550
Connection ~ 7350 1550
Connection ~ 7350 1450
Text Notes 7150 650  0    60   ~ 0
Adaptateur 5v/3,3v SPI pour le RFM95W
$Comp
L Adaptateurs_NiveauxSPI-rescue:C-device C9
U 1 1 60B95E7B
P 7500 2150
F 0 "C9" H 7500 2250 40  0000 L CNN
F 1 "100nF" H 7506 2065 40  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7538 2000 30  0001 C CNN
F 3 "" H 7500 2150 60  0000 C CNN
	1    7500 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7300 2150 7250 2150
Wire Wire Line
	7700 2150 7750 2150
Wire Notes Line
	6450 700  9950 700 
Wire Wire Line
	7350 1550 7450 1550
Wire Wire Line
	7350 1450 7450 1450
Wire Wire Line
	8850 2150 8900 2150
Wire Wire Line
	8450 2150 8400 2150
$Comp
L Adaptateurs_NiveauxSPI-rescue:C-device C10
U 1 1 60B95EF2
P 8650 2150
F 0 "C10" H 8650 2250 40  0000 L CNN
F 1 "100nF" H 8656 2065 40  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 8688 2000 30  0001 C CNN
F 3 "" H 8650 2150 60  0000 C CNN
	1    8650 2150
	0    -1   -1   0   
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:CON_5V_3-3V U5
U 1 1 60B95EFC
P 7950 1500
F 0 "U5" H 7650 1900 40  0000 C CNN
F 1 "CONV_5V/3.3V" H 8050 1900 40  0000 C CNN
F 2 "Conv_SPI:Level_Convertissor_SMD" H 7950 1500 30  0001 C CIN
F 3 "" H 7950 1500 60  0001 C CNN
	1    7950 1500
	-1   0    0    -1  
$EndComp
Wire Notes Line
	6450 2300 9950 2300
Wire Notes Line
	6450 2300 6450 700 
Wire Notes Line
	9950 2300 9950 700 
$Comp
L power:+5VL #PWR0109
U 1 1 60BB7E2D
P 7350 1200
F 0 "#PWR0109" H 7350 1050 50  0001 C CNN
F 1 "+5VL" H 7365 1373 50  0000 C CNN
F 2 "" H 7350 1200 50  0001 C CNN
F 3 "" H 7350 1200 50  0001 C CNN
	1    7350 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR0110
U 1 1 60BBA402
P 8700 1200
F 0 "#PWR0110" H 8700 1050 50  0001 C CNN
F 1 "+3.3VA" H 8715 1373 50  0000 C CNN
F 2 "" H 8700 1200 50  0001 C CNN
F 3 "" H 8700 1200 50  0001 C CNN
	1    8700 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDS #PWR0103
U 1 1 60BF944B
P 7750 2150
F 0 "#PWR0103" H 7750 1900 50  0001 C CNN
F 1 "GNDS" V 7755 2022 50  0000 R CNN
F 2 "" H 7750 2150 50  0001 C CNN
F 3 "" H 7750 2150 50  0001 C CNN
	1    7750 2150
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDS #PWR0105
U 1 1 60BFB386
P 8900 2150
F 0 "#PWR0105" H 8900 1900 50  0001 C CNN
F 1 "GNDS" V 8905 2022 50  0000 R CNN
F 2 "" H 8900 2150 50  0001 C CNN
F 3 "" H 8900 2150 50  0001 C CNN
	1    8900 2150
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDS #PWR0104
U 1 1 60C4018B
P 8550 1800
F 0 "#PWR0104" H 8550 1550 50  0001 C CNN
F 1 "GNDS" H 8650 1650 50  0000 R CNN
F 2 "" H 8550 1800 50  0001 C CNN
F 3 "" H 8550 1800 50  0001 C CNN
	1    8550 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDS #PWR0106
U 1 1 60C56925
P 7350 1800
F 0 "#PWR0106" H 7350 1550 50  0001 C CNN
F 1 "GNDS" H 7450 1650 50  0000 R CNN
F 2 "" H 7350 1800 50  0001 C CNN
F 3 "" H 7350 1800 50  0001 C CNN
	1    7350 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR0102
U 1 1 60C64C40
P 7250 2150
F 0 "#PWR0102" H 7250 2000 50  0001 C CNN
F 1 "+5VL" H 7265 2323 50  0000 C CNN
F 2 "" H 7250 2150 50  0001 C CNN
F 3 "" H 7250 2150 50  0001 C CNN
	1    7250 2150
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3VA #PWR0107
U 1 1 60C66ADB
P 8400 2150
F 0 "#PWR0107" H 8400 2000 50  0001 C CNN
F 1 "+3.3VA" H 8415 2323 50  0000 C CNN
F 2 "" H 8400 2150 50  0001 C CNN
F 3 "" H 8400 2150 50  0001 C CNN
	1    8400 2150
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3VA #PWR0101
U 1 1 60C67F94
P 6850 1850
F 0 "#PWR0101" H 6850 1700 50  0001 C CNN
F 1 "+3.3VA" V 6850 2100 50  0000 C CNN
F 2 "" H 6850 1850 50  0001 C CNN
F 3 "" H 6850 1850 50  0001 C CNN
	1    6850 1850
	0    1    1    0   
$EndComp
Text Notes 7150 2450 0    60   ~ 0
Adaptateur 5v/3,3v SPI pour le MPM 4 en 1
$Comp
L Adaptateurs_NiveauxSPI-rescue:C-device C11
U 1 1 60C7A013
P 7300 4400
F 0 "C11" H 7300 4500 40  0000 L CNN
F 1 "100nF" H 7306 4315 40  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7338 4250 30  0001 C CNN
F 3 "" H 7300 4400 60  0000 C CNN
	1    7300 4400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7100 4400 7050 4400
Wire Wire Line
	7500 4400 7550 4400
Wire Notes Line
	6450 2500 9950 2500
Wire Wire Line
	8850 4400 8900 4400
Wire Wire Line
	8450 4400 8400 4400
$Comp
L Adaptateurs_NiveauxSPI-rescue:C-device C12
U 1 1 60C7A024
P 8650 4400
F 0 "C12" H 8650 4500 40  0000 L CNN
F 1 "100nF" H 8656 4315 40  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 8688 4250 30  0001 C CNN
F 3 "" H 8650 4400 60  0000 C CNN
	1    8650 4400
	0    -1   -1   0   
$EndComp
$Comp
L power:+5F #PWR0114
U 1 1 60C93355
P 7600 2800
F 0 "#PWR0114" H 7600 2650 50  0001 C CNN
F 1 "+5F" H 7615 2973 50  0000 C CNN
F 2 "" H 7600 2800 50  0001 C CNN
F 3 "" H 7600 2800 50  0001 C CNN
	1    7600 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+5F #PWR0115
U 1 1 60C9544F
P 7050 4400
F 0 "#PWR0115" H 7050 4250 50  0001 C CNN
F 1 "+5F" V 7065 4528 50  0000 L CNN
F 2 "" H 7050 4400 50  0001 C CNN
F 3 "" H 7050 4400 50  0001 C CNN
	1    7050 4400
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0116
U 1 1 60C971F2
P 6900 2800
F 0 "#PWR0116" H 6900 2650 50  0001 C CNN
F 1 "+3.3V" H 6915 2973 50  0000 C CNN
F 2 "" H 6900 2800 50  0001 C CNN
F 3 "" H 6900 2800 50  0001 C CNN
	1    6900 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0117
U 1 1 60C99F98
P 8700 2800
F 0 "#PWR0117" H 8700 2650 50  0001 C CNN
F 1 "+3.3V" H 8715 2973 50  0000 C CNN
F 2 "" H 8700 2800 50  0001 C CNN
F 3 "" H 8700 2800 50  0001 C CNN
	1    8700 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0118
U 1 1 60C9AFFA
P 8400 4400
F 0 "#PWR0118" H 8400 4250 50  0001 C CNN
F 1 "+3.3V" V 8415 4528 50  0000 L CNN
F 2 "" H 8400 4400 50  0001 C CNN
F 3 "" H 8400 4400 50  0001 C CNN
	1    8400 4400
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0111
U 1 1 60CA07B9
P 6900 3950
F 0 "#PWR0111" H 6900 3700 50  0001 C CNN
F 1 "GNDREF" H 6905 3777 50  0000 C CNN
F 2 "" H 6900 3950 50  0001 C CNN
F 3 "" H 6900 3950 50  0001 C CNN
	1    6900 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0112
U 1 1 60CA162A
P 8900 4400
F 0 "#PWR0112" H 8900 4150 50  0001 C CNN
F 1 "GNDREF" V 8905 4272 50  0000 R CNN
F 2 "" H 8900 4400 50  0001 C CNN
F 3 "" H 8900 4400 50  0001 C CNN
	1    8900 4400
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0113
U 1 1 60CA2784
P 7550 4400
F 0 "#PWR0113" H 7550 4150 50  0001 C CNN
F 1 "GNDREF" V 7555 4272 50  0000 R CNN
F 2 "" H 7550 4400 50  0001 C CNN
F 3 "" H 7550 4400 50  0001 C CNN
	1    7550 4400
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 60CC0BDD
P 9650 4000
F 0 "J3" H 9600 4200 50  0000 L CNN
F 1 "MPM_4in1" V 9750 3850 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9650 4000 50  0001 C CNN
F 3 "~" H 9650 4000 50  0001 C CNN
	1    9650 4000
	1    0    0    -1  
$EndComp
$Comp
L Adaptateurs_NiveauxSPI-rescue:CONV_5V_3-3V_8 U6
U 1 1 60A06092
P 8150 3200
F 0 "U6" H 8450 3600 40  0000 C CNN
F 1 "CONV_5V_3-3V_8" H 8050 3600 40  0000 C CNN
F 2 "Conv_SPI:Level_Convertissor_8_W10.16mm" H 8150 3610 30  0001 C CIN
F 3 "" H 8150 3200 60  0001 C CNN
	1    8150 3200
	-1   0    0    -1  
$EndComp
Text Label 6950 2950 0    60   ~ 0
CS-CC2500
Text Label 6950 3050 0    60   ~ 0
CS_NRF24L01
Text Label 6950 3150 0    60   ~ 0
CS_CYRF
Text Label 6950 3250 0    60   ~ 0
CS_A7105
Wire Wire Line
	7400 3350 7400 3550
Wire Wire Line
	7400 3550 7650 3550
Text Label 6950 3350 0    60   ~ 0
MISO
Wire Wire Line
	7300 3450 7300 3650
Wire Wire Line
	7300 3650 7650 3650
Text Label 6950 3450 0    60   ~ 0
SCK
Wire Wire Line
	6850 3450 7300 3450
Wire Wire Line
	6850 3350 7400 3350
Wire Wire Line
	6850 3250 7650 3250
Wire Wire Line
	6850 3150 7650 3150
Wire Wire Line
	6850 3050 7650 3050
Wire Wire Line
	6850 2950 7650 2950
Wire Wire Line
	6850 3550 6900 3550
Wire Wire Line
	6900 3550 6900 2800
Wire Wire Line
	6850 3650 7200 3650
Wire Wire Line
	7200 3650 7200 3750
Wire Wire Line
	7200 3750 7650 3750
Text Label 6950 3650 0    60   ~ 0
MOSI
Wire Wire Line
	6850 3750 6900 3750
Wire Wire Line
	6900 3750 6900 3950
Wire Wire Line
	7650 3350 7600 3350
Wire Wire Line
	7600 3350 7600 2800
Wire Wire Line
	7650 3450 7600 3450
Wire Wire Line
	7600 3450 7600 3950
$Comp
L power:GNDREF #PWR0119
U 1 1 60B4A560
P 7600 3950
F 0 "#PWR0119" H 7600 3700 50  0001 C CNN
F 1 "GNDREF" H 7605 3777 50  0000 C CNN
F 2 "" H 7600 3950 50  0001 C CNN
F 3 "" H 7600 3950 50  0001 C CNN
	1    7600 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3350 8700 3350
Wire Wire Line
	8700 3350 8700 2800
Wire Wire Line
	8650 3450 8700 3450
Wire Wire Line
	8700 3450 8700 3950
$Comp
L power:GNDREF #PWR0120
U 1 1 60B66320
P 8700 3950
F 0 "#PWR0120" H 8700 3700 50  0001 C CNN
F 1 "GNDREF" H 8705 3777 50  0000 C CNN
F 2 "" H 8700 3950 50  0001 C CNN
F 3 "" H 8700 3950 50  0001 C CNN
	1    8700 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+5F #PWR0121
U 1 1 60B67615
P 9250 2700
F 0 "#PWR0121" H 9250 2550 50  0001 C CNN
F 1 "+5F" V 9265 2873 50  0000 C CNN
F 2 "" H 9250 2700 50  0001 C CNN
F 3 "" H 9250 2700 50  0001 C CNN
	1    9250 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8650 3150 8750 3150
Wire Wire Line
	8750 3150 8750 2800
Wire Wire Line
	8650 3650 8800 3650
Wire Wire Line
	8800 3650 8800 3000
Wire Wire Line
	9400 3100 9400 3200
$Comp
L power:GNDREF #PWR0122
U 1 1 60BA0B2E
P 9400 3650
F 0 "#PWR0122" H 9400 3400 50  0001 C CNN
F 1 "GNDREF" H 9600 3600 50  0000 C CNN
F 2 "" H 9400 3650 50  0001 C CNN
F 3 "" H 9400 3650 50  0001 C CNN
	1    9400 3650
	1    0    0    -1  
$EndComp
Connection ~ 9400 3200
Wire Wire Line
	9400 3200 9400 3650
Wire Wire Line
	8850 3400 8850 3750
Wire Wire Line
	8850 3750 8650 3750
Wire Wire Line
	8650 3550 8900 3550
Wire Wire Line
	8900 3600 8900 3550
Wire Wire Line
	9450 3900 8950 3900
Wire Wire Line
	8950 3900 8950 3050
Wire Wire Line
	8950 3050 8650 3050
Wire Wire Line
	9450 4000 9000 4000
Wire Wire Line
	9000 4000 9000 2950
Wire Wire Line
	9000 2950 8650 2950
Wire Wire Line
	9450 4100 9050 4100
Wire Wire Line
	9050 4100 9050 3250
Wire Wire Line
	9050 3250 8650 3250
$Comp
L Connector_Generic:Conn_01x10 P10
U 1 1 60A2F00D
P 6650 3350
F 0 "P10" H 6550 3850 50  0000 L CNN
F 1 "SpirfMod" V 6750 3100 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 6650 3350 50  0001 C CNN
F 3 "~" H 6650 3350 50  0001 C CNN
	1    6650 3350
	-1   0    0    -1  
$EndComp
$Comp
L power:+5F #PWR0108
U 1 1 60A55036
P 7000 3850
F 0 "#PWR0108" H 7000 3700 50  0001 C CNN
F 1 "+5F" V 7015 4023 50  0000 C CNN
F 2 "" H 7000 3850 50  0001 C CNN
F 3 "" H 7000 3850 50  0001 C CNN
	1    7000 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 3850 6850 3850
Wire Notes Line
	6450 4550 9950 4550
Wire Notes Line
	9950 2500 9950 4550
Wire Notes Line
	6450 2500 6450 4550
Text Label 9100 2800 0    39   ~ 0
CYRF
Text Label 9100 3900 0    39   ~ 0
24L01
Text Label 9100 4000 0    39   ~ 0
CC2500
Wire Wire Line
	9450 3400 8850 3400
Wire Wire Line
	9450 3200 9400 3200
Wire Wire Line
	9450 3100 9400 3100
Wire Wire Line
	8800 3000 9450 3000
Wire Wire Line
	8750 2800 9450 2800
Wire Wire Line
	8900 3600 9450 3600
Wire Wire Line
	9250 2700 9450 2700
$Comp
L Connector_Generic:Conn_01x10 J2
U 1 1 60CBD38F
P 9650 3100
F 0 "J2" H 9600 3600 50  0000 L CNN
F 1 "MPM_ 4en1" V 9750 2850 50  0000 L CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_2x05_P2.00mm_Vertical" H 9650 3100 50  0001 C CNN
F 3 "~" H 9650 3100 50  0001 C CNN
	1    9650 3100
	1    0    0    -1  
$EndComp
Text Label 9100 4100 0    39   ~ 0
A7105
Text Label 9100 3400 0    39   ~ 0
MOSI_L
Text Label 9100 3600 0    39   ~ 0
MISO_L
Text Label 9100 3000 0    39   ~ 0
SCK_L
$Comp
L Connector_Generic:Conn_01x16 J1
U 1 1 60B89EB5
P 9700 1450
F 0 "J1" H 9800 2150 50  0000 L CNN
F 1 "RFM95W" V 9800 1300 50  0000 L CNN
F 2 "Conv_SPI:RFM95W" H 9700 1450 50  0001 C CNN
F 3 "~" H 9700 1450 50  0001 C CNN
	1    9700 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 2250 9450 2250
$Comp
L power:GNDS #PWR0123
U 1 1 60BBD105
P 9400 2250
F 0 "#PWR0123" H 9400 2000 50  0001 C CNN
F 1 "GNDS" V 9405 2122 50  0000 R CNN
F 2 "" H 9400 2250 50  0001 C CNN
F 3 "" H 9400 2250 50  0001 C CNN
	1    9400 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	8700 1200 8700 1450
Wire Wire Line
	9450 2250 9450 1550
Wire Wire Line
	9450 850  9500 850 
Connection ~ 9450 2250
Wire Wire Line
	9450 2250 9400 2250
Wire Wire Line
	9500 1550 9450 1550
Connection ~ 9450 1550
Wire Wire Line
	9450 1550 9450 850 
Wire Wire Line
	8800 1950 8800 1750
Wire Wire Line
	8800 1750 8450 1750
Wire Wire Line
	8800 1950 9500 1950
Wire Wire Line
	8900 1850 8900 1650
Wire Wire Line
	8900 1650 8450 1650
Wire Wire Line
	8900 1850 9500 1850
Wire Wire Line
	9000 1750 9000 1350
Wire Wire Line
	9000 1350 8450 1350
Wire Wire Line
	9000 1750 9500 1750
Wire Wire Line
	9100 1650 9100 1250
Wire Wire Line
	9100 1250 8450 1250
Wire Wire Line
	9100 1650 9500 1650
Wire Wire Line
	9500 1150 9300 1150
Wire Wire Line
	9300 1150 9300 1100
$Comp
L power:+3.3VA #PWR0124
U 1 1 60CA706D
P 9300 1100
F 0 "#PWR0124" H 9300 950 50  0001 C CNN
F 1 "+3.3VA" H 9315 1273 50  0000 C CNN
F 2 "" H 9300 1100 50  0001 C CNN
F 3 "" H 9300 1100 50  0001 C CNN
	1    9300 1100
	1    0    0    -1  
$EndComp
Text Notes 9150 1950 0    39   ~ 0
NSS
Text Notes 9150 1850 0    39   ~ 0
SCK
Text Notes 9150 1750 0    39   ~ 0
MOSI
Text Notes 9150 1650 0    39   ~ 0
MISO
Text Notes 6900 1750 0    39   ~ 0
CS_CYRF
Text Notes 6900 1650 0    39   ~ 0
SCK
Text Notes 6900 1350 0    39   ~ 0
MOSI
Text Notes 6900 1250 0    39   ~ 0
MISO
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 60D218B3
P 8850 750
F 0 "J4" H 9000 750 50  0000 C CNN
F 1 "SMA" H 9000 650 50  0000 C CNN
F 2 "Conv_SPI:SMA_Amphenol_132289_EdgeMount" H 8850 750 50  0001 C CNN
F 3 "~" H 8850 750 50  0001 C CNN
	1    8850 750 
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDS #PWR0125
U 1 1 60D2420F
P 9100 950
F 0 "#PWR0125" H 9100 700 50  0001 C CNN
F 1 "GNDS" H 9200 800 50  0000 R CNN
F 2 "" H 9100 950 50  0001 C CNN
F 3 "" H 9100 950 50  0001 C CNN
	1    9100 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 750  9050 750 
Wire Wire Line
	9050 850  9100 850 
Wire Wire Line
	9100 850  9100 950 
$EndSCHEMATC
