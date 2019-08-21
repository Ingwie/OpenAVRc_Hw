EESchema Schematic File Version 4
LIBS:Mega_2560 core mini_full_2.2-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 7
Title "Shield Mega2560 core Full"
Date "2019-08-21"
Rev "2.2"
Comp "© Team OpenAVRc"
Comment1 "Reproduction et commercialisation interdite"
Comment2 "By Antho.breizh / pierrotm777"
Comment3 ""
Comment4 "Shield pour RC OpenAVRc"
$EndDescr
Text Label 2450 5800 1    60   ~ 0
Stick_RHcon
Text Label 2550 5800 1    60   ~ 0
Stick_RVcon
Text Label 1400 5800 1    60   ~ 0
Stick_LVcon
Text Label 1500 5800 1    60   ~ 0
Stick_LHcon
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C9
U 1 1 59C5C005
P 1850 5200
F 0 "C9" H 1875 5300 50  0000 L CNN
F 1 "100nF" H 1875 5100 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 1888 5050 50  0001 C CNN
F 3 "" H 1850 5200 50  0000 C CNN
	1    1850 5200
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C11
U 1 1 59C5C00C
P 1850 4900
F 0 "C11" H 1875 5000 50  0000 L CNN
F 1 "100nF" H 1875 4800 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 1888 4750 50  0001 C CNN
F 3 "" H 1850 4900 50  0000 C CNN
	1    1850 4900
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C16
U 1 1 59C5C013
P 2900 5200
F 0 "C16" H 2925 5300 50  0000 L CNN
F 1 "100nF" H 2925 5100 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 2938 5050 50  0001 C CNN
F 3 "" H 2900 5200 50  0000 C CNN
	1    2900 5200
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C17
U 1 1 59C5C01A
P 2900 4900
F 0 "C17" H 2925 5000 50  0000 L CNN
F 1 "100nF" H 2925 4800 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 2938 4750 50  0001 C CNN
F 3 "" H 2900 4900 50  0000 C CNN
	1    2900 4900
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR04
U 1 1 59C5C021
P 1600 4650
F 0 "#PWR04" H 1600 4400 50  0001 C CNN
F 1 "GND" H 1600 4500 50  0000 C CNN
F 2 "" H 1600 4650 50  0000 C CNN
F 3 "" H 1600 4650 50  0000 C CNN
	1    1600 4650
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR05
U 1 1 59C5C027
P 2650 4650
F 0 "#PWR05" H 2650 4400 50  0001 C CNN
F 1 "GND" H 2650 4500 50  0000 C CNN
F 2 "" H 2650 4650 50  0000 C CNN
F 3 "" H 2650 4650 50  0000 C CNN
	1    2650 4650
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:MCP6004-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue U6
U 2 1 59C5C02D
P 6100 4500
F 0 "U6" H 6100 4700 50  0000 L CNN
F 1 "MCP6004" H 6100 4300 50  0000 L CNN
F 2 "Librairie master:SOP14" H 6050 4600 50  0001 C CNN
F 3 "" H 6150 4700 50  0000 C CNN
	2    6100 4500
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:MCP6004-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue U6
U 4 1 59C5C034
P 9500 4550
F 0 "U6" H 9500 4750 50  0000 L CNN
F 1 "MCP6004" H 9500 4350 50  0000 L CNN
F 2 "Librairie master:SOP14" H 9450 4650 50  0001 C CNN
F 3 "" H 9550 4750 50  0000 C CNN
	4    9500 4550
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:MCP6004-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue U6
U 3 1 59C5C03B
P 7800 4500
F 0 "U6" H 7800 4700 50  0000 L CNN
F 1 "MCP6004" H 7800 4300 50  0000 L CNN
F 2 "Librairie master:SOP14" H 7750 4600 50  0001 C CNN
F 3 "" H 7850 4700 50  0000 C CNN
	3    7800 4500
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:MCP6004-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue U6
U 1 1 59C5C042
P 4400 4500
F 0 "U6" H 4400 4700 50  0000 L CNN
F 1 "MCP6004" H 4400 4300 50  0000 L CNN
F 2 "Librairie master:SOP14" H 4350 4600 50  0001 C CNN
F 3 "" H 4450 4700 50  0000 C CNN
	1    4400 4500
	0    -1   -1   0   
$EndComp
$Comp
L power1:VCC #PWR06
U 1 1 59C5C049
P 9200 4650
F 0 "#PWR06" H 9200 4500 50  0001 C CNN
F 1 "VCC" H 9200 4800 50  0000 C CNN
F 2 "" H 9200 4650 50  0000 C CNN
F 3 "" H 9200 4650 50  0000 C CNN
	1    9200 4650
	0    -1   -1   0   
$EndComp
$Comp
L power1:VCC #PWR07
U 1 1 59C5C04F
P 4000 4200
F 0 "#PWR07" H 4000 4050 50  0001 C CNN
F 1 "VCC" H 4000 4350 50  0000 C CNN
F 2 "" H 4000 4200 50  0000 C CNN
F 3 "" H 4000 4200 50  0000 C CNN
	1    4000 4200
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R26
U 1 1 59C5C055
P 4950 5350
F 0 "R26" V 5030 5350 50  0000 C CNN
F 1 "47K" V 4950 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 4880 5350 50  0001 C CNN
F 3 "" H 4950 5350 50  0000 C CNN
	1    4950 5350
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R28
U 1 1 59C5C05C
P 5150 5350
F 0 "R28" V 5230 5350 50  0000 C CNN
F 1 "120K" V 5150 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 5080 5350 50  0001 C CNN
F 3 "" H 5150 5350 50  0000 C CNN
	1    5150 5350
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR08
U 1 1 59C5C063
P 5350 5800
F 0 "#PWR08" H 5350 5550 50  0001 C CNN
F 1 "GND" H 5350 5600 50  0000 C CNN
F 2 "" H 5350 5800 50  0000 C CNN
F 3 "" H 5350 5800 50  0000 C CNN
	1    5350 5800
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR09
U 1 1 59C5C069
P 4700 4600
F 0 "#PWR09" H 4700 4350 50  0001 C CNN
F 1 "GND" H 4700 4400 50  0000 C CNN
F 2 "" H 4700 4600 50  0000 C CNN
F 3 "" H 4700 4600 50  0000 C CNN
	1    4700 4600
	1    0    0    -1  
$EndComp
$Comp
L power1:VCC #PWR010
U 1 1 59C5C06F
P 5800 4600
F 0 "#PWR010" H 5800 4450 50  0001 C CNN
F 1 "VCC" H 5800 4750 50  0000 C CNN
F 2 "" H 5800 4600 50  0000 C CNN
F 3 "" H 5800 4600 50  0000 C CNN
	1    5800 4600
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR011
U 1 1 59C5C075
P 6400 4600
F 0 "#PWR011" H 6400 4350 50  0001 C CNN
F 1 "GND" H 6400 4400 50  0000 C CNN
F 2 "" H 6400 4600 50  0000 C CNN
F 3 "" H 6400 4600 50  0000 C CNN
	1    6400 4600
	1    0    0    -1  
