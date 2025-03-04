class Orb {

  //instance variables
  PVector center;
  PVector velocity;
  PVector acceleration;
  float bsize;
  color c;

   //default constructor
   Orb(float x, float y, int s) {
     bsize = s;
     center = new PVector(x, y);
     velocity = new PVector();
     acceleration = new PVector();
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

  boolean yBounce(){
    if (center.y > height - bsize/2) {
      velocity.y *= -1;
      return true;
    }//bottom bounce
    else if (center.y < bsize/2) {
      //center.y = bsize/2;
      velocity.y*= -1;
      return true;
    }
    return false;
  }//yBounce
  boolean xBounce() {
    if (center.x > width - bsize/2) {
      velocity.x *= -1;
      return true;
    }
    else if (center.x < bsize/2) {
      velocity.x *= -1;
      return true;
    }
    return false;
  }//xbounce

  boolean collisionCheck(Orb other) {
    return ( this.center.dist(other.center)
             <= (this.bsize/2 + other.bsize/2) );
  }//collisionCheck

  void setColor(color newC) {
    c = newC;
  }//setColor

  //visual behavior
  void display() {
    fill(c);
    circle(center.x, center.y, bsize);
  }//display
}//Ball
