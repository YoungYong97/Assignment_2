class Bullet
{
  PVector pos;
  PVector forward;
  float theta;
  float size;
  float speed = 1000;
  boolean hit=false;

  
  Bullet(float x, float y, float theta, float size)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, 0);
    this.theta = theta;
    this.size = size;   
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, - size, 0, size/2);
    popMatrix();
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    pos.add(PVector.mult(PVector.mult(forward, speed), time));
    
  }
  
  boolean isEdge()
  {
    if( pos.x > width)
    {
      return true;
    }
    if( pos.x < 0)
    {
      return true;
    }
    if( pos.y > height)
    {
      return true;
    }
    if( pos.y < 0)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}