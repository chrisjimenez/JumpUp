/**
*  JumpUp 
*  BY Chris Jimenez
*  ****music credit does not go to nintendo
*/


import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

// load up sound files
Minim minim;
AudioPlayer startUpSong;
AudioPlayer marioGameMusic;
AudioPlayer dkGameMusic;
AudioPlayer kirbyGameMusic;
AudioPlayer coin;
AudioPlayer jumpSound;
AudioPlayer loseSound;

AudioPlayer marioSound;
AudioPlayer dkSound;
AudioPlayer kirbySOund;

//font
PFont font;

//title & bg
PImage title;
int increment;

//start screen characters!
PImage startMario;
PImage startDk;
PImage startKirby;


//For the easy,medium,hard buttons
PImage marioButtonImage;
PImage marioButtonPressedImage;
PImage dkButtonImage;
PImage dkButtonPressedImage;
PImage kirbyButtonImage;
PImage kirbyButtonPressedImage;
ImageButton marioButton;
ImageButton dkButton;
ImageButton kirbyButton;

int gameState = 0;//startup screen will display by default
//if gameState = 1, then the game is being played with mario
//if gameState = 2, then the game is being played with donkey
//if gameState = 3, then the game is being played with kirby
//if gamestate = 4, the the game is at the end, w/ option to play again

//array of floors that will be seen by all classes
Floor[] floors = new Floor[4];

//array of enemies
Enemy[] enemies = new Enemy[4];


//keep track of score, more you play the more points you get
int score = 0;


//to display the time
float startTime;
float currentTime;
float displayTime;

//set up the games
MarioGame marioGame;
DonkeyKongGame dkGame;
KirbyGame kirbyGame;


void setup() {
  size(720, 720);
  frameRate(30);

  //setup start screen background
  //startScreenBg = loadImage("startScreenbg.png");
  minim = new Minim(this);

  //load title
  title = loadImage("title.png");

  // set up Minim & sound
  minim = new Minim(this);
  marioGameMusic = minim.loadFile("marioTheme.mp3");
  dkGameMusic = minim.loadFile("dkTheme.mp3");
  kirbyGameMusic = minim.loadFile("kirbyTheme.mp3");
  coin = minim.loadFile("coin.mp3");
  jumpSound = minim.loadFile("jump.mp3");
  loseSound = minim.loadFile("lose.mp3");

  //set up buttons
  marioButtonImage = loadImage("marioButton.png");
  marioButtonPressedImage= loadImage("marioButtonPressed.png");
  dkButtonImage = loadImage("dkButton.png");
  dkButtonPressedImage = loadImage("dkButtonPressed.png");
  kirbyButtonImage = loadImage("kirbyButton.png");
  kirbyButtonPressedImage = loadImage("kirbyButtonPressed.png");


  marioButton = new ImageButton(marioButtonImage, marioButtonPressedImage);
  dkButton = new ImageButton(dkButtonImage, dkButtonPressedImage);
  kirbyButton = new ImageButton(kirbyButtonImage, kirbyButtonPressedImage);
}


void draw() {
  smooth();

  if (gameState == 0) {
    startGame();
  }
  else if (gameState == 1) {
    marioGameMusic.play();
    marioGame.play();
  }
  else if ( gameState == 2) {
    dkGameMusic.play();
    dkGame.play();
  }
  else if ( gameState == 3) {
    kirbyGameMusic.play();
    kirbyGame.play();
  }
  else if ( gameState == 4) {
    endGame();
  }
}

//=================================================================
//starts the game
void startGame() {
  background(random(200, 255), random(100, 150), random(240, 255));

  //SET UP COOL BACKGROUND
  for (int i = 0; i < width; i = i+20) {
    for (int j = 0; j < height; j = j +20) {
      noStroke();
      fill(random(10), random(100, 180), random(150, 250));
      rect(i, j, 15, 15);
    }
    increment += 2;
  }

  image(title, 40, 50);

  //set up font
  font = loadFont("8BITWONDERNominal-48.vlw");
  textFont(font, 32);

  //display Button
  textSize(10);
  fill(255);
  marioButton.resizeButton(300, 165);
  marioButton.display(width/2 -150, 200);
  dkButton.resizeButton(300, 165);
  dkButton.display(width/2 -150, 375);
  kirbyButton.resizeButton(300, 165);
  kirbyButton.display(width/2 -150, 550);

  //rewind lose sound
  loseSound.pause();
  loseSound.rewind();

  //commands if either button is pressed
  if (marioButton.isPressed() && mousePressed) {
    marioGame = new MarioGame();
    marioGame.init();
    gameState = 1;
  }
  else if (dkButton.isPressed() && mousePressed) {
    dkGame = new DonkeyKongGame();
    dkGame.init();
    gameState = 2;
  }
  else if (kirbyButton.isPressed() && mousePressed) {
    kirbyGame = new KirbyGame();
    kirbyGame.init();
    gameState = 3;
  }
}


//===============================
void endGame() {
  fill(255, 255, 255, 10);
  rect(0, 0, width, height);

  marioGameMusic.pause();
  marioGameMusic.rewind();

  dkGameMusic.pause();
  dkGameMusic.rewind();

  kirbyGameMusic.pause();
  kirbyGameMusic.rewind();

  loseSound.play();

  fill(0, 0, 0, 10);
  textSize(72);
  text("GAME OVER!", width/2 - 320, height/2 - 220);
  textSize(45);
  text("SCORE: " + score, width/2 - 240, height/2+30);
  textSize(20);
  text("DO YOU WANT TO PLAY AGAIN(Y/N)", width/2 - 260, height/2 + 200);

  if (keyPressed) {
    if (key == 'y') {
      gameState = 0;
    }
    else if ( key == 'n') {
      exit();
    }
  }
}

