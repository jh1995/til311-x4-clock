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

# Operation

The user interface of this clock is composed of a button and a potentiometer. All controls are a combination of the two.

## At power up

At power up it is possible to choose between continuous operation and night mode. While in continuous operation the display is always on, in night mode it will display time between 00:00 AM and 07:59 AM. During the day the display is off unless the clock registers a large-ish variation in the incident light. In this case the display stays on for 80 seconds unless another light variation is noticed during the last 20 seconds, which resets the 80" counter.

* To enter night mode power up the clock with the potentiometer fully closed (CCW). Briefly displays "CO 1".
* To enter continous operation power up the clock with the potentiometer fully open (CW). Briefly displays "CO 0".
* Any other pot position at power up keeps the previous setting, which is recorded into the permanent memory (EEPROM). Brieflt displays "CO 0" or "CO 1" depending on the EEPROM value.

## Clock

Without uset interaction, the device goes into Clock mode and operates according to the logic described above. It applies leading-zero blanking. The two innermost dots blank alternatively every second. The digit luminosity is adjusted according to the incoming light (even though the algorithm still needs refining).

## Timer - counter

TBW

## Setting the clock

A long press of the button during normal Clock operation activates the setting function. At each press the value is confirmed and moves to the next. The value is chosen rotating the potentiometer. This is the sequence:
* hours (0-23)
* tens of minutes (0-5)
* units of minutes (0-9)
* month (1-12)
* day (1-31)
* tens of year (2-5) -- from 2020 to 2050
* units of year (0-9) 

The new value is written to the RTC only after all parameters have been set. If you want to abort the setting procedure you can long-press the button and end the setting cycle, or power cycle the clock.

