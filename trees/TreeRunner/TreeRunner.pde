int NODE_SIZE = 30;
int YSPACE = 100;

Tree oak;

void setup() {
  size(800, 500);

  oak = new Tree(width/2, 50, 5);
  oak.display(oak.root);

}//setup


void drawTree(TreeNode t) {
  if (t != null) {
    t.display();
    drawTree(t.left);
    drawTree(t.right);
  }
}//drawTree
