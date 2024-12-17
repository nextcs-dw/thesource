int BUBBLE = 0;
int SELECTION = 1;
int INSERTION = 2;

int dataSize;
int maxValue;
SortArray sorty;

boolean liveSort;

void setup() {
  size (600, 400);
  background(0);
  textSize(25);
  sinWave = new SinOsc(this);
  dataSize =20;
  maxValue = max(300, dataSize);
  sorty = new SortArray(BUBBLE, dataSize, maxValue);
}//setup

void draw() {
  background(0);
  sorty.display();
  if (liveSort) {
    sorty.sortOnce();
  }
  frq = sorty.getPosValue();
  sinWave.freq(frq + 200);
}//draw


void keyPressed() {
  if (key == 'r') {
    reset();
  }//reset
  if (key == ' ') {
    liveSort = !liveSort;
  }
  if (keyCode == RIGHT) {
    sorty.sortOnce();
  }
  if (key == '1') {
    sorty.algorithm = BUBBLE;
    reset();
  }
  if (key == '2') {
    sorty.algorithm = SELECTION;
    reset();
  }
  if (key == '3') {
    sorty.algorithm = INSERTION;
    reset();
  }
  if (key == 'm') {
    sound = !sound;
    if (sound) {
      sinWave.play();
    }
    else {
      sinWave.stop();
    }
  }
}//keyPressed

void reset() {
  sorty.randInts();
  sorty.resetSortVars();
}//reset for more sorting
