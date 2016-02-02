
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
    path1.add(new PathPoint(random(width),random(height)));
  }
  
  go.add(new BasicCreep(random(width),random(height),path1));
  go.add(new BasicCreep(random(width),random(height),path1));
  
  go.add(new BasicTower(width/2,height/2));
}


void draw() {
  background(255);
  m.render();
  println(frameRate);
  
  for(int i = 0; i < go.size(); i++) {
    if(go.get(i) instanceof BasicCreep) { 
      go.get(i).update();
      go.get(i).render();
      
      for(int j = 0; j < go.size(); j++) {
        if (go.get(j) instanceof Bullet) {
          GameObject current = go.get(i);
          GameObject other = go.get(j);
          
          if (current.pos.dist(other.pos) < 5) {
            ((Effect) other).applyTo(current);
            go.remove(other);
          }
        }
      }
      
      if(((BasicCreep)go.get(i)).getHP() == 0) {
        go.remove(i);
      }
    }else if(go.get(i) instanceof BasicTower) {
      GameObject current = go.get(i);
      current.update();
      current.render();
      
      if (frameCount % (60/((Tower)current).curROF) == 0) {
        ((Tower)current).hasShot = false;
      }
      
      for(int j = 0; j < go.size(); j++) {
        if(go.get(j) instanceof BasicCreep) {
          
          GameObject other = go.get(j);
          
          if(dist(current.pos.x,current.pos.y,other.pos.x,other.pos.y) <= ((Tower)current).getRange()) {
            current.setTargetXY(other.pos.x, other.pos.y);
            ((Tower)current).shoot(current.pos.x,current.pos.y,other.pos.x+(other.vel.x*5),other.pos.y+(other.vel.y*5));
          }
        }
      }
    } else if (go.get(i) instanceof Bullet) {
      GameObject current = go.get(i);
      current.update();
      current.render();
      if ((current.pos.x < 0 || current.pos.x > width) && (current.pos.y < 0 || current.pos.y > height)) {
        go.remove(current);
      }
    }
  }
}