ListArray la;

void setup() {
  la = new ListArray();
  println(la.toString());

  populate(la, 10, true);
  println(la.toString());

  populate(la, 20, false);
  println(la.toString());

  la.add(0, '+');
  println(la.toString());
  la.add(10, '+');
  println(la.toString());
  la.add(la.size, '+');
  println(la.toString());

  char c = la.remove(0);
  println(la.toString() + " " + c);
}//setup



void populate(ListArray s, int count, boolean ordered) {
  for (int i=0; i < count; i++) {
    char c = char('A' + i);
    if (!ordered) {
      c = char(int(random(26)) + 'A');
    }
    s.add(c);
  }//loop
}//populate
