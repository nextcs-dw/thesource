//variables for the up-down circle
int udy, udspeed;
//variables for the left-right circle
int lrx, lrspeed;

//other variables
int csize;
boolean moving;

void setup() {
  size(600, 400);
  udy = height/2;
  lrx = width/2;
  udspeed = lrspeed = 1;

  csize = 40;
  moving = true;
}//setup

void draw() {
  background(0);

  circle(width/2, udy, csize);
  circle(lrx, height/2, csize);

  if (moving) {
    if (udy >= height - csize/2 ||
        udy <= csize/2) {
        udspeed *= -1;
    }//up/down bounce

    if (lrx >= width - csize/2 ||
        lrx <= csize/2) {
        lrspeed *= -1;
    }//left/right bounce

    udy+= udspeed;
    lrx+= lrspeed;
  }//moving

}//draw

void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'r') {
    udy = height/2;
    lrx = width/2;
  }
}//keyPressed
