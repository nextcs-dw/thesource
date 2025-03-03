//balls!
Ball b0;
Ball b1;

//other variables
int BSIZE;
boolean moving;
PVector gravity;

void setup() {
  size(1000, 800);
  BSIZE = 40;
  moving = true;
  
  b0 = new Ball(new PVector(25, height-25), 20);
  gravity = new PVector(0, 1);
  PVector push = new PVector(1, -1);
  b0.applyForce(gravity);
  b0.applyForce(push);
  //b0 = new Ball(new PVector(random(width), random(height)), BSIZE);
  //b1 = new Ball(new PVector(random(width), random(height)), BSIZE);
}//setup

void draw() {
  background(255);

  b0.display();
  //b1.display();

  if (moving) {
    b0.move();
    //b1.move();
  }//moving

}//draw

void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'r') {
    b0 = new Ball(new PVector(random(width), random(height)), BSIZE);
    //b1 = new Ball(new PVector(random(width), random(height)), BSIZE);
  }
}//keyPressed