$EndComp
$Comp
L power1:VCC #PWR012
U 1 1 59C5C07B
P 7500 4600
F 0 "#PWR012" H 7500 4450 50  0001 C CNN
F 1 "VCC" H 7500 4750 50  0000 C CNN
F 2 "" H 7500 4600 50  0000 C CNN
F 3 "" H 7500 4600 50  0000 C CNN
	1    7500 4600
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR013
U 1 1 59C5C081
P 8100 4600
F 0 "#PWR013" H 8100 4350 50  0001 C CNN
F 1 "GND" H 8100 4400 50  0000 C CNN
F 2 "" H 8100 4600 50  0000 C CNN
F 3 "" H 8100 4600 50  0000 C CNN
	1    8100 4600
	1    0    0    -1  
$EndComp
Text Label 4950 6100 1    60   ~ 0
Stick_RHcon
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C43
U 1 1 59C5C089
P 5400 4600
F 0 "C43" H 5425 4700 50  0000 L CNN
F 1 "22nF" H 5425 4500 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 5438 4450 50  0001 C CNN
F 3 "" H 5400 4600 50  0000 C CNN
	1    5400 4600
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C44
U 1 1 59C5C090
P 7100 4600
F 0 "C44" H 7125 4700 50  0000 L CNN
F 1 "22nF" H 7125 4500 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 7138 4450 50  0001 C CNN
F 3 "" H 7100 4600 50  0000 C CNN
	1    7100 4600
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:POT-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue RV2
U 1 1 59C5C097
P 5350 5550
F 0 "RV2" V 5250 5550 50  0000 C CNN
F 1 "100K" V 5350 5550 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Bourns_3296W_3-8Zoll_Inline_ScrewUp" H 5350 5550 50  0001 C CNN
F 3 "" H 5350 5550 50  0000 C CNN
	1    5350 5550
	-1   0    0    1   
$EndComp
$Comp
L power1:VCC #PWR014
U 1 1 59C5C09E
P 5350 5400
F 0 "#PWR014" H 5350 5250 50  0001 C CNN
F 1 "VCC" H 5350 5550 50  0000 C CNN
F 2 "" H 5350 5400 50  0000 C CNN
F 3 "" H 5350 5400 50  0000 C CNN
	1    5350 5400
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R29
U 1 1 59C5C0A4
P 6650 5350
F 0 "R29" V 6730 5350 50  0000 C CNN
F 1 "47K" V 6650 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 6580 5350 50  0001 C CNN
F 3 "" H 6650 5350 50  0000 C CNN
	1    6650 5350
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R31
U 1 1 59C5C0AB
P 6850 5350
F 0 "R31" V 6930 5350 50  0000 C CNN
F 1 "120K" V 6850 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 6780 5350 50  0001 C CNN
F 3 "" H 6850 5350 50  0000 C CNN
	1    6850 5350
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR015
U 1 1 59C5C0B2
P 7050 5800
F 0 "#PWR015" H 7050 5550 50  0001 C CNN
F 1 "GND" H 7050 5600 50  0000 C CNN
F 2 "" H 7050 5800 50  0000 C CNN
F 3 "" H 7050 5800 50  0000 C CNN
	1    7050 5800
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:POT-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue RV3
U 1 1 59C5C0B8
P 7050 5550
F 0 "RV3" V 6950 5550 50  0000 C CNN
F 1 "100K" V 7050 5550 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Bourns_3296W_3-8Zoll_Inline_ScrewUp" H 7050 5550 50  0001 C CNN
F 3 "" H 7050 5550 50  0000 C CNN
	1    7050 5550
	-1   0    0    1   
$EndComp
$Comp
L power1:VCC #PWR016
U 1 1 59C5C0BF
P 7050 5400
F 0 "#PWR016" H 7050 5250 50  0001 C CNN
F 1 "VCC" H 7050 5550 50  0000 C CNN
F 2 "" H 7050 5400 50  0000 C CNN
F 3 "" H 7050 5400 50  0000 C CNN
	1    7050 5400
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C45
U 1 1 59C5C0C5
P 8800 4650
F 0 "C45" H 8825 4750 50  0000 L CNN
F 1 "22nF" H 8825 4550 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 8838 4500 50  0001 C CNN
F 3 "" H 8800 4650 50  0000 C CNN
	1    8800 4650
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R32
U 1 1 59C5C0CC
P 8350 5350
F 0 "R32" V 8430 5350 50  0000 C CNN
F 1 "47K" V 8350 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 8280 5350 50  0001 C CNN
F 3 "" H 8350 5350 50  0000 C CNN
	1    8350 5350
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R34
U 1 1 59C5C0D3
P 8550 5350
F 0 "R34" V 8630 5350 50  0000 C CNN
F 1 "120K" V 8550 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 8480 5350 50  0001 C CNN
F 3 "" H 8550 5350 50  0000 C CNN
	1    8550 5350
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR017
U 1 1 59C5C0DA
P 8750 5800
F 0 "#PWR017" H 8750 5550 50  0001 C CNN
F 1 "GND" H 8750 5600 50  0000 C CNN
F 2 "" H 8750 5800 50  0000 C CNN
F 3 "" H 8750 5800 50  0000 C CNN
	1    8750 5800
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:POT-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue RV4
U 1 1 59C5C0E0
P 8750 5550
F 0 "RV4" V 8650 5550 50  0000 C CNN
F 1 "100K" V 8750 5550 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Bourns_3296W_3-8Zoll_Inline_ScrewUp" H 8750 5550 50  0001 C CNN
F 3 "" H 8750 5550 50  0000 C CNN
	1    8750 5550
	-1   0    0    1   
