int[] xvals;
int[] yvals;
int numPoints;

void setup() {
  size(600, 400);
  background(0);
  stroke(255);
  xvals = new int[100];
  yvals = new int[100];
  numPoints = 0;

  makeLines(xvals, yvals, 10);
  drawLines(xvals, yvals);
}//setup


void makeLines(int[] xs, int[] ys, int ps) {

  for (int i=0; i<ps; i++) {
    xs[i] = int(random(width));
    ys[i] = int(random(height));
    numPoints++;
  }//populate points
}//makeLines

void drawLines(int[] xs, int[] ys) {
  for (int i=0; i<numPoints-1; i++) {
    line(xs[i], ys[i], xs[i+1], ys[i+1]);
  }//line loop
}//drawLines
