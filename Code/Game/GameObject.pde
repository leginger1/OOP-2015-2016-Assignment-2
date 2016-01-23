/*
  The base class that every object on the screen will extend
*/

abstract class GameObject
{
  private PVector pos;
  private PVector forward;
  private float theta = 0.0f;
  private float speed = 5.0f; 
 
  GameObject()
  {
    // Constructor chaining
    this(width * 0.5f, height  * 0.5f);     
  }
  
  GameObject(float x, float y)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.theta = 0.0f;
  }
  
  abstract void update();  
  abstract void render();
  
}