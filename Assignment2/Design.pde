abstract class Design
{
  void button(String a, float b, float c)
  {
    fill(255);
    beginShape();
    vertex(b - 100, c - 50);
    vertex(b - 100, c + 30);
    vertex(b + 100, c + 30);
    vertex(b + 100, c - 50);
    endShape(CLOSE);
    
    fill(200,0,0);
    textSize(30);
    textAlign(CENTER);
    text(a, b, c);
  }
}