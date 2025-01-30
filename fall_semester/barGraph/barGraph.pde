int[] values;

void setup() {
  size(300, 200);

  values = new int[10];
  randomArray(values, 50, height);

  drawBars(values, width/values.length);

}//setup

void randomArray(int[] data, int low, int high) {
  for (int i=0; i<data.length; i++) {
    data[i] = int(random(low, high));
  }//array loop
}//randomArray

void drawBars(int[] data, int barWidth) {
}//drawValues
