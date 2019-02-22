EESchema Schematic File Version 4
LIBS:Mega_2560 core mini_full_2.2-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 7
Title "Shield Mega2560 core Full"
Date "2019-02-21"
Rev "2.2"
Comp "© Team OpenAVRc"
Comment1 "Reproduction et commercialisation interdite"
Comment2 "By Antho.breizh / pierrotm777"
Comment3 ""
Comment4 "Shield pour RC OpenAVRc"
$EndDescr
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR099
U 1 1 59C5A54C
P 6500 3600
F 0 "#PWR099" H 6500 3350 50  0001 C CNN
F 1 "GND" H 6500 3450 50  0000 C CNN
F 2 "" H 6500 3600 50  0000 C CNN
F 3 "" H 6500 3600 50  0000 C CNN
	1    6500 3600
	1    0    0    -1  
$EndComp
$Comp
L power1:VCC #PWR0100
U 1 1 59C5A552
P 6200 3750
F 0 "#PWR0100" H 6200 3600 50  0001 C CNN
F 1 "VCC" H 6200 3900 50  0000 C CNN
F 2 "" H 6200 3750 50  0000 C CNN
F 3 "" H 6200 3750 50  0000 C CNN
	1    6200 3750
	-1   0    0    1   
$EndComp
Text Label 6000 4300 1    60   ~ 0
JQ_Left_Out
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C5
U 1 1 59C5A55A
P 6350 3400
F 0 "C5" H 6375 3500 50  0000 L CNN
F 1 "100nF" H 6375 3300 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 6388 3250 50  0001 C CNN
F 3 "" H 6350 3400 50  0000 C CNN
	1    6350 3400
	0    1    1    0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X02-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue P5
U 1 1 59C5A561
P 10650 3300
AR Path="/59C5A561" Ref="P5"  Part="1" 
AR Path="/59C59DB3/59C5A561" Ref="P5"  Part="1" 
F 0 "P5" H 10650 3450 50  0000 C CNN
F 1 "Vibreur" V 10750 3300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10650 3300 50  0001 C CNN
F 3 "" H 10650 3300 50  0000 C CNN
	1    10650 3300
	1    0    0    -1  
$EndComp
Text Label 5350 3050 2    60   ~ 0
JQ_Left_Out
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R3
U 1 1 59C5A580
P 4700 3450
F 0 "R3" V 4780 3450 50  0000 C CNN
F 1 "18K" V 4700 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 4630 3450 50  0001 C CNN
F 3 "" H 4700 3450 50  0000 C CNN
	1    4700 3450
	0    1    1    0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R4
U 1 1 59C5A587
P 4700 3250
F 0 "R4" V 4780 3250 50  0000 C CNN
F 1 "1K" V 4700 3250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 4630 3250 50  0001 C CNN
F 3 "" H 4700 3250 50  0000 C CNN
	1    4700 3250
	0    1    1    0   
$EndComp
$Comp
L power1:VCC #PWR0101
U 1 1 59C5A58E
P 4000 4500
F 0 "#PWR0101" H 4000 4350 50  0001 C CNN
F 1 "VCC" H 4000 4650 50  0000 C CNN
F 2 "" H 4000 4500 50  0000 C CNN
F 3 "" H 4000 4500 50  0000 C CNN
	1    4000 4500
	-1   0    0    1   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR0102
U 1 1 59C5A594
P 3350 4400
F 0 "#PWR0102" H 3350 4150 50  0001 C CNN
F 1 "GND" H 3350 4250 50  0000 C CNN
F 2 "" H 3350 4400 50  0000 C CNN
F 3 "" H 3350 4400 50  0000 C CNN
	1    3350 4400
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR0103
U 1 1 59C5A59A
P 4650 4400
F 0 "#PWR0103" H 4650 4150 50  0001 C CNN
F 1 "GND" H 4650 4250 50  0000 C CNN
F 2 "" H 4650 4400 50  0000 C CNN
F 3 "" H 4650 4400 50  0000 C CNN
	1    4650 4400
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_JQ6500_28P_mini-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue P22
U 1 1 59C5A5A0
P 3700 3600
F 0 "P22" H 4000 3650 50  0000 C CNN
F 1 "JQ6500_28P" V 3550 3600 50  0000 C CNN
F 2 "anthoperso:connector_mini-JQ6500-28P" H 3700 3600 50  0001 C CNN
F 3 "" H 3700 3600 50  0000 C CNN
	1    3700 3600
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:R-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue R9
U 1 1 59C5A5AE
P 8400 3950
F 0 "R9" V 8500 3950 50  0000 C CNN
F 1 "10K" V 8400 3950 50  0000 C CNN
F 2 "anthoperso:R_1206" V 8330 3950 50  0001 C CNN
F 3 "" H 8400 3950 50  0000 C CNN
	1    8400 3950
	0    1    1    0   
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:CONN_01X04-Mega_2560-core-mini_full_2.1-Mega_2560-core-mini_full_2.1-rescue P8
U 1 1 59C5A5BC
P 6150 3050
F 0 "P8" H 6150 3300 50  0000 C CNN
F 1 "Audio" V 6250 3050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 6150 3050 50  0001 C CNN
F 3 "" H 6150 3050 50  0000 C CNN
	1    6150 3050
	0    -1   -1   0   
