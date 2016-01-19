/*
  This class will be for all the tiles in the game.
  Ground, buildings, etc
*/

class Tile extends GameObject {
  
  private ArrayList<PImage> tiles;
  private int tileVal = 0;
  private int layer = 0;
  private int x = 0;
  private int y = 0;
  
  public void setVal(int tileVal) {
    this.tileVal = tileVal;
  }
  
  public int getVal() {
     return tileVal; 
  }
  
  public void setLayer(int layer) {
    this.layer = layer;
  }
  
  public void setSheet(ArrayList<PImage> tiles){
    this.tiles = tiles;
  }
  
  public void update(ArrayList<PImage> tiles,int tileNum, int mapWidth, int mapHeight) {
    this.tiles = tiles;
    x = (tileNum%mapWidth) * 20;
    y = (tileNum/mapWidth) * 20;
    //super.pos.add(x,y);
  }
  
  public void render() {
 
    pushMatrix();
    translate(x, y);
    image(tiles.get(tileVal), super.pos.x, super.pos.y);
    popMatrix();
  }
}