class TreeNode {

  TreeNode left;
  TreeNode right;

  PVector position;
  int size;
  color c;
  char data;

  TreeNode(char d, int x, int y) {
    position = new PVector(x, y);
    data = d;
    size = NODE_SIZE;
    c = color(255, 0, 255);
  }

  void display() {
    if (left != null) {
      line(position.x, position.y, left.position.x, left.position.y);
    }
    if (right != null) {
      line(position.x, position.y, right.position.x, right.position.y);
    }
    fill(c);
    circle(position.x, position.y, size);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(size);
    text(data, position.x, position.y);
  }//display

}//TreeNode
