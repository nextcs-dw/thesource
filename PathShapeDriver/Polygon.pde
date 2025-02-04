class Polygon extends PathShape {

  PVector center;
  int radius;


  void makeRandomShape() {

    radius = shapeSize/2;
    center = new PVector(corner.x + radius, corner.y + radius);

    for(int p=0; p < numPoints; p++) {
      float theta = radians((float(p)/numPoints) * 360);
      int r = int(random(radius));
      int x = int(r * cos(theta) + center.x);
      int y = int(r * sin(theta) +  center.y);
      points.add(new PVector(x, y));
    }//generate points loop
  }//makeRandomShape

}//Polygon
