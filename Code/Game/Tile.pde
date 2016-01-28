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
  
  Tile(int tileNum) {
    super(0,0);
    this.tileNum = tileNum;
  }
  
  void setVal(int tileVal) {
    this.tileVal = tileVal;
  }
  
  int getVal() {
     return tileVal; 
  }
  
  void setLayer(int layer) {
    this.layer = layer;
  }
  
  void setSheet(ArrayList<PImage> tiles) {
    this.tiles = tiles;
  }
  
  void update() {
    super.pos.x = (tileNum%25) * 20;
    super.pos.y = (floor(tileNum/25)) * 20;
  }
  
  void render() {
 
    pushMatrix();
    translate(super.pos.x, super.pos.y);
    rotate(super.theta);
    image(tiles.get(tileVal), 0f, 0f);
    popMatrix();
  }
}