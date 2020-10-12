EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "4x TIL311 Arduino Nano clock"
Date "2020-04-25"
Rev "2"
Comp "Paolo Cravero IK1ZYW"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L nanov3:Arduino_Nano A1
U 1 1 5DDE10AD
P 4000 5250
F 0 "A1" H 4025 6587 60  0000 C CNN
F 1 "Arduino_Nano" H 4025 6481 60  0000 C CNN
F 2 "ArduinoNano:arduino_nano" H 4000 5250 60  0001 C CNN
F 3 "" H 4000 5250 60  0000 C CNN
	1    4000 5250
	1    0    0    -1  
$EndComp
$Comp
L obsoleteLED:TIL311 DIS3
U 1 1 5DDE26BA
P 8000 1850
F 0 "DIS3" V 7972 1156 60  0000 R CNN
F 1 "TIL311" V 8078 1156 60  0000 R CNN
F 2 "ledObsolete:TIL311" H 8000 1650 60  0001 C CNN
F 3 "" H 8000 1650 60  0001 C CNN
	1    8000 1850
	0    1    1    0   
$EndComp
$Comp
L obsoleteLED:TIL311 DIS2
U 1 1 5DDE3F0F
P 6450 1850
F 0 "DIS2" V 6422 1156 60  0000 R CNN
F 1 "TIL311" V 6528 1156 60  0000 R CNN
F 2 "ledObsolete:TIL311" H 6450 1650 60  0001 C CNN
F 3 "" H 6450 1650 60  0001 C CNN
	1    6450 1850
	0    1    1    0   
$EndComp
$Comp
L obsoleteLED:TIL311 DIS4
U 1 1 5DDE51CD
P 9550 1850
F 0 "DIS4" V 9522 1156 60  0000 R CNN
F 1 "TIL311" V 9628 1156 60  0000 R CNN
F 2 "ledObsolete:TIL311" H 9550 1650 60  0001 C CNN
F 3 "" H 9550 1650 60  0001 C CNN
	1    9550 1850
	0    1    1    0   
$EndComp
$Comp
L obsoleteLED:TIL311 DIS1
U 1 1 5DDE5A41
P 4850 1850
F 0 "DIS1" V 4822 1156 60  0000 R CNN
F 1 "TIL311" V 4928 1156 60  0000 R CNN
F 2 "ledObsolete:TIL311" H 4850 1650 60  0001 C CNN
F 3 "" H 4850 1650 60  0001 C CNN
	1    4850 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 1400 4600 1300
Wire Wire Line
	4600 1300 6200 1300
Wire Wire Line
	6200 1300 6200 1400
Wire Wire Line
	6200 1300 7750 1300
Wire Wire Line
	7750 1300 7750 1400
Connection ~ 6200 1300
Wire Wire Line
	7750 1300 9300 1300
Wire Wire Line
	9300 1300 9300 1400
Connection ~ 7750 1300
Wire Wire Line
	9450 1400 9450 1250
Wire Wire Line
	9450 1250 7900 1250
Wire Wire Line
	7900 1250 7900 1400
Wire Wire Line
	7900 1250 6350 1250
Wire Wire Line
	6350 1250 6350 1400
Connection ~ 7900 1250
Wire Wire Line
	6350 1250 4750 1250
Wire Wire Line
	4750 1250 4750 1400
Connection ~ 6350 1250
Wire Wire Line
	4900 1400 4900 1200
Wire Wire Line
	4900 1200 6500 1200
Wire Wire Line
	6500 1200 6500 1400
Wire Wire Line
	6500 1200 8050 1200
Wire Wire Line
	8050 1200 8050 1400
Connection ~ 6500 1200
Wire Wire Line
	8050 1200 9600 1200
Wire Wire Line
	9600 1200 9600 1400
Connection ~ 8050 1200
Wire Wire Line
	9750 1400 9750 1150
Wire Wire Line
	9750 1150 8200 1150
Wire Wire Line
	8200 1150 8200 1400
Wire Wire Line
	8200 1150 6650 1150
Wire Wire Line
	6650 1150 6650 1400
Connection ~ 8200 1150
Wire Wire Line
	6650 1150 5050 1150
Wire Wire Line
	5050 1150 5050 1400
Connection ~ 6650 1150
Wire Wire Line
	5450 2000 5450 2600
Wire Wire Line
	7050 2600 7050 2000
Wire Wire Line
	8600 2600 8600 2000
Wire Wire Line
	10150 2600 10150 2000