$EndComp
$Comp
L power1:VCC #PWR018
U 1 1 59C5C0E7
P 8750 5400
F 0 "#PWR018" H 8750 5250 50  0001 C CNN
F 1 "VCC" H 8750 5550 50  0000 C CNN
F 2 "" H 8750 5400 50  0000 C CNN
F 3 "" H 8750 5400 50  0000 C CNN
	1    8750 5400
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR019
U 1 1 59C5C0ED
P 9800 4650
F 0 "#PWR019" H 9800 4400 50  0001 C CNN
F 1 "GND" H 9800 4450 50  0000 C CNN
F 2 "" H 9800 4650 50  0000 C CNN
F 3 "" H 9800 4650 50  0000 C CNN
	1    9800 4650
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C46
U 1 1 59C5C0F3
P 10500 4700
F 0 "C46" H 10525 4800 50  0000 L CNN
F 1 "22nF" H 10525 4600 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 10538 4550 50  0001 C CNN
F 3 "" H 10500 4700 50  0000 C CNN
	1    10500 4700
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R35
U 1 1 59C5C0FA
P 10050 5400
F 0 "R35" V 10130 5400 50  0000 C CNN
F 1 "47K" V 10050 5400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 9980 5400 50  0001 C CNN
F 3 "" H 10050 5400 50  0000 C CNN
	1    10050 5400
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R37
U 1 1 59C5C101
P 10250 5400
F 0 "R37" V 10330 5400 50  0000 C CNN
F 1 "120K" V 10250 5400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 10180 5400 50  0001 C CNN
F 3 "" H 10250 5400 50  0000 C CNN
	1    10250 5400
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR020
U 1 1 59C5C108
P 10450 5850
F 0 "#PWR020" H 10450 5600 50  0001 C CNN
F 1 "GND" H 10450 5650 50  0000 C CNN
F 2 "" H 10450 5850 50  0000 C CNN
F 3 "" H 10450 5850 50  0000 C CNN
	1    10450 5850
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:POT-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue RV5
U 1 1 59C5C10E
P 10450 5600
F 0 "RV5" V 10350 5600 50  0000 C CNN
F 1 "100K" V 10450 5600 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Bourns_3296W_3-8Zoll_Inline_ScrewUp" H 10450 5600 50  0001 C CNN
F 3 "" H 10450 5600 50  0000 C CNN
	1    10450 5600
	-1   0    0    1   
$EndComp
$Comp
L power1:VCC #PWR021
U 1 1 59C5C115
P 10450 5450
F 0 "#PWR021" H 10450 5300 50  0001 C CNN
F 1 "VCC" H 10450 5600 50  0000 C CNN
F 2 "" H 10450 5450 50  0000 C CNN
F 3 "" H 10450 5450 50  0000 C CNN
	1    10450 5450
	1    0    0    -1  
$EndComp
Text Label 6650 6100 1    60   ~ 0
Stick_RVcon
Text Label 8350 6100 1    60   ~ 0
Stick_LVcon
Text Label 10050 6150 1    60   ~ 0
Stick_LHcon
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R24
U 1 1 59C5C121
P 3550 5550
F 0 "R24" V 3630 5550 50  0000 C CNN
F 1 "39K" V 3550 5550 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 3480 5550 50  0001 C CNN
F 3 "" H 3550 5550 50  0000 C CNN
	1    3550 5550
	-1   0    0    1   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C42
U 1 1 59C5C128
P 3750 5250
F 0 "C42" H 3775 5350 50  0000 L CNN
F 1 "6.8nF" H 3750 5100 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3788 5100 50  0001 C CNN
F 3 "" H 3750 5250 50  0000 C CNN
	1    3750 5250
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R25
U 1 1 59C5C12F
P 4000 5250
F 0 "R25" V 4080 5250 50  0000 C CNN
F 1 "39K" V 4000 5250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 3930 5250 50  0001 C CNN
F 3 "" H 4000 5250 50  0000 C CNN
	1    4000 5250
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR022
U 1 1 59C5C136
P 4000 5800
F 0 "#PWR022" H 4000 5550 50  0001 C CNN
F 1 "GND" H 4000 5600 50  0000 C CNN
F 2 "" H 4000 5800 50  0000 C CNN
F 3 "" H 4000 5800 50  0000 C CNN
	1    4000 5800
	1    0    0    -1  
$EndComp
Text Notes 2300 3950 2    60   ~ 0
Stick control
Text Notes 5900 3350 0    60   Italic 0
Option Amplification des manches (Fonctionne sans)
$Comp
L Mega_2560-core-mini_full_2.2-rescue:TEST_2P-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue W1
U 1 1 59C5C13E
P 4900 4600
F 0 "W1" H 4900 4660 50  0000 C CNN
F 1 "TEST_2P" H 4900 4530 50  0000 C CNN
F 2 "anthoperso:TESTPT" H 4900 4600 50  0001 C CNN
F 3 "" H 4900 4600 50  0000 C CNN
	1    4900 4600
	0    1    1    0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:TEST_2P-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue W2
U 1 1 59C5C145
P 6600 4600
F 0 "W2" H 6600 4660 50  0000 C CNN
F 1 "TEST_2P" H 6600 4530 50  0000 C CNN
F 2 "anthoperso:TESTPT" H 6600 4600 50  0001 C CNN
F 3 "" H 6600 4600 50  0000 C CNN
	1    6600 4600
	0    1    1    0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:TEST_2P-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue W3
U 1 1 59C5C14C
P 8300 4600
F 0 "W3" H 8300 4660 50  0000 C CNN
F 1 "TEST_2P" H 8300 4530 50  0000 C CNN
F 2 "anthoperso:TESTPT" H 8300 4600 50  0001 C CNN
F 3 "" H 8300 4600 50  0000 C CNN
	1    8300 4600
	0    1    1    0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:TEST_2P-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue W4
U 1 1 59C5C153
P 10000 4650
F 0 "W4" H 10000 4710 50  0000 C CNN
F 1 "TEST_2P" H 10000 4580 50  0000 C CNN
F 2 "anthoperso:TESTPT" H 10000 4650 50  0001 C CNN
F 3 "" H 10000 4650 50  0000 C CNN
	1    10000 4650
	0    1    1    0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:POT-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R27
U 1 1 59C5C15A
P 5150 4350
F 0 "R27" V 5050 4350 50  0000 C CNN
F 1 "100K" V 5150 4350 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3296W" H 5150 4350 50  0001 C CNN
F 3 "" H 5150 4350 50  0000 C CNN
	1    5150 4350
	-1   0    0    1   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R11
U 1 1 59C5C161
P 5150 4800
F 0 "R11" V 5230 4800 50  0000 C CNN
F 1 "68K" V 5150 4800 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 5080 4800 50  0001 C CNN
F 3 "" H 5150 4800 50  0000 C CNN
	1    5150 4800
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:POT-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R30
U 1 1 59C5C168
P 6850 4350
F 0 "R30" V 6750 4350 50  0000 C CNN
F 1 "100K" V 6850 4350 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3296W" H 6850 4350 50  0001 C CNN
F 3 "" H 6850 4350 50  0000 C CNN
	1    6850 4350
	-1   0    0    1   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R12
U 1 1 59C5C16F
P 6850 4800
F 0 "R12" V 6930 4800 50  0000 C CNN
F 1 "68K" V 6850 4800 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 6780 4800 50  0001 C CNN
F 3 "" H 6850 4800 50  0000 C CNN
	1    6850 4800
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:POT-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R33
U 1 1 59C5C176
P 8550 4350
F 0 "R33" V 8450 4350 50  0000 C CNN
F 1 "100K" V 8550 4350 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3296W" H 8550 4350 50  0001 C CNN
F 3 "" H 8550 4350 50  0000 C CNN
	1    8550 4350
	-1   0    0    1   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:POT-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R36
U 1 1 59C5C17D
P 10250 4400
F 0 "R36" V 10150 4400 50  0000 C CNN
F 1 "100K" V 10250 4400 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3296W" H 10250 4400 50  0001 C CNN
F 3 "" H 10250 4400 50  0000 C CNN
	1    10250 4400
	-1   0    0    1   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R13
