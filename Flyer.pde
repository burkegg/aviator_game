/*  
 Alive Check - keep # of lives in object and only output whether alive or dead.
 Collision Check - subtract life, clear array
 Offscreen - 
 gravity - 
 flap
 apply forces
 display
 */

class Flyer {

  color c;
  int rad, lives;
  float y_loc;
  float x_loc;
  float vel;
  float accel;
  float flap;
  float grav;

  Flyer() {
    lives = 0;
    c = color(155, 0, 255);
    y_loc = height/2;
    x_loc = width/2;
    vel = 0;
    accel = 0;
    flap = -5.0;
    rad = 20;
    grav = 0.2;
  }
  
  void giveLives(){
   lives = 3; 
  }

  void forces(float f) {
    accel = accel + f;
  }

  void update() {
    vel = vel + accel;
    vel = constrain(vel, -5, 100);
    y_loc = y_loc + vel;
    accel = 0;
  }

  void display() {
    noStroke();
    fill(c);
    ellipseMode(RADIUS);
    ellipse(x_loc, y_loc, rad, rad);
  }
  boolean fallCheck() {
    if (y_loc + rad > height) {
      lives = lives - 1;
      y_loc = height/2;
      vel = 0;
      forces(flap);
      return true;
    } else {
      return false;
    }
  }
  void flap() {
    if (keyPressed==true) {
      if (key == CODED) {
        if (keyCode == UP) {
          forces(flap);
        } else {
        }
      }
    }
  }
  void grav() {
    forces(grav);
  }
  boolean isAlive() {
    if (lives > 0) {
      return true;
    } else {
      return false;
    }
  }
  boolean obstacleCheck(Obstacle obs) {
    float distance = dist(obs.x, obs.y, x_loc, y_loc);
    if (distance < (rad + obs.obstacleSize/2)) {
      lives = lives - 1;
      y_loc = height/2;
      forces(flap);
      return true;
    } else {
      return false;
    }
  }
  int getLives(){
    return lives;
  }
}