Connection ~ 8600 2600
Wire Wire Line
	10150 1750 10200 1750
Wire Wire Line
	10200 1750 10200 2550
Wire Wire Line
	10200 2550 8650 2550
Wire Wire Line
	8650 2550 8650 1750
Wire Wire Line
	8650 1750 8600 1750
Wire Wire Line
	8650 2550 7100 2550
Wire Wire Line
	7100 2550 7100 1750
Wire Wire Line
	7100 1750 7050 1750
Connection ~ 8650 2550
Wire Wire Line
	7100 2550 6400 2550
Wire Wire Line
	5500 2550 5500 1750
Wire Wire Line
	5500 1750 5450 1750
Connection ~ 7100 2550
Wire Wire Line
	8900 1750 8900 2500
Wire Wire Line
	8900 2500 7350 2500
Wire Wire Line
	7350 2500 7350 1750
Wire Wire Line
	7350 2500 5800 2500
Wire Wire Line
	5800 2500 5800 1750
Connection ~ 7350 2500
Wire Wire Line
	5800 2500 4200 2500
Wire Wire Line
	4200 2500 4200 1750
Connection ~ 5800 2500
$Comp
L power:GNDPWR #PWR0101
U 1 1 5DDC70B3
P 4200 2500
F 0 "#PWR0101" H 4200 2300 50  0001 C CNN
F 1 "GNDPWR" H 4204 2346 50  0000 C CNN
F 2 "" H 4200 2450 50  0001 C CNN
F 3 "" H 4200 2450 50  0001 C CNN
	1    4200 2500
	1    0    0    -1  
$EndComp
Connection ~ 4200 2500
$Comp
L power:GNDPWR #PWR0102
U 1 1 5DDC7DC8
P 3350 6250
F 0 "#PWR0102" H 3350 6050 50  0001 C CNN
F 1 "GNDPWR" H 3354 6096 50  0000 C CNN
F 2 "" H 3350 6200 50  0001 C CNN
F 3 "" H 3350 6200 50  0001 C CNN
	1    3350 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 6150 3350 6250
Connection ~ 3350 6250
$Comp
L power:VCC #PWR0103
U 1 1 5DDCAF1A
P 10200 1750
F 0 "#PWR0103" H 10200 1600 50  0001 C CNN
F 1 "VCC" H 10217 1923 50  0000 C CNN
F 2 "" H 10200 1750 50  0001 C CNN
F 3 "" H 10200 1750 50  0001 C CNN
	1    10200 1750
	1    0    0    -1  
$EndComp
Connection ~ 10200 1750
$Comp
L Device:R R4
U 1 1 5DDCB6EE
P 10400 2150
F 0 "R4" H 10470 2196 50  0000 L CNN
F 1 "R" H 10470 2105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0414_L11.9mm_D4.5mm_P15.24mm_Horizontal" V 10330 2150 50  0001 C CNN
F 3 "~" H 10400 2150 50  0001 C CNN
	1    10400 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x19_Female J7
U 1 1 5DDCE9A0
P 7300 3400
F 0 "J7" V 7373 3380 50  0000 C CNN
F 1 "Conn_01x19_Female" V 7464 3380 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x19_P2.54mm_Vertical" H 7300 3400 50  0001 C CNN
F 3 "~" H 7300 3400 50  0001 C CNN
	1    7300 3400
	0    1    1    0   
$EndComp
$Comp
L power:GNDPWR #PWR0104
U 1 1 5DDCF57B
P 8000 3150
F 0 "#PWR0104" H 8000 2950 50  0001 C CNN
F 1 "GNDPWR" H 8004 2996 50  0000 C CNN
F 2 "" H 8000 3100 50  0001 C CNN
F 3 "" H 8000 3100 50  0001 C CNN
	1    8000 3150
	-1   0    0    1   
$EndComp
Text GLabel 6500 3000 1    50   Input ~ 0
Vdisplay
Text GLabel 10400 1800 1    50   Input ~ 0
Vdisplay
Wire Wire Line
	10400 1800 10400 2000
Wire Wire Line
	8200 2350 8300 2350
Wire Wire Line
	8600 2600 10150 2600
Wire Wire Line
	7050 2600 8600 2600
$Comp
L power:GNDPWR #PWR0105
U 1 1 5DDCE246
P 10400 2600
F 0 "#PWR0105" H 10400 2400 50  0001 C CNN
F 1 "GNDPWR" H 10404 2446 50  0000 C CNN
F 2 "" H 10400 2550 50  0001 C CNN
F 3 "" H 10400 2550 50  0001 C CNN
	1    10400 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 2300 10400 2350
