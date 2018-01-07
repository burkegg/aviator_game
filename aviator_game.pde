/* setup 
 if running -> game on
 if not -> splash screen
 
 splash screen
 if not clicked -> stay
 if clicked -> start game, set lives = 3, start array
 */

Flyer f;
Timer obstacleTimer;
Timer cloudTimer;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Cloud> clouds = new ArrayList<Cloud>();
ArrayList<Obstacle> removal = new ArrayList<Obstacle>();

int level;
boolean started;
PVector grav;

void setup() {
  size(600, 600);
  f = new Flyer();
  obstacleTimer = new Timer(900);
  obstacleTimer.getStartTime();
  level = 1;
  cloudTimer = new Timer(2000);
  cloudTimer.getStartTime();
}

void draw() {
  if (!f.isAlive()) {
    splashScreen(f);
    obstacles.clear();
  } else {
    //The game
    background(50, 50, 200);
    f.grav();
    f.flap();
    f.update();
    f.display();
    f.fallCheck();
    if (obstacleTimer.checkTime() == true) {
      obstacles.add(new Obstacle(level));
      obstacleTimer.getStartTime();
    }

    if (cloudTimer.checkTime() == true) {
      clouds.add(new Cloud());
      cloudTimer.getStartTime();
    }

    for (Cloud eachCloud : clouds) {
      eachCloud.display();
      eachCloud.wind();
    }


    for (Obstacle obs : obstacles) {
      obs.display();
      obs.scroll();
      if (f.obstacleCheck(obs) == true) {
        removal.add(obs);
      }
      if (obs.edgeCheck() == true) {
        removal.add(obs);
      }
    }
    obstacles.removeAll(removal);
  }
}