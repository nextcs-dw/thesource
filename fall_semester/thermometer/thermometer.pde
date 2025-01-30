int CELSIUS = 0;
int FAHRENHEIT = 1;
float ft;

void setup() {
  size(300, 600);
  textAlign(CENTER, CENTER);
  frameRate(30);
}//setup

void draw() {
  background(150);

  if (frameCount % 30 == 1) {
    ft = random(32, 212);
  }
  drawThermometer(50, 50, 100, 500, ft, FAHRENHEIT);
  drawThermometer(150, 50, 100, 500, fToC(ft), CELSIUS);
}//draw


void drawThermometer(int x, int y, int w, int h, float temp, int scale) {

  //bounding box
  fill(255);
  rect(x, y, w, h);

  int scaleWidth = int(w * 0.4);
  int scaleHeight = int(h * 0.9);

  //inner box
  drawReading(x+(w-scaleWidth)/2, y+(h-scaleHeight)/2, scaleWidth, scaleHeight, temp, scale);



  text(temp, x+ w/2, y+15);
}//drawThermometer

void drawReading(int x, int y, int w, int h, float temp, int scale) {

  rect(x, y, w, h);
  int tempHeight = 0;
  if (scale == FAHRENHEIT) {
    tempHeight = int((temp-32) / (212.0 - 32) * h);
  }//farenheight scale
  else {
    tempHeight = int(temp / 100.0 * h);
  }
  fill(255, 0, 0);
  rect(x, y+(h-tempHeight), w, tempHeight);

  //scale
  drawScale(x-15, y+h, h, scale);
}//drawReading

void drawScale(int x, float y, int h, int scale) {

  //println(h);
  int scaleStop = 0;
  int scaleStart = 0;
  float scaleIncrease = 0;
  if (scale == FAHRENHEIT) {
    scaleStop = 212;
    scaleStart = 32;
    scaleIncrease = h/180.0;
  }
  else if (scale == CELSIUS) {
    scaleStop = 100;
    scaleIncrease = h/100.0;
  }
  for (; scaleStart<=scaleStop; scaleStart++) {
    if (scaleStart % 5 == 0) {
      line(x, y, x+10, y);
      text(scaleStart, x-5, y);
    }
    y-= scaleIncrease;
    //println(scaleStart + " y: " + y);
  }//draw marks
}//drawScale

float fToC(float fahrenheight) {
  float c = (fahrenheight - 32.0) * (5.0/9);
  return c;
}//fToC
