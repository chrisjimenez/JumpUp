class DkFloor extends Floor {

  DkFloor(float x, float y) {
    super(x, y);

    //  load ground tiles
    ground = loadImage("assets/dkGround.png");
    rightGround = loadImage("assets/rightDkGround.png");
    leftGround = loadImage("assets/leftDkGround.png");
    topGround = loadImage("assets/topDkGround.png");
    topRightGround = loadImage("assets/topRightDkGround.png");
    topLeftGround = loadImage("assets/topLeftDkGround.png");
  }
}

