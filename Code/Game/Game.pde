
Map m;

ArrayList<GameObject> go = new ArrayList<GameObject>();
ArrayList<PathPoint> path1 = new ArrayList<PathPoint>();
ArrayList<PathPoint> path2 = new ArrayList<PathPoint>();
ArrayList<PathPoint> path3 = new ArrayList<PathPoint>();
ArrayList<PathPoint> path4 = new ArrayList<PathPoint>();

void setup() {
  
  size(500,500);
  m = new Map();
  m.loadMap("maps\\map1.txt");
  
  for(int i = 0; i < 100; i++) {
    path1.add(new PathPoint(random(width/4,width-width/4),random(height/4, height-height/4)));
  }
  for(int i = 0; i < 100; i++) {
    path2.add(new PathPoint(random(width/4,width-width/4),random(height/4, height-height/4)));
  }
  for(int i = 0; i < 100; i++) {
    path3.add(new PathPoint(random(width/4,width-width/4),random(height/4, height-height/4)));
  }
  for(int i = 0; i < 100; i++) {
    path4.add(new PathPoint(random(width/4,width-width/4),random(height/4, height-height/4)));
  }
  
  go.add(new BasicCreep(random(width),random(height), path1));
  go.add(new BasicCreep(random(width),random(height), path2));
  go.add(new BasicCreep(random(width),random(height), path3));
  go.add(new BasicCreep(random(width),random(height), path4));
  
}


void draw() {
  background(255);
  m.render();
  println(frameRate);
  
  for(int i = 0; i < go.size(); i++) {
    if(go.get(i) instanceof BasicCreep) { 
      go.get(i).update();
      go.get(i).render();
      if(((BasicCreep)go.get(i)).getHP() == 0) {
        go.remove(i);
      }
    }
  }
}