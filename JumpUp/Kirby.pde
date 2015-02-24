class Kirby extends Player {

  Kirby(float x, float y, KirbyGame kG) {
    super( x, y, kG);
    setupKirby();
  }

  /**
  * set up kirby for the game
  */
  void setupKirby() {
    idleState = new Animation("assets/kirbyIdle_", 1);
    runningLeft = new Animation("assets/kirbyRunningLeft_", 4);
    runningRight = new Animation("assets/kirbyRunningRight_", 4);
    jumpUp = new Animation("assets/kirbyJump_", 1);
    currentState = idleState;
  }
}

