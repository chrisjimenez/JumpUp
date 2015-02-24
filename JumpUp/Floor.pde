class Floor {
  //  initial position
  float initXPos;
  float initYPos;

  //  current position
  float xPos;
  float yPos;

  //  floor height & velocity
  float floorHeight = 32;//the height of the floor
  float floorVel = 0;
  float floorVelIncrement = -0.015;
  float floorVelLimit = 4;

  //  space b/w floors
  float spaceBwFl = 148;

  //  hole width and x position
  float holeWidth = 64;
  float holeXPos;

  //  each floor will be populated with ground tiles
  float groundTileWidth = 16;
  float groundTileHeight = 16;

  Coin[] coins;

  //  ground tiles
  PImage ground;
  PImage rightGround;
  PImage leftGround;
  PImage topGround;
  PImage topRightGround;
  PImage topLeftGround;


  /**
  * CONSTRUCTOR
  */
  Floor(float x, float y) {
    initXPos = xPos = x;
    initYPos = yPos = y;

    // set initial x position of hole
    holeXPos = newHoleXPos();

    setNewCoins();
  }


  /**
  * displays the floor and on the screen
  */
  void display() {
    for (float x = xPos; x < holeXPos; x = x+16) {
      if (x == holeXPos - groundTileWidth) {
        image(topRightGround, x, yPos);
        image(rightGround, x, yPos+groundTileHeight);
      }
      else {
        image(topGround, x, yPos);
        image(ground, x, yPos+groundTileHeight);
      }
    }

    //  in between the section there will be a hole

    for (float x = holeXPos+holeWidth; x < width; x = x+16) {
      if (x == holeXPos +holeWidth) {
        image(topLeftGround, x, yPos);
        image(leftGround, x, yPos+groundTileHeight);
      }      
      else {
        image(topGround, x, yPos);
        image(ground, x, yPos+16);
      }
    }

    //  display coins
    for (int i = 0; i < coins.length; i++) {
      coins[i].display();
    }


    //  wrap around floors with new hole positions
    if (yPos > height) {
      //  change x position of hole
      holeXPos = newHoleXPos();
      yPos = 0;
      setNewCoins();// set new coins
    } 
    else if (yPos < 0) {
      //  change x position of hole
      holeXPos = newHoleXPos();
      yPos = height;
      setNewCoins();//set new coins
    }
  }

  /**
  * Returns a new x position for the hole. 
  * Recursively calls itself unless the new x position suffices
  */
  int newHoleXPos() {
    int n = 16 * (int)random(0, 40);

    if (n < holeWidth) {
      // makes sure that it is within game frame
      n = newHoleXPos();
    }
    else if (n > (width - holeWidth)) {
      // makes sure that it is within game frame
      n = newHoleXPos();
    }
    else if (dist(holeXPos, yPos, n, yPos) < holeWidth) {
      //makes sure that holes are not too close
      n = newHoleXPos();
    }

    return n;
  }


  /**
  * Moves the floor downwards and slightly increases velocity.
  */
  void move() {
    float randomNum = random(0, 1);
    yPos += floorVel;
    increaseVel();

    //move all coins at same rate as floor
    for (int i = 0; i < coins.length; i++) {
      coins[i].yPos += floorVel;
    }
  }

  /**
  * Returns if given x,y position is on top of floor.
  */
  boolean isOnFloor(float x, float y) {
    if (((y < yPos) &&( y > yPos-spaceBwFl))
      &&((x < holeXPos) || (x >holeXPos+holeWidth))) {
      return true;
    }
    else {
      return false;
    }
  }

  /**
  * increases velocity of floor.
  */
  void increaseVel() {
    floorVel += floorVelIncrement;

    if ((floorVel < -floorVelLimit) || (floorVel > floorVelLimit)) {//set limit to floor velocity
      floorVelIncrement = floorVelIncrement * -1; 
      floorVelLimit = 1.25 * floorVelLimit;
    }
  }

  /**
  * Create new sets of coins.
  */
  void setNewCoins() {
    coins = new Coin[(int)random(3, 13)];//random number of coins 
    for (int i = 0; i < coins.length; i++) {
      coins[i] = new Coin(random(width), yPos - 15);//15 is the coin height
    }
  }

  /**
  * initialize floor position
  */
  void init() {
    xPos = initXPos;
    yPos = initYPos;

    // initialize coins
    for (int i = 0; i < coins.length; i++) {
      coins[i].init();
    }
  }
  
}
