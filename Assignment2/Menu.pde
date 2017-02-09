class Menu extends Design implements Screen
{
  void display()
  {
    background(0);
    
    textSize(60);
    textAlign(CENTER);
    text("Shooter", width *0.5, height *0.2);
    
    button("Start", width* 0.5, height * 0.4);
    button("Instructions", width* 0.5, height * 0.5);
  }
}