class BallGrid {

  Ball[][] grid;
  int ballSize;
  PVector topLeft;
  int gridWidth;
  int gridHeight;
  int direction;

  BallGrid(int rows, int cols, int bsize) {
    grid = new Ball[rows][cols];
    ballSize = bsize;
    gridWidth = ballSize * cols;
    gridHeight = ballSize * rows;
    direction = RIGHT;
    topLeft = new PVector(ballSize/2, ballSize/2);
    makeBalls();
  }//constructor

  void makeBalls() {
    PVector pos = topLeft.copy();
    for (int r=0; r<grid.length; r++) {
      for (int c=0; c<grid[r].length; c++) {
        grid[r][c] = new Ball(pos, ballSize);
        grid[r][c].setSpeed(ballSize, 0);
        pos.x+=ballSize;
      }//columns
      pos.y+= ballSize;
      pos.x = topLeft.x;
    }//rows
  }//makeBalls

  void display() {
    for (int r=0; r<grid.length; r++) {
      for (int c=0; c<grid[r].length; c++) {
        if (grid[r][c] != null) {
          grid[r][c].display();
        }
      }//columns
    }//rows
  }//drawGrid

  boolean processCollisions(Ball p) {
    boolean hit = false;
    for (int r=0; r<grid.length; r++) {
      for (int c=0; c<grid[r].length; c++) {
        if (grid[r][c] != null && p.collisionCheck(grid[r][c])) {
          grid[r][c] = null;
          hit = true;
        }//collide!
      }//columns
    }//rows
    return hit;
  }//processCollisions

  void move() {

    if (direction == DOWN) {
      topLeft.y+= ballSize;
    }
    else if (direction == LEFT) {
      topLeft.x-= ballSize;
    }
    else if (direction == RIGHT) {
      topLeft.x+= ballSize;
    }

    for (int r=0; r<grid.length; r++) {
      for (int c=0; c<grid[r].length; c++) {
        if (grid[r][c] != null) {
          grid[r][c].move();
        }
      }//columns
    }//rows

    checkSpacing();
  }//move

  void checkSpacing() {
    float leftEdge = topLeft.x - (ballSize/2);
    float rightEdge = leftEdge + gridWidth;
    float topEdge = topLeft.y - (ballSize/2);

    //println(rightEdge);

    if (direction == DOWN) {
      if (leftEdge <= 0) {
        direction = RIGHT;
      }
      if (rightEdge >= width) {
        direction = LEFT;
      }
      changeDirection();
    }//switching left/right
    else if (leftEdge <= 0) {
      direction = DOWN;
      changeDirection();
    }
    else if (rightEdge >= width) {
      direction = DOWN;
      changeDirection();
    }
  }//checkSpacing

  void changeDirection() {
    int newx, newy;
    newx = 0;
    newy = 0;
    if (direction == LEFT) {
      newx = -ballSize;
    }//left
    if (direction == RIGHT) {
      newx = ballSize;
    }//right
    if (direction == DOWN) {
      newy = ballSize;
    }//down

    for (int r=0; r<grid.length; r++) {
      for (int c=0; c<grid[r].length; c++) {
        if (grid[r][c] != null) {
          grid[r][c].setSpeed(newx, newy);
        }
      }//columns
    }//rows
  }//changeDirection
}//BallGrid
