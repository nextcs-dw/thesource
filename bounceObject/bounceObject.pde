//balls!
Ball b0;
Ball b1;

//other variables
int BSIZE;
boolean moving;

void setup() {
  size(600, 400);
  BSIZE = 40;
  moving = true;

  b0 = new Ball();
  b1 = new Ball();
}//setup

void draw() {
  background(0);

  b0.display();
  b1.display();

  if (moving) {
    b0.move();
    b1.move();
  }//moving

}//draw

void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'r') {
    b0 = new Ball();
    b1 = new Ball();
  }
}//keyPressed
