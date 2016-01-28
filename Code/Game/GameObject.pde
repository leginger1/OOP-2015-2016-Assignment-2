/*
  The base class that every object on the screen will extend
*/

abstract class GameObject
{
  PVector pos,vel,target,acc;
  float theta = 0.0f;
  float speed = 5.0f; 
 
  GameObject()
  {
    // Constructor chaining
    this(width * 0.5f, height  * 0.5f);     
  }
  
  GameObject(float x, float y)
  {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    target = new PVector(0,0);
    this.theta = 0.0f;
  }
  
  abstract void update();  
  abstract void render();
  
}