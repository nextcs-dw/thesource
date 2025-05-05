int NODE_SIZE = 30;
int YSPACE = 100;

Tree oak;
boolean full;

void setup() {
  size(800, 500);

  full = false;
  oak = new Tree(width/2, 50, 5, full);
  oak.display();
  
 
}//setup

void draw() {
  background(200);
  oak.display();
  textAlign(LEFT, TOP);
   text(oak.getHeight(), 0, 0);
}//draw


void keyPressed() {
  if (key == ' ') {
    oak.reset(full);
  }
}
