class WordGrid {

  char[][] grid;
  int size;


  WordGrid(int s) {
    size = s;
    grid = new char[size][size];
    fillGrid();
  }//constructor


  void fillGrid() {
    for (int r=0; r < grid.length; r++) {
      for(int c=0; c < grid[r].length; c++) {
        char rando = char(int(random(26)) + 'A');
        grid[r][c] = rando;
      }
    }
  }//fillGrid

  void drawGrid() {
    textAlign(CENTER, CENTER);
    textSize(CHAR_SIZE);
    fill(0);
    for (int r=0; r < grid.length; r++) {
      for(int c=0; c < grid[r].length; c++) {
        if (grid[r][c] != 0 ) {
          text(grid[r][c], r * CHAR_SIZE+CHAR_SIZE/2, c * CHAR_SIZE+CHAR_SIZE/2);
        }
      }
    }
  }//drawGrid


}//WordGrid
