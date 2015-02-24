class Coin {

  //  initial position
  float initXPos;
  float initYPos;

  //  current position
  float xPos;
  float yPos;

  boolean collided;

  //  coin animation
  Animation currentState;
  Animation coin = new Animation("assets/coin_", 8);

  /**
  * CONSTRUCTOR
  */
  Coin(float x, float y) {
    initXPos = xPos = x;
    initYPos = yPos = y;

    currentState = coin;
  }

  /***
  *  Displays the coin at the given x, y position.
  */
  void display() {

    //only display coin if not collided with player
    if (!collided) {
      coin.display(xPos, yPos);
    }
  }

  /***
  * Initializes coin position.
  */
  void init() {
    xPos = initXPos;
    yPos = initYPos;
  }
}

