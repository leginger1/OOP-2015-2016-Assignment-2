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
  
  
  //Function for randomly generating a map
  public void generateMap(String mapName, int mHeight, int mWidth) {
    
    //Creating array to hold the map data
    int[][] map = new int[mHeight][mWidth];
    
    //Initilising the map to empty space
    for(int i = 0; i < mHeight; i++) {
      for(int j = 0; j < mWidth; j++) {
        map[i][j] = 0;
      }
    }
    
    //Getting the total number of tiles on map
    int tiles = mHeight * mWidth;
    
    for(int i = 0; i < mHeight; i++) {
      for(int j = 0; j < mWidth; j++) {
        
        int r = floor(random(tiles));
        
        //Prob of each tile
        int grass = floor(tiles*0.5);
        int forest = floor(tiles*0.25);
        int mount = floor(tiles*0.2);
        int iron = floor(tiles*0.04);
        int gold = floor(tiles*0.01);
        
        if(r > 0 && r < gold) {
          map[i][j] = 4;
        }else if(r > gold && r < iron) {
          map[i][j] = 3;
        }else if(r > iron && r < mount) {
          map[i][j] = 5;
        }else if(r > mount && r < forest) {
          map[i][j] = 2;
        }else {
          map[i][j] = 1;
        }
        
      }
    }
    
    //String array to hold the map
    String[] lines = new String[mHeight];
    
    //Initilising the array to empty strings
    for(int i = 0; i < lines.length; i++) {
      lines[i] = "";
    }
    
    //Creating string to save as map
    for(int i = 0; i < mHeight; i++) {
      for(int j = 0; j < mWidth; j++) {
        
        if(j < mWidth-1) {
          lines[i] += (map[i][j]+",");
        }else{
          lines[i] += map[i][j]; 
        }
        
      }
    }
    
    //Saving map
    saveStrings(mapName, lines);
  }
  
  public void render() {
      for(int i = 0; i < tiles.size(); i++){
        tiles.get(i).update(t,i, mapWidth, mapHeight);
        tiles.get(i).render();
      }
  }
    
}