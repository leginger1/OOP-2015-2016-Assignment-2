//Class for the first enemy type

class Basic extends Enemy{
 
  Basic(float x, float y, float health, float speed, float armor) {
    super(x,y);
    super.setHealth(health);
    super.setSpeed(speed);
    super.setArmor(armor);
  }
  
  public void update() {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
  }
  
  public void render() {
    
  }
  
}