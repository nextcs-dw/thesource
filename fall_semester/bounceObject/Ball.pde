class Ball {

  int x, y;
  int xspeed, yspeed;
  int bsize;

  Ball() {
    bsize = BSIZE;
    x = int(random(bsize/2, width - bsize/2));
    y = int(random(bsize/2, height - bsize/2));

    xspeed = 1;
    yspeed = 1;
  }//constructor

  void display() {
    circle(x, y, bsize);
  }//display

  void move() {
    if (y >= height - bsize/2 ||
        y <= bsize/2) {
        yspeed *= -1;
    }//up/down bounce

    if (x >= width - bsize/2 ||
        x <= bsize/2) {
        xspeed *= -1;
    }//left/right bounce

    y+= yspeed;
    x+= xspeed;
  }//move

}//Ball
