# A Clock with four TIL311 LED displays
This project is an Arduino-based clock with 4x TIL311 obsolete displays. A PCB has been created in KiCad to simplify wiring, so the code is tailored to its layout.
This device uses:
* decimal points to blink once a second
* an LDR to control brightness through PWM of the Blanking Input
* independent brightness control for each digit
* pushbutton (long press) + potentiometer to adjust the time/date
* pushbutton (short press) to activate a time counter

Since the display is HEX-capable, at one point the clock will show random words using A, B, C, D, E, F, I ("1"), O ("0") letters only. Actually, with some imagination, 2, 5 and 7 could act as Z, S and T.

*Important*. LDR and potentiometer are connected to A6 and A7 respectively. These pins have no internal pull-up resistor. Remember it when designing your own circuit.
