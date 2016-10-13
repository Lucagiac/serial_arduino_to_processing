// Example by Tom Igoe

import processing.serial.*;

int radius = 10, directionX = 1, directionY = 0;
float x=300, y=300, speed=0.5;


// The serial port:
Serial myPort;

void setup() {
  // List all the available serial ports:
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.clear();
  size(600, 600);
  
  frameRate(10);
  
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  
}

void draw() {
  background(230);
  // changing Position
  x=x+speed*directionX;
  y=y+speed*directionY; 
  // check boundaries
  if ((x>width-radius) || (x<radius))
  {   
    directionX=-directionX;
  }
  if ((y>height-radius) || (y<radius))
  {   
    directionY=-directionY;
  } 
  // draw
  // if(direction==1)
  // rect(x, y, 20, 20);
  fill (color(0, 22, 22)); 
  ellipse (x, y, radius, radius);    // body
  fill (color(22, 82, 22)); 
  ellipse (x-4, y-4, 2, 2);  // the eye
  while (myPort.available() > 0) {
  int inByte = myPort.read();
  
  if(inByte == 0){
      directionX=-10;
      directionY=0;  
  }
  
    if(inByte == 1){
      directionX=+10;
      directionY=0;
  
  }
  
    if(inByte == 2){
      directionX=0;
      directionY=-10;
  
  }
  
    if(inByte == 3){
      directionX=0;
      directionY=10;
  
  }
    
    println(inByte);
  }
}
