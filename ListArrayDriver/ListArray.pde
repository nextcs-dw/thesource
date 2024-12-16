class ListArray {

  //fields
  char[] data;
  int size;


  ListArray(int capacity) {
    data = new char[capacity];
    size = 0;
  }//capacity constructor

  ListArray() {
    this(20);
  }//default constructor

  String toString() {
    String s = "[ ";
    for (int i=0; i < size; i++) {
      s+= data[i] + " ";
    }
    s+= "]";
    return s;
  }//toString

  /* ===================
    indexOf(char c)

    Return the index of the first occurance
    of c in data.
    Returns -1 if c is not in data.
   =================== */
  int indexOf(char c) {
    for (int i=0; i < size; i++) {
      if (data[i] == c) {
        return i;
      }//found
    }//keep searching
    return -1;
  }//indexOf

  /* ===================
    get(int i)

  Returns the value at index i.
   =================== */
  char get(int i) {
    if (i < size && i >= 0) {
      return data[i];
    }//valid index
    return 0;
  }//get

  /* ===================
    add(char c)

    Append c to the end of the List.
   =================== */
  void add(char c) {
    data[size] = c;
    size++;
    if (size == data.length) {
      expand();
    }//grow if needed
  }//add


  void expand() {
    //make new array
    char[] newdata = new char[size + 20];
    //copy data
    for (int i=0; i<size; i++) {
      newdata[i] = data[i];
    }//copy
    //reassign data
    data = newdata;
  }//expand

  void add(int i, char c) {
    if (i >= 0 && i <= size) {
      if (i == size) {
        add(c);
        return;
      }//if adding at end, just call add()

      for(int j=size; j>i; j--) {
        data[j] = data[j-1];
      }//data copy
      data[i] = c;
      size++;
      if (size == data.length) {
        expand();
      }
    }//valid index
  }//add at index

  char remove(int i) {
    if (i < 0 || i >= size) {
      return 0;
    }//invalid index

    //get value
    char c = data[i];
    for (int j=i; j < size-1; j++) {
      data[j] = data[j+1];
    }//move values over
    size--;
    return c;
  }//remove

}//ListArray
