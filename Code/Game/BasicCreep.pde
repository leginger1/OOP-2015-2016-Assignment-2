//Class for basic creep enemys

class BasicCreep extends Enemy{
  
  BasicCreep(float x, float y, ArrayList<PathPoint> path) {
    super(x,y,path);
    
    
    //Setting the stats for the creep
    setSpeed(5);
    setHealth(10);
    setArmor(1);
    
    nextPoint();
  }
  
  float getHP() {
    return getHealth();
  }
  
  float getArm() {
    return getArmor();  
  }
  
  float getSp() {
    return getSpeed();  
  }
  
  void update() {
    
    if(pos.x < (target.x + speed) && pos.x > (target.x - speed) && pos.y < (target.y + speed) && pos.y > (target.y - speed)) {
        nextPoint();
    }
    
    move();
    
    vel.normalize();
    vel.mult(speed);
    
    //Moving towards the next path point 
    pos.add(vel);
    
  }
  
  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    noStroke();
    fill(255,0,0);
    rectMode(CENTER);
    rect(0f,0f,5,5);
    popMatrix();
  }
}