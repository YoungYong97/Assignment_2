Shooter shooter;
GameOver death= new GameOver();
Game game= new Game();
Menu menu = new Menu();
ArrayList<Enemy> monsters = new ArrayList<Enemy>();
;
PImage img;
float cx, cy;
int[] heal = {1, 2, 3, 4};
int state=3;
boolean[] keys = new boolean[1000];
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
float time = 1.0f / 60.0f;
int lvl = 1;

void setup()
{
  fullScreen();
  cx = width/2;
  cy = height/2;
  frameRate(60);

  for (int i=0; i < lvl; i++)
  {
    monsters.add( new Enemy(new PVector(0, random(height)), int(random(heal.length))) );
    monsters.add( new Enemy(new PVector(width, random(height)), int(random(heal.length))) );  
    monsters.add( new Enemy(new PVector(random(width), 0), int(random(heal.length))) );
    monsters.add( new Enemy(new PVector(random(width), height), int(random(heal.length))));
  }
  shooter = new Shooter(new PVector(cx, cy), PI, 50);
  img = loadImage("shoot.png");
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
  game_state(state);
  
}

void game_state(int state)
{
  switch(state)
  {
    case 0: // Menu
    {
      menu.display();
      break;
    }
    
    case 1: // game screen
    {
      game.display();
      break; 
    }
    
    case 2: // Credits
    {
      break;
    }
    
    case 3: // death screen
    {
      death.display();
      break;
    }
  }
}

boolean testCollision(PVector aPos, PVector bPos, float aSize)
{
  if (bPos.x < aPos.x + aSize/2 && bPos.x > aPos.x - aSize/2 && bPos.y > aPos.y - aSize/2 && bPos.y < aPos.y + aSize/2)
  {   
    println("hit!");
    return true;
  } else {
    return false;
  }
}

void mouseClicked()
{
  if(state==0) // menu 
  {
    if(mouseX > width* 0.5 - 50 && mouseX < width * 0.5 +50 && mouseY> height *0.4 -50 && mouseY< height * 0.4+50)
    {
      state=1;
    }
  }
  else if(state==3) // Game Over
  {
    if(mouseX > width* 0.5 - 50 && mouseX < width * 0.5 +50 && mouseY> height *0.8 -50 && mouseY< height * 0.8+50)
    {
      for (int index= monsters.size() - 1; index >=0; index--)
      {
        Enemy e = monsters.get(index);
        monsters.remove(e);
        lvl = 1;
      }
      state=0;
    }
  }
}