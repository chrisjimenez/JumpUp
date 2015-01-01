class DonkeyKong extends Player {

  //constructor
  DonkeyKong(float x, float y, DonkeyKongGame dkG) {
    super( x, y, dkG);
    setupDk();
  }

  //=======================================================
  //setup dk
  void setupDk() {
    idleState = new Animation("dkIdle_", 1);
    runningLeft = new Animation("dkRunningLeft_", 4);
    runningRight = new Animation("dkRunningRight_", 4);
    jumpUp = new Animation("dkJumpUp_", 1);
    currentState = idleState;
  }
}

