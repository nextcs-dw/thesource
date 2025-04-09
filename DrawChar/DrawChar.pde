void setup() {
  size(600, 400);
  background(0);

  int x = 0;
  int y = 0;
  for (char c='A'; c<='Z'; c++) {
    drawChar(c, x, y);
    x+= c;
    if (x+c >= width) {
      x = 0;
      y+= c;
    }
  }//char loop
}//setup

color charToColor(char c) {
  int r = (c * 23)%256;
  int g = (c * 41)%256;
  int b = (c * 67)%256;
  return color(r, g, b);
}//charToColor


void drawChar(char c, int x, int y) {
  noStroke();
  fill(charToColor(c));
  square(x, y, c);
  fill(255);
  textSize(c);
  textAlign(CENTER, CENTER);
  text(c, x+(c/2), y+(c/2));
}//drawChar
