/*
  Class for loading in the map and drawing it on screen
 */
class Map {

  ArrayList<Tile> tiles = new ArrayList<Tile>();
  ArrayList<PathPoint> path = new ArrayList<PathPoint>();
  ArrayList<PImage> t;

  int mapWidth = 0;
  int mapHeight = 0;

  //Constructor loading in tilesheet
  Map() {
    TileSheet sheet = new TileSheet();
    sheet.loadSheet("tilesheets\\sheet.png");
    sheet.loadTiles();
    t = sheet.getTileSheet();
    ;
  }

  //Getting the path from the map
  ArrayList<PathPoint> loadPath() {
    int numPoints = 0;
    for (int i = 0; i < tiles.size(); i++) {
      if (tiles.get(i).isPP()) {
        numPoints++;
      }
    }

    int curPoint = 0;
    while (curPoint < numPoints) {
      for (int i = 0; i < tiles.size(); i++) {
        Tile t = tiles.get(i);
        if (t.isPP() == true) {
          t.update();
          if (t.getPP() == curPoint) {
            println(curPoint + ": " + t.pos.x + " "  + t.pos.y);
            PathPoint p = new PathPoint(t.pos.x, t.pos.y);
            path.add(p);
            curPoint++;
          }
        }
      }
    }
    return path;
  }

  //Loading the map from file
  void loadMap(String mapName) {

    //Clearing the array list
    tiles.clear();

    String[] rows = loadStrings(mapName);//String array to hold the rows in the map file
    String[] row = split(rows[1], ",");//String array to get the width of the map

    //Map width and height
    mapHeight = rows.length;
    mapWidth = row.length;
    int tileNum = 0;

    for (int i = 0; i < rows.length; i++) {//Going through each row of file

      String[] cols = split(rows[i], "|");//Getting each element(tile) in each row

      for (int j = 0; j < cols.length; j++) {//Adding each tile to array list

        String[] data = split(cols[j], ",");

        int tileVal = parseInt(data[0]);//Converting strings to ints
        boolean pathPoint;
        int loc;

        println(data[1].isEmpty());

        if (data[1].isEmpty() == false) {
          loc = parseInt(data[1]);
          pathPoint = true;
        } else {
          pathPoint = false;
          loc = 0;
        }

        Tile tile = new Tile(tileNum, pathPoint, loc);//Creating new tile
        //Setting the value and layer of tile
        tile.setVal(tileVal);
        tile.setSheet(t);
        tile.setLayer(0);
        //Adding the tile to array list
        tiles.add(tile);
        tileNum ++;
      }
    }
  }


  //function for saving a map
  void saveMap(String mapName) {

    int[][] map = new int[25][25];

    for (int i = 0; i < 25; i++) {
      for (int j = 0; j < 25; j++) {
        map[i][j] = tiles.get((25*i)+j).getVal();
      }
    }

    //String array to hold the map
    String[] lines = new String[25];

    //Initilising the array to empty strings
    for (int i = 0; i < lines.length; i++) {
      lines[i] = "";
    }

    //Creating string to save as map
    for (int i = 0; i < 25; i++) {
      for (int j = 0; j < 25; j++) {

        if (j < 25-1) {
          lines[i] += (map[i][j]+",");
        } else {
          lines[i] += map[i][j];
        }
      }
    }

    //Saving map as text file
    saveStrings(mapName, lines);
  }


  //Displaying the map on the screen
  void render() {
    for (int i = 0; i < tiles.size(); i++) {
      tiles.get(i).update();
      tiles.get(i).render();
    }
  }
}