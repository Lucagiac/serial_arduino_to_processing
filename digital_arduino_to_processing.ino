// Sketch successfully tested on Arduino Uno Rev3.

// LICENCE
// Luca Giacolini
// www.lucagiacolini.com
// University College of London, Interactive Architecture Lab
// Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

// INTRODUCTION
//sending input value from digitalPin2, digitalPin3 Arduino to Processing through serial communication

// HARDWARE
// two push buttons each individually grounded through a pull-up resistor (10kOhm)


#define buttonPin        2
#define buttonPin1       3
 
boolean previousState; // previous state
boolean previousState1;

void setup()
{
  pinMode(buttonPin, INPUT);
  digitalWrite(buttonPin, HIGH); // pull-up
  pinMode(buttonPin1, INPUT);
  digitalWrite(buttonPin1, HIGH); // pull-up
  Serial.begin(9600);
  //setting the booleans as false
  previousState = false;
  previousState1 = false;
}

void loop()
{
  
  // ask the first button whether it is true or false. if pressed send a 0
  boolean value = handle_button();

  //using serial.write instead of serial.print cause I want to send bytes.
  if (value)
  {  
    Serial.write(0);
  }
  
  // ask the second button whether it is true or false. if pressed send a 1
  boolean value1 = handle_button1();
  if (value1)
  { 
    Serial.write(1);
  }
  
  delay(10);
}

//booleans that detects a state of change from pressed (LOW) to non pressed (HIGH). 
boolean handle_button()
{
  boolean event;
  int currentState = !digitalRead(buttonPin); // pin low -> value

  event = currentState && !previousState;
  previousState = currentState;
  return event;
}

boolean handle_button1()
{
  boolean event1;
  int currentState1 = !digitalRead(buttonPin1); // pin low -> value

  event1 = currentState1 && !previousState1;
  previousState1 = currentState1;
  return event1;
}
