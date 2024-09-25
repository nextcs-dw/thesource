int x, y; //position of target
int ts;//size of target

void setup() {
  size(500, 500);
  frameRate(30);
  ts = 100;
  x = int(random(ts/2, width-(ts/2) ));
  y = int(random(ts/2, height-(ts/2)));
}//setup

void draw() {

  background(255);
  println("before target: " + y);
  target(x, y, 100);
  if (frameCount % 1 == 0 && y > ts/2) {
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
