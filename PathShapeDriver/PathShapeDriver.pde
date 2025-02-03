PathShape[] shapes;

void setup() {
  size(400, 400);
  shapes = new PathShape[4];
  makeShapes();
  drawShapes();
}//setup

 void draw() {
   background(255);
   drawShapes();
 }//draw


void makeShapes() {
  int shapeSize = 200;
  shapes[0] = new Polygon();
  shapes[1] = new PathShape(10, shapeSize, 0, shapeSize);
  shapes[2] = new PathShape(10, 0, shapeSize, shapeSize);
  shapes[3] = new PathShape(10, shapeSize, shapeSize, shapeSize);
  
  println(shapes[0].toString());
  println(shapes[1].toString());
  println(shapes[0].oldToString());
  println(shapes[1].oldToString());
}//makeShapes

void drawShapes() {
  for (int s=0; s < shapes.length; s++) {
    shapes[s].display();
  }
}//drawShapes

void keyPressed() {
  if (key == ' ') {
    makeShapes();
  }
}//keypressed
