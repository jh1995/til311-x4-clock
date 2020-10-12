
// (c) by Paolo CRAVERO IK1ZYW 2020. All rights reserved.
//
// No responsibility is taken for any use of this code,
// which is provided as an academic guidance to fellow builders.
// -------------------------------------------------------------

#include <Wire.h>
#include <EEPROM.h> // used to store DST status
#include <RTClib.h>
#include <EasyButton.h>

RTC_DS3231 rtc;
DateTime RTCnow;


// **** CONFIGURATION ****

#define MAXBRI 30 // limit brightness PWM excursion (lower value = maximum brightness)
#define MINBRI 240 // limit brightness PWM excursion (highest value = minimum brightness)
#define DIMBRI 240

#define MAXONTIME 80   // number of seconds to stay ON during the day if nightmode is chosen
#define RESETONTIME 20  // reset to MAXONTIME if the timeout counter is lower than this
#define RESETONTIMEDIFF 7 // difference of brightness level to trigger daytime display in night mode

#define WORDS 46 // update this value to reflect the following array, minus 1
#define WORDS4LETTER 32
#define WORDS3LETTER 43
int words[] = {
  0xC1, 0xA0,
  0xF1, 0xFA,
  0xF1, 0xC0,
  0xCA, 0xFE,
  0xF0, 0xCA,
  0xDE, 0xAF,
  0xFA, 0xDE,
  0xFA, 0xD0,
  0xF1, 0xD0,
  0xAC, 0x1D,
  0xBE, 0xAD,
  0xB1, 0xDE,
  0xCA, 0xDE,
  0xCA, 0xD0,
  0xCA, 0xD1,
  0xC0, 0xDA,
  0xC0, 0xDE,
  0xD1, 0xCE,
  0xF0, 0x1E,
  0xA1, 0xDE,
  0x1D, 0xEA,
  0xAB, 0xBA,
  0x1C, 0xED,
  0x2B, 0xAD,
  0x36, 0x37,
  0x0B, 0x0E,
  0xAA, 0xAA,
  0xBB, 0xBB,
  0xCC, 0xCC,
  0xDD, 0xDD,
  0xEE, 0xEE,
  0xFF, 0xFF,
  0xBE, 0xEF, // 32 is here. End of 4-letter words
  0xD1, 0x00,
  0xF0, 0xE0,
  0xBA, 0xD0,
  0xBE, 0xD0,
  0xB1, 0xD0,
  0xB1, 0x00,
  0xB0, 0xA0,
  0xEC, 0x00,
  0x1C, 0xE0,
  0x0C, 0xA0,
  0xA1, 0xA0, // 43 is here. End of 3-letter words
  0x04, 0x20,
  0x07, 0x30,
  0x09, 0x00, // 46
};



// **** DEFINITIONS ****
// **** I/O PIN DEFINITIONS ****

int inputs[4] = {15, 14, 11, 8}; // Q1, Q2, Q4, Q8 outputs

int latches[4] = {17, 16, 4, 7}; // latches LSD to MSD

int blanking[4] = {6, 5, 9, 10}; // blanking line for brightness control via PWM (must be PWM pins)

#define decimalPointLeft 13
#define decimalPointRight 12

#define oneSecondInterruptPin 2

#define sensorPin A6 // LDR for intensity control
#define potPin A7 // linear pot
#define buttonPin 3 // button pin

// **** END I/O PIN DEFINITIONS ****

#define DSTADDRESS 1 // EEPROM position for DST status
#define NIGHTMODEEE 10 // EEPROM position to store night mode setting
#define NIGHTMODESTARTEE 12 // EEPROM position to store night mode start time
#define NIGHTMODEENDEE 16 // // EEPROM position to store night mode end time
#define ENDOFNIGHTMODE 9 // end night mode at 9 AM. Integer

byte seconds;
byte minutes;
byte hours;
byte weekday;
byte month_day;
byte month_nr;
byte year_nr;

EasyButton button(buttonPin);

bool blinker = 0;  // blinking control variable
bool dpBlink = 0; // decimal point blinking control; set to 1 to make decimal points blink
bool digitBlink = 0; // digit blinking control; set to 1 to make digits blink
bool blankMSD = 0; // set to true to blank MSD, when its value is '0'

