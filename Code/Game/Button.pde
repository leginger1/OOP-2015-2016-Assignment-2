//Class to deal with buttons

class Button extends GameObject {

  float w, h;
  int tSize, val;
  String text;
  boolean hover;
  boolean pressed;

  Button(float x, float y, float w, float h, int tSize, int val, String text) {
    super(x, y);

    this.w = w;
    this.h = h;
    this.tSize = tSize;
    this.val = val;
    this.text = text;
  }

  int getVal() {
    return val;
  }

  boolean getPress() {
    return pressed;
  }

  void update() {
    if (mouseX < pos.x+(w/2) && mouseX > pos.x-(w/2) && mouseY < pos.y+(h/2) && mouseY > pos.y-(h/2)) {
      hover = true;
      if (mousePressed) {
        pressed = true;
        unpressed = false;
      }
    } else {
      hover = false;
      pressed = false;
    }
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    if (hover) {  
      fill(125);
    } else {
      fill(200);
    }
    rect(0, 0, w, h);
    fill(255);
    textSize(tSize);
    text(text, 0, -2);
    popMatrix();
  }
}