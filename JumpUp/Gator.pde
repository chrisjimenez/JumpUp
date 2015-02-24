class Gator extends Enemy {

  Gator(float x, float y) {
    super(x, y);
    runningLeft = new Animation("assets/gatorLeft_", 5);
    runningRight = new Animation("assets/gatorRight_", 5);
    currentState = runningLeft;
  }
}

