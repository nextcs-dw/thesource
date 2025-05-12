class ExpressionTreeNode {

  ExpressionTreeNode left;
  ExpressionTreeNode right;

  PVector position;
  int size;
  color c;
  
  int type;
  float value;

  ExpressionTreeNode(int t, float v, int x, int y) {
    position = new PVector(x, y);
    type = t;
    if (type != VALUE) {
      value = 0;
    }
    else {
      value = v;
    }
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
    if (type == VALUE) {
      text(value, position.x, position.y);
    }
    else {
      text(type, position.x, position.y);
    }
  }//display

}//ExpressionTreeNode
