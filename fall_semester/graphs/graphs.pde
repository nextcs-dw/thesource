int dotDiameter;

void setup() {
  size(600, 400);
  background(0);
  frameRate(60);
  noStroke();
  dotDiameter = 10;
}//setup

void draw() {
  //background(0);
  int x = frameCount % width;

  drawSinCurve(x, 100, 100, dotDiameter);
  plotCircle(x, 100, width/2, height - height/4, dotDiameter);
}//draw

float getSineY(int theta, float amplitude, int k) {
  float t = radians(theta);
  float y = amplitude * sin(t) + k;
  return y;
}//getSineY

void drawSinCurve(int x, float amplitude, int k, int d) {
  float y = getSineY(x, amplitude, k);
  circle(x, y, d);
}//drawSinCurve

float getCircleX(int theta, float amplitude, int cx) {
  float t = radians(theta);
  float x = amplitude * cos(t) + cx;
  return x;
}//getCircleX

void plotCircle(int theta, int r, int cx, int cy, int d) {
  float x = getCircleX(theta, r, cx);
  float y = getSineY(theta, r, cy);
  circle(x, y, d);
}//plotCircle
