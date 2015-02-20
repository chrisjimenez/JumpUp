class Gator extends Enemy {

  //constructor
  Gator(float x, float y) {
    super(x, y);
    runningLeft = new Animation("gatorLeft_", 5);
    runningRight = new Animation("gatorRight_", 5);
    currentState = runningLeft;
  }
}

