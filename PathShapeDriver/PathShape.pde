class PathShape {

  ArrayList<PVector> points;
  int numPoints;
  PVector corner;
  int shapeSize;
  color inside;

  PathShape() {
    this(int(random(3, 20)), 0, 0, 100);
  }

  PathShape(int np, int cx, int cy, int ss) {
    numPoints = np;
    corner = new PVector(cx, cy);
    shapeSize = ss;
    inside = color(255, 0, 255);
    points = new ArrayList<PVector>();
    makeRandomShape();
  }



  void makeRandomShape() {
    for (int p=0; p < numPoints; p++) {
      points.add( makeRandomPoint() );
    }
  }//makePoints

  void display() {
    fill(inside);
    beginShape();
    for (int p=0; p < numPoints; p++) {
      vertex(points.get(p).x, points.get(p).y);
    }//loop over vertices
    endShape(CLOSE);
    fill(255, 255, 0);
  }//display

  PVector makeRandomPoint() {
    PVector newPoint = new PVector();
    newPoint.x = int(random(shapeSize)) + corner.x;
    newPoint.y = int(random(shapeSize)) + corner.y;
    return newPoint;
  }//makeRandomPoint

  String toString() {
    return "Shape: " + numPoints;
  }

  String oldToString() {
    return super.toString();
  }

}//PathShape