$EndComp
Text Notes 6100 5400 0    60   ~ 0
Buzzer
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C20
U 1 1 59C5A5D1
P 3650 4550
F 0 "C20" H 3675 4650 50  0000 L CNN
F 1 "100nF" H 3675 4450 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3688 4400 50  0001 C CNN
F 3 "" H 3650 4550 50  0000 C CNN
	1    3650 4550
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C21
U 1 1 59C5A5D8
P 4300 4550
F 0 "C21" H 4325 4650 50  0000 L CNN
F 1 "100nF" H 4325 4450 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 4338 4400 50  0001 C CNN
F 3 "" H 4300 4550 50  0000 C CNN
	1    4300 4550
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR0104
U 1 1 59C5A5DF
P 3650 4750
F 0 "#PWR0104" H 3650 4500 50  0001 C CNN
F 1 "GND" H 3650 4600 50  0000 C CNN
F 2 "" H 3650 4750 50  0000 C CNN
F 3 "" H 3650 4750 50  0000 C CNN
	1    3650 4750
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR0105
U 1 1 59C5A5E5
P 4300 4750
F 0 "#PWR0105" H 4300 4500 50  0001 C CNN
F 1 "GND" H 4300 4600 50  0000 C CNN
F 2 "" H 4300 4750 50  0000 C CNN
F 3 "" H 4300 4750 50  0000 C CNN
	1    4300 4750
	1    0    0    -1  
$EndComp
Text GLabel 5900 4300 3    60   Input ~ 0
Audio_Buzzer_out
Text GLabel 4950 3250 2    60   Input ~ 0
JQ6500Data
Text GLabel 4950 3450 2    60   Output ~ 0
JQ6500Busy
Text GLabel 7950 3950 0    60   Input ~ 0
Vibreur
$Comp
L device:NPN Q2
U 1 1 5A97FDE8
P 8950 3950
F 0 "Q2" H 9250 3850 50  0000 R CNN
F 1 "MMBT2222ALT1" H 9700 3950 50  0000 R CNN
F 2 "v2.1:SOT-23_MMBT2222" H 8950 3950 60  0001 C CNN
F 3 "" H 8950 3950 60  0000 C CNN
	1    8950 3950
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:GND-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue #PWR0106
U 1 1 5A9805CC
P 9050 4400
F 0 "#PWR0106" H 9050 4150 50  0001 C CNN
F 1 "GND" H 9050 4250 50  0000 C CNN
F 2 "" H 9050 4400 50  0000 C CNN
F 3 "" H 9050 4400 50  0000 C CNN
	1    9050 4400
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:C-RESCUE-Mega_2560_core_mini_full_2.0-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue C2
U 1 1 5A980AA9
P 10200 3300
F 0 "C2" H 10225 3400 50  0000 L CNN
F 1 "100nF" H 10350 3300 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 10238 3150 50  0001 C CNN
F 3 "" H 10200 3300 50  0000 C CNN
	1    10200 3300
	-1   0    0    1   
$EndComp
$Comp
L power1:VCC #PWR0107
U 1 1 5A981097
P 9050 3000
F 0 "#PWR0107" H 9050 2850 50  0001 C CNN
F 1 "VCC" H 9050 3150 50  0000 C CNN
F 2 "" H 9050 3000 50  0000 C CNN
F 3 "" H 9050 3000 50  0000 C CNN
	1    9050 3000
	1    0    0    -1  
$EndComp
Connection ~ 4500 4150
Connection ~ 3500 4150
Wire Wire Line
	3500 4050 3500 4150
