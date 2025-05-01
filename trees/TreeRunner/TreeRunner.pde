int NODE_SIZE = 40;
TreeNode o;

void setup() {
  size(600, 600);

  o = new TreeNode('A', width/2, NODE_SIZE/2);

  TreeNode o0, o1, o2;
  o0 = new TreeNode('B', width/4, 100);
  o1 = new TreeNode('C', width/4*3, 100);
  o2 = new TreeNode('D', width/8*3, 200);

  o.left = o0;
  o.right = o1;
  o0.right = o2;

  drawTree(o);
}

void drawTree(TreeNode t) {
  if (t != null) {
    t.display();
    drawTree(t.left);
    drawTree(t.right);
  }
}//drawTree
