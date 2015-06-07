class Turtle extends Enemy {

  Turtle(float x, float y) {
    super(x, y);
    runningLeft = new Animation("assets/turtleRunningLeft_", 6);
    runningRight = new Animation("assets/turtleRunningRight_", 6);
    currentState = runningLeft;
  }
}

