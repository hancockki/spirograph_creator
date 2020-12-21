/*
Welcome to the Spiraling Spirograph Scene!

This processing program is a unique, user-friendly applet that allows you to
explore the fun world of spirographs! Spirographs are based off of different mathematical
ratios between outer and inner circles, as well as the speed in which the spirograph is traced.
The user is able to create their own spirograph design with a few simple tools, filling the page
with fun and unique shapes. Each spirograph is composed of Circle objects, where each Circle object has a 
parent and a child Circle (except the outer circle which has no parent and the inner most circle which
has no child). We make these circles 'on top of' one another and then rotate them at different speeds based on
an inital speed. Each inner circle spins faster than its parent.

I basically just played around with the different ratios of speed and radius and number of circles, because
really I wanted to create something where the user could determine for themselves what speed and circle ratios
they like the shape of best.

This script is the driver for the whole program. It creates an initial Circle object and continuously
draws the path of the objects.

12/20/2020
@author: Kim Hancock
CSCI 3725: Computational Creativity
Bowdoin College
*/

import g4p_controls.*;
import java.util.Random;

// we initialize the current path (which will be updated as the user creates new spirographs
Path currentPath;
//initialize list of Path objects to track the path of each spirograph the user creates.
ArrayList<Path> paths;

///initialize the outer, end, and current circles which is updated as the user creates new spirographs
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
  currentPath = new Path(255,0,50);
  paths = new ArrayList<Path>();
  paths.add(currentPath);
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
  drawPath(currentPath.points); //draw the path of the orbit! 
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
  for (Path currentpath : paths) {
    for (int i = 0; i < numLayers; i+=1) {
      // draw new outline
      beginShape();
      //update colors to create a rainbow affect the user can manipulate
      stroke(currentpath.redAmount-(i*12),currentpath.greenAmount+(i*5),currentpath.blueAmount+(i*5),200-(i*2)); 
      //draw each vertex in the list
      for (PVector pos : currentpath.points) {
        vertex(pos.x+(0.5*i), pos.y+(0.5*i));
      }
    endShape();
   }
  }
}
