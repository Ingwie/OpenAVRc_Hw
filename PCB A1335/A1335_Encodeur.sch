EESchema Schematic File Version 2
LIBS:A1335_Encodeur-rescue
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
LIBS:A1335_Encodeur-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Encodeur Angulaire Absolu A1335"
Date "2018-11-29"
Rev "0.1"
Comp "OpenAVRc"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 79L05-RESCUE-A1335_Encodeur U1
U 1 1 5BFBBC16
P 3950 2850
F 0 "U1" H 4100 2655 60  0000 C CNN
F 1 "662K" H 3950 3050 60  0000 C CNN
F 2 "SOT-23" H 3950 2850 60  0001 C CNN
F 3 "" H 3950 2850 60  0000 C CNN
	1    3950 2850
	1    0    0    -1  
$EndComp
$Comp
L MOS_N Q1
U 1 1 5BFBBD47
P 3900 3800
F 0 "Q1" V 3800 4050 60  0000 R CNN
F 1 "MOS_N" H 3910 3650 60  0001 R CNN
F 2 "SOT-23_MOS_P" H 3900 3800 60  0001 C CNN
F 3 "" H 3900 3800 60  0000 C CNN
	1    3900 3800
	0    -1   -1   0   
$EndComp
$Comp
L MOS_N Q2
U 1 1 5BFBBEA4
P 3900 4600
F 0 "Q2" V 3750 4850 60  0000 R CNN
F 1 "MOS_N" H 3910 4450 60  0001 R CNN
F 2 "SOT-23_MOS_P" H 3900 4600 60  0001 C CNN
F 3 "" H 3900 4600 60  0000 C CNN
	1    3900 4600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3700 3700 3200 3700
Wire Wire Line
	3200 4500 3700 4500
Text Label 3200 3700 0    60   ~ 0
SDA
Text Label 3200 4500 0    60   ~ 0
SCL
$Comp
L R-RESCUE-Mega_2560_core_mini_full_2.0 R1
U 1 1 5BFBBF6E
P 4350 3950
F 0 "R1" V 4430 3950 50  0000 C CNN
F 1 "10K" V 4350 3950 50  0000 C CNN
F 2 "R_1206" V 4280 3950 50  0001 C CNN
F 3 "" H 4350 3950 50  0000 C CNN
	1    4350 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3700 4700 3700
Wire Wire Line
	4350 3700 4350 3800
Connection ~ 4350 3700
Text Label 4700 3700 2    60   ~ 0
SDA_33
Wire Wire Line
	4350 4100 4350 4200
Wire Wire Line
	3900 4200 4500 4200
Wire Wire Line
	3900 4200 3900 4000
$Comp
L R-RESCUE-Mega_2560_core_mini_full_2.0 R2
U 1 1 5BFBC027
P 4350 4750
F 0 "R2" V 4430 4750 50  0000 C CNN
F 1 "10K" V 4350 4750 50  0000 C CNN
F 2 "R_1206" V 4280 4750 50  0001 C CNN
F 3 "" H 4350 4750 50  0000 C CNN
	1    4350 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4500 4700 4500
Wire Wire Line
	4350 4500 4350 4600
Connection ~ 4350 4500
Wire Wire Line
	4350 4900 4350 5000
Wire Wire Line
	3900 5000 4500 5000
Wire Wire Line
	3900 5000 3900 4800
Text Label 4700 4500 2    60   ~ 0
SCL_33
Connection ~ 4350 4200
Connection ~ 4350 5000
$Comp
L +3,3V #PWR6
U 1 1 5BFBC0F5
P 4500 4200
F 0 "#PWR6" H 4500 4160 30  0001 C CNN
F 1 "+3,3V" H 4500 4310 30  0000 C CNN
F 2 "" H 4500 4200 60  0001 C CNN
F 3 "" H 4500 4200 60  0001 C CNN
	1    4500 4200
	0    1    1    0   
$EndComp
$Comp
L +3,3V #PWR7
U 1 1 5BFBC113
P 4500 5000
F 0 "#PWR7" H 4500 4960 30  0001 C CNN
F 1 "+3,3V" H 4500 5110 30  0000 C CNN
F 2 "" H 4500 5000 60  0001 C CNN
F 3 "" H 4500 5000 60  0001 C CNN
	1    4500 5000
	0    1    1    0   
$EndComp
$Comp
L +3,3V #PWR8
U 1 1 5BFBC14F
P 4600 2800
F 0 "#PWR8" H 4600 2760 30  0001 C CNN
F 1 "+3,3V" H 4600 2910 30  0000 C CNN
F 2 "" H 4600 2800 60  0001 C CNN
F 3 "" H 4600 2800 60  0001 C CNN
	1    4600 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 2800 4600 2800
