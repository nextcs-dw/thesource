class ExpressionTree {

  ExpressionTreeNode root;
  int numLevels;

  ExpressionTree(int x, int y, int levels, boolean full) {
    numLevels = levels;
    root = makeExpressionTree(x, y, numLevels, full);
  }//constructor

  void reset(boolean full) {
    root = makeExpressionTree(int(root.position.x), int(root.position.y), numLevels, full);
  }//reset

  ExpressionTreeNode makeExpressionTree(int x, int y, int levels, boolean full) {
    if (levels == 0) {
      return null;
    }//base case
    else {
      ExpressionTreeNode n;
      
      if (levels == 1) {      
        n = new ExpressionTreeNode(VALUE, 8, x, y);
      }
      else {
        n = new ExpressionTreeNode(PLUS, 8, x, y);
      }
     
      //x position of each node is based on its level
      //root is at width/2
      //level 1 nodes are width/4 away from root
      //level 2 nodes are width/8 away from root ...
      //deviation form root is width/(2^(level+1))
      int nextLevel = numLevels - levels + 1;
      float xspacing = width / pow(2, (nextLevel + 1));
      int xLeft = int(x - xspacing);
      int xRight = int(x + xspacing);
      y+= YSPACE;

      if ( levels != 1) {
        n.left = makeExpressionTree(xLeft, y, levels-1, full);
        n.right = makeExpressionTree(xRight, y, levels-1, full);
      }
      return n;
    }//make subExpressionTree
  }//makeExpressionTree

  void display(ExpressionTreeNode current) {
    if (current != null) {
      current.display();
      display(current.left);
      display(current.right);
    }
  }//drawExpressionTree

}//ExpressionTree
