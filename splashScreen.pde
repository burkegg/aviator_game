void splashScreen(Flyer aFlyerObject) {
  /*
  Draw a button on screen that has some text.
  Look up the text() function if you don't know it.
  If the button is pressed, call the giveLives() method on the flyer.
  Otherwise, do nothing.
  */
  
  rectMode(CORNER);
  int boxX, boxY, wide, tall;
  boxX = 50;
  boxY = 50;
  wide = 300;
  tall = 50;
  fill(0);
  rect(boxX, boxY, wide, tall);
  textSize(tall - 15);
  fill(255);
  text("Click to start!", 75, 85);
  if ((mouseX > boxX) && (mouseX < boxX + wide) && (mouseY > boxY) && (mouseY < boxY + tall)
    && (mousePressed == true)) {
    aFlyerObject.giveLives();
  } else {
    // Do nothing.
  }
}