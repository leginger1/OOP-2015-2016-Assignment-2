/*
  This class will be for all the tiles in the game.
  Ground, buildings, etc
*/

class Tile extends GameObject {
  
  private ArrayList<PImage> tiles;
  private int tileNum;
  private int tileVal = 0;
  private int layer = 0;
  private int x = 0;
  private int y = 0;
  
  Tile(int tileNum) {
    super(0,0);
    this.tileNum = tileNum;
  }
  
  public void setVal(int tileVal) {
    this.tileVal = tileVal;
  }
  
  public int getVal() {
     return tileVal; 
  }
  
  public void setLayer(int layer) {
    this.layer = layer;
  }
  
  public void setSheet(ArrayList<PImage> tiles) {
    this.tiles = tiles;
  }
  
  public void update() {
    x = (tileNum%25) * 20;
    y = (floor(tileNum/25)) * 20;
  }
  
  public void render() {
 
    pushMatrix();
    translate(x, y);
    rotate(super.theta);
    image(tiles.get(tileVal), 0f, 0f);
    popMatrix();
  }
}