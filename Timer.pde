class Timer {
  // We want a timer where you can input the amount of time as an argument upon creation
  // and it will return true once time is up.
  // it will have methods getStartTime() and checkTime().
  // To use it, you will have to create a timer, start a timer, and then check the time.

  int startTime;
  int runTime;
  Timer(int tempTime) {
    runTime = tempTime;
  }

  void getStartTime() {
    // This gets the current 
    startTime = millis();
  }

  boolean checkTime() {
    if (millis() > (startTime + runTime)) { 
      return true;
    } else {
      return false;
    }
  }
}