bool dpLeftStatus = 0;
bool dpRightStatus = 0;
bool nightMode = 0; // set at power up, if set to 1 activates timed display during the day ****TBD
bool nightModeStayOn = 1;
int  nightModeStartHour;
int  nightModeEndHour;

bool secondElapsed = 0;
int  secondsElapsed = 30;
int  timerCountdown = MAXONTIME;

bool shortPress = 0;
bool longPress = 0;

int sensorValue = 0;  // variable to store the value coming from the LDR sensor
int sensorValuePrev = 0; // variable to store the previos value of LDR sensor

byte BCD[16][4] = { // LSB to MSB
  {0, 0, 0, 0}, // 0
  {1, 0, 0, 0}, // 1
  {0, 1, 0, 0}, // 2
  {1, 1, 0, 0}, // 3
  {0, 0, 1, 0}, // 4
  {1, 0, 1, 0}, // 5
  {0, 1, 1, 0}, // 6
  {1, 1, 1, 0}, // 7
  {0, 0, 0, 1}, // 8
  {1, 0, 0, 1}, // 9
  {0, 1, 0, 1}, // A
  {1, 1, 0, 1}, // B
  {0, 0, 1, 1}, // C
  {1, 0, 1, 1}, // D
  {0, 1, 1, 1}, // E
  {1, 1, 1, 1} // F
};


void setup() {

  Serial.begin(9600);

  // Initialize inputs and outputs
  pinMode(sensorPin, INPUT_PULLUP);
  pinMode(potPin, INPUT);
  pinMode(oneSecondInterruptPin, INPUT); // DS3231 square wave output. Does it need pullup?

  for (int a = 0; a < 4; a++) {
    pinMode(blanking[a], OUTPUT);  // set blanking/PWM outputs
    analogWrite(blanking[a], 255);
  }
  
  for (int a = 0; a < 4; a++) {
    pinMode(inputs[a], OUTPUT);  //set data lines outputs
    digitalWrite(inputs[a], LOW);
  }
  for (int a = 0; a < 4; a++) {
    pinMode(latches[a], OUTPUT);  //set data latches outputs
    digitalWrite(latches[a], HIGH);
  }


  pinMode(decimalPointLeft, OUTPUT);
  digitalWrite(decimalPointLeft, HIGH); // DP off
  pinMode(decimalPointRight, OUTPUT);
  digitalWrite(decimalPointRight, HIGH); // DP off

  // Initialize I2C RTC
  if (! rtc.begin()) {
    Serial.println("Couldn't find RTC");
    // TODO: display an error on the display E001
    blankControl(50, 50, 50, 50);
    printBCD(2, 0xE0);
    printBCD(0, 0x01);
    delay(1000);

    while (1);
  }

  if (rtc.lostPower()) {
    Serial.println("RTC lost power, you need to set the time!");
    rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
    // rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0));
    blankControl(50, 50, 50, 50);
    printBCD(2, 0xE0);
    printBCD(0, 0x02);
    delay(4500);

  }

    blankControl(50, 50, 255, 50);
    updateDisplay(3, 12);
    updateDisplay(2, 0);
    updateDisplay(1, 0);
  if (analogRead(potPin) > 1000) {
    nightMode = 0;
    EEPROM.write(NIGHTMODEEE, nightMode);   
  } else if (analogRead(potPin) < 10) {
    nightMode = 1;
    EEPROM.write(NIGHTMODEEE, nightMode);
  } else {  // pot is unconnected or not max nor min
    nightMode = EEPROM.read(NIGHTMODEEE);
  }
  updateDisplay(0, nightMode); 
  // DEBUG ***** nightMode=1; 
  delay(1000);

  // for future use, handle start hour of night mode in EEPROM
  // set to 0 if an invalid  value comes up
  nightModeStartHour = EEPROM.read(NIGHTMODESTARTEE);
  if (nightModeStartHour > 0) {
    nightModeStartHour = 0;
    EEPROM.write(NIGHTMODESTARTEE, 0);
  }
  
  // handle end hour of night mode in EEPROM;
  // set to 8 AM if an invalid value comes up
  nightModeEndHour = EEPROM.read(NIGHTMODEENDEE);
  if (nightModeEndHour > 23) {
    nightModeEndHour = 8;
    EEPROM.write(NIGHTMODEENDEE, 8);
  }
  

  rtc.writeSqwPinMode(DS3231_SquareWave1Hz);

  delay(300);

  RTCnow = rtc.now();
  seconds = RTCnow.second();
  secondsElapsed = seconds;
  randomSeed(seconds+RTCnow.day()+RTCnow.month());

  attachInterrupt(digitalPinToInterrupt(oneSecondInterruptPin), oneSecondISR, FALLING);

  // button initialization routines. Using INT1, so External Interrupt
  button.begin();
  button.onPressed(buttonPressed);
  button.onPressedFor(2000, buttonPressedTwoSeconds);
  if (button.supportsInterrupt())
  {
    button.enableInterrupt(buttonISR);
//    Serial.println("EasyButton onPressedFor Interrupt example");
  }

  updateDisplay(3, 12);
  updateDisplay(2, 1);
  updateDisplay(1, 10);
  updateDisplay(0, 0);

  // fadeIn
  fadeIn();

  delay(200);

}


