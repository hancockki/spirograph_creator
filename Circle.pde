/*
This script houses the Circle class. A Circle object is created for every 
circle of each spirograph. Circle objects have (x,y) coordinates, parent and child circles
(which may be null if it's the outer or inner circle), angle/speed for rotation, and 
a 'level', n (this level controls the speed, as each circle gets faster).

The angle is updated continuously when the spirograph is created, since we rotate around the outer circle.
We do this by continuously adding to the angle (Which is in radians).

The other attribute that needs a bit of an explanation is factor, which is essentially the factor which
we divide the radius of each new circle by. So, if factor=2 and we start with radius=12, then the second 
circle will have radius 6, the third radius 3, etc.
*/

//public variable for the base speed, same for every spirograph.
public int k = -4;

//number of circles in spirograph and number of layers in each one
public int numCircles = 3;
public int numLayers = 15;

class Circle {
  float x; //x coordinate
  float y; //y coordinate
  float r; //radius
  int n; //level of the circle. for instance, the outermost circle is n=1
  Circle parent; //parent circle
  Circle child; //child circle
  float speed; //keep track of speed and angle
  float angle; //angle we are taking the sine/cosine of to rotate the circle.
  float factor; //this is the factor by which we divide the radius of the circle when creating child circles.

  /* circle constructor. initialize all class attributes */
  Circle(float x_, float y_, float r_, int n_, float factor_, Circle p) {
    x = x_;
    y = y_;
    r = r_;
    n = n_;
    parent = p;
    child = null; //we reassign this when we make the child Circle
    angle = 65; //this is arbitrary but I picked 65 to make the spirals centered.
    speed = radians(pow(k,n-1)); //a higher value of k will make the speed faster.
    factor = factor_;
  }
  
  /* 
  Alternative circle constructor for when there is no parent.
  Called for the outermost circle which has no parent circle.
  */
  Circle(float x_, float y_, float r_, int n_, float factor_) {
    this(x_,y_,r_, n_,factor_, null);
  }
  
  /* Show the circle */
  void show() {
    stroke(255);
    strokeWeight(1);
    ellipse(x,y,r*2,r*2);
  }
  
  /*
  This is called continuously in draw() and is what makes the circles rotate.
  We update the x,y coordinates based on the difference between the parent radius
  and the radius of the current circle.  We continuously update the angle which we take
  the sine and cosine of to offset the x,y coordinates. In other words, we are continuously
  moving the starting point of the circle to rotate around its parent. We only move the circle
  if it has a parent (otherwise it would have nothing to rotate around).
  
  We also call this to update the speed if the user changes it, since the constructor is only called once.
  */
  void updateCircle() {
   //if the circle has a parent, update angle of rotation.
   if (parent != null) {
    angle += speed*0.5;
   float rsub = r - parent.r;
   x = parent.x - rsub * cos(angle);
   y = parent.y - rsub * sin(angle);
   speed = radians(pow(k,n-1));
   }
  }
  
  /* 
  Creates a child circle. Sets the radius to 1/3 of the parent and
  the x,y coordinates to be 2/3 of what they were in the parent (and thus
  1/3 from the outer edge of the parent circle)
  Then sets the child attribute of the current Circle object to be a new Circle object
  with the calculated attributes.
  @returns:
      child --> the child Circle object of the current Circle
  */
  Circle addChild() {
    float newr = r / factor;
    float newx = x + r - newr;
    float newy = y + r - newr;
    child = new Circle(newx, newy, newr, n+1, this.factor, this);
    return child;
  }
}
