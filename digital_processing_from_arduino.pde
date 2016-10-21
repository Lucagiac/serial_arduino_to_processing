// Sketch successfully tested on Arduino Uno Rev3.

// LICENCE
// Luca Giacolini
// www.lucagiacolini.com
// University College of London, Interactive Architecture Lab
// Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

// INTRODUCTION
//sending input value from A0, A1, A2, A3 Arduino to Processing through serial communication


import processing.serial.*;

int radius = 10, directionX = 1, directionY = 0;
float x=width/2, y=width/2, speed=0.7;


// The serial port:
Serial myPort;

void setup() {
  
  fullScreen();
  // List all the available serial ports:
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.clear();

  
  frameRate(10);
  
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  
  
}

void draw() {
  background(250);
    rectMode(CENTER);
    //red bar on the left

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
      directionX=-20;
      directionY=0;  
  }
  
    if(inByte == 1){
      directionX=+20;
      directionY=0;
  
  }
  
    if(inByte == 2){
      directionX=0;
      directionY=-20;
  
  }
  
    if(inByte == 3){
      directionX=0;
      directionY=20;
  
  }
    
    println(inByte);
  }
  
  if (x > (width/2) && x < (width/2 + 150)){
    
    if (y < (height/2)){
       
        x = 50;
     y = 400;      
    }
  
  }
  
    if (x > (width/4) && x < (width/4 + 150)){
    
    if (y > (height/4)){
       
        x = 50;
     y = 400;      
    }
  
  }
  
      if (x > (width*3/4) && x < (width*3/4 + 150)){
    
    if (y > (height/3)){ 
       
        x = 50;
     y = 400;      
    }
  
  }
  
  
  if (x > width-100){
  
    background(255, 20, 20);
  }
  
  
  fill(15);
  beginShape();
  vertex((width/4), height);
  vertex((width/4)+150, height);
  vertex((width/4)+150, (height/4));
  vertex((width/4), (height/4));
  endShape(CLOSE);
  
  
  fill(15);
  beginShape();
  vertex((width/2), 0);
  vertex((width/2)+150, 0);
  vertex((width/2)+150, (height/2));
  vertex((width/2), (height/2)); 
  endShape(CLOSE);
  
  
  
    fill(15);
  beginShape();
  vertex((width*3/4), height);
  vertex((width*3/4)+150, height);
  vertex((width*3/4)+150, (height/3));
  vertex((width*3/4), (height/3));
  endShape(CLOSE);




}
