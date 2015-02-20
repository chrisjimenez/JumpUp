class Turtle extends Enemy {

  //constructor
  Turtle(float x, float y) {
    super(x, y);
    runningLeft = new Animation("turtleRunningLeft_", 6);
    runningRight = new Animation("turtleRunningRight_", 6);
    currentState = runningLeft;
  }
}

