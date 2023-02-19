import processing.serial.*;
Serial port;
float brightness = 0;
String s;
PImage img;


void setup() {
  size(640, 512);
  port = new Serial(this, "/dev/ttyUSB0", 9600);
  port.bufferUntil('\n');
  img = loadImage("hsv.jpg");
}

void draw() {
  background(0, 0, brightness);
  image(img,0,0);
}

void serialEvent(Serial port) {
  s = port.readStringUntil('\n');
  print("IN< " + s);
  if (s != null && s.charAt(0) == 'P') { //POT: 716 / 69%
    String potPercentS;
    potPercentS = s.substring(s.indexOf('/') + 2);
    potPercentS = potPercentS.substring(0, potPercentS.indexOf('%'));
    brightness = float(potPercentS) * 2;
  }
}

void mousePressed() 
{
  color c = get(mouseX, mouseY);
  String colors = int(red(c))+","+int(green(c))+","+int(blue(c))+"\n";
  print("OUT> " + colors);
  port.write(colors);
}
