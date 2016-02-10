//Class for basic creep enemys

class BasicCreep extends Enemy {

  BasicCreep(float x, float y, ArrayList<PathPoint> path) {
    super(x, y, path);


    //Setting the stats for the creep
    setSpeed(5);
    setHealth(30);
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

    move();

    if (pos.x < (target.x + speed) && pos.x > (target.x - speed) && pos.y < (target.y + speed) && pos.y > (target.y - speed)) {
      nextPoint();
    }

    theta = atan2(vel.y, vel.x) - HALF_PI;

    vel.normalize();
    vel.mult(speed);

    //Moving towards the next path point 
    pos.add(vel);
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    displayHealth();
    rotate(theta);
    noStroke();
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(0f, 0f, 5, 10);
    //fill(0);
    //rect(0f,5f,5,5);
    popMatrix();
  }
}