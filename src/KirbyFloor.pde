class KirbyFloor extends Floor {


  KirbyFloor(float x, float y) {
    super(x, y);

    //  load ground tiles
    ground = loadImage("assets/kirbyGround.png");
    rightGround = loadImage("assets/rightKirbyGround.png");
    leftGround = loadImage("assets/leftKirbyGround.png");
    topGround = loadImage("assets/topKirbyGround.png");
    topRightGround = loadImage("assets/topRightKirbyGround.png");
    topLeftGround = loadImage("assets/topLeftKirbyGround.png");
  }
}

