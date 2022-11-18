EESchema Schematic File Version 4
LIBS:fuji-right-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MX_Alps_Hybrid:MX-NoLED MX2
U 1 1 62BA2FCC
P 4900 1700
F 0 "MX2" H 4933 1923 60  0000 C CNN
F 1 "MX-NoLED" H 4933 1849 20  0000 C CNN
F 2 "MX_Alps_Hybrid:MX-1U-NoLED" H 4275 1675 60  0001 C CNN
F 3 "" H 4275 1675 60  0001 C CNN
	1    4900 1700
	1    0    0    -1  
$EndComp
$Comp
L MX_Alps_Hybrid:MX-NoLED MX3
U 1 1 62BA33B3
P 5300 1700
F 0 "MX3" H 5333 1923 60  0000 C CNN
F 1 "MX-NoLED" H 5333 1849 20  0000 C CNN
F 2 "MX_Alps_Hybrid:MX-1U-NoLED" H 4675 1675 60  0001 C CNN
F 3 "" H 4675 1675 60  0001 C CNN
	1    5300 1700
	1    0    0    -1  
$EndComp
$Comp
L MX_Alps_Hybrid:MX-NoLED MX5
U 1 1 62BA39F4
P 6100 1700
F 0 "MX5" H 6133 1923 60  0000 C CNN
F 1 "MX-NoLED" H 6133 1849 20  0000 C CNN
F 2 "MX_Alps_Hybrid:MX-1U-NoLED" H 5475 1675 60  0001 C CNN
F 3 "" H 5475 1675 60  0001 C CNN
	1    6100 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 1850 4850 1850
Connection ~ 4850 1850
Wire Wire Line
	4850 1850 5250 1850
Connection ~ 5250 1850
Text GLabel 5850 1600 1    50   Input ~ 0
COL6
Text GLabel 5450 1600 1    50   Input ~ 0
COL7
Connection ~ 5650 1850
Wire Wire Line
	5250 1850 5650 1850
Wire Wire Line
	5650 1850 6050 1850
$Comp
L MX_Alps_Hybrid:MX-NoLED MX4
U 1 1 62BA3660
P 5700 1700
F 0 "MX4" H 5733 1923 60  0000 C CNN
F 1 "MX-NoLED" H 5733 1849 20  0000 C CNN
F 2 "MX_Alps_Hybrid:MX-1U-NoLED" H 5075 1675 60  0001 C CNN
F 3 "" H 5075 1675 60  0001 C CNN
	1    5700 1700
	1    0    0    -1  
$EndComp
Text GLabel 5050 1600 1    50   Input ~ 0
COL8
Text GLabel 4600 1600 1    50   Input ~ 0
COL9
Wire Wire Line
	6250 1600 6250 1650
Wire Wire Line
	5850 1600 5850 1650
Wire Wire Line
	5450 1600 5450 1650
Wire Wire Line
	5050 1600 5050 1650
Text GLabel 6250 1600 1    50   Input ~ 0
COL5
Wire Wire Line
	4600 1600 4600 1650
$Comp
L MX_Alps_Hybrid:MX-NoLED MX1
U 1 1 62BA251A
P 4450 1700
F 0 "MX1" H 4483 1923 60  0000 C CNN
F 1 "MX-NoLED" H 4483 1849 20  0000 C CNN
F 2 "MX_Alps_Hybrid:MX-1U-NoLED" H 3825 1675 60  0001 C CNN
F 3 "" H 3825 1675 60  0001 C CNN
	1    4450 1700
	1    0    0    -1  
$EndComp
Text GLabel 2800 1250 2    50   Input ~ 0
COL9
Text GLabel 2800 1350 2    50   Input ~ 0
COL8
Text GLabel 2800 1450 2    50   Input ~ 0
COL7
Text GLabel 2800 1550 2    50   Input ~ 0
COL6
Text GLabel 2800 1650 2    50   Input ~ 0
COL5
$Comp
L Connector:6P6C J1
U 1 1 62BFBA89
P 2400 1550
F 0 "J1" H 2457 2117 50  0000 C CNN
F 1 "6P6C" H 2457 2026 50  0000 C CNN
F 2 "Connector_RJ:RJ12_Amphenol_54601" V 2400 1575 50  0001 C CNN
F 3 "~" V 2400 1575 50  0001 C CNN
	1    2400 1550
	1    0    0    -1  
$EndComp
Text GLabel 2800 1750 2    50   Input ~ 0
ROW0
Text GLabel 4400 1850 0    50   Input ~ 0
ROW0
$EndSCHEMATC