$Comp
L Device:D_Zener_Small D1
U 1 1 5DDCBCD5
P 10400 2500
F 0 "D1" V 10354 2568 50  0000 L CNN
F 1 "4.8V" V 10445 2568 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P10.16mm_Horizontal" V 10400 2500 50  0001 C CNN
F 3 "~" V 10400 2500 50  0001 C CNN
	1    10400 2500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5DE29B15
P 6700 3050
F 0 "R2" H 6759 3096 50  0000 R CNN
F 1 "R_Small" H 6759 3005 50  0001 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P2.54mm_Vertical" H 6700 3050 50  0001 C CNN
F 3 "~" H 6700 3050 50  0001 C CNN
	1    6700 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5DE2A1BF
P 6600 3050
F 0 "R3" H 6659 3096 50  0000 L CNN
F 1 "R_Small" H 6659 3005 50  0001 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P2.54mm_Vertical" H 6600 3050 50  0001 C CNN
F 3 "~" H 6600 3050 50  0001 C CNN
	1    6600 3050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 5DE2C3C6
P 6350 2550
F 0 "J4" V 6196 2598 50  0000 L CNN
F 1 "Conn_01x01_Female" V 6287 2598 50  0001 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 6350 2550 50  0001 C CNN
F 3 "~" H 6350 2550 50  0001 C CNN
	1    6350 2550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J12
U 1 1 5DE2CC0E
P 8050 2550
F 0 "J12" V 7896 2598 50  0000 L CNN
F 1 "Conn_01x01_Female" V 7987 2598 50  0001 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 8050 2550 50  0001 C CNN
F 3 "~" H 8050 2550 50  0001 C CNN
	1    8050 2550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J10
U 1 1 5DE2D75A
P 6600 2750
F 0 "J10" V 6538 2662 50  0000 R CNN
F 1 "Conn_01x01_Female" V 6447 2662 50  0001 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 6600 2750 50  0001 C CNN
F 3 "~" H 6600 2750 50  0001 C CNN
	1    6600 2750
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J6
U 1 1 5DE2DFFF
P 6700 2750
F 0 "J6" V 6638 2662 50  0000 R CNN
F 1 "Conn_01x01_Female" V 6547 2662 50  0001 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 6700 2750 50  0001 C CNN
F 3 "~" H 6700 2750 50  0001 C CNN
	1    6700 2750
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x19_Female J8
U 1 1 5DE2E85F
P 7300 3950
F 0 "J8" V 7150 4950 50  0000 C CNN
F 1 "Conn_01x19_Female" V 7464 3930 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x19_P2.54mm_Vertical" H 7300 3950 50  0001 C CNN
F 3 "~" H 7300 3950 50  0001 C CNN
	1    7300 3950
	0    1    1    0   
$EndComp
$Comp
L power:GNDPWR #PWR0106
U 1 1 5DE30133
P 8000 4100
F 0 "#PWR0106" H 8000 3900 50  0001 C CNN
F 1 "GNDPWR" H 8004 3946 50  0000 C CNN
F 2 "" H 8000 4050 50  0001 C CNN
F 3 "" H 8000 4050 50  0001 C CNN
	1    8000 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3200 6600 3750
Wire Wire Line
	6700 3750 6700 3200
Wire Wire Line
	6800 3200 6800 3750
Wire Wire Line
	6900 3750 6900 3200
Wire Wire Line
	7000 3750 7000 3200
Connection ~ 7000 3200
Wire Wire Line
	7400 3200 7400 3750
Wire Wire Line
	7200 3200 7200 3750
Wire Wire Line
	7500 3200 7500 3750
Wire Wire Line
	7600 3200 7600 3750
Connection ~ 7600 3200
Wire Wire Line
	7700 3200 7700 3750
Wire Wire Line
	7900 3200 7900 3750
Wire Wire Line
	8000 3750 8000 3200
Wire Wire Line
	8200 3750 8200 3200
$Comp
L power:VCC #PWR0107
U 1 1 5DE8BC4B
P 3100 4700
F 0 "#PWR0107" H 3100 4550 50  0001 C CNN
F 1 "VCC" V 3118 4827 50  0000 L CNN
F 2 "" H 3100 4700 50  0001 C CNN
F 3 "" H 3100 4700 50  0001 C CNN
	1    3100 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 4700 3350 4700
