//Class for enemys
abstract class Enemy extends GameObject{
  
  //Normal HP, HP with mod, HP mod
  float hp, curHP, hpMod;
  
  //
  float speed, speedMod;
  
  float armor, armorMod;
  
  ArrayList<PathPoint> path;
  int curPoint = 0;
  
  //Constructor
  Enemy(float x, float y, ArrayList<PathPoint> path) {
    super(x,y);
    this.path = path;
  }
 
  
  //Path functions
  
  //Sets velocity vector to next point
  void nextPoint() {
    
    //Checks to see if arrraylist is empty
    if(path.size() == 0) {
      return;
    } else {
      //Loops to start of list if at end
      if(curPoint == path.size() - 1) {
        curPoint = 0;
      } else {
        //Incrementing current point
        curPoint++; 
      }
    }
    
  }
  
  //sets velocity vector to previous point
  void prevPoint() {
    
    //Checks if the path arraylist is empty
    if(path.size() == 0) {
      return;
    } else {
     //Loops to end of list if at start
     if(curPoint == 0) {
       curPoint = path.size() - 1;
     } else {
       //Decrements current path point
       curPoint--;
     }
    }
    
  }
  
  void move() {
    
    float x = path.get(curPoint).getX();
    float y = path.get(curPoint).getY();
    
    setTargetXY(x,y);
    
    vel = PVector.sub(target,pos);
    
    path.get(curPoint).render();
    
  }
  
  //Health Functions
  
  //Setting enemy health
  void setHealth(float hp) {
    this.hp = hp;
    curHP = this.hp;
  }
  
  //Applying damage to the enemy
  void damage(float dmg) {
    curHP -= dmg;
    if(curHP < 0) curHP = 0;
  }
  
  //Applying healing to the enemy
  void heal(float h) {
    curHP += h;
    if(curHP > (hp*hpMod)) curHP = (hp*hpMod);
  }
  
  //Returns cur health
  float getHealth() {
   return curHP;  
  }
 
  
  
  //Speed Functions
  
  //Setting enemy penis to hard
  void setSpeed(float speed) {
    this.speed = speed;
  }
  
  //Setting speed mod
  void setSpeedMod(float speedMod) {
    this.speedMod = speedMod;
  }
  
  //Returns speed after mod
  float getSpeed() {
    return speed*speedMod;
  }
  

 
  //Armor functions
 
  //Setting enemy armor penis
  void setArmor(float armor) {
    this.armor = armor;
  }
  
  //Setting armor mod
  void setArmorMod(float armorMod) {
    this.armorMod = armorMod;
  }
  
  //Returns armor after mod
  float getArmor() {
    return armor*armorMod;
  }
  
  
  abstract void update();
  abstract void render();
}