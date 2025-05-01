class OrbNode {

  OrbNode next;
  OrbNode previous;

  PVector position;
  int size;
  color c;
  char data;

  OrbNode(char d, int x, int y) {
    position = new PVector(x, y);
    data = d;
    size = NODE_SIZE;
    c = color(255, 0, 255);
  }

  void display() {
    fill(c);
    circle(position.x, position.y, size);
    textAlign(CENTER, CENTER);
    textSize(size);
    text(data, position.x, position.y);
  }//display

}//OrbNode
