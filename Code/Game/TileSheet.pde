/*
  Class to handle the tile sheet
*/

class TileSheet {
  
  private ArrayList<PImage> tiles = new ArrayList<PImage>();//Array List to hold all of the tile images
  private PImage sheet;//Image object to hold the tile sheet
  
  
  //Loading in the tile sheet
  public void loadSheet(String sheetName) {
    sheet = loadImage(sheetName);
    loadTiles();
  }
  
  
  //Loading in the tiles
  private void loadTiles() {
    
    //PImage object to hold tiles and add to arraylist
    PImage tile;
    
    //Loading sheet pixles
    sheet.loadPixels();
    
    for(int i = 0; i < sheet.height; i += 20) {
      for(int j = 0; j < sheet.width; j += 20) {
        
        //Dividning sheet up into seperate tiles
        tile = sheet.get(j,i,20,20);
        tiles.add(tile);
        
      } 
    }
  }
  
  public ArrayList<PImage> getTileSheet() {
    return tiles;
  }
  
}