class Bug extends Enemy {

  Bug(float x, float y) {
    super(x, y);
    runningLeft = new Animation("assets/bugLeft_", 8);
    runningRight = new Animation("assets/bugRight_", 8);
    currentState = runningLeft;
  }
}

