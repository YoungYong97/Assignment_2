class GameOver extends Design implements Screen
{
  void display()
  {
    background(0);
    
    textSize(60);
    textAlign(CENTER);
    text("YOU DIED", width *0.5, height *0.5);
    
    button("Back", width* 0.5, height * 0.8);
  }
}