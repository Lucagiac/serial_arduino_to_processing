// Sketch successfully tested on Arduino Uno Rev3.

// LICENCE
// Luca Giacolini
// www.lucagiacolini.com
// University College of London, Interactive Architecture Lab
// Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

// INTRODUCTION
//sending input value from A0 and A1 Arduino to Processing through serial communication

// HARDWARE
// two piezo sensors connected to A0 and A1. No resistors used in this circuit.

//declaring the necessary pins and variables
int sensor = A0;
int sensorValue = 0;
int sensor1 = A1;
int sensorValue1 = 0;

void setup() {

  pinMode(sensor, INPUT);
  pinMode(sensor1, INPUT);
  Serial.begin(9600); //this communication baudrate needs to match the one at which Processing is receiving
}

void loop() {

  //read sensor1 and map it
  sensorValue = analogRead(sensor);
  sensorValue = map(sensorValue, 0, 1023, 0, 99);
  //read sensor2 and map it
  sensorValue1 = analogRead(sensor1);
  sensorValue1 = map(sensorValue1, 0, 1023, 0, 99);

  //print the values to serial port. Arduino prints characters by default. I set them to be decimal. There is a , separating the values and a line to tell the two values have been sent
  Serial.print(sensorValue, DEC);
  Serial.print(",");
  Serial.print(sensorValue1, DEC);
  Serial.println();
//    uncomment these three lines on this in order to see the reading values on the serial monitor
//    Serial.print(sensorValue);
//    Serial.print("  ");
//        Serial.println(sensorValue1);

    delay(2);
 

}