U 1 1 59C5C184
P 8550 4800
F 0 "R13" V 8630 4800 50  0000 C CNN
F 1 "68K" V 8550 4800 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 8480 4800 50  0001 C CNN
F 3 "" H 8550 4800 50  0000 C CNN
	1    8550 4800
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R14
U 1 1 59C5C18B
P 10250 4900
F 0 "R14" V 10330 4900 50  0000 C CNN
F 1 "68K" V 10250 4900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 10180 4900 50  0001 C CNN
F 3 "" H 10250 4900 50  0000 C CNN
	1    10250 4900
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C4
U 1 1 59C5C192
P 3700 4450
F 0 "C4" H 3725 4550 50  0000 L CNN
F 1 "100nF" H 3725 4350 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3738 4300 50  0001 C CNN
F 3 "" H 3700 4450 50  0000 C CNN
	1    3700 4450
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR023
U 1 1 59C5C199
P 3700 4700
F 0 "#PWR023" H 3700 4450 50  0001 C CNN
F 1 "GND" H 3700 4500 50  0000 C CNN
F 2 "" H 3700 4700 50  0000 C CNN
F 3 "" H 3700 4700 50  0000 C CNN
	1    3700 4700
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X03-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue P28
U 1 1 59C5C19F
P 2950 5550
F 0 "P28" H 2950 5750 50  0000 C CNN
F 1 "5v/3,3v manches" V 3050 5600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 2950 5550 50  0001 C CNN
F 3 "" H 2950 5550 50  0000 C CNN
	1    2950 5550
	0    -1   -1   0   
$EndComp
$Comp
L power1:VCC #PWR024
U 1 1 59C5C1A6
P 2850 5850
F 0 "#PWR024" H 2850 5700 50  0001 C CNN
F 1 "VCC" H 2850 6000 50  0000 C CNN
F 2 "" H 2850 5850 50  0000 C CNN
F 3 "" H 2850 5850 50  0000 C CNN
	1    2850 5850
	-1   0    0    1   
$EndComp
Text Label 1200 6050 1    60   ~ 0
Power_manches
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X06-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue P13
U 1 1 59C5C1AE
P 2500 4350
F 0 "P13" H 2500 4700 50  0000 C CNN
F 1 "Stick_right" V 2600 4350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 2500 4350 50  0001 C CNN
F 3 "" H 2500 4350 50  0000 C CNN
	1    2500 4350
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X06-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue P12
U 1 1 59C5C1B5
P 1450 4350
F 0 "P12" H 1450 4700 50  0000 C CNN
F 1 "Stick_left" V 1550 4350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 1450 4350 50  0001 C CNN
F 3 "" H 1450 4350 50  0000 C CNN
	1    1450 4350
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR025
U 1 1 59C5C1BC
P 3100 4900
F 0 "#PWR025" H 3100 4650 50  0001 C CNN
F 1 "GND" H 3100 4750 50  0000 C CNN
F 2 "" H 3100 4900 50  0000 C CNN
F 3 "" H 3100 4900 50  0000 C CNN
	1    3100 4900
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR026
U 1 1 59C5C1C2
P 3100 5200
F 0 "#PWR026" H 3100 4950 50  0001 C CNN
F 1 "GND" H 3100 5050 50  0000 C CNN
F 2 "" H 3100 5200 50  0000 C CNN
F 3 "" H 3100 5200 50  0000 C CNN
	1    3100 5200
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR027
U 1 1 59C5C1C8
P 2050 4900
F 0 "#PWR027" H 2050 4650 50  0001 C CNN
F 1 "GND" H 2050 4750 50  0000 C CNN
F 2 "" H 2050 4900 50  0000 C CNN
F 3 "" H 2050 4900 50  0000 C CNN
	1    2050 4900
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR028
U 1 1 59C5C1CE
P 2050 5200
F 0 "#PWR028" H 2050 4950 50  0001 C CNN
F 1 "GND" H 2050 5050 50  0000 C CNN
F 2 "" H 2050 5200 50  0000 C CNN
F 3 "" H 2050 5200 50  0000 C CNN
	1    2050 5200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2350 4650 2350 4550
Wire Wire Line
	1300 4650 1300 4550
Wire Notes Line
	3350 3200 10850 3200
Wire Notes Line
	3350 3200 3350 6250
Wire Notes Line
	3350 4100 950  4100
Wire Notes Line
	950  6250 10850 6250
Wire Notes Line
	950  4100 950  6250
Wire Notes Line
	10850 6250 10850 3200
Connection ~ 4000 5500
Wire Wire Line
	4000 5400 4000 5500
Wire Wire Line
	3750 5500 4000 5500
Wire Wire Line
	3750 5400 3750 5500
Connection ~ 4000 5000
Wire Wire Line
	3750 5100 3750 5000
Wire Wire Line
	4000 5000 4000 5100
Wire Wire Line
	4000 4600 4100 4600
Wire Wire Line
	4000 4200 4000 4250
Wire Wire Line
	9400 5000 9400 4850
Wire Wire Line
	3750 5000 4000 5000
Connection ~ 7700 5000
Wire Wire Line
	7700 5000 7700 4800
Connection ~ 6000 5000
Wire Wire Line
	6000 5000 6000 4800
Connection ~ 4300 5000
Wire Wire Line
	4300 5000 4300 4800
Connection ~ 6100 4100
Connection ~ 4400 4100
Connection ~ 7800 4100
Connection ~ 9500 4150
Wire Wire Line
	9600 5150 9600 4850
Wire Wire Line
	9600 5150 10050 5150
Connection ~ 10250 4150
Wire Wire Line
	10500 4150 10500 4550
Connection ~ 10050 5150
Connection ~ 10250 5150
Wire Wire Line
	10050 5550 10050 6150
Wire Wire Line
	10050 5250 10050 5150
Wire Wire Line
	10450 5850 10450 5750
Wire Wire Line
	10250 5600 10250 5550
Wire Wire Line
	10300 5600 10250 5600
Wire Wire Line
	10500 5150 10500 4850
Wire Wire Line
	9500 4150 10000 4150
Wire Wire Line
	7900 5100 7900 4800
Wire Wire Line
	7900 5100 8350 5100
Connection ~ 8550 4100
Wire Wire Line
	8800 4100 8800 4500
Connection ~ 8350 5100
Connection ~ 8550 5100
Wire Wire Line
	8350 5500 8350 6100
Wire Wire Line
	8350 5200 8350 5100
Wire Wire Line
	8750 5800 8750 5700
Wire Wire Line
	8550 5550 8550 5500
Wire Wire Line
	8600 5550 8550 5550
Wire Wire Line
	8800 5100 8800 4800
Connection ~ 6650 5100
Connection ~ 6850 5100
Wire Wire Line
	6650 5500 6650 6100
Wire Wire Line
	6650 5200 6650 5100