$Comp
L Connector:Conn_01x01_Female J2
U 1 1 5DEA6DED
P 4750 2550
F 0 "J2" V 4596 2598 50  0000 L CNN
F 1 "Conn_01x01_Female" V 4687 2598 50  0001 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 4750 2550 50  0001 C CNN
F 3 "~" H 4750 2550 50  0001 C CNN
	1    4750 2550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J3
U 1 1 5DEA7674
P 4900 2550
F 0 "J3" V 4746 2598 50  0000 L CNN
F 1 "Conn_01x01_Female" V 4837 2598 50  0001 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 4900 2550 50  0001 C CNN
F 3 "~" H 4900 2550 50  0001 C CNN
	1    4900 2550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J5
U 1 1 5DEA78B8
P 6500 2550
F 0 "J5" V 6346 2598 50  0000 L CNN
F 1 "Conn_01x01_Female" V 6437 2598 50  0001 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 6500 2550 50  0001 C CNN
F 3 "~" H 6500 2550 50  0001 C CNN
	1    6500 2550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J11
U 1 1 5DEA7C86
P 7900 2550
F 0 "J11" V 7746 2598 50  0000 L CNN
F 1 "Conn_01x01_Female" V 7837 2598 50  0001 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 7900 2550 50  0001 C CNN
F 3 "~" H 7900 2550 50  0001 C CNN
	1    7900 2550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J14
U 1 1 5DEA8418
P 9450 2550
F 0 "J14" V 9296 2598 50  0000 L CNN
F 1 "Conn_01x01_Female" V 9387 2598 50  0001 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 9450 2550 50  0001 C CNN
F 3 "~" H 9450 2550 50  0001 C CNN
	1    9450 2550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J15
U 1 1 5DEAE02A
P 9600 2550
F 0 "J15" V 9446 2598 50  0000 L CNN
F 1 "Conn_01x01_Female" V 9537 2598 50  0001 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 9600 2550 50  0001 C CNN
F 3 "~" H 9600 2550 50  0001 C CNN
	1    9600 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	10150 2600 10300 2600
Wire Wire Line
	10300 2600 10300 2350
Wire Wire Line
	10300 2350 10400 2350
Connection ~ 10150 2600
Connection ~ 10400 2350
Wire Wire Line
	10400 2350 10400 2400
$Comp
L Connector:Conn_01x06_Female J16
U 1 1 5DEB52B0
P 9800 5450
F 0 "J16" H 9828 5426 50  0000 L CNN
F 1 "Conn_01x06_Female" H 9828 5335 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 9800 5450 50  0001 C CNN
F 3 "~" H 9800 5450 50  0001 C CNN
	1    9800 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDPWR #PWR0109
U 1 1 5DEB6E1B
P 9600 5750
F 0 "#PWR0109" H 9600 5550 50  0001 C CNN
F 1 "GNDPWR" H 9604 5596 50  0000 C CNN
F 2 "" H 9600 5700 50  0001 C CNN
F 3 "" H 9600 5700 50  0001 C CNN
	1    9600 5750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0110
U 1 1 5DEB7868
P 9600 5650
F 0 "#PWR0110" H 9600 5500 50  0001 C CNN
F 1 "VCC" V 9618 5777 50  0000 L CNN
F 2 "" H 9600 5650 50  0001 C CNN
F 3 "" H 9600 5650 50  0001 C CNN
	1    9600 5650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9600 5550 5300 5550
Wire Wire Line
	5300 5550 5300 6000
Wire Wire Line
	5300 6000 4700 6000
Wire Wire Line
	4700 6100 5350 6100
Wire Wire Line
	5350 6100 5350 5450
Wire Wire Line
	5350 5450 9600 5450
$Comp
L Connector:Conn_01x03_Female J13
U 1 1 5DE027A8
P 9350 4950
F 0 "J13" V 9288 4762 50  0000 R CNN
F 1 "Conn_01x03_Female" V 9197 4762 50  0001 R CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_Pad1.0x1.5mm" H 9350 4950 50  0001 C CNN
F 3 "~" H 9350 4950 50  0001 C CNN
	1    9350 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9450 5250 9450 5150
Wire Wire Line
	9450 5250 9600 5250
Wire Wire Line
	9250 5150 9250 5350
Wire Wire Line
	9250 5350 9600 5350
Wire Wire Line
	9350 5150 9350 5300
Wire Wire Line
	5300 5300 5300 4400
Wire Wire Line
	5300 4400 4700 4400
Wire Wire Line
	5300 5300 9350 5300