Wire Wire Line
	3550 2800 3250 2800
Wire Wire Line
	3950 3100 3950 3250
$Comp
L +5V #PWR3
U 1 1 5BFBC1B5
P 3250 2800
F 0 "#PWR3" H 3250 2890 20  0001 C CNN
F 1 "+5V" H 3250 2890 30  0000 C CNN
F 2 "" H 3250 2800 60  0001 C CNN
F 3 "" H 3250 2800 60  0001 C CNN
	1    3250 2800
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR4
U 1 1 5BFBC1D3
P 3950 3250
F 0 "#PWR4" H 3950 3250 30  0001 C CNN
F 1 "GND" H 3950 3180 30  0001 C CNN
F 2 "" H 3950 3250 60  0001 C CNN
F 3 "" H 3950 3250 60  0001 C CNN
	1    3950 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3400 6000 3400
$Comp
L +5V #PWR9
U 1 1 5BFBC450
P 6000 3400
F 0 "#PWR9" H 6000 3490 20  0001 C CNN
F 1 "+5V" H 6000 3490 30  0000 C CNN
F 2 "" H 6000 3400 60  0001 C CNN
F 3 "" H 6000 3400 60  0001 C CNN
	1    6000 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6300 3600 5950 3600
Wire Wire Line
	6300 3700 5950 3700
Wire Wire Line
	7050 4150 7050 4250
Wire Wire Line
	7050 4250 6850 4250
Wire Wire Line
	6850 4250 6850 4150
Wire Wire Line
	6950 4150 6950 4300
Connection ~ 6950 4250
Wire Wire Line
	6650 4150 6650 4300
Wire Wire Line
	6650 4250 6550 4250
Wire Wire Line
	6550 4250 6550 4150
Connection ~ 6650 4250
$Comp
L GND #PWR10
U 1 1 5BFBC534
P 6650 4300
F 0 "#PWR10" H 6650 4300 30  0001 C CNN
F 1 "GND" H 6650 4230 30  0001 C CNN
F 2 "" H 6650 4300 60  0001 C CNN
F 3 "" H 6650 4300 60  0001 C CNN
	1    6650 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR11
U 1 1 5BFBC57B
P 6950 4300
F 0 "#PWR11" H 6950 4300 30  0001 C CNN
F 1 "GND" H 6950 4230 30  0001 C CNN
F 2 "" H 6950 4300 60  0001 C CNN
F 3 "" H 6950 4300 60  0001 C CNN
	1    6950 4300
	1    0    0    -1  
$EndComp
Text Label 5950 3600 0    60   ~ 0
SCL_33
Text Label 5950 3700 0    60   ~ 0
SDA_33
$Comp
L C C1
U 1 1 5BFBC6FC
P 4500 3100
F 0 "C1" H 4500 3200 40  0000 L CNN
F 1 "100nF" H 4506 3015 40  0000 L CNN
F 2 "C_1206" H 4538 2950 30  0001 C CNN
F 3 "" H 4500 3100 60  0000 C CNN
	1    4500 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2900 4500 2800
Connection ~ 4500 2800
Wire Wire Line
	4500 3300 4500 3400
$Comp
L GND #PWR5
U 1 1 5BFBC83C
P 4500 3400
F 0 "#PWR5" H 4500 3400 30  0001 C CNN
F 1 "GND" H 4500 3330 30  0001 C CNN
F 2 "" H 4500 3400 60  0001 C CNN
F 3 "" H 4500 3400 60  0001 C CNN
	1    4500 3400
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-Mega_2560_core_mini_full_2.0 R4
U 1 1 5BFBC942
P 7650 3600
F 0 "R4" V 7600 3750 50  0000 C CNN
F 1 "0" V 7650 3600 50  0000 C CNN
F 2 "R_1206" V 7580 3600 50  0001 C CNN
F 3 "" H 7650 3600 50  0000 C CNN
	1    7650 3600
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-Mega_2560_core_mini_full_2.0 R3
U 1 1 5BFBCA52
P 7650 3500
F 0 "R3" V 7600 3650 50  0000 C CNN
F 1 "0" V 7650 3500 50  0000 C CNN
F 2 "R_1206" V 7580 3500 50  0001 C CNN
F 3 "" H 7650 3500 50  0000 C CNN
	1    7650 3500
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-Mega_2560_core_mini_full_2.0 R5
U 1 1 5BFBCA7D
P 7650 3700
F 0 "R5" V 7600 3850 50  0000 C CNN
F 1 "0" V 7650 3700 50  0000 C CNN
F 2 "R_1206" V 7580 3700 50  0001 C CNN
F 3 "" H 7650 3700 50  0000 C CNN
	1    7650 3700
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-Mega_2560_core_mini_full_2.0 R6
U 1 1 5BFBCABD
P 7650 3800
F 0 "R6" V 7600 3950 50  0000 C CNN
F 1 "0" V 7650 3800 50  0000 C CNN
F 2 "R_1206" V 7580 3800 50  0001 C CNN
F 3 "" H 7650 3800 50  0000 C CNN
	1    7650 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 3600 7500 3600
