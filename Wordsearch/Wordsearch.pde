int GRID_SIZE = 10;
int CHAR_SIZE = 30;

WordGrid board;


void setup() {
  size(300, 300);

  board = new WordGrid(GRID_SIZE);
  board.drawGrid();
  //saveFrame("a16-wordgrid.png");
}//setup

void draw() {
  background(255);
  board.drawGrid();
}//draw

void keyPressed() {
  if (key == ' ') {
    board = new WordGrid(GRID_SIZE);
  }//new board
}//keyPressed