$Comp
L Device:R_POT_US RV1
U 1 1 5DE56ED8
P 4700 6850
F 0 "RV1" V 4587 6850 50  0000 C CNN
F 1 "20Klin" V 4496 6850 50  0000 C CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 4700 6850 50  0001 C CNN
F 3 "~" H 4700 6850 50  0001 C CNN
	1    4700 6850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 6300 4700 6700
$Comp
L power:GNDPWR #PWR0111
U 1 1 5DE5E410
P 4950 6850
F 0 "#PWR0111" H 4950 6650 50  0001 C CNN
F 1 "GNDPWR" H 4954 6696 50  0000 C CNN
F 2 "" H 4950 6800 50  0001 C CNN
F 3 "" H 4950 6800 50  0001 C CNN
	1    4950 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 6850 4950 6850
$Comp
L power:VCC #PWR0112
U 1 1 5DE6571E
P 4400 6850
F 0 "#PWR0112" H 4400 6700 50  0001 C CNN
F 1 "VCC" V 4418 6977 50  0000 L CNN
F 2 "" H 4400 6850 50  0001 C CNN
F 3 "" H 4400 6850 50  0001 C CNN
	1    4400 6850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4400 6850 4550 6850
$Comp
L Device:R_PHOTO R1
U 1 1 5DE7128D
P 5150 6550
F 0 "R1" H 5220 6596 50  0000 L CNN
F 1 "10k" H 5220 6505 50  0000 L CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" V 5200 6300 50  0001 L CNN
F 3 "~" H 5150 6500 50  0001 C CNN
	1    5150 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 6200 5150 6200
Wire Wire Line
	5150 6200 5150 6400
Wire Wire Line
	5150 6700 5150 6850
Wire Wire Line
	5150 6850 4950 6850
Connection ~ 4950 6850
$Comp
L power:VCC #PWR0114
U 1 1 5DECAF7A
P 6400 4600
F 0 "#PWR0114" H 6400 4450 50  0001 C CNN
F 1 "VCC" V 6418 4727 50  0000 L CNN
F 2 "" H 6400 4600 50  0001 C CNN
F 3 "" H 6400 4600 50  0001 C CNN
	1    6400 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	6400 4600 6400 3750
$Comp
L Connector:Conn_01x02_Female J9
U 1 1 5DEE8BBA
P 6700 4500
F 0 "J9" H 6728 4476 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6728 4385 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6700 4500 50  0001 C CNN
F 3 "~" H 6700 4500 50  0001 C CNN
	1    6700 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4600 6400 4600
Connection ~ 6400 4600
Wire Wire Line
	6500 4500 6500 3750
$Comp
L Switch:SW_Push SW1
U 1 1 5DEFCE51
P 5200 3950
F 0 "SW1" H 5200 4235 50  0000 C CNN
F 1 "SW_Push" H 5200 4144 50  0000 C CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 5200 4150 50  0001 C CNN
F 3 "~" H 5200 4150 50  0001 C CNN
	1    5200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3950 4900 3950
Wire Wire Line
	4900 3950 4900 4500
Wire Wire Line
	4900 4500 4700 4500
$Comp
L power:GNDPWR #PWR0115
U 1 1 5DF08019
P 5400 4050
F 0 "#PWR0115" H 5400 3850 50  0001 C CNN
F 1 "GNDPWR" H 5404 3896 50  0000 C CNN
F 2 "" H 5400 4000 50  0001 C CNN
F 3 "" H 5400 4000 50  0001 C CNN
	1    5400 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4050 5400 3950
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5DF1A512
P 1350 3600
F 0 "J1" H 1242 3275 50  0000 C CNN
F 1 "Conn_01x02_Female" H 1242 3366 50  0000 C CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 1350 3600 50  0001 C CNN
F 3 "~" H 1350 3600 50  0001 C CNN
	1    1350 3600
	-1   0    0    1   
$EndComp
$Comp
L Device:C C1
U 1 1 5DF1B271
P 2000 3550
F 0 "C1" H 2115 3596 50  0000 L CNN
F 1 "100nF" H 2115 3505 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 2038 3400 50  0001 C CNN
F 3 "~" H 2000 3550 50  0001 C CNN
	1    2000 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C2
U 1 1 5DF1BCCD
P 2500 3550
F 0 "C2" H 2615 3596 50  0000 L CNN
F 1 "100uF" H 2615 3505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 2500 3550 50  0001 C CNN
F 3 "~" H 2500 3550 50  0001 C CNN
	1    2500 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5DF1CFC6
