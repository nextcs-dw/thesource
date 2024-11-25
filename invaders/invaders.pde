int NUM_ROWS = 3;
int NUM_COLS = 5;
int BALL_SIZE = 40;
int PROJECTILE_SIZE = 20;
BallGrid balls;
Ball projectile;

void setup() {
  size(400, 400);

  newProjectile(PROJECTILE_SIZE);
  balls = new BallGrid(NUM_ROWS, NUM_COLS, BALL_SIZE);
}//setup

void draw() {
  background(255);
  balls.display();

  projectile.display();
  projectile.move();

  boolean hit = balls.processCollisions(projectile);
  if (hit) {
    newProjectile(PROJECTILE_SIZE);
  }
  if (frameCount % 30 == 0) {
    balls.move();
  }
  //saveFrame("data/" + nf(frameCount, 4) + ".png");
}//draw


void keyPressed() {
  if (key == ' ') {
    projectile.yspeed = -1;
  }
  if (keyCode == LEFT) {
    projectile.center.x-=projectile.bsize;
  }
  if (keyCode == RIGHT) {
    projectile.center.x+=projectile.bsize;
  }
}//keyPressed

void newProjectile(int psize) {
  PVector p = new PVector(width/2, height-psize/2);
  projectile = new Ball(p, psize);
}//newProjectile
