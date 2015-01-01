class KirbyGame extends Game {

  //constructor for KirbyGame class
  KirbyGame() {
    setupGame();
  }

  void setupGame() {
    background = loadImage("kirbybg.png");
    background.resize(width, height);
    background.filter(BLUR, 4.5);

    //set up floors for the game
    for (int i = 0; i < floors.length; i++) {
      floors[i] = new KirbyFloor(0, i*(height/4));
    }

    //by default the player will start on 3rd floor
    player = new Kirby(width/2, floors[2].yPos, this);

    setupEnemies();
  }

  void setupEnemies() {
    //set up enemy at each floor
    for (int i = 0; i < enemies.length; i++) {
      enemies[i] = new Gator(random(0, width), floors[i].yPos);
    }
  }
}

