Orb b0;

//other variables
boolean moving;
PVector gravity;

void setup() {
  size(1000, 400);
  moving = false;

  b0 = new Orb(width/2, 25, 20);
  gravity = new PVector(0, 0.1);
  PVector push = new PVector(2, -2);
  b0.applyForce(gravity);
  //b0.applyForce(push);
}//setup

void draw() {
  background(255);

  b0.display();

  if (moving) {
    b0.applyForce(gravity);
    b0.move();
  }//moving

}//draw

void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'r') {
    b0 = new Orb(random(width), random(height), 20);
  }
}//keyPressed
