//Class for the basic tower type

class BasicTower extends Tower{
 
  BasicTower(float x, float y) {
    super(x,y);
    
    //Setting the rate of fire of the tower
    setROF(1);
    setROFMod(1);
    
    //Setting the range of the tower
    setRange(1000);
    setRangeMod(1);
    
    //Setting the damage of the tower
    setDMG(1);
    setDMGMod(1);
  }
  
  void update() {
    aim();
  }
  
  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(0);
    //line(0,0,vel.x,vel.y);
    rotate(theta);
    noStroke();
    fill(255,0,0);
    triangle(-10,5,10,5,0,-11);
    fill(0);
    triangle(0,-11,-5,3,5,3);
    popMatrix();
  }
}