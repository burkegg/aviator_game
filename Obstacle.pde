/*  Obstacles should display and scroll.  
 Obstacles should have an x and y to send coordinates.
 */

class Obstacle {
  color obsColor;
  float x, y;
  float obstacleSize;
  float vel;
  int level;

  Obstacle(int tempLevel) {
    rectMode(CENTER);
    obstacleSize = random(35, 100);
    y = random(obstacleSize/2, height-obstacleSize/2);
    x = width + obstacleSize;
    vel = 2;
    level = tempLevel;
    obsColor = color(0, 255, 0);
  }

  void display() {
    fill(obsColor);
    rect(x, y, obstacleSize, obstacleSize, 15);
  }
  void scroll() {
    x -= vel*level * 0.5;
  }
  boolean edgeCheck() {
    if ((x + obstacleSize) < 0) {
      return true;
    } else {
      return false;
    }
  }
}