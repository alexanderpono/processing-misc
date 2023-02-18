import processing.serial.*;
Serial port;
float brightness = 0;
String s;
void setup() {
  size(500, 500);
  port = new Serial(this, "/dev/ttyUSB0", 9600);
  port.bufferUntil('\n');
}

void draw() {
  background(0, 0, brightness);
}

void serialEvent(Serial port) {
  s = port.readStringUntil('\n');
  if (s != null && s.charAt(0) == 'P') { //POT: 716 / 69%
    String potPercentS;
    potPercentS = s.substring(s.indexOf('/') + 2);
    potPercentS = potPercentS.substring(0, potPercentS.indexOf('%'));
    brightness = float(potPercentS) * 2;
  }
}
