import processing.serial.*;
PImage img;
Serial port;

void setup()
{
  size(640,256);
  img = loadImage("hsv.jpg");
  port = new Serial(this, "/dev/ttyUSB0", 9600);                               
}

void draw()
{
  background(0);
  image(img,0,0);
}

void mousePressed() 
{
  color c = get(mouseX, mouseY);
  String colors = int(red(c))+","+int(green(c))+","+int(blue(c))+"\n";
  print(colors);
  port.write(colors);
}
