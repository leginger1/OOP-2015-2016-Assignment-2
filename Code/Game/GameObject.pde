/*
  The base class that every object on the screen will extend
*/

class GameObject {
  
  private PVector pos;//Position on screen
  private float theta = 0.0f;
  private float w;
  private float h; 
 
  GameObject() {
    this(0, 0);  
  }
  
  GameObject(float x, float y) {
    
    pos = new PVector(x, y);
  }
  
  
  public void update() {}
  
  public void render() {}
  
}