class Game {
  PImage background;
  Player player;


  /**
  * plays the game
  */
  void play() {
    //set up background
    image(background, 0, 0);

    //move the floor down
    for (int i =0; i < floors.length; i++) {
      floors[i].display();
      floors[i].move();
    }

    //display enemies
    for (int i = 0; i < enemies.length; i++) {
      enemies[i].display();
    }

    //displays the player on the screen
    player.display();
    gameControls();

    displayTimeAndScore();
  }


  /**
  * game controls for the game
  */
  void gameControls() {

    if (keyPressed && key == CODED) {
      if (keyCode == LEFT) {
        player.moveLeft();
      } 

      if (keyCode == RIGHT) {
        player.moveRight();
      } 

      if (keyCode == UP) {
        jumpSound.play();
        player.jumpup();
      }

      if (keyCode == DOWN) {
        player.pressDown();
      }
    }


    if (keyPressed && key =='r') {//resets the game
      init();
    }

    if (keyPressed && key =='q') {//quits the game
      gameState = 0;
      init();
    }
  }

  /**
  * displays the time and score on the screen
  */
  void displayTimeAndScore() {
    fill(0);
    rect(0, height-48, width, 48);
    //time & score
    fill(255);
    currentTime = (int)(millis()/1000);
    displayTime = currentTime - startTime;
    textSize(15);
    text("TIME: " + displayTime, 0, height - 25);
    text("SCORE: " + score, 0, height - 10);

    displayCommands();
  }

  /**
  * initializes the game
  */
  void init() {
    //rewind all music
    marioGameMusic.pause();
    marioGameMusic.rewind();

    dkGameMusic.pause();
    dkGameMusic.rewind();

    kirbyGameMusic.pause();
    kirbyGameMusic.rewind();

    //enemies same # of floors
    for (int i = 0; i < floors.length; i++) {
      floors[i].init();
      enemies[i].init();
    }

    //init player position
    player.init();

    //score is set to 0
    score =0;

    //reset start time
    startTime = (millis()/1000);
  }

  /**
  * Displays the commands to reset or quit.
  */
  void displayCommands() {
    text("TO GO BACK TO MENU, PRESS 'Q'", width/2 - 10, height - 25);
    text("TO RESET GAME, PRESS 'R'", width/2 - 10, height - 10);
  }
}

