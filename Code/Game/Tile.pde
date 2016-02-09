/*
  This class will be for all the tiles in the game.
 Ground, buildings, etc
 */

class Tile extends GameObject {

  ArrayList<PImage> tiles;
  int tileNum;
  int tileVal = 0;
  int layer = 0;
  int x = 0;
  int y = 0;
  int pointNum;

  boolean pathPoint;

  Tile(int tileNum, boolean pathPoint, int pointNum) {
    super(0, 0);
    this.tileNum = tileNum;
    this.pathPoint = pathPoint;
    this.pointNum = pointNum;
  }

  void setVal(int tileVal) {
    this.tileVal = tileVal;
  }

  int getVal() {
    return tileVal;
  }

  boolean isPP() {
    return pathPoint;
  }

  int getPP() {
    return pointNum;
  }

  void setLayer(int layer) {
    this.layer = layer;
  }

  void setSheet(ArrayList<PImage> tiles) {
    this.tiles = tiles;
  }

  void update() {
    pos.x = ((tileNum%25) * 20) + tiles.get(0).width/2;
    pos.y = ((floor(tileNum/25)) * 20) + tiles.get(0).height/2;

    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT) {
          theta -= 0.02f;
        }

        if (keyCode == RIGHT) {
          theta += 0.02f;
        }
      }
    }
  }

  void render() {

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    imageMode(CENTER);
    image(tiles.get(tileVal), 0f, 0f);
    popMatrix();
  }
}