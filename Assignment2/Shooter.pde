class Shooter
{
  PVector location;
  float theta;
  float size;
  float radius;
  PShape shape;
  int delay;
  float a;
  
  Shooter(PVector location, float theta, float size)
  {
    this.location = location;
    this.theta = theta;
    this.size = size;
    radius = size / 2;
    delay = 5;
  }
  void render()
  {
    a = atan2(mouseY-width/2, mouseX-height/2);    
    
    pushMatrix(); // Stores the current transform
    imageMode(CENTER);
    translate(location.x  , location.y);
    rotate(theta);    
    
    image(img, 0, 0);
    popMatrix(); // Restore the transform
  }


  void update()
  {
    
    if (checkKey('a'))
     {
     theta -= 0.05f;
     }
     if (checkKey('d'))
     {
     theta += 0.05f;
     }


    if (checkKey(' '))
    {
      if(delay <= 0) {
        Bullet b = new Bullet(location.x, location.y, theta, 20);
        bullets.add(b);
        delay = 8;
      }
      else {
        delay--;
      }
    }
  }
}