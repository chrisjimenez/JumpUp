class DonkeyKongGame extends Game {

  /**
  *  CONSTRUCTOR
  */
  DonkeyKongGame() {
    setupGame();
  }

  /**
  *  Set up game with DK
  */
  void setupGame() {
    background = loadImage("assets/dkbg.png");
    background.resize(width, height);
    background.filter(BLUR, 4.5);

    //  set up floors for the game
    for (int i = 0; i < floors.length; i++) {
      floors[i] = new DkFloor(0, i*(height/4));
    }

    //  by default the player will start on 3rd floor
    player = new DonkeyKong(width/2, floors[2].yPos, this);

    setupEnemies();
  }

 
  /**
  *  sets up enemies, in this case bugs
  */
  void setupEnemies() {
  
    // set up enemy at each floor
    for (int i = 0; i < enemies.length; i++) {
      enemies[i] = new Bug(random(0, width), floors[i].yPos);
    }
  }
}

