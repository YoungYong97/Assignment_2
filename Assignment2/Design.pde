abstract class Design
{
  void button(String a, float b, float c)
  {
    fill(255);
    beginShape();
    vertex(b - 50, c-50);
    vertex(b-50, c+50);
    vertex(b+50, c+50);
    vertex(b+50, c-50);
    endShape(CLOSE);
    
    fill(200,0,0);
    textSize(30);
    textAlign(CENTER);
    text(a, b, c);
  }
}