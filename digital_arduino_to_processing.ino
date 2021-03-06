// Sketch successfully tested on Arduino Uno Rev3.

// LICENCE
// Luca Giacolini
// www.lucagiacolini.com
// University College of London, Interactive Architecture Lab
// Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

// INTRODUCTION
//sending DIGITAL values from Arduino to Processing through serial communication

// HARDWARE
// four push buttons each individually grounded through a pull-up resistor (10kOhm)


#define buttonPin        A0
#define buttonPin1       A1
#define buttonPin2       A2
#define buttonPin3       A3
 
boolean previousState;
boolean previousState1;
boolean previousState2;
boolean previousState3;

int value = 0;
int value1 = 0;
int value2 = 0;
int value3 = 0;

int trigger = 0;

void setup()
{
  pinMode(buttonPin, INPUT);
  digitalWrite(buttonPin, HIGH); // pull-up
  pinMode(buttonPin1, INPUT);
  digitalWrite(buttonPin1, HIGH); // pull-up
  Serial.begin(9600);
  pinMode(buttonPin2, INPUT);
  digitalWrite(buttonPin2, HIGH); // pull-up
  pinMode(buttonPin3, INPUT);
  digitalWrite(buttonPin3, HIGH); // pull-up
  Serial.begin(9600);
  //setting the booleans as false
  previousState = false;
  previousState1 = false;
  previousState2 = false;
  previousState3 = false;

  triggerSet();

}

void loop()
{
  
  // ask the first button whether it is true or false. if pressed send a 0
  boolean value = handle_button();

  //using serial.write instead of serial.print cause I want to send bytes.
  if (!value)
  {  
    Serial.write(0);
  }
  
  // ask the second button whether it is true or false. if pressed send a 1
  boolean value1 = handle_button1();
  if (!value1)
  { 
    Serial.write(1);
  }

  // ask the third button whether it is true or false. if pressed send a 2
  boolean value2 = handle_button2();
  if (!value2)
  { 
    Serial.write(2);
  }

  // ask the fourth button whether it is true or false. if pressed send a 3
  boolean value3 = handle_button3();
  if (!value3)
  { 
    Serial.write(3);
  }
  
  delay(10);
}

//booleans that detects a state of change from pressed (LOW) to non pressed (HIGH). 
boolean handle_button()
{
  boolean event;
  value = analogRead(buttonPin);
  if (value > trigger){
  int currentState = false; // pin low -> value

  event = currentState && !previousState;
  previousState = currentState;

  return event;
  }
}

boolean handle_button1()
{
  boolean event1;
  value1 = analogRead(buttonPin1);
  if (value1 > trigger){
  int currentState1 = false; // pin low -> value

  event1 = currentState1 && !previousState1;
  previousState1 = currentState1;

  return event1;
  }
}

boolean handle_button2()
{
  boolean event2;
  value2 = analogRead(buttonPin2);
  if (value2 > trigger){
  int currentState2 = false; // pin low -> value

  event2 = currentState2 && !previousState2;
  previousState2 = currentState2;

  return event2;
  }
}

boolean handle_button3()
{
  boolean event3;
  value3 = analogRead(buttonPin3);
  if (value3 > trigger){
  int currentState3 = false; // pin low -> value

  event3 = currentState3 && !previousState3;
  previousState3 = currentState3;

  return event3;
  }
}

void triggerSet(){



  int first = analogRead(A0);

  

  trigger = first - 20;

  delay(5000);
  
  }
