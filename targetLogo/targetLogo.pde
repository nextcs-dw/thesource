
void setup() {
  size(500, 500);

  target(250, 250, 100);
}//setup

void draw() {

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
