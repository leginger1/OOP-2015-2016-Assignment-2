
Map m;
Level l;
int missed;
int gameState;

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
ArrayList<GameObject> mainMenu = new ArrayList<GameObject>();
ArrayList<GameObject> pauseMenu = new ArrayList<GameObject>();

ArrayList<PathPoint> path1 = new ArrayList<PathPoint>();

void setup() {

  size(500, 500);
  m = new Map();
  m.loadMap("maps\\map1.txt");
  path1 = m.loadPath();

  l = new Level(1);
  gameState = 1;

  mainMenu.add(new TextArea(width/2, height/5, 25, "Tower Defence Game"));
  mainMenu.add(new Button(width/2, height/3, 150, 25, 15, 2, "Play"));
  mainMenu.add(new Button(width/2, height/3 + 50, 150, 25, 15, 3, "Controls"));
  mainMenu.add(new Button(width/2, height/3 + 100, 150, 25, 15, 4, "Mystery Button"));
  mainMenu.add(new Button(width/2, height/3 + 150, 150, 25, 15, 5, "About"));
  mainMenu.add(new Button(width/2, height/3 + 200, 150, 25, 15, 6, "Quit"));

  gameObjects.add(new BaseTower(path1.get(path1.size()-1).getX(), path1.get(path1.size()-1).getY()));
  gameObjects.add(new Button(width/8, height - 30, 100, 25, 15, 1, "Towers"));
  gameObjects.add(new Button(width/8*3, height - 30, 100, 25, 15, 2, "Other"));
  gameObjects.add(new Button(width/8*5, height - 30, 100, 25, 15, 3, "Blarg"));
  gameObjects.add(new Button(width/8*7, height - 30, 100, 25, 15, 4, "Menu"));
  
  pauseMenu.add(new TextArea(width/2, height/5, 25, "Game Paused"));
  pauseMenu.add(new Button(width/2, height/3, 150, 25, 15, 2, "Resume"));
  pauseMenu.add(new Button(width/2, height/3 + 50, 150, 25, 15, 3, "About"));
  pauseMenu.add(new Button(width/2, height/3 + 200, 150, 25, 15, 6, "Quit"));

  missed = 0;
}


