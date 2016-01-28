//Class for enemys
abstract class Enemy extends GameObject{
  
  float hp;
  float curHP;
  float hpMod;
  
  float speed;
  float speedMod;
  
  float armor;
  float armorMod;
  
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
    
    if(path.size() == 0 || curPoint == path.size()-1) {
      return;
    } else {
      curPoint++;
    }
    
  }
  
  //sets velocity vector to previous point
  void prevPoint() {
    
    if(path.size() == 0 || curPoint == 0) {
      return;
    } else {
     curPoint--;
    }
    
  }
  
  void move() {
    target.x = path.get(curPoint).getX();
    target.y = path.get(curPoint).getY();
    
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
  void damage(int dmg) {
    curHP -= dmg;
    if(curHP < 0) curHP = 0;
  }
  
  //Applying healing to the enemy
  void heal(int h) {
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