Wire Wire Line
	4650 4150 4650 4400
Wire Wire Line
	4500 4150 4650 4150
Wire Wire Line
	4500 4050 4500 4150
Wire Wire Line
	4850 3450 4950 3450
Wire Wire Line
	4850 3250 4950 3250
Wire Wire Line
	4500 3450 4550 3450
Wire Wire Line
	4500 3250 4550 3250
Connection ~ 4000 4350
Wire Wire Line
	4000 4350 4000 4500
Wire Wire Line
	4500 4350 4500 4250
Wire Wire Line
	3500 4350 4500 4350
Wire Wire Line
	3500 4250 3500 4350
Wire Wire Line
	3350 4150 3350 4400
Wire Wire Line
	3500 4150 3350 4150
Wire Wire Line
	6000 3350 6000 4300
Connection ~ 6200 3400
Connection ~ 6500 3400
Wire Wire Line
	6500 3250 6500 3600
Wire Wire Line
	6300 3250 6500 3250
Wire Wire Line
	6200 3250 6200 3750
Wire Wire Line
	5900 3350 5900 4300
Wire Wire Line
	4500 3050 5350 3050
Wire Wire Line
	8250 3950 7950 3950
Wire Wire Line
	6000 3350 6100 3300
Wire Wire Line
	6100 3300 6100 3250
Wire Wire Line
	5900 3350 6000 3300
Wire Wire Line
	6000 3300 6000 3250
Wire Notes Line
	6500 4000 6500 5350
Wire Notes Line
	6500 5350 6450 5350
Wire Notes Line
	6050 5350 5900 5350
Wire Notes Line
	5900 5350 5900 5200
Wire Wire Line
	3650 4400 3650 4350
Connection ~ 3650 4350
Wire Wire Line
	4300 4400 4300 4350
Connection ~ 4300 4350
Wire Wire Line
	4300 4700 4300 4750
Wire Wire Line
	3650 4700 3650 4750
Wire Wire Line
	8550 3950 8750 3950
Wire Wire Line
	9050 4150 9050 4400
Wire Wire Line
	9050 3000 9050 3200
Wire Wire Line
	9050 3600 9050 3750
Wire Wire Line
	10100 3050 10400 3050
Wire Wire Line
	9050 3050 9200 3050
Connection ~ 9050 3050
Wire Wire Line
	10450 3250 10400 3250
Wire Wire Line
	10400 3250 10400 3050
Wire Wire Line
	10200 3150 10200 3050
Connection ~ 10200 3050
Wire Wire Line
	10450 3350 10400 3350
Wire Wire Line
	10400 3350 10400 3700
Wire Wire Line
	10400 3700 9050 3700
Connection ~ 9050 3700
Wire Wire Line
	10200 3450 10200 3700
Connection ~ 10200 3700
$Comp
L Mega_2560-core-mini_full_2.2-rescue:DIODE-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue D1
U 1 1 5AABE17F
P 9050 3400
F 0 "D1" H 9050 3300 40  0000 C CNN
F 1 "LL4148" H 9050 3500 40  0000 C CNN
F 2 "Diodes_SMD:D_SOD-123" H 9050 3400 60  0001 C CNN
F 3 "" H 9050 3400 60  0000 C CNN
	1    9050 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9700 3050 9600 3050
$Comp
L Mega_2560-core-mini_full_2.2-rescue:DIODE-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue D2
U 1 1 5BB5C069
P 9400 3050
F 0 "D2" H 9400 2950 40  0000 C CNN
F 1 "LL4148" H 9400 3150 40  0000 C CNN
F 2 "Diodes_SMD:D_SOD-123" H 9400 3050 60  0001 C CNN
F 3 "" H 9400 3050 60  0000 C CNN
	1    9400 3050
	1    0    0    -1  
$EndComp
$Comp
L Mega_2560-core-mini_full_2.2-rescue:DIODE-Mega_2560-core-mini_full_2.1-rescue-Mega_2560-core-mini_full_2.1-rescue D3
U 1 1 5BB5C0BE
P 9900 3050
F 0 "D3" H 9900 2950 40  0000 C CNN
F 1 "LL4148" H 9900 3150 40  0000 C CNN
F 2 "Diodes_SMD:D_SOD-123" H 9900 3050 60  0001 C CNN
F 3 "" H 9900 3050 60  0000 C CNN
	1    9900 3050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
