/*
Very simple path that just stores the list of PVector objects along the path of the spirograph
and its color scheme.
*/
class Path {
  ArrayList<PVector> points; //store each point along the path
  //store the amount of each color. initialized to the following but the user can change it.
  int redAmount = 255; 
  int greenAmount = 0;
  int blueAmount = 50;
  
  //constructor for Path objects
  Path(int redAmount_, int greenAmount_, int blueAmount_) {
    points = new ArrayList<PVector>();
    redAmount = redAmount_;
    greenAmount = greenAmount_;
    blueAmount = blueAmount_;
  }
}
  


    

  
