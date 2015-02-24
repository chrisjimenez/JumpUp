class MarioFloor extends Floor {

  /**
  * CONSTURCTOR
  */
  MarioFloor(float x, float y) {
    super(x, y);
    //load ground tiles
    ground = loadImage("assets/marioGround.png");
    rightGround = loadImage("assets/marioRightGround.png");
    leftGround = loadImage("assets/marioLeftGround.png");
    topGround = loadImage("assets/topMarioGround.png");
    topRightGround = loadImage("assets/topRightMarioGround.png");
    topLeftGround = loadImage("assets/topMarioLeftGround.png");
  }
}