void fadeIn()
{
  for (int j=255; j>=5; j=j-10) {
    blankControl(j, j, j, j);
    delay(25);
  }
}

int fadeOut(int startingValue = 10)
{
  for (int j=startingValue; j<256; j=j+10) {
    blankControl(j, j, j, j);
    delay(25);
  }
  return 255; // return all off
}

int decToBcd(int val)
{
  return ( ((val / 10) * 16) + (val % 10) );
}

int bcdToDec(int val)
{
  return ( val / 16 * 10 + val % 16 );
}


// increase a BCD value converting it to decimal and back
byte increaseBCD ( byte myBCD, int lowLimit, int highLimit ) {
  int myDecimal = bcdToDec( myBCD );  // get the decimal value

  myDecimal++;

  if (myDecimal > highLimit) {
    return decToBcd(lowLimit);
  } else {
    return decToBcd(myDecimal);
  }
}


// update a single digit of the display array.
// this is supposed to be the last ring in the display chain
// ------------------
// || parameters: digit position, BCD to display (0-F), decimal point status ||
void updateDisplay(int myPosition, int myBCD) {


  if ((myPosition >= 0) && (myPosition < 5)) { // just make sure we're not addressing a non-existant display
    for (int c = 0; c < 4; c++) {
      digitalWrite(inputs[c], BCD[myBCD][c]);
    }

    if (myPosition == 3) {
      if (myBCD == 0) {
        blankMSD = 1;
      } else {
        blankMSD = 0;
      }
    }
    
    // send a signal to the latch so that the display loads the data
    digitalWrite(latches[myPosition], HIGH);
    digitalWrite(latches[myPosition], LOW);
    digitalWrite(latches[myPosition], HIGH);
  }
}

void updateDpLeft(int dpLeft) {
  switch (dpLeft) {
    case 0:  // off
      dpLeftStatus = 1;
      break;
    case 1:  // on
      dpLeftStatus = 0;
      break;
    default: //toggle
      dpLeftStatus = !dpLeftStatus;
      break;
  }

  digitalWrite(decimalPointLeft, dpLeftStatus);
}

void updateDpRight(int dpRight) {
  switch (dpRight) {
    case 0:  // off
      dpRightStatus = 1;
      break;
    case 1:  // on
      dpRightStatus = 0;
      break;
    default: //toggle
      dpRightStatus = !dpRightStatus;
      break;
  }

  digitalWrite(decimalPointRight, dpRightStatus);
}


void printBCD(int myPosition, int myBCD) {
  int myDigit;

  // get lower digit and display it
  myDigit = myBCD & 0x0F;
  updateDisplay(myPosition, myDigit);

  // get higher digit and display it; remember to move 1 position upwards
  myDigit = myBCD >> 4;
  updateDisplay(myPosition + 1, myDigit);

}


