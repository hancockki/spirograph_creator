import g4p_controls.*;

ArrayList<PVector> path; //pvector objects are 2d vectors
ArrayList<PVector> path2; //pvector objects are 2d vectors

boolean paused = false; //used to pause and start drawing

//initialize amount of each color
int redAmount = 0;
int greenAmount = 50;
int blueAmount = 50;

float r = 100; //radius
float angle = 0;

//number of circles in spirograph and number of layers in each one
int numCircles = 1;
int numLayers = 10;

//initialize our start and end circles
Orbit sun;
Orbit end;

//controls whether we want to stop the drawing
boolean stop = false;
boolean drawing = true;
//screen size
void settings() {
  size(600, 600);
}

//setup for the screen
void setup() {
  
  //add second window for control of elements
  screen = GWindow.getWindow(this, "Control Panel", 300,300,500,200,P2D);
  screen.addDrawHandler(this, "windowDraw");
  
  //simple buttons
  increaseCircles = new GButton(screen, 0,0,150, 30,"Click me to increase the number of circles");
  increaseLayers = new GButton(screen, 150,0,150,30, "Click me to increase the number of layers");
  increaseSpeed = new GButton(screen, 300,0,150,30, "Click me to increase the speed");
  decreaseCircles = new GButton(screen, 0,30,150,30, "Click me to decrease the number of circles");
  decreaseLayers = new GButton(screen, 150,30,150,30, "Click me to decrease the number of layers");
  decreaseSpeed = new GButton(screen, 300,30,150,30, "Click me to decrease the speed");
  
  //a slider for each primary color
  implementSliders(red, 4.0, 100,100, redAmount);
  implementSliders(green, 5.0, 200,100, greenAmount);
  implementSliders(blue, 6.0, 300,100, blueAmount);
  
  //initialize our path vector
  path = new ArrayList<PVector>();
  //create our first spirograph!
  startMoving(305,305);
}

//runs for the duration of the program, draws the spirals
void draw(){
  background(51);
  noFill();
  Orbit current = sun;
  while (current != null) {
    if (stop == false) {
      current.update();
      current.show();
    }
    current = current.child;
    if (stop == true) {
      break;
    }
  }
   drawPath(path);
}

void mouseReleased() {
    end.x = mouseX;
    end.y = mouseY;
    path2 = new ArrayList<PVector>();
    startMoving(mouseX, mouseY);
    drawPath2(path2);
}

//start the spirograph
void startMoving(int xCoord, int yCoord) {
  //center circle
  sun = new Orbit(xCoord, yCoord,100, 1);
  //update current so we have more and more children
  Orbit current = sun;
  for (int i = 0; i < numCircles; i++) {
    current = current.addChild();
  }
   end = current;
   loop();
}

//initialize our control panel window
public void windowDraw(PApplet app, GWinData data) {
  app.background(0);
  app.fill(255);
}

//where we actually track the location vectors to draw the spiral
void drawPath(ArrayList<PVector> path) {
  if (drawing) {
    path.add(new PVector(end.x,end.y)); //add the vectors to path
  }
  //draw each layer
  for (int i = 0; i < numLayers; i+=1) {
  // draw new outline
    beginShape();
    if (drawing) {
      stroke(redAmount+(i*5),greenAmount+(i*5),blueAmount+(i*5), log(i)*100); 
    } else {
      stroke(0,0,0); }
    for (PVector pos : path) {
      vertex(pos.x+(0.5*i), pos.y+(0.5*i));
    }
    
    endShape();
  }
  
}

void drawPath2(ArrayList<PVector> path) {
  path.add(new PVector(end.x,end.y)); //add the vectors to path
  
  //draw each layer
  for (int i = 0; i < numLayers; i+=1) {
  // draw new outline
    beginShape();
    stroke(redAmount+(i*5),greenAmount+(i*5),blueAmount+(i*5), log(i)*100); 
    for (PVector pos : path) {
      vertex(pos.x+(0.5*i), pos.y+(0.5*i));
      }
    
    endShape();
  }
  
}

///variables for buttons and sliders
GButton increaseCircles;
GButton increaseLayers;
GButton increaseSpeed;
GButton decreaseCircles;
GButton decreaseLayers;
GButton decreaseSpeed;

GCustomSlider red;
GCustomSlider green;
GCustomSlider blue;

GWindow screen;
//float x1 = 300;
  //float y1 = 300;
  //float r1 = 100;
  
  //stroke(255);
  //strokeWeight(2);
  //noFill();
  //ellipse(x1, y1, r1*2, r1*2);
  
  //float r2 = r1 * 0.5; //r divides by 2
  //float rsum = r1 + r2;
  //float x2 = x1 + rsum * cos(angle);
  //float y2 = y1 + rsum * sin(angle);
  //ellipse(x2, y2, r2*2, r2*2);
