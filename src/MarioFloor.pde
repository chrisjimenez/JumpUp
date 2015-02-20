class MarioFloor extends Floor {

  //coonstructor
  MarioFloor(float x, float y) {
    super(x, y);
    //load ground tiles
    ground = loadImage("marioGround.png");
    rightGround = loadImage("marioRightGround.png");
    leftGround = loadImage("marioLeftGround.png");
    topGround = loadImage("topMarioGround.png");
    topRightGround = loadImage("topRightMarioGround.png");
    topLeftGround = loadImage("topMarioLeftGround.png");
  }
}

