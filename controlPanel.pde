void handleButtonEvents(GButton button, GEvent event) {
  //INCREASE VALUES
  if (button == increaseCircles && event == GEvent.CLICKED) {
    println("clicked button");
    numCircles += 1;
    path.clear();
    startMoving(305,305);
  }
  
  if (button == increaseLayers && event == GEvent.CLICKED) {
    numLayers += 5;
  }
  if (button == increaseSpeed && event == GEvent.CLICKED) {
    path.clear();
    k -= 1;
    println(k);
    end.update();
  }
  
  //DECREASE VALUES
  if (button == decreaseCircles && event == GEvent.CLICKED) {
    numCircles -= 1;
    path.clear();
    startMoving(305,305);
  }
  
  if (button == decreaseLayers && event == GEvent.CLICKED) {
    numLayers -= 5;
  }
  if (button == decreaseSpeed && event == GEvent.CLICKED) {
    path.clear();
    k += 1;
    println(k);
    end.update();
  }
}

void handleSliderEvents(GValueControl slider, GEvent event) {
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
void keyPressed() {
  if ( key == 'p' ) {
    paused = !paused;

    if (paused) {
      noLoop();
    } else {
      loop();
    }
  }
  if (key == 's') {
    if (stop == true) {
      stop = false;
    } else {
      stop = true;
    }
  }
  if (key == 'c') {
    println('c');
    path.clear();
  }
  if (key == 'n') {
    drawing = !drawing;
  }
}

void implementSliders(GCustomSlider color_, float easing, int xindex, int yindex, int amount) {
  //implement sliders
  color_ = new GCustomSlider(screen, xindex,yindex,100,100);
  color_.setShowValue(true);
  color_.setShowLimits(true);
  color_.setLimits(amount, 0, 255);
  color_.setNbrTicks(11);
  color_.setShowTicks(true);
  color_.setEasing(easing);
  color_.setNumberFormat(G4P.INTEGER, 0);
  color_.setOpaque(true);
  
}