Wire Wire Line
	7050 5800 7050 5700
Wire Wire Line
	6850 5550 6850 5500
Wire Wire Line
	6900 5550 6850 5550
Wire Wire Line
	4950 5500 4950 6100
Connection ~ 4950 5100
Wire Wire Line
	4950 5200 4950 5100
Wire Wire Line
	5350 5800 5350 5700
Wire Wire Line
	5150 5550 5150 5500
Wire Wire Line
	5200 5550 5150 5550
Connection ~ 5150 5100
Connection ~ 5150 4100
Wire Wire Line
	5400 4100 5400 4450
Wire Wire Line
	5400 5100 5400 4750
Connection ~ 6850 4100
Wire Wire Line
	7100 4100 7100 4450
Wire Wire Line
	7100 5100 7100 4750
Wire Wire Line
	7800 3900 7800 4100
Wire Wire Line
	7800 4100 8300 4100
Wire Wire Line
	6100 3900 6100 4100
Wire Wire Line
	6100 4100 6600 4100
Wire Wire Line
	6200 5100 6650 5100
Wire Wire Line
	6200 4800 6200 5100
Wire Wire Line
	4400 3900 4400 4100
Wire Wire Line
	4400 4100 4900 4100
Wire Wire Line
	4500 5100 4950 5100
Wire Wire Line
	4500 4800 4500 5100
Wire Wire Line
	9500 3950 9500 4150
Wire Wire Line
	1500 4550 1500 4900
Wire Wire Line
	1400 4550 1400 5200
Wire Wire Line
	2550 4550 2550 4900
Wire Wire Line
	2450 4550 2450 5200
Wire Wire Line
	4900 4100 4900 4400
Connection ~ 4900 4100
Wire Wire Line
	4850 5500 4950 5500
Wire Wire Line
	4900 4800 4850 4900
Wire Wire Line
	4850 4900 4850 5500
Connection ~ 4950 5500
Connection ~ 6600 4100
Wire Wire Line
	6600 4100 6600 4400
Wire Wire Line
	6600 4800 6550 4900
Wire Wire Line
	6550 4900 6550 5500
Wire Wire Line
	6550 5500 6650 5500
Connection ~ 6650 5500
Connection ~ 8300 4100
Wire Wire Line
	8300 4100 8300 4400
Wire Wire Line
	10000 4150 10000 4450
Connection ~ 10000 4150
Wire Wire Line
	8300 4800 8250 4900
Wire Wire Line
	8250 4900 8250 5500
Wire Wire Line
	8250 5500 8350 5500
Wire Wire Line
	10000 4850 9950 4950
Wire Wire Line
	9950 4950 9950 5550
Wire Wire Line
	9950 5550 10050 5550
Connection ~ 10050 5550
Connection ~ 8350 5500
Wire Wire Line
	5150 4100 5150 4200
Wire Wire Line
	5000 4350 5000 4100
Connection ~ 5000 4100
Wire Wire Line
	5150 4500 5150 4650
Wire Wire Line
	5150 4950 5150 5100
Wire Wire Line
	6850 4500 6850 4650
Wire Wire Line
	6850 4950 6850 5100
Wire Wire Line
	6850 4200 6850 4100
Wire Wire Line
	6700 4350 6700 4100
Connection ~ 6700 4100
Wire Wire Line
	8550 4650 8550 4500
Wire Wire Line
	8550 4200 8550 4100
Wire Wire Line
	8400 4350 8400 4100
Connection ~ 8400 4100
Wire Wire Line
	8550 4950 8550 5100
Wire Wire Line
	10250 5050 10250 5150
Wire Wire Line
	10250 4750 10250 4550
Wire Wire Line
	10250 4250 10250 4150
Wire Wire Line
	10100 4400 10100 4150
Connection ~ 10100 4150
Wire Wire Line
	3700 4300 3700 4250
Wire Wire Line
	3700 4250 4000 4250
Connection ~ 4000 4250
Wire Wire Line
	3700 4700 3700 4600
Wire Wire Line
	2950 6050 2950 5750
Wire Wire Line
	2850 5750 2850 5850
Wire Wire Line
	2250 4550 2250 4650
Connection ~ 2250 4650
Wire Wire Line
	1200 4550 1200 4650
Connection ~ 1200 4650
Wire Wire Line
	2750 4550 2750 4600
Wire Wire Line
	2750 4600 2650 4600
Wire Wire Line
	2650 4550 2650 4600
Connection ~ 2650 4600
Wire Wire Line
	2750 4900 2550 4900
Connection ~ 2550 4900
Wire Wire Line
	2750 5200 2450 5200
Connection ~ 2450 5200
Connection ~ 2250 6050
Wire Wire Line
	2350 4650 2250 4650
Wire Wire Line
	3050 4900 3100 4900
Wire Wire Line
	3050 5200 3100 5200
Wire Wire Line
	1700 4550 1700 4600
Wire Wire Line
	1700 4600 1600 4600
Wire Wire Line
	1600 4550 1600 4600
Connection ~ 1600 4600
Wire Wire Line
	1700 4900 1500 4900
Connection ~ 1500 4900
Wire Wire Line
	1700 5200 1400 5200
Connection ~ 1400 5200
Wire Wire Line
	2000 4900 2050 4900
Wire Wire Line
	2000 5200 2050 5200
Wire Wire Line
	1200 6050 2250 6050
Wire Wire Line
	1300 4650 1200 4650
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C12
U 1 1 59C60A12
P 2800 2250
F 0 "C12" H 2825 2350 50  0000 L CNN
F 1 "100nF" H 2825 2150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 2838 2100 50  0001 C CNN
F 3 "" H 2800 2250 50  0000 C CNN
	1    2800 2250
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C13
U 1 1 59C60A19
P 2150 2250
F 0 "C13" H 2175 2350 50  0000 L CNN
F 1 "100nF" H 2175 2150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 2188 2100 50  0001 C CNN
F 3 "" H 2150 2250 50  0000 C CNN
	1    2150 2250
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C14
U 1 1 59C60A20
P 1550 2250
F 0 "C14" H 1575 2350 50  0000 L CNN
F 1 "100nF" H 1575 2150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 1588 2100 50  0001 C CNN
F 3 "" H 1550 2250 50  0000 C CNN
	1    1550 2250
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR029
U 1 1 59C60A27
P 2800 2450
F 0 "#PWR029" H 2800 2200 50  0001 C CNN
F 1 "GND" H 2800 2300 50  0000 C CNN
F 2 "" H 2800 2450 50  0000 C CNN
F 3 "" H 2800 2450 50  0000 C CNN
	1    2800 2450
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR030
U 1 1 59C60A2D
P 2150 2450
F 0 "#PWR030" H 2150 2200 50  0001 C CNN
F 1 "GND" H 2150 2300 50  0000 C CNN
F 2 "" H 2150 2450 50  0000 C CNN
F 3 "" H 2150 2450 50  0000 C CNN
	1    2150 2450
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR031
U 1 1 59C60A33
P 1550 2450
F 0 "#PWR031" H 1550 2200 50  0001 C CNN
F 1 "GND" H 1550 2300 50  0000 C CNN
F 2 "" H 1550 2450 50  0000 C CNN
F 3 "" H 1550 2450 50  0000 C CNN
	1    1550 2450
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X03-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue P32
U 1 1 59C60A39
P 1450 1250
F 0 "P32" H 1450 1450 50  0000 C CNN
F 1 "Pot1" V 1550 1250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 1450 1250 50  0001 C CNN
F 3 "" H 1450 1250 50  0000 C CNN
	1    1450 1250
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X03-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue P31
U 1 1 59C60A40
P 2050 1250
F 0 "P31" H 2050 1450 50  0000 C CNN
F 1 "Pot2" V 2150 1250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 2050 1250 50  0001 C CNN
F 3 "" H 2050 1250 50  0000 C CNN
	1    2050 1250
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X03-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue P4
U 1 1 59C60A47
P 2700 1250
F 0 "P4" H 2700 1450 50  0000 C CNN
F 1 "Pot3" V 2800 1250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 2700 1250 50  0001 C CNN
F 3 "" H 2700 1250 50  0000 C CNN
	1    2700 1250
	0    -1   -1   0   
