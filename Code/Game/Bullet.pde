//Class for bullets

class Bullet extends GameObject implements Effect{
 
  float dmg, range;
  
  Bullet(float x, float y, float tx, float ty, float dmg, float range) {
    super(x,y);
    this.dmg = dmg;
    this.range = range;
    target.x = tx;
    target.y = ty;
    
    vel = PVector.sub(target, pos);
    vel.normalize();
    vel.mult(20);
  }
  
  void applyTo(GameObject enemy) {
    ((Enemy)enemy).damage(dmg);
  }
  
  void update() {
    
    pos.add(vel);
    
    theta = atan2(vel.y,vel.x) - HALF_PI;
  }
  
  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    noStroke();
    fill(0,255,0);
    rectMode(CENTER);
    rect(0f,0f,2,2);
    popMatrix();
  }
}