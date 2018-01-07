class Cloud{
  /*
  A class to show and animate clouds on the screen.
  */
  float size1, size2, x, y, separation;
  Cloud(){
    size1 = random(20, 40);
    size2 = random(20, 40);
    separation = random(15, 40);
    x = width + size1;
    y = random(0, height/2);
  }
  
  void display(){
    /*
    Draw ellipses that overlap, using variables to keep track of
    their sizes and locations.  As a hint, keep track of the location 
    of one cloud, and set a "separation" that spreads them out a little.
    */
    fill(255);
    ellipse(x, y, size1, size2);
    ellipse(x + separation, y + separation, size1, size2);
  }
  
  void wind(){
    /*
    This function should update the horizontal position of the clouds, 
    moving them left across the screen.  
    */
    x = x - 1;
  }
}