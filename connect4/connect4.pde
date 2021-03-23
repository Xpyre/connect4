Player player1;
Player player2;
Grid circles;

int[][] numbers = new int[10][10];
int mx, my;
int colors;
int r, g, b;
PImage background;
boolean p = false;
boolean grid = false;
boolean turn;
int turns;
int filled;
boolean start = false;
int time;
int connects;
boolean game = false;

void setup() {
  size(500, 500);
  background = loadImage("retro.png");
  player1 = new Player(255, 0, 255, 1);
  player2 = new Player(0, 0, 255, 2);
  circles = new Grid();

  for ( int i = 0; i < circles.rows; i++) {
    for (int j = 0; j < circles.colums; j++) {
      numbers[i][j] = 0;
    }
  }
  background(background);
}

void draw() {

  if (start == false) {
    background(background);
    textSize(30);
    fill(255);
    text("click to begin the game", 80, 200);
    text("keys: w = player1, s = player2", 30, 300);
    text("player1 will begin", 100, 400);
  }
  if (start == true) {

    if (grid == false) {
      circles.draw();
      grid = true;
    }
    if (p == true ) { 
      fill(r, g, b);
      ellipse((mx*50)+25, (my * 50)+25, 50, 50);
    }
    player1.won();
    player2.won();
  }
}
void mousePressed() {
  if (start == false) {
    background(background);
    start = true;
  }
  if (game == true) {
    background(background);
    start = false;
    game = false;
    grid = false;
    p = false;
    connects = 0;
    player1.connected = 0;
    player2.connected = 0;
    setup();
  }
}     
void keyPressed() {
  if (key == 's') {
    if (turn ) {
      p = true;
      my = int(mouseY/50);
      mx = int(mouseX/50);
      filled = 0;
      for (int j = 0; j < circles.colums; j++) {

        if (numbers[j][mx] != 0 ) {
          filled += 1;
        }
        if (10 - filled != 0) {
          my = 9 - filled;
        }
      }

      if (numbers[my][mx] != player2.num) {
        numbers[my][mx] = player1.num ;

        g = player1.g;
        b = player1.b;
        r = player1.r;
        turns += 1;
      }
    }
    turn = false;
  }


  if (key == 'w') {
    if (turn == false) {
      p = true;
      my = int(mouseY/50);
      mx = int(mouseX/50);
      filled = 0;
      for (int j = 0; j < circles.colums; j++) {

        if (numbers[j][mx] != 0 ) {
          filled += 1;
        }
        if (10 - filled != 0) {
          my = 9 - filled;
        }
      }  
      if (numbers[my][mx] != player1.num) {
        numbers[my][mx] = player2.num ;



        g = player2.g;
        b = player2.b;
        r = player2.r;
        turns += 1;
      }
    }
    turn = true;
  }
}
