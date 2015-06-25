/*************************************
*  JumpUp 
*  By: Chris Jimenez
*  Music cred goes to Nintendo 
*************************************/
import ddf.minim.*;


//  load up sound files
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

//title & bg
PImage title;
int increment;

//start screen characters!
PImage startMario;
PImage startDk;
PImage startKirby;

//font
PFont font;

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
  minim = new Minim(this);

  //load title
  title = loadImage("assets/title.png");

  // set up Minim & sound
  minim = new Minim(this);
  marioGameMusic = minim.loadFile("assets/marioTheme.mp3");
  dkGameMusic = minim.loadFile("assets/dkTheme.mp3");
  kirbyGameMusic = minim.loadFile("assets/kirbyTheme.mp3");
  coin = minim.loadFile("assets/coin.mp3");
  jumpSound = minim.loadFile("assets/jump.mp3");
  loseSound = minim.loadFile("assets/lose.mp3");

  //set up buttons
  marioButtonImage = loadImage("assets/marioButton.png");
  marioButtonPressedImage= loadImage("assets/marioButtonPressed.png");
  dkButtonImage = loadImage("assets/dkButton.png");
  dkButtonPressedImage = loadImage("assets/dkButtonPressed.png");
  kirbyButtonImage = loadImage("assets/kirbyButton.png");
  kirbyButtonPressedImage = loadImage("assets/kirbyButtonPressed.png");


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
  else if (gameState == 2) {
    dkGameMusic.play();
    dkGame.play();
  }
  else if (gameState == 3) {
    kirbyGameMusic.play();
    kirbyGame.play();
  }
  else if (gameState == 4) {
    endGame();
  }
}

/***
*  Starts the game.
*/
void startGame() {
  background(#0099FF);

  //SET UP COOL BACKGROUND
  for (int i = 0; i < width; i = i + 20) {
    for (int j = 0; j < height; j = j + 20) {
      noStroke();
      fill(random(10), random(100, 180), random(150, 250));
      rect(i, j, 15, 15);
    }
    increment += 2;
  }
  
    //set up font
  font = createFont("Orbitron");
  textFont(font, 36);

  image(title, 20, 25);

  //display Button
  textSize(10);
  fill(255);
  marioButton.resizeButton(300, 165);
  marioButton.display(width/2 -150, 180);
  dkButton.resizeButton(300, 165);
  dkButton.display(width/2 -150, 355);
  kirbyButton.resizeButton(300, 165);
  kirbyButton.display(width/2 -150, 530);

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


/**
* Gets called to end the game and exit the sketch.
*/
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
  textSize(80);
  text("GAME OVER!", width/2 - 285, height/2 - 220);
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

