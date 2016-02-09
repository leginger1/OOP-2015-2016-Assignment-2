//Class for bullets
class Bullet extends GameObject implements Effect {

  float dmg;

  Bullet(float x, float y, float tx, float ty, float dmg) {
    //Calling GameObject constructor
    super(x, y);

    //Disambiguating varaibles
    this.dmg = dmg;

    //Setting the target for the bullet
    target.x = tx;
    target.y = ty;
  }

  void applyTo(GameObject enemy) {
    ((Enemy)enemy).damage(dmg);
  }

  void update() {
    vel = target.sub(pos);
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(0, 255, 0);
    line(0, 0, vel.x, vel.y);
    rotate(theta);
    popMatrix();
  }
}