class Enemy
{
  PVector location;
  float speed;
  float size = 50;
  float health;
  
  Enemy(PVector location, float health)
  {
    this.location = location;
    this.health = health;
    
  }
  
  void draw()
  {
    fill(255);
    noStroke();
    if( health == 1)
    {
      fill(255, 0, 0);
      speed = 20;
    }
    if( health == 2)
    {
      fill(0, 255, 0);
      speed = 15;
    }
    if( health == 3)
    {
      fill(0, 0, 255);
      speed = 10;
    }
    if( health == 4)
    {
      fill(0);
      speed = 10;
    }
    ellipse(location.x, location.y, size, size);
  }
  
  void update()
  {
    location.x = lerp(location.x, shooter.location.x, speed / 10000);
    location.y = lerp(location.y, shooter.location.y, speed / 10000);
  }
}