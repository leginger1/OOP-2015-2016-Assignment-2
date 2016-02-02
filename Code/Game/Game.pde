
Map m;

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

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
  
  gameObjects.add(new BasicCreep(random(width),random(height),path1));
  gameObjects.add(new BasicCreep(random(width),random(height),path1));
  
  gameObjects.add(new BasicTower(width/2,height/2));
}


void draw() {
  background(255);
  m.render();
  println(frameRate);

  //Going through every game object
  for(int i = 0; i < gameObjects.size(); i++) {
    //Checking for Enemy objects
    if(gameObjects.get(i) instanceof Enemy) {
      //Holder for enemy object
      GameObject enemy = gameObjects.get(i);
      
      //Updating and rendering
      enemy.update();
      enemy.render();
      
      //Going through every game object
      for(int j = 0; j < gameObjects.size(); j++) {
        
        //Checking if bullet object
        if (gameObjects.get(j) instanceof Bullet) {
          
          GameObject bullet = gameObjects.get(j);
          
          bullet.update();
          bullet.render();
          
          if (enemy.pos.dist(bullet.pos) < 5) {
            ((Effect) bullet).applyTo(enemy);
            gameObjects.remove(bullet);
          }
        }
      }
      
      if(((BasicCreep)gameObjects.get(i)).getHP() == 0) {
        gameObjects.remove(i);
      }
    }else if(gameObjects.get(i) instanceof BasicTower) {
      GameObject tower = gameObjects.get(i);
      tower.update();
      tower.render();
      
      if (frameCount % (60/((Tower)tower).curROF) == 0) {
        ((Tower)tower).hasShot = false;
      }
      
      for(int j = 0; j < gameObjects.size(); j++) {
        if(gameObjects.get(j) instanceof BasicCreep) {
          
          GameObject enemy = gameObjects.get(j);
          
          if(dist(tower.pos.x,tower.pos.y,enemy.pos.x,enemy.pos.y) <= ((Tower)tower).getRange()) {
            ((Tower)tower).shoot(tower.pos.x,tower.pos.y,enemy.pos.x+(enemy.vel.x*4),enemy.pos.y+(enemy.vel.y*4));
            tower.setTarget(enemy.pos.x+(enemy.vel.x*4),enemy.pos.y+(enemy.vel.y*4));
            break;
          }
        }
      }
    }
  }
}