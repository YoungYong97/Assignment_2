class Enemy
{
  PVector location;
  float speed;
  float size = 50;
  int health;
  
  Enemy(PVector location, int health)
  {
    this.location = location;
    if ( health == 0)
      this.health = health + 4;
    else
      this.health = health;
    
  }
  
  void display()
  {
    fill(255);
    noStroke();
    if( health == 1)
    {
      fill(255, 0, 0);
      speed = 30;
    }
    else if( health == 2)
    {
      fill(0, 255, 0);
      speed = 25;
    }
    else if( health == 3)
    {
      fill(0, 0, 255);
      speed = 20;
    }
    else
    {
      fill(255);
      speed = 15;
    }
    ellipse(location.x, location.y, size, size);
  }
  
  void update()
  {
    location.x = lerp(location.x, shooter.location.x, speed / 9000);
    location.y = lerp(location.y, shooter.location.y, speed / 9000);
  }
}