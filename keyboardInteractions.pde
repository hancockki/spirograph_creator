/*
This script hosts all of the code for handling what happens when the user uses the keyboard
functionality of the program. This is pressing the mouse to create a new spirograph
and pressing different keys to stop/pause/clear the current spirograph.
*/

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
    int index = paths.size()-1;
    if (index >= 0) {
      paths.remove(index);
    } else {
        createCircle(outer.x,outer.y, outer.r, outer.factor);
    }
  }
  //save image
  if (key == 'i') {
    save("spirograph.png");
  }
}

/* 
Create a new spirograph every time the user clicks in the window. 
Creates a new array list for the path of the new spirograph and adds it to the list
of paths.
*/
void mouseReleased() {
  //get mouse x,y coordinates
  float radius;
  float factor;
  //if the user pressed 's' before clicking, clear the spirograph and create identical one somewhere else
  if (stop) {
     currentPath.points.clear();
     radius = outer.r;
     factor = end.factor;
  // if the user pressed 'p' before clicking, make the same spirograph with a different size somewhere else
  } else if (paused){
     radius = (int)(Math.random() * (180 - 30 + 1) + 20);
     factor = end.factor;
  // if they just clicked, make a random spirograph with a new size/circle ratio
  } else {
     radius = (int)(Math.random() * (180 - 30 + 1) + 20);
     factor = (float)(Math.random() * (4 - 1 + 1) + 1)+rand.nextFloat();
  }
  //get x,y coordinates of where the user clicked
  end.x = mouseX;
  end.y = mouseY;
  //create new path object for the new spirograph
  currentPath = new Path(255,0,50); //reassign path variable
  createCircle(mouseX, mouseY, radius, factor); //create next Circle
  //add path to paths list
  paths.add(currentPath);
}
