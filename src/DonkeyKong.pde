class DonkeyKong extends Player {

  DonkeyKong(float x, float y, DonkeyKongGame dkG) {
    super( x, y, dkG);
    setupDk();
  }


  void setupDk() {
    idleState = new Animation("assets/dkIdle_", 1);
    runningLeft = new Animation("assets/dkRunningLeft_", 4);
    runningRight = new Animation("assets/dkRunningRight_", 4);
    jumpUp = new Animation("assets/dkJumpUp_", 1);
    currentState = idleState;
  }
}