$EndComp
$Comp
L power1:VCC #PWR032
U 1 1 59C60A4E
P 2600 1550
F 0 "#PWR032" H 2600 1400 50  0001 C CNN
F 1 "VCC" H 2600 1700 50  0000 C CNN
F 2 "" H 2600 1550 50  0000 C CNN
F 3 "" H 2600 1550 50  0000 C CNN
	1    2600 1550
	-1   0    0    1   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR033
U 1 1 59C60A54
P 2800 1550
F 0 "#PWR033" H 2800 1300 50  0001 C CNN
F 1 "GND" H 2800 1400 50  0000 C CNN
F 2 "" H 2800 1550 50  0000 C CNN
F 3 "" H 2800 1550 50  0000 C CNN
	1    2800 1550
	1    0    0    -1  
$EndComp
$Comp
L power1:VCC #PWR034
U 1 1 59C60A5A
P 1950 1550
F 0 "#PWR034" H 1950 1400 50  0001 C CNN
F 1 "VCC" H 1950 1700 50  0000 C CNN
F 2 "" H 1950 1550 50  0000 C CNN
F 3 "" H 1950 1550 50  0000 C CNN
	1    1950 1550
	-1   0    0    1   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR035
U 1 1 59C60A60
P 2150 1550
F 0 "#PWR035" H 2150 1300 50  0001 C CNN
F 1 "GND" H 2150 1400 50  0000 C CNN
F 2 "" H 2150 1550 50  0000 C CNN
F 3 "" H 2150 1550 50  0000 C CNN
	1    2150 1550
	1    0    0    -1  
$EndComp
$Comp
L power1:VCC #PWR036
U 1 1 59C60A66
P 1350 1550
F 0 "#PWR036" H 1350 1400 50  0001 C CNN
F 1 "VCC" H 1350 1700 50  0000 C CNN
F 2 "" H 1350 1550 50  0000 C CNN
F 3 "" H 1350 1550 50  0000 C CNN
	1    1350 1550
	-1   0    0    1   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR037
U 1 1 59C60A6C
P 1550 1550
F 0 "#PWR037" H 1550 1300 50  0001 C CNN
F 1 "GND" H 1550 1400 50  0000 C CNN
F 2 "" H 1550 1550 50  0000 C CNN
F 3 "" H 1550 1550 50  0000 C CNN
	1    1550 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1450 2050 1850
Wire Wire Line
	2700 1450 2700 1850
Wire Wire Line
	1450 1450 1450 1850
Wire Wire Line
	2800 2100 2800 1850
Wire Wire Line
	2800 1850 2700 1850
Connection ~ 2700 1850
Wire Wire Line
	2150 2100 2150 1850
Wire Wire Line
	2150 1850 2050 1850
Connection ~ 2050 1850
Wire Wire Line
	1550 2100 1550 1850
Wire Wire Line
	2800 2400 2800 2450
Wire Wire Line
	2150 2400 2150 2450
Wire Wire Line
	1550 2400 1550 2450
Wire Wire Line
	2600 1450 2600 1550
Wire Wire Line
	2800 1450 2800 1550
Wire Wire Line
	1950 1450 1950 1550
Wire Wire Line
	2150 1450 2150 1550
Wire Wire Line
	1350 1450 1350 1550
Wire Wire Line
	1550 1450 1550 1550
Wire Wire Line
	1550 1850 1450 1850
Connection ~ 1450 1850
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR038
U 1 1 59C62A28
P 4350 1650
F 0 "#PWR038" H 4350 1400 50  0001 C CNN
F 1 "GND" H 4350 1500 50  0000 C CNN
F 2 "" H 4350 1650 50  0000 C CNN
F 3 "" H 4350 1650 50  0000 C CNN
	1    4350 1650
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR039
U 1 1 59C62A2E
P 6000 1650
F 0 "#PWR039" H 6000 1400 50  0001 C CNN
F 1 "GND" H 6000 1500 50  0000 C CNN
F 2 "" H 6000 1650 50  0000 C CNN
F 3 "" H 6000 1650 50  0000 C CNN
	1    6000 1650
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X10-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue P14
U 1 1 59C62A34
P 5550 1250
F 0 "P14" H 5550 1800 50  0000 C CNN
F 1 "Switch" V 5650 1250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm" H 5550 1250 50  0001 C CNN
F 3 "" H 5550 1250 50  0000 C CNN
	1    5550 1250
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X10-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue P11
U 1 1 59C62A3B
P 3900 1250
F 0 "P11" H 3900 1800 50  0000 C CNN
F 1 "Trim" V 4000 1250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm" H 3900 1250 50  0001 C CNN
F 3 "" H 3900 1250 50  0000 C CNN
	1    3900 1250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3750 2200 3750 1450
Wire Wire Line
	4150 1450 4150 2200
Wire Wire Line
	3450 2200 3450 1450
Wire Wire Line
	3550 2200 3550 1450
Wire Wire Line
	3850 2200 3850 1450
Wire Wire Line
	3650 2200 3650 1450
Wire Wire Line
	3950 2200 3950 1450
Wire Wire Line
	4050 2200 4050 1450
Wire Wire Line
	4350 1450 4350 1550
Wire Wire Line
	4250 1450 4250 1550
Wire Wire Line
	4250 1550 4350 1550
Connection ~ 4350 1550
Wire Wire Line
	5100 2200 5100 1450
Wire Wire Line
	5200 2200 5200 1450
Wire Wire Line
	5300 2200 5300 1450
Wire Wire Line
	5400 2200 5400 1450
Wire Wire Line
	5500 2200 5500 1450
Wire Wire Line
	5600 2200 5600 1450
