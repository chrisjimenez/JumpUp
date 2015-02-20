class KirbyFloor extends Floor {


  KirbyFloor(float x, float y) {
    super(x, y);

    //load ground tiles
    ground = loadImage("kirbyGround.png");
    rightGround = loadImage("rightKirbyGround.png");
    leftGround = loadImage("leftKirbyGround.png");
    topGround = loadImage("topKirbyGround.png");
    topRightGround = loadImage("topRightKirbyGround.png");
    topLeftGround = loadImage("topLeftKirbyGround.png");
  }
}

