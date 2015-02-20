class Kirby extends Player {

  //constructor
  Kirby(float x, float y, KirbyGame kG) {
    super( x, y, kG);
    setupKirby();
  }

  //======================================================
  //set up kirby for the game
  void setupKirby() {
    idleState = new Animation("kirbyIdle_", 1);
    runningLeft = new Animation("kirbyRunningLeft_", 4);
    runningRight = new Animation("kirbyRunningRight_", 4);
    jumpUp = new Animation("kirbyJump_", 1);
    currentState = idleState;
  }
}

