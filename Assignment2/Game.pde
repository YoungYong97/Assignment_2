class Game implements Screen
{
  void display()
  {
    background(0);
    stroke(255);
    shooter.update();
    shooter.render();

    if (monsters.size() == 0)
    {
      for (int i=0; i < lvl; i++)
      {
        monsters.add( new Enemy(new PVector(0, random(height)), int(random(heal.length))) );
        monsters.add( new Enemy(new PVector(width, random(height)), int(random(heal.length))) );  
        monsters.add( new Enemy(new PVector(random(width), 0), int(random(heal.length))) );
        monsters.add( new Enemy(new PVector(random(width), height), int(random(heal.length))));
      }
      lvl++;
    }

    for (int i = 0; i < bullets.size(); i++)
    {
      stroke(255);
      Bullet b = bullets.get(i);
      b.update();
      b.render();

      if (b.isEdge() || b.hit==true)
      {
        bullets.remove(i);
      }
    }

    for (int index= monsters.size() - 1; index >=0; index--)
    {
      Enemy e = monsters.get(index);
      e.display();
      e.update();
      for (Bullet b : bullets) 
      {
        if (testCollision(e.location, b.pos, e.size)) 
        {
          if ( e.health > 1)
          {
            e.health--;
            score++;
          } 
          else
          {
            monsters.remove(e);
            score++;
          }
          b.hit=true;
          
        }
      }
    }

    for (int index= monsters.size() - 1; index >=0; index--)
    {
      if( monsters.get(index).location.x > shooter.location.x - 70 && monsters.get(index).location.x < shooter.location.x + 70 && monsters.get(index).location.y > shooter.location.y - 70 && monsters.get(index).location.y < shooter.location.y + 70)
      {
        state = 3; // game over
      }
    }
    textSize(30);
    fill(255);
    text("Score = ", width * 0.8, height * 0.9);
    text(score, width * 0.9, height * 0.9);
  }
}