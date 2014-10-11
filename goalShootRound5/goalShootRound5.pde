///the following values can be changed without causing big problems...///

float boxSize = 50;
float boxX = 150;
float boxY;

float gapWidth;
float gapX = 150;
float gapY;



float goalWidth;
float goalX = 150;
float goalY;

color boxColor = color(255, 0, 0);


void setup() {
  size(300, 600);
  textSize(48);
  textAlign(CENTER);
  
  boxY = 40;
  gapY = 200;
  gapWidth = 200;
  goalY = height - 25;
  goalWidth = 300;
}


void draw() {
  
  background(200); 
  noStroke();

  ///Draw the sides of the gap///
  gapWidth = gapWidth - 4;
  if(gapWidth < 0){
    gapWidth = 0;
  }
  rectMode(CORNER);
  fill(255, 255, 0);
  rect(0, gapY, gapX - 0.5*gapWidth, 100);
  rect(gapX + 0.5*gapWidth, gapY, width - (gapX + 0.5*gapWidth), 100);

  ///Draw the goal region///
  rectMode(CENTER);
  fill(0, 0, 255, 200);
  rect(goalX, goalY, goalWidth, 20);

  ///Draw the falling box///
  boxY = boxY + 3;
  rectMode(CENTER);
  fill(boxColor);
  rect(boxX, boxY, boxSize, boxSize);
  
  detectCollision();
}




void detectCollision() {

  ///if the box is between the top and bottom of the gap, but too far left or right...///
  if (boxY - 0.5*boxSize < gapY + 100 && 
    boxY + 0.5*boxSize > gapY) {
    if (boxX - 0.5*boxSize < gapX - 0.5*gapWidth ||
      boxX + 0.5*boxSize > gapX + 0.5*gapWidth) {
      tryAgain();
    }
  }

  ///if any part of the box is within the vertical limits of the goal, and is also within its width///
  if (boxY - 0.5*boxSize < goalY + 5 && 
    boxY + 0.5*boxSize > goalY - 5) {
    if (boxX - 0.5*boxSize < goalX + 0.5*goalWidth ||
      boxX + 0.5*boxSize > goalX - 0.5*goalWidth) {
      youWin();
    }
  }

  ///if the box reaches the bottom of the screen///
  if (boxY + 0.5*boxSize >= height) {
    tryAgain();
  }
  
  ///if the box is outside the screen///
  if (boxX - 0.5*boxSize < 0 || boxX + 0.5*boxSize > width) {
    tryAgain();
  }
  
  ///if the box is given a size of zero///
  if (boxSize <= 0){
    tryAgain();
  }
}

void youWin() {
  fill(0);
  text("you win! :)", 2 + width/2, 2 + height/2);
  fill(255, 150, 0);
  text("you win! :)", width/2, height/2);
  boxColor = color(255, 0, 255);
  fill(boxColor);
  rect(boxX, boxY, boxSize, boxSize);
  noLoop();
}

void tryAgain() {
  fill(0);
  text("try again! :P", 2 + width/2, 2 + height/2);
  fill(255, 150, 0);
  text("try again! :P", width/2, height/2);
  boxColor = color(40, 150);
  fill(boxColor);
  rect(boxX, boxY, boxSize, boxSize);
  noLoop();
}
