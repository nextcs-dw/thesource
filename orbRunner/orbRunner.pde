Orb[] orbs;

//other variables
int NUM_ORBS = 6;
int MAX_SIZE = 60;
int MIN_SIZE = 10;
int MAX_MASS = 100;

boolean moving;
PVector gravity;
PVector wind;
float dcoef;

void setup() {
  size(600, 600);
  textAlign(LEFT, TOP);
  textSize(20);
  moving = false;

  orbs = new Orb[NUM_ORBS];
  makeOrbs();

  gravity = new PVector();
  wind = new PVector();
  dcoef = 0.1;
}//setup

void draw() {
  background(255);

  fill(0, 255, 255);
  rect(0, 200, width, height-200);

  for (int i=0; i<orbs.length; i++) {
    orbs[i].display();
  }
  if (moving) {
    for (int i=0; i<orbs.length; i++) {
      orbs[i].applyForce(gravity);
      orbs[i].applyForce(wind);

      if ((orbs[i].center.y + orbs[i].bsize/2) > 200) {
        PVector drag = orbs[i].getDragForce(dcoef);
        orbs[i].applyForce(drag);
      }

      orbs[i].move();
    }
  }//moving

  fill(0);
  text("wind: " + wind, 0, 0);
  text("gravity: " + gravity, 0, 20);
  text("drag: " + dcoef, width-80, 0);
}//draw

void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'r') {
    makeOrbs();
  }
  if (keyCode == UP) {
    gravity.y -=  0.1;
  }
  if (keyCode == DOWN) {
    gravity.y += 0.1;
  }
  if (keyCode == RIGHT) {
    wind.x += 0.1;
  }
  if (keyCode == LEFT) {
    wind.x -= 0.1;
  }
}//keyPressed


void makeOrbs() {
  float x = width / MAX_SIZE;
  float y = MAX_SIZE;
  for (int i=0; i<orbs.length; i++) {
    float osize = random(MIN_SIZE, MAX_SIZE);
    orbs[i] = new Orb(x, y, osize);
    x+= width/NUM_ORBS;
  }//for
}//makeOrbs
