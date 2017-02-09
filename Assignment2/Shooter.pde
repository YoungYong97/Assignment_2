class Shooter
{
  PVector location;
  float theta;
  float size;
  float radius;
  PShape shape;
  int delay;
  float a;
  
  Shooter(PVector location, float theta, float size)
  {
    this.location = location;
    this.theta = theta;
    this.size = size;
    radius = size / 2;
    delay = 5;
    /* }
     
     void draw()
     {
     stroke(255);
     strokeWeight(0.5);
     line(location.x, location.y, mouseX, mouseY); 
     image(img,(width/2)-50,(height/2)-50, 100,100);
     noFill();
     stroke(0);
     strokeWeight(30);
     ellipse(location.x, location.y, 120, 120);
     */
    //create();
  }

  /*void create()
  {
    shape = createShape();
    shape.beginShape();
    
    shape.stroke(255);
    shape.noFill();
    shape.strokeWeight(2);
    shape.rectMode(CENTER);
    
    /*shape.vertex(-radius, radius);
    shape.vertex(0, - radius);
    shape.vertex(radius, radius);
    shape.vertex(0, 0);
    
    shape.rect();
    
    shape.endShape(CLOSE);
  }*/
  void render()
  {
    a = atan2(mouseY-width/2, mouseX-height/2);    
    
    pushMatrix(); // Stores the current transform
    imageMode(CENTER);
    translate(location.x  , location.y);
    rotate(theta);    
    
    image(img, 0, 0);
    popMatrix(); // Restore the transform
  }


  void update()
  {
    
    if (checkKey('a'))
     {
     theta -= 0.05f;
     }
     if (checkKey('d'))
     {
     theta += 0.05f;
     }


    if (checkKey(' '))
    {
      if(delay <= 0) {
        Bullet b = new Bullet(location.x, location.y, theta, 20);
        bullets.add(b);
        delay = 8;
      }
      else {
        delay--;
      }
    }
  }
}