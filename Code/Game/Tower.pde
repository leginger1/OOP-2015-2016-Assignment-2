//Bass class for towers
abstract class Tower extends GameObject{
 
  float rof;
  float curROF;
  float rofMod;
  
  float range;
  float dmg;
  
  Tower(float x, float y) {
    super(x,y);
  }
  
  //Setting the tpwers rate of fire
  void setROF(float rof) {
    this.rof = rof;
  }
  //returning the towers rate of fire
  float getROF() {
    return rof; 
  }
  
  abstract void update();
  abstract void render();
}