Wire Wire Line
	5700 2200 5700 1450
Wire Wire Line
	5800 2200 5800 1450
Wire Wire Line
	6000 1450 6000 1550
Wire Wire Line
	5900 1450 5900 1550
Wire Wire Line
	5900 1550 6000 1550
Connection ~ 6000 1550
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C29
U 1 1 59C63F4F
P 7250 1800
F 0 "C29" H 7275 1900 50  0000 L CNN
F 1 "100nF" H 6900 1800 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 7288 1650 50  0001 C CNN
F 3 "" H 7250 1800 50  0000 C CNN
	1    7250 1800
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C27
U 1 1 59C63F56
P 7150 1900
F 0 "C27" H 7175 2000 50  0000 L CNN
F 1 "100nF" H 6800 1900 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 7188 1750 50  0001 C CNN
F 3 "" H 7150 1900 50  0000 C CNN
	1    7150 1900
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C26
U 1 1 59C63F5D
P 7050 2000
F 0 "C26" H 7075 2100 50  0000 L CNN
F 1 "100nF" H 6700 2000 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 7088 1850 50  0001 C CNN
F 3 "" H 7050 2000 50  0000 C CNN
	1    7050 2000
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C34
U 1 1 59C63F64
P 8500 1800
F 0 "C34" H 8525 1900 50  0000 L CNN
F 1 "100nF" H 8150 1800 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 8538 1650 50  0001 C CNN
F 3 "" H 8500 1800 50  0000 C CNN
	1    8500 1800
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C33
U 1 1 59C63F6B
P 8400 1900
F 0 "C33" H 8425 2000 50  0000 L CNN
F 1 "100nF" H 8050 1900 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 8438 1750 50  0001 C CNN
F 3 "" H 8400 1900 50  0000 C CNN
	1    8400 1900
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR040
U 1 1 59C63F79
P 8650 2150
F 0 "#PWR040" H 8650 1900 50  0001 C CNN
F 1 "GND" H 8650 2000 50  0000 C CNN
F 2 "" H 8650 2150 50  0000 C CNN
F 3 "" H 8650 2150 50  0000 C CNN
	1    8650 2150
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X04-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue P23
U 1 1 59C63F7F
P 7050 1250
F 0 "P23" H 7050 1500 50  0000 C CNN
F 1 "Rot_1" V 7150 1250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 7050 1250 50  0001 C CNN
F 3 "" H 7050 1250 50  0000 C CNN
	1    7050 1250
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X04-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue P24
U 1 1 59C63F86
P 8300 1250
F 0 "P24" H 8300 1500 50  0000 C CNN
F 1 "Rot_2" V 8400 1250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 8300 1250 50  0001 C CNN
F 3 "" H 8300 1250 50  0000 C CNN
	1    8300 1250
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X08-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue P25
U 1 1 59C63FBD
P 9650 1250
F 0 "P25" H 9650 1700 50  0000 C CNN
F 1 "Keys" V 9750 1250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm" H 9650 1250 50  0001 C CNN
F 3 "" H 9650 1250 50  0000 C CNN
	1    9650 1250
	0    -1   -1   0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR041
U 1 1 59C63FC4
P 7400 2150
F 0 "#PWR041" H 7400 1900 50  0001 C CNN
F 1 "GND" H 7400 1950 50  0000 C CNN
F 2 "" H 7400 2150 50  0000 C CNN
F 3 "" H 7400 2150 50  0000 C CNN
	1    7400 2150
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR042
U 1 1 59C63FCE
P 9300 1750
F 0 "#PWR042" H 9300 1500 50  0001 C CNN
F 1 "GND" H 9300 1600 50  0000 C CNN
F 2 "" H 9300 1750 50  0000 C CNN
F 3 "" H 9300 1750 50  0000 C CNN
	1    9300 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 1450 8650 1800
Wire Wire Line
	7400 1450 7400 1800
Wire Wire Line
	7000 1450 7000 1900
Wire Wire Line
	7100 1450 7100 1800
Wire Wire Line
	8650 2000 8450 2000
Wire Wire Line
	8650 1900 8550 1900
Wire Wire Line
	8450 1450 8650 1450
Connection ~ 8650 1800
Connection ~ 8350 1800
Connection ~ 8650 2000
Connection ~ 8650 1900
Connection ~ 8150 2000
Wire Wire Line
	7400 2000 7200 2000
Wire Wire Line
	7400 1900 7300 1900
Connection ~ 7400 2000
Connection ~ 7400 1900
Wire Wire Line
	8250 1450 8250 1900
Wire Wire Line
	8350 1450 8350 1800
Connection ~ 7400 1800
Wire Wire Line
	6900 1450 6900 2000
Wire Wire Line
	8150 1450 8150 2000
Connection ~ 6900 2000
Connection ~ 7000 1900
Connection ~ 7100 1800
Connection ~ 8250 1900
Wire Wire Line
	7400 1450 7200 1450
Wire Wire Line
	9400 1450 9400 1650
Wire Wire Line
	9400 1650 9300 1650
Wire Wire Line
	9300 1450 9300 1650
Connection ~ 9300 1650
Wire Wire Line
	9500 2050 9500 1450
Wire Wire Line
	9600 2050 9600 1450
Wire Wire Line
	9700 2050 9700 1450
Wire Wire Line
	9800 2050 9800 1450
Wire Wire Line
	9900 2050 9900 1450
Wire Wire Line
	10000 2050 10000 1450
