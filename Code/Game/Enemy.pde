//Class for enemys
abstract class Enemy extends GameObject{
  
  private float hp;
  private float curHP;
  private float hpMod;
  
  private float speed;
  private float speedMod;
  
  private float armor;
  private float armorMod;
  
  
  //Constructor
  Enemy(float x, float y) {
    super(x,y);
  }
  
  
  
  //Health Functions
  
  //Setting enemy health
  public void setHealth(float hp) {
    this.hp = hp;
    curHP = this.hp;
  }
  
  //Applying damage to the enemy
  public void damage(int dmg) {
    curHP -= dmg;
    if(curHP < 0) curHP = 0;
  }
  
  //Applying healing to the enemy
  public void heal(int h) {
    curHP += h;
    if(curHP > (hp*hpMod)) curHP = (hp*hpMod);
  }
  
  //Returns cur health
  public float getHealth() {
   return curHP;  
  }
 
  
  
  //Speed Functions
  
  //Setting enemy speed
  public void setSpeed(float speed) {
    this.speed = speed;
  }
  
  //Setting speed mod
  public void setSpeedMod(float speedMod) {
    this.speedMod = speedMod;
  }
  
  //Returns speed after mod
  public float getSpeed() {
    return speed*speedMod;
  }
  

 
  //Armor functions
 
  //Setting enemy armor
  public void setArmor(float armor) {
    this.armor = armor;
  }
  
  //Setting armor mod
  public void setArmorMod(float armorMod) {
    this.armorMod = armorMod;
  }
  
  //Returns armor after mod
  public float getArmor() {
    return armor*armorMod;
  }
  
  abstract void update();
  abstract void render();
}