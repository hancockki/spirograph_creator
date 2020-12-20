/*
This script is where all of the user interactions are controlled.
Includes buttons, keys pressed, and color control. All b
*/

public void createGUI() {
  //add second window for control of elements
  screen = GWindow.getWindow(this, "Control Panel", 300,300,600,700,P2D);
  G4P.setGlobalColorScheme(GCScheme.CYAN_SCHEME);
  screen.addDrawHandler(this, "windowDraw");
  
  //simple buttons
  increaseCircles = new GButton(screen, 20,580,183, 60,"Click me to increase the number of circles");
  increaseLayers = new GButton(screen, 203,580,183,60, "Click me to increase the number of layers");
  increaseSpeed = new GButton(screen, 386,580,183,60, "Click me to increase the speed");
  decreaseCircles = new GButton(screen, 20,640,183,60, "Click me to decrease the number of circles");
  decreaseLayers = new GButton(screen, 203,640,183,60, "Click me to decrease the number of layers");
  decreaseSpeed = new GButton(screen, 386,640,183,60, "Click me to decrease the speed");
  
  //a slider for each primary color
  implementSliders(red, 4.0, 100,400, redAmount);
  implementSliders(green, 5.0, 200,400, greenAmount);
  implementSliders(blue, 6.0, 300, 400, blueAmount);
  
  //add slider labels
  redLabel = new GLabel(screen, 110,375,100,30, "Red Slider");
  redLabel.setLocalColorScheme(GCScheme.RED_SCHEME);
  greenLabel = new GLabel(screen, 220,375,100,30, "Green Slider");
  greenLabel.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  blueLabel = new GLabel(screen, 330,375,100,30, "Blue Slider");
  blueLabel.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  
  //print description of how to use applet
  description = new GLabel(screen, 20,0,580,400, "Welcome to this applet!\n This allows you to create" +
  " your own spirograph design. Play around with different elements of the spirograph. These elements are: \n \n" +
  "\n 1) the number of circles \n \n 2) the speed the spirograph rotates \n \n 3) the number of layers drawn (how thick" +
  " it is) \n \n 4) the color of the path \n \n 5) The number of spirographs on the screen \n \n Click each of the buttons below" +
  "to control these aspects of the spirograph. \n Drag each slider to manipulate how much of each color is shown. \n In addition to the buttons, you can " +
  "also do the following: \n \n --> Click anywhere on the screen to start a new spirograph \n \n --> Press 'p' to pause the drawing, and then 'p'" +
  "again to restart \n \n --> Press 'c' to clear" +
  "the current spirograph and start again in the same location \n \n --> Press 's' to pause the drawing and hide the spirograph circles. Press" +
  "'s' again to restart \n \n --> If you press 'p' or 's' before clicking the screen to start a new spirograph, the current spirograph will" +
  "be erased. This can be used if you do not like the positioning of the last spirograph you created");
}

/* initialize our control panel window */
public void windowDraw(PApplet app, GWinData data) {
  app.background(220,220,220);
  app.fill(255);
}

/*
Controls what happens when the user clicks each button.
Used to increase/decrease the number of circles in each spirograph, the number of
layers drawn, and the speed the circles spin.

@params:
    button --> the button that was pressed
    event --> the event which occured to trigger this function (clicking button)
*/
void handleButtonEvents(GButton button, GEvent event) {
  //INCREASE VALUES
  if (button == increaseCircles && event == GEvent.CLICKED) {
    println("clicked button");
    numCircles += 1;
    path.clear();
    createCircle(outer.x,outer.y, outer.r);
  }
  if (button == increaseLayers && event == GEvent.CLICKED) {
    numLayers += 5;
  }
  if (button == increaseSpeed && event == GEvent.CLICKED) {
    path.clear();
    k -= 1;
  }
  //DECREASE VALUES
  if (button == decreaseCircles && event == GEvent.CLICKED) {
    numCircles -= 1;
    path.clear();
    createCircle(outer.x,outer.y, outer.r);
  }
  if (button == decreaseLayers && event == GEvent.CLICKED) {
    numLayers -= 5;
  }
  if (button == decreaseSpeed && event == GEvent.CLICKED) {
    path.clear();
    k += 1;
  }
}

/* 
Create a new spirograph every time the user clicks in the window. 
Creates a new array list for the path of the new spirograph and adds it to the list
of paths.
*/
void mouseReleased() {
  //get mouse x,y coordinates
  if (stop || paused) {
     path.clear();
  }
  end.x = mouseX;
  end.y = mouseY;
  path = new ArrayList<PVector>(); //reassign path list
  int radius = (int)(Math.random() * (100 - 20 + 1) + 20);
  createCircle(mouseX, mouseY, radius); //create next Circle
  //add path to paths list
  paths.add(path);
}

/*
Here, we control each slider. Allows user to manipulate the slider for
the color of the path. To differentiate each slider I used the easing
property of the slider. I made each easing different (couldn't find a better
way to tell which slider was which).

@params:
    slider --> the slider that was manipulated
    eventt --> the event that occured
*/
void handleSliderEvents(GValueControl slider, GEvent event) {
  //decide which slider it is and change color value accordingly
  if (slider.getEasing() == 4.0) {
    redAmount = slider.getValueI();
    println(slider.getEasing());
  }
  if (slider.getEasing() == 5.0) {
    greenAmount = slider.getValueI();
  }
  if (slider.getEasing() == 6.0) {
    blueAmount = slider.getValueI();
  }
}

/*
Control what happens when the user clicks various stop/start the spirograph from moving.
Press 'p' to pause/play the drawing
Press 's' to pause/play the drawing and hide the white circles
Press 'c' to clear the current spirograph and restart in the same place.
*/
void keyPressed() {
  //pause/play drawing
  if ( key == 'p' ) {
    paused = !paused;
    if (paused) {
      noLoop();
    } else {
      loop();
    }
  }
  //stop the drawing AND hide the white circles
  if (key == 's') {
    if (stop == true) {
      stop = false;
    } else {
      stop = true;
    }
  }
  //clear current circle
  if (key == 'c') {
    println('c');
    path.clear();
    createCircle(outer.x,outer.y, outer.r);

  }
}

/*
Implement our sliders for the color scheme of the drawing. Called once for each slider.
@params:
    color_ --> the slider that we are implementing
    easing --> the amount of easing the slider has. used to differentiate between the 
    three colors (each has different easing)
    xIndex --> the x coordinate of where we want the slider to be
    yIndex --> the y coordinate of where we want the slider to be
    amount --> the starting amount of the color
*/
void implementSliders(GCustomSlider color_, float easing, int xIndex, int yIndex, int amount) {
  //implement sliders
  color_ = new GCustomSlider(screen, xIndex,yIndex,100,100);
  color_.setShowValue(true);
  color_.setShowLimits(true);
  color_.setLimits(amount, 0, 255);
  color_.setNbrTicks(11);
  color_.setShowTicks(true);
  color_.setEasing(easing);
  color_.setNumberFormat(G4P.INTEGER, 0);
  color_.setOpaque(true);
  
}

//initialize G4P variables
GButton increaseCircles;
GButton increaseLayers;
GButton increaseSpeed;
GButton decreaseCircles;
GButton decreaseLayers;
GButton decreaseSpeed;

GCustomSlider red;
GCustomSlider green;
GCustomSlider blue;

GLabel redLabel;
GLabel greenLabel;
GLabel blueLabel;
GLabel description;

GWindow screen;