P 2950 3550
F 0 "C3" H 3065 3596 50  0000 L CNN
F 1 "100nF" H 3065 3505 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 2988 3400 50  0001 C CNN
F 3 "~" H 2950 3550 50  0001 C CNN
	1    2950 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C4
U 1 1 5DF1D5C8
P 3450 3550
F 0 "C4" H 3565 3596 50  0000 L CNN
F 1 "100uF" H 3565 3505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 3450 3550 50  0001 C CNN
F 3 "~" H 3450 3550 50  0001 C CNN
	1    3450 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3400 2950 3400
Wire Wire Line
	1650 3400 1650 3500
Wire Wire Line
	1650 3500 1550 3500
Connection ~ 2000 3400
Wire Wire Line
	2000 3400 1650 3400
Connection ~ 2500 3400
Wire Wire Line
	2500 3400 2000 3400
Connection ~ 2950 3400
Wire Wire Line
	2950 3400 2500 3400
Wire Wire Line
	1550 3600 1650 3600
Wire Wire Line
	1650 3600 1650 3700
Wire Wire Line
	1650 3700 2000 3700
Connection ~ 2000 3700
Wire Wire Line
	2000 3700 2500 3700
Connection ~ 2500 3700
Wire Wire Line
	2500 3700 2950 3700
Connection ~ 2950 3700
Wire Wire Line
	2950 3700 3450 3700
$Comp
L power:VCC #PWR0116
U 1 1 5DF33F04
P 2500 3400
F 0 "#PWR0116" H 2500 3250 50  0001 C CNN
F 1 "VCC" V 2518 3527 50  0000 L CNN
F 2 "" H 2500 3400 50  0001 C CNN
F 3 "" H 2500 3400 50  0001 C CNN
	1    2500 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDPWR #PWR0117
U 1 1 5DF3554A
P 2500 3700
F 0 "#PWR0117" H 2500 3500 50  0001 C CNN
F 1 "GNDPWR" H 2504 3546 50  0000 C CNN
F 2 "" H 2500 3650 50  0001 C CNN
F 3 "" H 2500 3650 50  0001 C CNN
	1    2500 3700
	1    0    0    -1  
$EndComp
Text GLabel 7200 4100 3    50   Input ~ 0
LSI1
Text GLabel 4800 4900 2    50   Output ~ 0
LSI1
Text GLabel 7700 4100 3    50   Input ~ 0
LSI2
Wire Wire Line
	6700 3750 6700 4100
Wire Wire Line
	6800 4100 6800 3750
Text GLabel 4800 4600 2    50   Output ~ 0
LSI2
Text GLabel 4800 5800 2    50   Output ~ 0
LSI3
Text GLabel 4800 5900 2    50   Output ~ 0
LSI4
Wire Wire Line
	7900 3750 7900 4100
Wire Wire Line
	6600 4100 6600 3750
Wire Wire Line
	4700 5800 4800 5800
Wire Wire Line
	4800 5900 4700 5900
Wire Wire Line
	4700 4900 4800 4900
Wire Wire Line
	4700 4600 4800 4600
Text GLabel 6900 4100 3    50   Input ~ 0
BI1
Text GLabel 7000 4100 3    50   Input ~ 0
BI2
Text GLabel 4800 5200 2    50   Output ~ 0
BI1
Text GLabel 4800 5100 2    50   Output ~ 0
BI2
Text GLabel 4800 4800 2    50   Output ~ 0
BI3
Text GLabel 4800 4700 2    50   Output ~ 0
BI4
Wire Wire Line
	4700 4800 4800 4800
Wire Wire Line
	4700 4700 4800 4700
Wire Wire Line
	7000 4100 7000 3750
Wire Wire Line
	6900 4100 6900 3750
Wire Wire Line
	4700 5100 4800 5100
Wire Wire Line
	4700 5200 4800 5200
Text GLabel 6800 4100 3    50   Input ~ 0
DATA_C
Text GLabel 7100 4100 3    50   Input ~ 0
DATA_D
Wire Wire Line
	7100 4100 7100 3750
Wire Wire Line
	7200 3750 7200 4100
Text GLabel 7900 4100 3    50   Input ~ 0
DATA_B
Text GLabel 7300 4100 3    50   Input ~ 0
DATA_A
Wire Wire Line
	7600 4100 7600 3750
Wire Wire Line
	7500 3750 7500 4100
Text GLabel 4800 5000 2    50   Output ~ 0
DATA_D
Text GLabel 4800 5300 2    50   Output ~ 0
DATA_C
Text GLabel 4800 5600 2    50   Output ~ 0
DATA_B
Text GLabel 4800 5700 2    50   Output ~ 0
DATA_A
Wire Wire Line
	4800 5700 4700 5700
