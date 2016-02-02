//Bass class for towers
abstract class Tower extends GameObject{
 
  float rof, curROF, rofMod;
  float range, curRange, rangeMod;
  float dmg, curDMG, dmgMod;
  boolean hasShot = false;
  
  Tower(float x, float y) {
    super(x,y);
    
    rof = curROF = rofMod = range = curRange = rangeMod = dmg = curDMG = dmgMod = 1;
  }
  
  //ROF Functions
  
  //Setting the towers rate of fire
  void setROF(float rof) {
    this.rof = rof;
    curROF = rof * rofMod;
  }
  
  //Setting rof mod for the tower
  void setROFMod(float rofMod) {
    this.rofMod = rofMod;
    curROF = rof * rofMod;
  }
  
  //returning the towers rate of fire after mod
  float getROF() {
    return curROF; 
  }
  
  //Range functions
  
  //Setting range of the tower
  void setRange(float range) {
    this.range = range;
    curRange = range * rangeMod;
  }
  
  //Setting the range mod of the tower
  void setRangeMod(float rangeMod) {
    this.rangeMod = rangeMod;
    curRange = range * rangeMod;
  }
  
  //returning the range of the tower 
  float getRange() {
    return curRange;
  }
  
  //Damage functions
  
  //Setting the damage of the tower
  void setDMG(float dmg) {
    this.dmg = dmg;
    curDMG = dmg * dmgMod; 
  }
  
  //Setting the damage mod of the tower
  void setDMGMod(float dmgMod) {
    this.dmgMod = dmgMod; 
  }
  
  //Returning the dmg after mod
  float getDMG() {
    return curDMG;
  }
  
  void aim() {
    vel = PVector.sub(target,pos);
    theta = atan2(vel.y,vel.x) + HALF_PI;
  }
  
  void shoot(float x,float y,float tx, float ty) {
    if(hasShot == false) {
      go.add(new Bullet(x,y,tx,ty,curDMG,curRange));
      hasShot = true;
    }
  }
  
  abstract void update();
  abstract void render();
}