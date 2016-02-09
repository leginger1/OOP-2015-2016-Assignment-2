//Points that will make up a path for creeps to follow

class PathPoint {

  float x;
  float y;

  PathPoint(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void render() {
    fill(0);
    rect(x, y, 5, 5);
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }
}