Wire Wire Line
	4700 5600 4800 5600
Wire Wire Line
	4800 5300 4700 5300
Wire Wire Line
	4700 5000 4800 5000
Text GLabel 6700 4100 3    50   Input ~ 0
DP_1
Text GLabel 6600 4100 3    50   Input ~ 0
DP_2
Text GLabel 4800 5500 2    50   Output ~ 0
DP_2
Text GLabel 4800 5400 2    50   Output ~ 0
DP_1
Wire Wire Line
	4700 5400 4800 5400
Wire Wire Line
	4700 5500 4800 5500
Wire Wire Line
	7400 3750 7400 4100
Wire Wire Line
	7300 4100 7300 3750
Text GLabel 5050 1050 1    50   Input ~ 0
DATA_A_2
Text GLabel 4900 1050 1    50   Input ~ 0
DATA_B_2
Text GLabel 4750 1050 1    50   Input ~ 0
DATA_C_2
Text GLabel 4600 1050 1    50   Input ~ 0
DATA_D_2
Wire Wire Line
	4600 1050 4600 1300
Connection ~ 4600 1300
Wire Wire Line
	4750 1050 4750 1250
Connection ~ 4750 1250
Wire Wire Line
	4900 1050 4900 1200
Connection ~ 4900 1200
Wire Wire Line
	5050 1050 5050 1150
Connection ~ 5050 1150
Text GLabel 7100 3150 1    50   Output ~ 0
DATA_D_2
Text GLabel 6800 3150 1    50   Output ~ 0
DATA_C_2
Text GLabel 7900 3150 1    50   Output ~ 0
DATA_B_2
Text GLabel 7300 3150 1    50   Output ~ 0
DATA_A_2
Wire Wire Line
	7800 3150 7800 3200
Wire Wire Line
	7700 3150 7700 3200
Connection ~ 7700 3200
Wire Wire Line
	6900 3150 6900 3200
Connection ~ 6900 3200
Wire Wire Line
	6800 3150 6800 3200
Connection ~ 6800 3200
Text GLabel 5150 2350 2    50   Input ~ 0
BI1_2
Text GLabel 8300 2350 2    50   Input ~ 0
BI3_2
Text GLabel 9850 2350 2    50   Input ~ 0
BI4_2
Wire Wire Line
	9850 2350 9750 2350
Wire Wire Line
	4850 2350 4900 2350
Text GLabel 7400 3150 1    50   Output ~ 0
BI3_2
Text GLabel 7500 3150 1    50   Output ~ 0
BI4_2
Text GLabel 7000 3150 1    50   Output ~ 0
BI2_2
Text GLabel 6900 3150 1    50   Output ~ 0
BI1_2
Text GLabel 6750 2350 2    50   Input ~ 0
BI2_2
Connection ~ 7050 2600
Wire Wire Line
	5450 2600 7050 2600
Wire Wire Line
	6750 2350 6650 2350
Wire Wire Line
	5050 2350 5150 2350
Text GLabel 7600 3150 1    50   Output ~ 0
LSI3_2
Text GLabel 7800 3150 1    50   Output ~ 0
LSI4_2
Text GLabel 7700 3150 1    50   Output ~ 0
LSI2_2
Text GLabel 7200 3150 1    50   Output ~ 0
LSI1_2
Text GLabel 4550 2350 0    50   Input ~ 0
LSI1_2
Text GLabel 6150 2350 0    50   Input ~ 0
LSI2_2
Text GLabel 7700 2350 0    50   Input ~ 0
LSI3_2
Text GLabel 9250 2350 0    50   Input ~ 0
LSI4_2
Wire Wire Line
	9300 2350 9250 2350
Wire Wire Line
	7750 2350 7700 2350
Wire Wire Line
	6200 2350 6150 2350
Wire Wire Line
	4600 2350 4550 2350
Wire Wire Line
	8100 4100 8100 3750
Wire Wire Line
	8000 4100 8000 3750
Text GLabel 7500 4100 3    50   Input ~ 0
BI4
Text GLabel 7400 4100 3    50   Input ~ 0
BI3
Text GLabel 7800 4100 3    50   Input ~ 0
LSI4
Text GLabel 7600 4100 3    50   Input ~ 0
LSI3
Wire Wire Line
	6600 3150 6600 3200
Connection ~ 6600 3200
Wire Wire Line
	6700 3150 6700 3200
