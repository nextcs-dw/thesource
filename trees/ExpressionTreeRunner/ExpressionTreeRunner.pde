int NODE_SIZE = 30;
int YSPACE = 100;

ExpressionTree oak;
boolean full;

void setup() {
  size(800, 500);

  full = false;
  oak = new ExpressionTree(width/2, 50, 5, full);
  oak.display(oak.root);

}//setup

void draw() {
  background(200);
  oak.display(oak.root);
}//draw


void keyPressed() {
  if (key == ' ') {
    oak.reset(full);
  }
}
