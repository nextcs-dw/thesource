int NUM_ROWS = 3;
int NUM_COLS = 5;
int BALL_SIZE = 40;
int PROJECTILE_SIZE = 20;
Ball[][] grid;
Ball projectile;

void setup() {
  size(400, 400);

  newProjectile(PROJECTILE_SIZE);
  grid = new Ball[NUM_ROWS][NUM_COLS];
  makeBalls(grid);
  drawGrid(grid);
}//setup

void draw() {
  background(255);
  drawGrid(grid);

  projectile.display();
  projectile.move();
  processCollisions(projectile, grid);

  saveFrame("data/" + nf(frameCount, 4) + ".png");
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

void makeBalls(Ball[][] g) {
  int rowWidth = NUM_COLS * BALL_SIZE;
  int widthSpace = width - rowWidth;
  PVector pos = new PVector(widthSpace/2, BALL_SIZE/2);
  for (int r=0; r<g.length; r++) {
    for (int c=0; c<g[r].length; c++) {
      g[r][c] = new Ball(pos, BALL_SIZE);
      pos.x+=BALL_SIZE;
    }//columns
    pos.y+= BALL_SIZE;
    pos.x = widthSpace/2;
  }//rows
}//makeBalls

void drawGrid(Ball[][] g) {
  for (int r=0; r<g.length; r++) {
    for (int c=0; c<g[r].length; c++) {
      if (g[r][c] != null) {
        g[r][c].display();
      }
    }//columns
  }//rows
}//drawGrid

void processCollisions(Ball p, Ball[][] g) {
  for (int r=0; r<g.length; r++) {
    for (int c=0; c<g[r].length; c++) {
      if (g[r][c] != null && p.collisionCheck(g[r][c])) {
        g[r][c] = null;
        newProjectile(PROJECTILE_SIZE);
      }//collide!
    }//columns
  }//rows
}//processCollisions
