Shooter shooter;
ArrayList<Enemy> monsters = new ArrayList<Enemy>();;
PImage img;
float cx, cy;
int[] heal = {1, 2, 3, 4};
boolean[] keys = new boolean[1000];
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
float time = 1.0f / 60.0f;

void setup()
{
  noCursor();
  fullScreen();
  cx = width/2;
  cy = height/2;
  frameRate(60);
  
  for (int i=0; i < 1; i++)
  {
    monsters.add( new Enemy(new PVector(0,random(height)), int(random(heal.length))) );
    monsters.add( new Enemy(new PVector(width,random(height)), int(random(heal.length))) );  
    monsters.add( new Enemy(new PVector(random(width), 0), int(random(heal.length))) );
    monsters.add( new Enemy(new PVector(random(width),height), int(random(heal.length))) );
  }
  shooter = new Shooter(new PVector(cx, cy), PI, 50);
  img = loadImage("boss.jpg");
}

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}


void draw()
{
  background(0);
  stroke(255);
  //shooter.draw();
  shooter.update();
  shooter.render();
  
  
  for (Enemy e: monsters)
  {
    e.draw();
    e.update();
  }
  for(int i = 0; i < bullets.size(); i++)
  {
    stroke(255);
    Bullet b = bullets.get(i);
    b.update();
    b.render();
    
    if(b.isEdge())
    {
      bullets.remove(i);
    }
  }
}