Connection ~ 6700 3200
Wire Wire Line
	7900 3150 7900 3200
Connection ~ 7900 3200
Wire Wire Line
	8000 3150 8000 3200
Connection ~ 8000 3200
Wire Wire Line
	8100 3150 8100 3200
Connection ~ 8100 3200
Wire Wire Line
	8100 3200 8100 3750
Wire Wire Line
	8200 3150 8200 3200
Connection ~ 8200 3200
Wire Wire Line
	7600 3150 7600 3200
Wire Wire Line
	7000 3200 7000 3150
Text Label 3050 3400 0    50   ~ 0
+5Vdc
Connection ~ 6400 3750
Connection ~ 6500 3750
Connection ~ 6400 2550
Wire Wire Line
	6400 2550 5500 2550
Wire Wire Line
	6400 2550 6400 3200
Connection ~ 6400 3200
Wire Wire Line
	6400 3200 6400 3750
Wire Wire Line
	6500 3000 6500 3200
Connection ~ 6500 3200
Wire Wire Line
	6500 3200 6500 3750
Connection ~ 6700 3750
Connection ~ 6800 3750
Connection ~ 6900 3750
Connection ~ 7000 3750
Connection ~ 7100 3750
Connection ~ 7200 3750
Wire Wire Line
	7100 3150 7100 3200
Connection ~ 7100 3200
Wire Wire Line
	7100 3200 7100 3750
Wire Wire Line
	7200 3150 7200 3200
Connection ~ 7200 3200
Wire Wire Line
	7300 3200 7300 3750
Connection ~ 7300 3750
Connection ~ 7400 3750
Connection ~ 7500 3750
Wire Wire Line
	7300 3150 7300 3200
Connection ~ 7300 3200
Wire Wire Line
	7400 3150 7400 3200
Connection ~ 7400 3200
Wire Wire Line
	7500 3150 7500 3200
Connection ~ 7500 3200
Connection ~ 7600 3750
Connection ~ 6600 3750
Connection ~ 8000 3750
Connection ~ 8100 3750
Wire Wire Line
	7700 4100 7700 3750
Connection ~ 7700 3750
Wire Wire Line
	7800 3200 7800 3750
Connection ~ 7800 3200
Connection ~ 7800 3750
Wire Wire Line
	7800 3750 7800 4100
Connection ~ 7900 3750
$Comp
L power:VCC #PWR01
U 1 1 5E35BD38
P 5700 6200
F 0 "#PWR01" H 5700 6050 50  0001 C CNN
F 1 "VCC" V 5718 6327 50  0000 L CNN
F 2 "" H 5700 6200 50  0001 C CNN
F 3 "" H 5700 6200 50  0001 C CNN
	1    5700 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 6200 5150 6200
Connection ~ 5150 6200
$Comp
L Device:R_Small R5
U 1 1 5E36DA47
P 5350 6200
F 0 "R5" H 5409 6246 50  0000 L CNN
F 1 "R_Small" H 5409 6155 50  0001 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P2.54mm_Vertical" H 5350 6200 50  0001 C CNN
F 3 "~" H 5350 6200 50  0001 C CNN
	1    5350 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 6200 5450 6200
Text Notes 2000 5800 0    59   ~ 0
D2, D3 are HW INTERRUPT.\n\nD3, D5, D6, D9, D10, D11\nare PWM capable.\n\nAD6, AD7 are pure ADC\ninput WITHOUT internal\npull-up resistor.
Text Notes 5450 6400 0    50   ~ 0
NOTE! R5 is not present on 2019 PCB!
Text Notes 1000 3850 0    50   ~ 0
Power supply: 5Vdc
Text Notes 9850 5150 0    50   ~ 0
To RTC module ZS-042.\nRemember to remove the\ncharging circuit if using CR2032\n(not rechargeable).
Text Notes 9700 3150 0    50   ~ 0
R4/D1 are optional, if you want\nto run displays at lower voltage\n(cooler and longer life).\nIf not, jumper R4 and leave D1 open.
Text Notes 4450 3000 0    50   ~ 0
Open pads on pins 4&10 allow\nyour own combination of blinking\ndots. Must be connected to pin\n16+17 of the passthrough connector.
Text Notes 8500 4950 0    50   ~ 0
J13 selects interrupt rate\nfrom RTC: 1 Hz vs 32 kHz.\n(Use 1 Hz).
Text Notes 6600 4900 0    50   ~ 0
Add jumper on J9 if displays and\nlogin on the daughter board run\nboth at 5V.
$EndSCHEMATC
