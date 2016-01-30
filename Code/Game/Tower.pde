//Bass class for towers
abstract class Tower extends GameObject{
 
  float rof, curROF, rofMod;
  float range, curRange, rangeMod;
  float dmg, curDMG, dmgMod;
  
  Tower(float x, float y) {
    super(x,y);
  }
  
  //ROF Functions
  
  //Setting the towers rate of fire
  void setROF(float rof) {
    this.rof = rof;
  }
  
  //Setting rof mod for the tower
  void setROFMod(float rofMod) {
    this.rofMod = rofMod;
  }
  
  //returning the towers rate of fire after mod
  float getROF() {
    return curROF; 
  }
  
  //Range functions
  
  //Setting range of the tower
  void setRange(float range) {
    this.range = range; 
  }
  
  //Setting the range mod of the tower
  void setRangeMod(float rangeMod) {
    this.rangeMod = rangeMod;
  }
  
  //returning the range of the tower 
  float getRange() {
    return curRange;
  }
  
  //Damage functions
  
  //Setting the damage of the tower
  void setDMG(float dmg) {
    this.dmg = dmg;
  }
  
  //Setting the damage mod of the tower
  void setDMGMod(float dmgMod) {
    this.dmgMod = dmgMod; 
  }
  
  //Returning the dmg after mod
  float getDMG() {
    return curDMG;
  }
  
  
  
 
  
  abstract void update();
  abstract void render();
}