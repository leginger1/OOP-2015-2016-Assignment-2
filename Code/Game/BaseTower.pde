//Class for the base tower (Where the creeps are trying to get to)
class BaseTower extends Tower {

  float hp, curHP, hpMod;

  BaseTower(float x, float y) {
    super(x, y);
    hpMod = 1;
    hp = curHP = 10;
  }

  //Applying damage to the tower
  void damage(float dmg) {
    curHP -= dmg;

    if (curHP < 0) {
      curHP = 0;
    }
  }

  //Applying heal to the tower
  void heal(float h) {
    curHP += h;

    if (curHP > (hp*hpMod)) {
      curHP = hp*hpMod;
    }
  }

  //getting th ehp of the tower
  float getHP() {
    return curHP;
  }

  //Setting the base hp for the tower
  void setHP(float hp) {
    this.hp = hp;
    curHP = hp * hpMod;
  }

  //Setting the hp modifer for the tower
  void setHPMod(float hpMod) {
    this.hpMod = hpMod;
    curHP = hp * curHP;
  }

  void displayHealth() {
    float barWidth = 10;
    float barHeight = 3;
    float x = map(curHP, 0, hp, 0, barWidth);
    rectMode(CENTER);
    fill(0);
    rect(0, -12, barWidth, barHeight);
    fill(0, 255, 0);
    rect(0, -12, x, barHeight);
  }

  void update() {
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    displayHealth();
    rotate(theta);
    noStroke();
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(0, 0, 15, 15);
    popMatrix();
  }
}