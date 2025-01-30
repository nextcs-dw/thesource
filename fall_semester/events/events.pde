int squareX;
int squareY;
int circleX;
int circleY;
int lineX;
int lineY;
int s;
boolean movement;

void setup() {
  size(600, 400);
  squareX = width/2;
  squareY = height/2;
  movement = true;
  lineX = squareX;
  lineY = squareY;
  fill(255, 0, 255);
  s = 40;
}//setup

void draw() {
  background(255);

  if (movement) {
    circleX = mouseX;
    circleY = mouseY;
  }//only move if movement

  //always draw the shapes
  circle(circleX, circleY, s);
  square(squareX, squareY, s);
  line(squareX, squareY, lineX, lineY);
}//draw


void mousePressed() {
  if (movement) {
    lineX = mouseX;
    lineY = mouseY;
  }
}//mousePressed

void keyPressed() {
  if (movement) {
    if (keyCode == UP || key == 'w') {
      squareY-= 5;
    }//move up
    if (keyCode == DOWN || key == 's') {
      squareY+= 5;
    }//move down
    if (keyCode == LEFT || key == 'a') {
      squareX-= 5;
    }//move left
    if (keyCode == RIGHT || key == 'd') {
      squareX+= 5;
    }//move right
    if (key == 'q') {
      squareX = width/2;
      squareY = height/2;
    }//re-center
  }//only move if movement
  if (key == ' ') {
    movement = !movement;
  }
}//keyPressed
