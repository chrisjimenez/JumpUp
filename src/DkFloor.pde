class DkFloor extends Floor {

  //constructor
  DkFloor(float x, float y) {
    super(x, y);

    //load ground tiles
    ground = loadImage("dkGround.png");
    rightGround = loadImage("rightDkGround.png");
    leftGround = loadImage("leftDkGround.png");
    topGround = loadImage("topDkGround.png");
    topRightGround = loadImage("topRightDkGround.png");
    topLeftGround = loadImage("topLeftDkGround.png");
  }
}

