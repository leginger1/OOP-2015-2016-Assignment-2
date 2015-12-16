/*
  Class for loading in the map and drawing it on screen
*/
class Map {
  
  private ArrayList<Tile> tiles = new ArrayList<Tile>();
  private ArrayList<PImage> t;
  
  private int mapWidth = 0;
  private int mapHeight = 0;
  
  Map() {
    TileSheet sheet = new TileSheet();
    sheet.loadSheet("tilesheets\\sheet.png");
    sheet.loadTiles();
    t = sheet.getTileSheet();;
  }
  
  public void loadMap(String mapName) {
    
    String[] rows = loadStrings(mapName);//String array to hold the rows in the map file
    String[] row = split(rows[1],",");
    
    mapHeight = rows.length;
    mapWidth = row.length;
    println(mapWidth);
    
    
    for(int i = 0; i < rows.length; i++) {//Going through each row of file
      
      String[] cols = split(rows[i],",");//Getting each element(tile) in each row
 
      for(int j = 0; j < cols.length; j++) {//Adding each tile to array list
        
        int tileVal = parseInt(cols[j]);//Converting strings to ints
        
        Tile tile = new Tile();//Creating new tile
        //Setting the value and layer of tile
        tile.setVal(tileVal);
        tile.setSheet(t);
        tile.setLayer(0);
        //Adding the tile to array list
        tiles.add(tile);
      }
      
    }
      
  }
  
  public void render() {
      for(int i = 0; i < tiles.size(); i++){
        tiles.get(i).update(t,i, mapWidth, mapHeight);
        tiles.get(i).render();
      }
  }
    
}