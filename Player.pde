class Player {
  //initial position
  float initXPos;
  float initYPos;

  //current position
  float xPos;
  float yPos;

  //player speed, accel & physics
  float xSpeed;
  float ySpeed;
  float jump = 12;
  float xAccel = 0.9;
  float gravity = 20;

  Game game;

  //animation for the player
  Animation currentState;
  Animation idleState;
  Animation runningRight;
  Animation runningLeft;
  Animation jumpUp;


  //height of player, varaible needed later for constrain
  float playerHeight = 25;


  //constructor
  Player(float x, float y, Game g) {
    initXPos = xPos = x;
    initYPos = yPos = y + playerHeight;
    game = g;
  }


  //=================================================================
  //displays the player
  void display() {
    //update x and y position
    updatePlayerPosition();
    currentState.display(xPos, yPos);
    currentState = idleState;
  }


  //======================================================
  //The following methods are for character movement
  void moveRight() {
    if (xSpeed < 20) {//to set the speed limit
      xSpeed += xAccel;
      currentState = runningRight;
    }
  }

  void moveLeft() {
    if (xSpeed > -20) {//to set the speed limit
      xSpeed -= xAccel;
      currentState = runningLeft;
    }
  }

  void jumpUp() {
    ySpeed -= jump;
    currentState = idleState;

    if (xSpeed < -1) {// if player is runnign left, jump left
      xSpeed -= 2* xAccel;
      currentState = runningLeft;
    }
    else if (xSpeed > 1) {//if player is running right, jump right
      xSpeed += 2* xAccel;
      currentState = runningRight;
    }
    else {
      currentState = idleState;
    }
  }

  void pressDown() {
    yPos++;
    currentState = idleState;
  }

  //=================================================================
  //updates player position 
  void updatePlayerPosition() {
    xPos += xSpeed;
    yPos += ySpeed;

    //dampen the speed
    xSpeed *= 0.90;
    ySpeed *= 0.75;

    //implement gravity effect
    yPos += gravity;

    checkIfTouchingBottomOrTop();
    checkEnemyCollision();
    checkCoinCollision();

    constrainPlayer();
  }


  //=================================================================
  //creates a platform on each floor 
  void constrainPlayer() {
    //constrain player within game screen
    yPos = constrain(yPos, 0, height - 48 - playerHeight);
    xPos = constrain(xPos, 0, width);

    float top;
    float bottom;

    //for each floor, if on floor, constrain player to bottom and top
    for (int i = 0; i < floors.length; i++) {
      bottom = floors[i].yPos-playerHeight;
      bottom += floors[i].floorVel;
      top = floors[i].yPos - floors[i].spaceBwFl;
      top += floors[i].floorVel;

      if (floors[i].isOnFloor(xPos, yPos)) {
        yPos = constrain(yPos, top, bottom);
      }
    }
  }

  //================================================================
  //initialize player position
  void init() {
    xPos = initXPos;
  }
  //=======================================================
  //checks if player collided with enemy
  void checkEnemyCollision() {
    for (int i = 0; i < enemies.length; i++) {
      if (dist(xPos, yPos, enemies[i].xPos, enemies[i].yPos) < 30)
        gameState = 4;
    }
  }

  //=======================================================
  //checks if player collided with coins
  void checkCoinCollision() {
    for (int i = 0; i < floors.length; i++) {
      for (int j = 0; j < floors[i].coins.length; j++) { 
        if (dist(xPos, yPos, floors[i].coins[j].xPos, floors[i].coins[j].yPos) < 16)
          if (!floors[i].coins[j].collided) {
            coin.rewind();
            coin.play();
            floors[i].coins[j].collided = true;
            score++;
          }
      }
    }
  }

  //=======================================================
  //checks if player is touching bottom or top of screen
  void checkIfTouchingBottomOrTop() {
    if (yPos <= 0) {//touching top
      gameState = 4;
    }

    //48 is the height of the rectangle below game screen
    if (yPos >= height - 48 - playerHeight) {//touching bottom
      gameState = 4;
    }
  }
}

