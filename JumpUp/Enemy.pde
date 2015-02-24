class Enemy {
  //  initial position
  float initXPos;
  float initYPos;

  //  current position
  float xPos;
  float yPos;

  Animation currentState;
  Animation runningRight;
  Animation runningLeft;

  float xDest;
  float yDest;

  //enemy physics
  float xSpeed;
  float ySpeed;
  float gravity = 20;

  float enemyHeight = 25;


  /**
  *  CONSTRUCTOR
  */
  Enemy(float x, float y) {
    initXPos = xPos = x;
    initYPos = yPos = y;
  }

  /**
  * Displays enemy on the screen.
  */
  void display() {
    updateEnemyPosition();
    currentState.display(xPos, yPos);
    constrainEnemy();

    move();
  }

  /**
  * Updates enemy position 
  */
  void updateEnemyPosition() {
    xPos += xSpeed;
    yPos += ySpeed;

    //dampen the speed
    xSpeed *= 0.90;
    ySpeed *= 0.75;

    yPos += gravity;

    constrainEnemy();

    permitWrapAround();
  }

  /**
  * Creates a platform at each floor. 
  */
  void constrainEnemy() {
    float top;
    float bottom;

    for (int i = 0; i < floors.length; i++) {
      bottom = floors[i].yPos-enemyHeight;
      top = floors[i].yPos - floors[i].spaceBwFl;

      if (floors[i].isOnFloor(xPos, yPos)) {
        yPos = constrain(yPos, top, bottom);
      }
    }
  }



  /**
  * Randomly moves character around canvas
  */
  void move() {
    // have we arrived at this position?
    if (dist(xPos, yPos, xDest, yDest) < 25) {
      // pick a new destination
      xDest = random(20, width-25);
    }

    if (xDest < xPos) {
      xSpeed = -1;
      currentState = runningLeft;
    }
    else {
      xSpeed = 1;
      currentState = runningRight;
    }
  }


  /**
  *  allow enemies to wrap around screen.
  */
  void permitWrapAround() {
    if (xPos >= width) {
      xPos = 0;
    }
    else if (xPos <= 0) {
      xPos = width;
    }
    else if (yPos <= 0) {
      yPos = height;
    }
    else if (yPos >= height) {
      yPos = 0;
    }
  }

  /**
  * initialize enemy position
  */
  void init() {
    xPos = initXPos;
    yPos = initYPos;
  }

}