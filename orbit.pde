int k = -4;

class Orbit {
  float x;
  float y;
  float r;
  int n;
  Orbit parent;
  Orbit child;
  float speed;
  float angle; //keep track of speed and angle
  
  Orbit(float x_, float y_, float r_, int n_) {
    this(x_,y_,r_,n_, null);
  }
  Orbit(float x_, float y_, float r_, int n_, Orbit p) {
    x = x_;
    y = y_;
    r = r_;
    n = n_;
    parent = p;
    child = null;
    angle = 0;
    speed = radians(pow(k,n-1));
  }
  
  void show() {
    stroke(255);
    strokeWeight(1);
    ellipse(x,y,r*2,r*2);
  }
  void update() {
   if (parent != null) {
    angle += speed*0.5;
   float rsum = r + parent.r;
   x = parent.x + rsum * cos(angle);
   y = parent.y + rsum * sin(angle);
   speed = radians(pow(k,n-1));
  //ellipse(x2, y2, r2*2, r2*2);
   }
  }
  Orbit addChild() {
    float newr = r / 3.0;
    float newx = x + r + newr;
    float newy = y;
    child = new Orbit(newx,newy,newr, n+1, this);
    
    return child;
  }
  void stop() {
    x = 0;
    y = 0;
    speed = 0;
    angle = 0;
  }
  
}
