class Tree {

  TreeNode root;
  int numLevels;

  Tree(int x, int y, int levels) {
    numLevels = levels;
    root = makeTree(x, y, numLevels);
  }//constructor

  TreeNode makeTree(int x, int y, int levels) {
    if (levels == 0) {
      return null;
    }//base case
    else {
      char c = char(int(random(26)) + 'A');
      TreeNode n = new TreeNode(c, x, y);
      
      //x position of each node is based on its level
      //root is at width/2
      //level 1 nodes are width/4 away from root
      //level 2 nodes are width/8 away from root ...
      //deviation form root is width/(2^(level+1))
      int nextLevel = numLevels - levels + 1;
      int xoffset = int(width / pow(2, (nextLevel + 1)));

           
      n.left = makeTree(x-xoffset, y+YSPACE, levels-1);
      n.right = makeTree(x+xoffset, y+YSPACE, levels-1);
      
      return n;
    }//make subtree
  }//makeTree
  
  void display(TreeNode t) {
    if (t != null) {
      t.display();
      drawTree(t.left);
      drawTree(t.right);
    }
}//drawTree

}//Tree
