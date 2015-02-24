class MarioGame extends Game {

  MarioGame() {
    setupGame();
  }

  void setupGame() {
    background = loadImage("assets/mariobg.png");
    background.resize(width, height);

    marioGameMusic.rewind();

    //  set up floors for the game
    for (int i = 0; i < floors.length; i++) {
      floors[i] = new MarioFloor(0, i*(height/4));
    }

    //  by default the player will start on 3rd floor
    player = new Mario(width/2, floors[2].yPos+10, this);

    setupEnemies();
  }

  /**
  * Set up enemies for Mario.
  */
  void setupEnemies() {
    //set up enemy at each floor
    for (int i = 0; i < enemies.length; i++) {
      enemies[i] = new Turtle(random(0, width), floors[i].yPos);
    }
  }
}

