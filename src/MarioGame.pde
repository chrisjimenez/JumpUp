class MarioGame extends Game {

  //constructor for MarioGame class
  MarioGame() {
    setupGame();
  }

  void setupGame() {
    background = loadImage("mariobg.jpg");
    background.resize(width, height);
    background.filter(BLUR, 4.5);

    marioGameMusic.rewind();

    //set up floors for the game
    for (int i = 0; i < floors.length; i++) {
      floors[i] = new MarioFloor(0, i*(height/4));
    }

    //by default the player will start on 3rd floor
    player = new Mario(width/2, floors[2].yPos+10, this);

    setupEnemies();
  }

  //===============================================
  //set up enemies for mario
  void setupEnemies() {
    //set up enemy at each floor
    for (int i = 0; i < enemies.length; i++) {
      enemies[i] = new Turtle(random(0, width), floors[i].yPos);
    }
  }
}

