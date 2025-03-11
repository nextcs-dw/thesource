Orb orbs[];
FixedOrb earth;

//other variables
int NUM_ORBS = 5;
int MAX_SIZE = 60;
int MAX_MASS = 100;
int MIN_SIZE = 10;

float gconstant;
boolean moving;
boolean bounce;

void setup() {
  size(600, 600);
  gconstant = 1;
  moving = false;
  bounce = false;

  orbs = new Orb[NUM_ORBS];
  makeOrbs(true, true);
  earth = new FixedOrb(width/2, height*100, 20, 1000);
}//setup

void draw() {
  background(255);
  earth.display();

  for (int o=0; o<orbs.length; o++) {
    orbs[o].display();
  }

  if (moving) {

    for (int o=0; o<orbs.length; o++)  {
      PVector g = orbs[o].getGravity(earth, gconstant);
      orbs[o].applyForce(g);
    }

    for (int o=0; o<orbs.length; o++) {
      orbs[o].move(bounce);
    }
  }//moving

}//draw

void keyPressed() {
  if (key == ' ') { moving = ! moving; }
  if (key == 'b') { bounce = ! bounce; }
  if (key == 'r') {
    makeOrbs(true, true);
    moving = false;
  }
}//keyPressed



void makeOrbs(boolean inline, boolean horizontal) {
  int x = width / (NUM_ORBS + 1);
  int y = MAX_SIZE;
  for (int i=0; i<orbs.length; i++) {
    orbs[i] = new Orb();
    if (inline && horizontal) {
      orbs[i].center = new PVector(x, y);
    }
    else if (inline && !horizontal) {
      orbs[i].center = new PVector(y, x);
    }
    x+= width/(NUM_ORBS+1);
  }//for
}//makeOrbs
