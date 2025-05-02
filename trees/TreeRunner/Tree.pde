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

      return n;
    }//make subtree
  }//makeTree


}//Tree