Text GLabel 3750 2200 3    60   Output ~ 0
Trim_LH->
Text GLabel 4150 2200 3    60   Output ~ 0
Trim_LH<-
Text GLabel 3450 2200 3    60   Output ~ 0
Trim_RV<-
Text GLabel 3550 2200 3    60   Output ~ 0
Trim_LV<-
Text GLabel 3850 2200 3    60   Output ~ 0
Trim_RH->
Text GLabel 3650 2200 3    60   Output ~ 0
Trim_RH<-
Text GLabel 3950 2200 3    60   Output ~ 0
Trim_LV->
Text GLabel 4050 2200 3    60   Output ~ 0
Trim_RV->
Text GLabel 5100 2200 3    60   Output ~ 0
Sw_id1
Text GLabel 5200 2200 3    60   Output ~ 0
Sw_id2
Text GLabel 5300 2200 3    60   Output ~ 0
Sw_rudDR
Text GLabel 5400 2200 3    60   Output ~ 0
Sw_gear
Text GLabel 5500 2200 3    60   Output ~ 0
Sw_ailDR
Text GLabel 5600 2200 3    60   Output ~ 0
Sw_thcut
Text GLabel 5700 2200 3    60   Output ~ 0
Sw_eleDR
Text GLabel 5800 2200 3    60   Output ~ 0
Sw_turn
Text GLabel 1450 1900 3    60   Output ~ 0
Pot_1
Text GLabel 2050 1900 3    60   Output ~ 0
Pot_2
Text GLabel 2700 1900 3    60   Output ~ 0
Pot_3
Text GLabel 6900 2400 3    60   Output ~ 0
Rot_1push
Text GLabel 7000 2400 3    60   Output ~ 0
Rot_1B
Text GLabel 7100 2400 3    60   Output ~ 0
Rot_1A
Text GLabel 8150 2400 3    60   Output ~ 0
Rot_2push
Text GLabel 8250 2400 3    60   Output ~ 0
Rot_2B
Text GLabel 8350 2400 3    60   Output ~ 0
Rot_2A
Text GLabel 9500 2050 3    60   Output ~ 0
Key_UP
Text GLabel 9600 2050 3    60   Output ~ 0
Key_DOWN
Text GLabel 9700 2050 3    60   Output ~ 0
Key_LEFT
Text GLabel 9800 2050 3    60   Output ~ 0
Key_RIGHT
Text GLabel 9900 2050 3    60   Output ~ 0
Key_ESC
Text GLabel 10000 2050 3    60   Output ~ 0
Key_MENU
Text GLabel 4400 3900 1    60   Output ~ 0
Stick_RH
Text GLabel 6100 3900 1    60   Output ~ 0
Stick_RV
Text GLabel 7800 3900 1    60   Output ~ 0
Stick_LV
Text GLabel 9500 3950 1    60   Output ~ 0
Stick_LH
$Comp
L power1:+3,3V #PWR043
U 1 1 59CA5E51
P 3050 5850
F 0 "#PWR043" H 3050 5810 30  0001 C CNN
F 1 "+3,3V" H 3050 6000 39  0000 C CNN
F 2 "" H 3050 5850 60  0001 C CNN
F 3 "" H 3050 5850 60  0001 C CNN
	1    3050 5850
	-1   0    0    1   
$EndComp
Wire Wire Line
	3050 5850 3050 5750
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X02-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue P33
U 1 1 5A71A89A
P 10450 1250
AR Path="/5A71A89A" Ref="P33"  Part="1" 
AR Path="/59C5A6CD/5A71A89A" Ref="P33"  Part="1" 
F 0 "P33" H 10450 1400 50  0000 C CNN
F 1 "5V_CODERS" V 10550 1250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10450 1250 50  0001 C CNN
F 3 "" H 10450 1250 50  0000 C CNN
	1    10450 1250
	0    -1   -1   0   
$EndComp
$Comp
L power1:VCC #PWR044
U 1 1 5A71ACEB
P 10400 1700
F 0 "#PWR044" H 10400 1550 50  0001 C CNN
F 1 "VCC" H 10400 1850 50  0000 C CNN
F 2 "" H 10400 1700 50  0000 C CNN
F 3 "" H 10400 1700 50  0000 C CNN
	1    10400 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	10400 1700 10400 1550
Wire Wire Line
	10400 1550 10500 1550
Wire Wire Line
	10500 1550 10500 1450
Connection ~ 10400 1550
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C32
U 1 1 5A72E2A9
P 8300 2000
F 0 "C32" H 8325 2100 50  0000 L CNN
F 1 "100nF" H 7950 2000 50  0000 L CNN
F 2 "Mylib_v2.2:C_1206" H 8338 1850 50  0001 C CNN
F 3 "" H 8300 2000 50  0000 C CNN
	1    8300 2000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 5500 4000 5800
Wire Wire Line
	4000 5000 4300 5000
Wire Wire Line
	7700 5000 9400 5000
Wire Wire Line
	6000 5000 7700 5000
Wire Wire Line
	4300 5000 6000 5000
Wire Wire Line
	6100 4100 6100 4200
Wire Wire Line
	4400 4100 4400 4200
Wire Wire Line
	7800 4100 7800 4200
Wire Wire Line
	9500 4150 9500 4250
Wire Wire Line
	10250 4150 10500 4150
Wire Wire Line
	10050 5150 10250 5150
Wire Wire Line
	10250 5150 10250 5250
Wire Wire Line
	10250 5150 10500 5150
Wire Wire Line
	8550 4100 8800 4100
Wire Wire Line
	8350 5100 8550 5100
Wire Wire Line
	8550 5100 8550 5200
Wire Wire Line
	8550 5100 8800 5100
Wire Wire Line
	6650 5100 6850 5100
Wire Wire Line
	6850 5100 6850 5200
Wire Wire Line
	6850 5100 7100 5100
Wire Wire Line
	4950 5100 5150 5100
Wire Wire Line
	5150 5100 5150 5200
Wire Wire Line
	5150 5100 5400 5100
Wire Wire Line
	5150 4100 5400 4100
Wire Wire Line
	6850 4100 7100 4100
Wire Wire Line
	4900 4100 5000 4100
Wire Wire Line
	6600 4100 6700 4100
Wire Wire Line
	8300 4100 8400 4100
Wire Wire Line
	10000 4150 10100 4150
Wire Wire Line
	5000 4100 5150 4100
Wire Wire Line
	6700 4100 6850 4100
Wire Wire Line
	8400 4100 8550 4100
Wire Wire Line
	10100 4150 10250 4150
Wire Wire Line
	4000 4250 4000 4600
Wire Wire Line
	2250 4650 2250 6050
Wire Wire Line
	1200 4650 1200 6050
Wire Wire Line
	2650 4600 2650 4650
Wire Wire Line
	2550 4900 2550 5800
Wire Wire Line
	2450 5200 2450 5800
Wire Wire Line
	2250 6050 2950 6050
Wire Wire Line
	1600 4600 1600 4650
Wire Wire Line
	1500 4900 1500 5800
Wire Wire Line
	1400 5200 1400 5800
Wire Wire Line
	2700 1850 2700 1900
Wire Wire Line
	2050 1850 2050 1900
Wire Wire Line
	1450 1850 1450 1900
Wire Wire Line
	4350 1550 4350 1650
Wire Wire Line
	6000 1550 6000 1650
Wire Wire Line
	8650 1800 8650 1900
Wire Wire Line
	8350 1800 8350 2400
Wire Wire Line
	8650 2000 8650 2150
Wire Wire Line
	8650 1900 8650 2000
Wire Wire Line
	8150 2000 8150 2400
Wire Wire Line
	7400 2000 7400 2150
Wire Wire Line
	7400 1900 7400 2000
Wire Wire Line
	7400 1800 7400 1900
Wire Wire Line
	6900 2000 6900 2400
Wire Wire Line
	7000 1900 7000 2400
Wire Wire Line
	7100 1800 7100 2400
Wire Wire Line
	8250 1900 8250 2400
Wire Wire Line
	9300 1650 9300 1750
Wire Wire Line
	10400 1550 10400 1450
Wire Wire Line
	3750 5000 3550 5000
Wire Wire Line
	3550 5000 3550 5400
Connection ~ 3750 5000
Wire Wire Line
	2950 6050 3550 6050
Wire Wire Line
	3550 6050 3550 5700
Connection ~ 2950 6050
$EndSCHEMATC
