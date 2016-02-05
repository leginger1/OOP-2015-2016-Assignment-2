
Map m;
int missed;

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

ArrayList<PathPoint> path1 = new ArrayList<PathPoint>();

void setup() {
  
  size(500,500);
  m = new Map();
  m.loadMap("maps\\map1.txt");
  path1 = m.loadPath();
  
  gameObjects.add(new BasicCreep(random(width),random(height),path1));
  gameObjects.add(new BasicCreep(random(width),random(height),path1));
  
  gameObjects.add(new BasicTower(width/2,height/2));
  
  missed = 0;
}


void draw() {
  background(255);
  m.render();
  //println(frameRate);

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
          
          if ((bullet.pos.x < 0 || bullet.pos.x > width) && (bullet.pos.y < 0 || bullet.pos.y > height)) {
            gameObjects.remove(bullet);
            missed++;
            //println("Bullet Missed! Number: " + missed + "\n");
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
            int t = 4;
            
            ((Tower)tower).shoot(tower.pos.x,tower.pos.y,enemy.pos.x+(enemy.vel.x*t),enemy.pos.y+(enemy.vel.y*t));
            tower.setTarget(enemy.pos.x+(enemy.vel.x*t),enemy.pos.y+(enemy.vel.y*t));
            break;
          }
        }
      }
    }
  }
}