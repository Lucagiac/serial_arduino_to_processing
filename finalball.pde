//importing the library of processing, necessary in the sketch
import processing.serial.*;
Serial myPort;

int numValues = 2;    
int A = 0;          
int B = 0;       

float x, y;
 
void setup() {
  
  size(800, 800);

  //initializing the serial port. The second parameter is the port we talk to, the third is the baudrate (needs to match the one at which Arduino is sending values)
  myPort = new Serial(this, "/dev/ttyACM0", 9600);
  myPort.clear();
  myPort.bufferUntil('\n');

  frameRate(60);
  rectMode(CENTER);
  noStroke();
  
  //initial coordinates of the fixed ball
  x = 100;
  y = 400;  


}
 
void draw() {
  
  //print the values in the monitor, just to check whether they are actually coming in or not
  print(A);
  println(B);
  
  background(255);
  
  //red bar on the left
  fill(229, 89, 52);  
  rect(50, 400, 100, 800);
  //green bar on the right
  fill(142, 198, 98);
  rect(750, 400, 100, 800);
  
  //static ball  
  fill(20);
  ellipse(x, y, 50, 50);
  //moving ball
  ellipse(A*8, B*8, 50, 50);
  

  //if the moving ball gets close to the non moving ball, the static ball gets pushed to mantain a given x,y distance. The *8 multiplier is arbitrary.
  if (abs(A*8 - x) < 45 && abs(B*8 - y) < 45) 
  {
     x -= (A*8 - x)*0.125;
     y -= (B*8 - y)*0.125;
  }
  
  //when the static ball actually reaches the green area, make it blue
  if (x>720)
  {
     fill(11, 19, 43);
     ellipse(x, y, 50, 50);
  }

} 
 
void serialEvent(Serial myPort) { 
  // get the ASCII string from arduino, until the null
  String inString = myPort.readStringUntil('\n');
  //println(inString);        // < - uncomment this to debug serial input from Arduino
  
  if (inString != null) 
  {
    // trim off any whitespace:
    inString = trim(inString);
    // split the string on the commas and convert the resulting substrings into an integer array:
    int[] values = int(split(inString, ","));
    // if the array has at least the # of elements as your # of sensors, you know
    // you got the whole data packet.  Put the numbers into the variables:
    if (values.length >= numValues) 
    {
      A = int(values[0]);
      B = int(values[1]);
    }
  }
}