void setup() {
  size(300, 600);
  textAlign(CENTER, CENTER);
  drawThermometer(50, 50, 100, 500);
}//setup



void drawThermometer(int x, int y, int w, int h) {

  //bounding box
  fill(255);
  rect(x, y, w, h);

  int scaleWidth = int(w * 0.4);
  int scaleHeight = int(h * 0.9);
  //inner box
  drawReading(x+(w-scaleWidth)/2, y+(h-scaleHeight)/2, scaleWidth, scaleHeight);
}//drawThermometer

void drawReading(int x, int y, int w, int h ) {

  rect(x, y, w, h);
  drawScale(x-15, y+h, h);
}//drawReading

void drawScale(int x, float y, int h) {

  //println(h);
  float scaleIncrease = h/100.0;

  for (int scaleStart = 0; scaleStart<=100; scaleStart++) {
    if (scaleStart % 5 == 0) {
      line(x, y, x+10, y);
    }
    y-= scaleIncrease;
    //println(scaleStart + " y: " + y);
  }//draw marks
}//drawScale
