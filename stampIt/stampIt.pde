int MOUSE_MODE = 0;
int KEY_MODE = 1;
int NORMAL = 0;
int BACKWARDS = 1;

int MAX_STAMPS = 100;

int stampSize = 20;
int mode;
int moveMode;
Stamp current;
Stamp[] stamps;

void setup() {
  size(600, 600);
  stamps = new Stamp[MAX_STAMPS];
  current = new Stamp(mouseX, mouseY, stampSize);
  mode = MOUSE_MODE;
  moveMode = NORMAL;
}//setup

void draw() {
  background(255);
  drawStamps();

  if (mode == MOUSE_MODE) {
    current.move(mouseX, mouseY);
  }

  current.display();
}//draw

void keyPressed() {
  if (key == 'm') {
    mode = MOUSE_MODE;
  }//set mouse mode
  if (key == 'k') {
    mode = KEY_MODE;
  }//set key mode
  if (key == 'n') {
    moveMode = NORMAL;
  }


  if (mode == KEY_MODE) {
    int direction = 0;
    if (keyCode == UP ||
        keyCode == DOWN ||
        keyCode == LEFT ||
        keyCode == RIGHT) {
      direction = keyCode;

    }//movement

    if (key == ' ') {
      stamp();
    }//stamp

  }//in key mode
}//keyPressed

void mousePressed() {
  if (mode == MOUSE_MODE) {
    stamp();
  }//in mouse mode
}//mousePressed

void drawStamps() {
  for (int i=0; i<stamps.length; i++) {
    if (stamps[i] != null) {
      stamps[i].display();
    }//there is a stamp
  }//array loop
}//drawStamps

int findSpot() {
  for (int i=0; i<stamps.length; i++) {
    if (stamps[i] == null) {
      return i;
    }//found spot
  }//array loop
  return -1;
}//findSpot

void stamp() {
  int i = findSpot();
  if (i != -1) {
    stamps[i] = current;
    if (mode == MOUSE_MODE) {
      current = new Stamp(mouseX, mouseY, stampSize);
    }
    if (mode == KEY_MODE) {
      current = new Stamp(stampSize);
    }
  }//room in array
}//stamp