Wire Wire Line
	7450 3600 7450 3500
Wire Wire Line
	7450 3500 7500 3500
Connection ~ 7450 3600
Wire Wire Line
	7300 3700 7500 3700
Wire Wire Line
	7500 3800 7450 3800
Wire Wire Line
	7450 3800 7450 3700
Connection ~ 7450 3700
Wire Wire Line
	7800 3500 7900 3500
Wire Wire Line
	7900 3500 7900 3900
Wire Wire Line
	7800 3700 7900 3700
Connection ~ 7900 3700
Wire Wire Line
	8000 3800 7800 3800
Wire Wire Line
	8000 3400 8000 3800
Wire Wire Line
	8000 3600 7800 3600
Connection ~ 8000 3600
Wire Wire Line
	7300 3400 8200 3400
$Comp
L GND #PWR12
U 1 1 5BFBCE12
P 7900 3900
F 0 "#PWR12" H 7900 3900 30  0001 C CNN
F 1 "GND" H 7900 3830 30  0001 C CNN
F 2 "" H 7900 3900 60  0001 C CNN
F 3 "" H 7900 3900 60  0001 C CNN
	1    7900 3900
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5BFBCEF6
P 8200 3650
F 0 "C2" H 8200 3750 40  0000 L CNN
F 1 "100nF" H 8206 3565 40  0000 L CNN
F 2 "C_1206" H 8238 3500 30  0001 C CNN
F 3 "" H 8200 3650 60  0000 C CNN
	1    8200 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR13
U 1 1 5BFBCFC6
P 8200 3900
F 0 "#PWR13" H 8200 3900 30  0001 C CNN
F 1 "GND" H 8200 3830 30  0001 C CNN
F 2 "" H 8200 3900 60  0001 C CNN
F 3 "" H 8200 3900 60  0001 C CNN
	1    8200 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 3400 8200 3450
Connection ~ 8000 3400
Wire Wire Line
	8200 3900 8200 3850
$Comp
L CONN_01X04 P1
U 1 1 5BFFB55C
P 1050 4100
F 0 "P1" H 1050 4350 50  0000 C CNN
F 1 "CONN_01X04" V 1150 4100 50  0000 C CNN
F 2 "SMD_1x04_Pitch2mm" H 1050 4100 50  0001 C CNN
F 3 "" H 1050 4100 50  0000 C CNN
	1    1050 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	1250 4250 1900 4250
Wire Wire Line
	1250 4150 1900 4150
Wire Wire Line
	1250 4050 1900 4050
Wire Wire Line
	1250 3950 1900 3950
$Comp
L GND #PWR1
U 1 1 5BFFB77C
P 1900 4150
F 0 "#PWR1" H 1900 4150 30  0001 C CNN
F 1 "GND" H 1900 4080 30  0001 C CNN
F 2 "" H 1900 4150 60  0001 C CNN
F 3 "" H 1900 4150 60  0001 C CNN
	1    1900 4150
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR2
U 1 1 5BFFB7AE
P 1900 4250
F 0 "#PWR2" H 1900 4340 20  0001 C CNN
F 1 "+5V" H 1900 4340 30  0000 C CNN
F 2 "" H 1900 4250 60  0001 C CNN
F 3 "" H 1900 4250 60  0001 C CNN
	1    1900 4250
	0    1    1    0   
$EndComp
Text Label 1900 4050 2    60   ~ 0
SDA
Text Label 1900 3950 2    60   ~ 0
SCL
$Comp
L A1335LLETR-T U2
U 1 1 5BFFB734
P 6800 3450
F 0 "U2" H 6800 3400 50  0000 C CNN
F 1 "A1335LLETR-T" H 6800 3650 50  0000 C CNN
F 2 "TSSOP-14_4.4x5mm_Pitch0.65mm" H 6800 3550 50  0001 C CNN
F 3 "" H 6800 3450 50  0000 C CNN
	1    6800 3450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
