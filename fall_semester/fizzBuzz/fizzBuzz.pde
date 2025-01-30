int fizz;
int buzz;
int count;

void setup() {
  size(500, 500);
  textSize(100);
  textAlign(CENTER, CENTER);
  frameRate(30);

  fizz = 3;
  buzz = 5;
  count = 0;
  text("" + count, width/2, height/2);
}//setup


void draw() {
  background(0);

  if (count % (fizz * buzz) == 0) {
    text("FIZZBUZZ", width/2, height/2);
  }//fizzbuzz
  else if (count % fizz == 0) {
    text("FIZZ", width/2, height/2);
  }//fizz
  else if (count % buzz == 0) {
    text("BUZZ", width/2, height/2);
  }//buzz
  else {
    text(count, width/2, height/2);
  }
  if (frameCount % 15 == 0) {
    count++;
  }//incriment
  //saveFrame("data/" + nf(frameCount, 4) + ".png");
}//draw
