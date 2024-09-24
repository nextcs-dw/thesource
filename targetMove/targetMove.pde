int y; //position of target

void setup() {
  size(500, 500);
  frameRate(30);
  y = height - 100;
}//setup

void draw() {

  background(255);
  println("before target: " + y);
  target(250, y, 100);
    if (frameCount % 15 == 0) {
  y--;
  }
  println("end of draw:" + y);
}//draw


void target(int cx, int cy, int tsize) {
  int tdiff = tsize/4;
  color c0 = #FF0000;
  color c1 = #FFFFFF;
  fill(c0);
  circle(cx, cy, tsize);
  fill(c1);
  circle(cx, cy, tsize - tdiff);
  fill(c0);
  circle(cx, cy, tsize - (2 * tdiff));
  fill(c1);
  circle(cx, cy, tsize - (3 * tdiff));
}//target
