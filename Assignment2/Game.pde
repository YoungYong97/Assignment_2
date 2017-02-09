class Game implements Screen
{
  void display()
  {
    background(0);
    stroke(255);
    //shooter.draw();
    shooter.update();
    shooter.render();


    /*for (Enemy e : monsters)
     {
     e.display();
     e.update();
     }*/
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
      //for(Enemy e : monsters) {
      for (Bullet b : bullets) {
        if (testCollision(e.location, b.pos, e.size)) {
          if ( e.health > 0)
          {
            e.health--;
          } else
          {
            monsters.remove(e);
          }
          b.hit=true;
        }
      }
    }

    for (int index= monsters.size() - 1; index >=0; index--)
    {
      if( monsters.get(index).location.x > shooter.location.x - 50 && monsters.get(index).location.x < shooter.location.x + 50 && monsters.get(index).location.y > shooter.location.y - 50 && monsters.get(index).location.y < shooter.location.y + 50)
      {
        state = 3; // game over
      }
    }
  }
}