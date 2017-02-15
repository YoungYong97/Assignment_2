class Menu extends Design implements Screen
{
  void display()
  {
    background(0);
    
    textSize(100);
    textAlign(CENTER);
    text("SHOOT", width *0.5, height *0.2);
    
    button("Start", width* 0.5, height * 0.5);
    button("Instructions", width* 0.5, height * 0.7);
  }
}