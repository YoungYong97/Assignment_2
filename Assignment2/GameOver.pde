class GameOver extends Design implements Screen
{
  void display()
  {
    background(0);
    
    textSize(60);
    textAlign(CENTER);
    text("YOU DIED", width *0.5, height *0.5);
    text("Score = ", width * 0.5, height * 0.7);
    text(score, width * 0.6, height * 0.7);
    
    button("Back", width* 0.5, height * 0.8);
  }
}