//Class for text areas

class TextArea extends GameObject {

  int size;
  String text;
  color c;

  TextArea(float x, float y, int size, String text) {
    super(x, y);

    this.size = size;
    this.text = text;
    c = color(0);
  }

  void update() {
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    textAlign(CENTER, CENTER);
    fill(c);
    textSize(size);
    text(text, 0, -2);
    popMatrix();
  }
}