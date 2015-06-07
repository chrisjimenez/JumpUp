class Mario extends Player {
  //constructor
  Mario(float x, float y, MarioGame mG) {
    super( x, y, mG);
    setupMario();
  }

  /**
  * set up mario for the game
  */
  void setupMario() {
    idleState = new Animation("assets/marioIdle_", 1);
    runningLeft = new Animation("assets/marioRunningLeft_", 4);
    runningRight = new Animation("assets/marioRunningRight_", 4);
    jumpUp = new Animation("assets/marioJumpUp_", 1);
    currentState = idleState;
  }
}

