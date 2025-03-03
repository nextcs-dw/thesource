class Ball {

  //instance variables
  PVector center;
  PVector velocity;
  PVector acceleration;
  int bsize;
  color c;

   //default constructor
   Ball(PVector p, int s) {
     bsize = s;
     center = new PVector(p.x, p.y);
     velocity = new PVector();
     //velocity = new PVector(random(-5, 5), random(-5, 5));
     acceleration = new PVector();
 }

  boolean collisionCheck(Ball other) {
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

  //movement behavior
  void move() {
    if (center.x > width - bsize/2 ||
        center.x < bsize/2) {
        velocity.x *= -1;
     }
     if (center.y > height - bsize/2 ||
         center.y < bsize/2) {
         velocity.y*= -1;
      }
     velocity.add(acceleration);
     center.add(velocity);
     acceleration.mult(0);
  }//move
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }

}//Ball
