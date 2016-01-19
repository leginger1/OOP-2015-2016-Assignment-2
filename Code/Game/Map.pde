/*
  Class for loading in the map and drawing it on screen
*/
class Map {
  
  private ArrayList<Tile> tiles = new ArrayList<Tile>();
  private ArrayList<PImage> t;
  
  private int mapWidth = 0;
  private int mapHeight = 0;
  
  //Constructor loading in tilesheet
  Map() {
    TileSheet sheet = new TileSheet();
    sheet.loadSheet("tilesheets\\sheet.png");
    sheet.loadTiles();
    t = sheet.getTileSheet();;
  }
  
  //Loading the map from file
  public void loadMap(String mapName) {
    
    //Clearing the array list
    tiles.clear();
    
    String[] rows = loadStrings(mapName);//String array to hold the rows in the map file
    String[] row = split(rows[1],",");//String array to get the width of the map
    
    //Map width and height
    mapHeight = rows.length;
    mapWidth = row.length;
    
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
  
  
  //function for saving a map
  public void saveMap(String mapName) {
    
    int[][] map = new int[25][25];
    
    for(int i = 0; i < 25; i++) {
      for(int j = 0; j < 25; j++) {
        map[i][j] = tiles.get((25*i)+j).getVal();
      }
    }
    
    //String array to hold the map
    String[] lines = new String[25];
    
    //Initilising the array to empty strings
    for(int i = 0; i < lines.length; i++) {
      lines[i] = "";
    }
    
    //Creating string to save as map
    for(int i = 0; i < 25; i++) {
      for(int j = 0; j < 25; j++) {
        
        if(j < 25-1) {
          lines[i] += (map[i][j]+",");
        }else{
          lines[i] += map[i][j]; 
        }
        
      }
    }
    
    //Saving map as text file
    saveStrings(mapName, lines);
  }
  
  
  //Displaying the map on the screen
  public void render() {
      for(int i = 0; i < tiles.size(); i++){
        tiles.get(i).update(t,i, mapWidth, mapHeight);
        tiles.get(i).render();
      }
  }
    
}