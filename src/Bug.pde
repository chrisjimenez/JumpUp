class Bug extends Enemy {

  //constructor
  Bug(float x, float y) {
    super(x, y);
    runningLeft = new Animation("bugLeft_", 8);
    runningRight = new Animation("bugRight_", 8);
    currentState = runningLeft;
  }
}

