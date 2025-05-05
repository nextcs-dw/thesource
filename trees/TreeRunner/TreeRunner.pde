int NODE_SIZE = 30;
int YSPACE = 100;

Tree oak;
boolean full;

void setup() {
  size(800, 500);

<<<<<<< HEAD
  full = false;
  oak = new Tree(width/2, 50, 5, full);
=======
  oak = new Tree(width/2, 50, 5);
>>>>>>> a70cb14c70130c158a3dd0b09c747827fe9e94a4
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
