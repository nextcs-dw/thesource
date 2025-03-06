class Orb {

  //instance variables
  PVector center;
  PVector velocity;
  PVector acceleration;
  float bsize;
  color c;

  //default constructor
  Orb() {
     bsize = random(10, MAX_SIZE);
     float x = random(bsize/2, width-bsize/2);
     float y = random(bsize/2, height-bsize/2);
     center = new PVector(x, y);
     velocity = new PVector();
     acceleration = new PVector();
     setColor();
  }

   Orb(float x, float y, float s) {
     bsize = s;
     center = new PVector(x, y);
     velocity = new PVector();
     acceleration = new PVector();
     setColor();
 }

  //movement behavior
  void move() {
    xBounce();
    yBounce();

    velocity.add(acceleration);
    center.add(velocity);
    acceleration.mult(0);
  }//move

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  PVector getDragForce(float cd) {
    float dragMag = velocity.mag();
    dragMag = -0.5 * dragMag * dragMag * cd;
    PVector dragForce = velocity.copy();
    dragForce.normalize();
    dragForce.mult(dragMag);
    return dragForce;
  }

  boolean yBounce(){
    if (center.y > height - bsize/2) {
      velocity.y *= -1;
      center.y = height - bsize/2;
      return true;
    }//bottom bounce

    else if (center.y < bsize/2) {
      velocity.y*= -1;
      center.y = bsize/2;
      return true;
    }
    return false;
  }//yBounce
  boolean xBounce() {
    if (center.x > width - bsize/2) {
      center.x = width - bsize/2;
      velocity.x *= -1;
      return true;
    }
    else if (center.x < bsize/2) {
      center.x = bsize/2;
      velocity.x *= -1;
      return true;
    }
    return false;
  }//xbounce

  boolean collisionCheck(Orb other) {
    return ( this.center.dist(other.center)
             <= (this.bsize/2 + other.bsize/2) );
  }//collisionCheck

  void setColor() {
    c = color(255, 0, 255);
  }//setColor

  //visual behavior
  void display() {
    fill(c);
    circle(center.x, center.y, bsize);
  }//display
}//Ball