void draw() {
  background(255);
  //println(frameRate);
  //println(gameState);


  switch (gameState) {
    //Main menu
  case 1:{ 
      stroke(0);
      strokeWeight(2);
      fill(255);
      rectMode(CORNER);
      rect(0,0,width-1,height-1);
      strokeWeight(1);
      
      for (int i = 0; i < mainMenu.size(); i++) {
        if (mainMenu.get(i) instanceof Button) {
          GameObject b = mainMenu.get(i);

          b.update();
          b.render();

          if (((Button)b).getPress()) {
            gameState = ((Button)b).getVal();

            //Resseting game state if going from main menu
            if (gameState == 2) {
              for (int j = 0; j < gameObjects.size(); j++) {
                if (!(gameObjects.get(j) instanceof BaseTower) && !(gameObjects.get(j) instanceof Button)) {
                  gameObjects.remove(j);
                }
              }
            }
          }
        } else if (mainMenu.get(i) instanceof TextArea) {
          GameObject b = mainMenu.get(i);
          
          b.update();
          b.render();
        }
      }
      break;
    }


    //Play the game
  case 2:{
      println("Blarg");
      m.render();

      //Going through all game objects
      for (int i = 0; i < gameObjects.size(); i++) {
        //Checking for Enemy objects
        if (gameObjects.get(i) instanceof Enemy) {
          //Holder for enemy object
          GameObject enemy = gameObjects.get(i);

          //Updating and rendering enemys
          enemy.update();
          enemy.render();

          //Going through every game object
          for (int j = 0; j < gameObjects.size(); j++) {

            //Checking if bullet object
            if (gameObjects.get(j) instanceof Bullet) {

              //Holder for bullet object
              GameObject bullet = gameObjects.get(j);

              //Updating and rendering
              bullet.update();
              bullet.render();
              //Damaging enemy
              ((Enemy)enemy).damage(1);
              //Removing bullet from array list
              gameObjects.remove(bullet);
            }
          }

          //Checking if enemy is dead
          if (((Enemy)enemy).getHealth() == 0) {
            gameObjects.remove(i);
          }

          //Checking if objects is a basicTower
        } else if (gameObjects.get(i) instanceof BasicTower) {
          //Holder for tower
          GameObject tower = gameObjects.get(i);

          //Updating and rendering
          tower.update();
          tower.render();

          //Controlling towers rate of fire
          if (frameCount % (60/((Tower)tower).curROF) == 0) {
            ((Tower)tower).hasShot = false;
          }

          //Going through gameObjects
          for (int j = 0; j < gameObjects.size(); j++) {

            //Checking for enemys
            if (gameObjects.get(j) instanceof Enemy) {

              //Holder for enemy objects
              GameObject enemy = gameObjects.get(j);

              //Checking if enemys are in range of the tower
              if (PVector.dist(tower.pos, enemy.pos) <= ((Tower)tower).getRange()) {   

                //Telling the tower to shoot
                ((Tower)tower).shoot(tower.pos.x, tower.pos.y, enemy.pos.x, enemy.pos.y);
                //Setting the terget vector for the towers aiming
                tower.setTarget(enemy.pos.x, enemy.pos.y);
                //Breaking out of loop to stop aiming at every enemy at once
                break;
              }
            }
          }

          //Checking for BaseTower
        } else if (gameObjects.get(i) instanceof BaseTower) {

          //Holder for the base tower
          BaseTower b = ((BaseTower)gameObjects.get(i));

          //Updating and rendering
          b.update();
          b.render();

          //Going through game objects
          for (int j = 0; j < gameObjects.size(); j++) {

            //Checking for enemys
            if (gameObjects.get(j) instanceof Enemy) {

              //Holder for enemy object
              Enemy c = ((Enemy)gameObjects.get(j));

              //Checking if the enemny hits tower
              if (PVector.dist(c.pos, b.pos) < 10) {
                //Damaging tower
                b.damage(1);
                //Removing enemy
                gameObjects.remove(c);
              }
            }
          }
        } else if (gameObjects.get(i) instanceof Button) {
          Button b = ((Button)gameObjects.get(i));
          
          b.update();
          b.render();
          
          int v = b.getVal();
          
          switch(v) {
            case 1:{
              
              break;
            }
            
            case 2:{
              
              break;
            }
            
            case 3:{
              
              break;
            }
            
            case 4:{
              gameState = 7;
              break;
            }
            
            default:{
              println("Something done fucked up!!");
              break;
            }
          }
        }
      }
      break;
    }

    //Controls
  case 3:{
      
      break;
    }

    //mystery button(Unsure what im gonna do with this)
  case 4:{
      
      break;
    }

    //About
  case 5:{
    
      break;
    }

    //Quit
  case 6: {
      exit();
      break;
    }

    //Game paused
  case 7:{
    stroke(0);
    strokeWeight(2);
    fill(255);
    rectMode(CORNER);
    rect(0,0,width-1,height-1);
    strokeWeight(1);
    
    for (int i = 0; i < mainMenu.size(); i++) {
      if (mainMenu.get(i) instanceof Button) {
        GameObject b = mainMenu.get(i);

        b.update();
        b.render();

        if (((Button)b).getPress()) {
          gameState = ((Button)b).getVal();

          //Resseting game state if going from main menu
          if (gameState == 2) {
            for (int j = 0; j < gameObjects.size(); j++) {
              if (!(gameObjects.get(j) instanceof BaseTower) && !(gameObjects.get(j) instanceof Button)) {
                gameObjects.remove(j);
              }
            }
          }
        }
      } else if (mainMenu.get(i) instanceof TextArea) {
        GameObject b = mainMenu.get(i);
        
        b.update();
        b.render();
      }
    }
    break;
    }

  default:{
      
      println("Something done fucked up!!!!");
      break;
    }
  }
}