void blankControl (int b3, int b2, int b1, int b0) {

  if (((nightModeStayOn==1)&&(nightMode == 1))||(nightMode == 0)) {
    if ( blankMSD == 1) {
      analogWrite(blanking[3], 255);
    } else {
      analogWrite(blanking[3], b3);
    }
    analogWrite(blanking[2], b2);
    analogWrite(blanking[0], b1);
    analogWrite(blanking[1], b0);
  } else {
    analogWrite(blanking[3], 255);
    analogWrite(blanking[2], 255);
    analogWrite(blanking[1], 255);
    analogWrite(blanking[0], 255);
  }
  
}


void oneSecondISR() {
  secondElapsed = 1;
  secondsElapsed += 1;
  timerCountdown -= 1;
}


void buttonPressedTwoSeconds()
{
  longPress = 1;
}


void buttonPressed()
{
  shortPress = 1;
}

void buttonISR()
{
  //When button is being used through external interrupts, parameter INTERRUPT must be passed to read() function
  button.read(INTERRUPT);
}

void loop() {

  static int lightIntensity;
  static int lightIntensityOld;
  int newHours;
  int newMinutes;
  int newDay;
  int newMonth;
  int newYear;
  int newDoW;
  int tempValue;
  int oldValue;
  int maxDayOfMonth;
  static int randomWord;
  
  button.update();

  if (shortPress == 1) {
    // short button press, enter time COUNTER routine

    nightModeStayOn = 1;
    longPress = 0; // acknowledge long press
    shortPress = 0; // reset short press

    lightIntensity = map(analogRead(sensorPin), 0, 1020, MAXBRI, MINBRI);
    
    // get rid of DPs
    updateDpLeft(0);
    updateDpRight(0);

    // wait for a short press to start elapsed time counter
    do {
      button.update();
      printBCD(2, 0x0C);
      printBCD(0, 0x00);
      blankControl(255, lightIntensity, lightIntensity, 255); // blank rightmost two digits
    } while (shortPress == 0);

    shortPress = 0;
    secondsElapsed = 0;

    updateDpRight(1); // set a spacer

    do {
      // upcount until button is pressed
      do {
        button.update();
        printBCD(2, decToBcd(secondsElapsed / 60));
        printBCD(0, decToBcd(secondsElapsed % 60));
        lightIntensity = map(analogRead(sensorPin), 0, 1020, MAXBRI, MINBRI);
        blankControl(lightIntensity, lightIntensity, lightIntensity, lightIntensity);
        if (secondsElapsed > 5999) { secondsElapsed = 0; } // return to zero after 99'59"
      } while (shortPress == 0);
      shortPress = 0;
      longPress = 0;

      do {
        button.update();
      } while (!(button.wasReleased()));
      shortPress = 0;

    } while (longPress == 0);
    shortPress = 0;
    longPress = 0;

    RTCnow = rtc.now(); // update current time
    secondsElapsed = RTCnow.second();

  } else if (longPress == 1) {
    // long button press, enter time SETTING routine
    
    nightModeStayOn = 1;
    longPress = 0; // acknowledge long press
    shortPress = 0; // reset short press

    // turn off DPs
    updateDpLeft(0);
    updateDpRight(0);

    newHours = RTCnow.hour();
    newMinutes = RTCnow.minute();
    newDay = RTCnow.day();
    newMonth = RTCnow.month();
    newYear = RTCnow.year() % 100;
    newDoW = RTCnow.dayOfTheWeek();

    // set hours
    oldValue = map(analogRead(potPin), 0, 1000, 0, 23);
    do {
      button.update();
      printBCD(2, decToBcd(newHours));
      printBCD(0, decToBcd(newMinutes));
      
      tempValue = map(analogRead(potPin), 0, 1000, 0, 23);
      // if the pot has moved
      if (tempValue != oldValue) {
        newHours = tempValue;
        oldValue = tempValue;
      }

      blankMSD = 0;
      blankControl(MAXBRI, MAXBRI, DIMBRI, DIMBRI); // blank rightmost two digits
    } while (shortPress == 0);
    shortPress = 0;

    if (longPress == 1) {
      updateDpLeft(1);
      updateDpRight(1);

    }

    // set minutes
    oldValue = map(analogRead(potPin), 0, 1015, 0, 59);
    do {
      button.update();
      printBCD(2, decToBcd(newHours));
      printBCD(0, decToBcd(newMinutes));

      tempValue = map(analogRead(potPin), 0, 1015, 0, 59);
      // if the pot has moved
      if (tempValue != oldValue) {
        newMinutes = tempValue;
        oldValue = tempValue;
      }
            
      blankControl(DIMBRI, DIMBRI, MAXBRI, MAXBRI); // blank rightmost two digits
    } while (shortPress == 0);
    shortPress = 0;

    if (longPress == 1) {
      updateDpLeft(1);
      updateDpRight(1);

    }


    // set month
    oldValue = map(analogRead(potPin), 0, 1000, 1, 12);
    do {
      button.update();
      printBCD(2, decToBcd(newDay));
      printBCD(0, decToBcd(newMonth));
      
      tempValue = map(analogRead(potPin), 0, 1000, 1, 12);
      // if the pot has moved
      if (tempValue != oldValue) {
        newMonth = tempValue;
        oldValue = tempValue;
      }
 
      
      blankControl(DIMBRI, DIMBRI, MAXBRI, MAXBRI); // blank leftmost two digits
    } while (shortPress == 0);
    shortPress = 0;

    if (longPress == 1) {
      updateDpLeft(1);
      updateDpRight(1);

    }


    // set day
    switch (newMonth) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        maxDayOfMonth = 31;
        break;
      case 4:
      case 6:
      case 9:
      case 11:
        maxDayOfMonth = 30;
        break;
      case 2: // alright, please don't set the time on THAT DAY of leap years!
        maxDayOfMonth = 28;
        break;
    }
      
    oldValue = map(analogRead(potPin), 0, 1000, 1, maxDayOfMonth);    
    do {
      button.update();
      printBCD(2, decToBcd(newDay));
      printBCD(0, decToBcd(newMonth));

      tempValue = map(analogRead(potPin), 0, 1000, 1, maxDayOfMonth);
      // if the pot has moved
      if (tempValue != oldValue) {
        newDay = tempValue;
        oldValue = tempValue;
      }
      
      blankMSD = 0;
      blankControl(MAXBRI, MAXBRI, DIMBRI, DIMBRI); // blank rightmost two digits
    } while (shortPress == 0);
    shortPress = 0;

    if (longPress == 1) {
      updateDpLeft(1);
      updateDpRight(1);

    }

    // set year
    oldValue = map(analogRead(potPin), 0, 1000, 20, 50);    
    do {
      button.update();
      printBCD(2, 0x20);
      printBCD(0, decToBcd(newYear));

      tempValue = map(analogRead(potPin), 0, 1000, 20, 50);
      // if the pot has moved
      if (tempValue != oldValue) {
        newYear = tempValue;
        oldValue = tempValue;
      }
      
      blankControl(MAXBRI, MAXBRI, MAXBRI, MAXBRI); // no blanking for the year
    } while (shortPress == 0);
    shortPress = 0;

    if (longPress == 1) {
      updateDpLeft(1);
      updateDpRight(1);

    }

    // set END OF NIGHT MODE
    oldValue = map(analogRead(potPin), 0, 1015, 0, 23);
    do {
      button.update();
      printBCD(2, 0xBE);
      printBCD(0, decToBcd(nightModeEndHour));

      tempValue = map(analogRead(potPin), 0, 1015, 0, 23);
      // if the pot has moved
      if (tempValue != oldValue) {
        nightModeEndHour = tempValue;
        oldValue = tempValue;
      }
            
      blankControl(DIMBRI, DIMBRI, MAXBRI, MAXBRI); // blank rightmost two digits
    } while (shortPress == 0);
    shortPress = 0;

    if (longPress == 1) {
      updateDpLeft(1);
      updateDpRight(1);

    }


    // update the RTC only if the button was not longpressed during previous steps
    printBCD(2, 0xCF);
    if (longPress == 0) {
      rtc.adjust(DateTime(newYear, newMonth, newDay, newHours, newMinutes, 0));
      EEPROM.write(NIGHTMODEENDEE, nightModeEndHour);
      printBCD(0, 1);
    } else {
      printBCD(0, 0);
    }
    blankControl(MAXBRI, MAXBRI, 255, MAXBRI);
    delay(1000);

    // exit
    shortPress = 0;
    longPress = 0;
    
    RTCnow = rtc.now(); // update current time

  } else {
    // no button press, display time

    if (secondElapsed == 1) {
      blinker = secondsElapsed % 2; // blink stuff once a second (0.5 Hz)

      // 0 to about 1020
      //      lightIntensity = analogRead(sensorPin);
      //      Serial.print("Light value: ");
      //      Serial.println(lightIntensity);
      
      lightIntensity = map(analogRead(sensorPin), 0, 1020, MAXBRI, MINBRI);
      if (nightMode == 1) {
        if (abs(lightIntensity-lightIntensityOld)>RESETONTIMEDIFF) {
          if (timerCountdown<RESETONTIME) {
            timerCountdown = MAXONTIME;
          }
          nightModeStayOn = 1;
        }
        if (timerCountdown<1) {
          nightModeStayOn = 0;
        }

        if (RTCnow.hour()<nightModeEndHour) { // between 00:00 and 08:00 stay on regardless
          nightModeStayOn = 1;          
        }
        
      lightIntensityOld = lightIntensity;
      }

      // Control blinking dots. Since there is no PWM on them,
      // turn them off in darkness or during DD/MM/YY display
      // at the end of the minute
      if ( (secondsElapsed > 56) || (lightIntensity > 200) ) {
        updateDpLeft(0);
        updateDpRight(0);
      } else {
        updateDpLeft(blinker);
        updateDpRight(!blinker);
      }
      
      
      secondElapsed = 0;

    }



    if (secondsElapsed >= 60) {

      randomWord = random(0, WORDS) * 2;
      
      // once a minute update the data from RTC
      RTCnow = rtc.now();
      secondsElapsed = RTCnow.second();
    }

    // daytime roll, between 7 AM and midnight
    if (RTCnow.hour() > 6) {

      switch (secondsElapsed) {
        case 18:
        case 19:
          // during the day show a random word
          printBCD(2, words[randomWord]);
          printBCD(0, words[randomWord+1]);
          blankMSD=0;
          if (randomWord > (WORDS3LETTER*2)) { // we're beyond 4-letter words
            blankControl(255, lightIntensity, lightIntensity, 255);
          } else if (randomWord > (WORDS4LETTER*2)) { // we're beyond 4-letter words
            blankControl(lightIntensity, lightIntensity, lightIntensity, 255);
          } else {
            blankControl(lightIntensity, lightIntensity, lightIntensity, lightIntensity);
          }
          updateDpRight(0);
          updateDpLeft(0);
          break;        
        case 59:
          // day-of-the-week number
          printBCD(2, 0xDA);
          if (RTCnow.dayOfTheWeek() == 0) {
            printBCD(0, 7);  // Sunday is day #7
          } else {
            printBCD(0, decToBcd(RTCnow.dayOfTheWeek()));
          }
          blankControl(lightIntensity, lightIntensity, 255, lightIntensity); // blank rightmost two digits
          break;
        case 58:
          printBCD(2, 0x20);
          printBCD(0, decToBcd(RTCnow.year() % 100));
          blankControl(lightIntensity, lightIntensity, lightIntensity, lightIntensity); // restore luminosity
          break;
        case 57:
          printBCD(0, decToBcd(RTCnow.month()));
          blankControl(255, 255, lightIntensity, lightIntensity); // blank leftmost two digits
          break;
        case 56:
          // show month-day and day-of-the-week number
          printBCD(2, decToBcd(RTCnow.day()));
          printBCD(0, 0xFF);
          blankMSD = 0;
          blankControl(lightIntensity, lightIntensity, 255, 255); // blank rightmost two digits
          break;
        case 55:
          lightIntensity = fadeOut(lightIntensity);
          delay(200);
          updateDpRight(0);
          updateDpLeft(0);
          break;
        default:
          printBCD(2, decToBcd(RTCnow.hour()));
          printBCD(0, decToBcd(RTCnow.minute()));
          blankControl(lightIntensity, lightIntensity, lightIntensity, lightIntensity);
          break;
      } // end switch
      
    } else {
        printBCD(2, decToBcd(RTCnow.hour()));
        printBCD(0, decToBcd(RTCnow.minute()));
        blankControl(lightIntensity, lightIntensity, lightIntensity, lightIntensity);
    }
    
  }


}
