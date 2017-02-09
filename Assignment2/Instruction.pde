class Instruction extends Design implements Screen
{
  void display()
  {
    background(0);
    
    textSize(60);
    textAlign(CENTER);
    fill(255);
    text("Press A Or D to rotate the turret.", width *0.5, height *0.3);
    textSize(50);
    fill(255, 0, 0);
    text("Red ball takes 1 shot to kill.", width * 0.5, height * 0.4);
    fill(0, 255, 0);
    text("Green ball takes 2 shot to kill.", width * 0.5, height * 0.5);
    fill(0, 0, 255);
    text("Blue ball takes 3 shot to kill.", width * 0.5, height * 0.6);
    fill(255);
    text("White ball takes 4 shot to kill.", width * 0.5, height * 0.7);
    
    button("Back", width* 0.5, height * 0.8);
  }
}