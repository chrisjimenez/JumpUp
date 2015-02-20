class Coin {
  //initial position
  float initXPos;
  float initYPos;

  //current position
  float xPos;
  float yPos;

  //if collided
  boolean collided;

  //coin animation
  Animation currentState;
  Animation coin = new Animation("coin_", 8);

  //constructor
  Coin(float x, float y) {
    initXPos = xPos = x;
    initYPos = yPos = y;

    currentState = coin;
  }

  //====================================================
  // displays the coin at the given x, y position
  void display() {

    //only display coin if not collided with player
    if (!collided) {
      coin.display(xPos, yPos);
    }
  }

  //initializes coin position
  void init() {
    xPos = initXPos;
    yPos = initYPos;
  }
}

