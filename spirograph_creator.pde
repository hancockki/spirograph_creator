import g4p_controls.*;
import java.util.Random;

// the below lines initialize data structures to store each point in the path
ArrayList<PVector> path;
ArrayList<ArrayList<PVector>> paths;

//used to pause and stop drawing
boolean paused = false;
boolean stop = false;

//initialize amount of each color
int redAmount = 255;
int greenAmount = 0;
int blueAmount = 50;
//initialize our outer, current, and end circles
Circle outer;
Circle end;
Circle current;

//initialzie random object
Random rand;

/* 
Called once automatically when the program starts. Cannot be called again. 
Sets the background, initializes global vars, and creates our first spirograph
in the middle of the page!
*/
void setup() {
  size(600, 600);
  noFill();
  rand = new Random();
  createGUI();
  
  //initialize our path vector lists
  path = new ArrayList<PVector>();
  paths = new ArrayList<ArrayList<PVector>>();
  
  //add first path to list and create first spirograph!
  paths.add(path);
  createCircle(305,305,100, 3);
}

/*
Runs continuously for the duration of the program.
We show the spirograph itself as well as the path.
*/
void draw(){
  background(30, 30, 30);
  noFill();
  Circle current = outer;
  //show the circles until current is null (indicating its the outer most circle)
  while (current != null) {
    if (stop == false) {
      current.updateCircle();
      current.show();
    }
    current = current.child; //reassign current to next circle
  }
  drawPath(path); //draw the path of the orbit! 
}

/*
Creates the next spirograph on the page! The outermost circle is named outer, and 
all of the circles spiraling in it are called children. This method creates the specified
number of child circles. Each circle is a Spirograph Object.
@params:
    xCoord --> x coordinate of the outer circle to be made
    yCoord -> y coordinate of the outer circle to be made
    radius --> the radius of the outer circle to be made
*/
void createCircle(float xCoord, float yCoord, float radius, float factor) {
  //create outer-most circle
  outer = new Circle(xCoord, yCoord,radius, 1, factor);
  //create the specified number of children; update current circle
  Circle current = outer;
  for (int i = 0; i < numCircles; i++) {
    current = current.addChild(); //add a child circle
  }
  end = current; //set end to the last circle (this is where the path is drawn from)
}

/* 
Here we actually track the location vectors to draw the spiral. Note that draw() calls this method,
so this is  also called continuously. Note that the outer Circle of each spirograph has continuously moving
x,y parameters as all the circles rotate. We want to trace this like in a real spirograph on paper.
To do this, we continuously add all of the coordinates as PVector objects to a list and then draw all
of them. IF the drawing is stopped we don't keep adding to the path.

@params:
  path --> current array list of PVector vertices
*/
void drawPath(ArrayList<PVector> path) {
  //if the drawing is not stopped, add the points as the circles rotate.
  if (!stop) {
    path.add(new PVector(end.x,end.y)); //add the vectors to path
  }
  //draw each spirograph
  for (ArrayList<PVector> currentpath : paths) {
    for (int i = 0; i < numLayers; i+=1) {
      // draw new outline
      beginShape();
      //update colors to create a rainbow affect the user can manipulate
      stroke(redAmount-(i*12),greenAmount+(i*5),blueAmount+(i*5),200-(i*2)); 
      //draw each vertex in the list
      for (PVector pos : currentpath) {
        vertex(pos.x+(0.5*i), pos.y+(0.5*i));
      }
    endShape();
   }
  }
}
