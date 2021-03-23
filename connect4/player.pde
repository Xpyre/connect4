public class Player {
  int x, y;
  int r, g, b;
  int num;
  int row;
  int checkRow;
  int io, jo;
  int connected;


  public Player(int r, int g, int b, int num) {
    this.r = r;
    this.g =g;
    this.b = b;
    this.num = num;
  }
  public void won() {
    if (turns >= 7) {
      //4 going sideways

      for (int j = 0; j < circles.colums; j++) {
        if (numbers[my][j] == num) {
          row += 1;
        } else {
          row = 0;
        }
        if (row == 4) {
          connected = 1;
        }
      }

      row = 0;
      //4 going up
      for (int j = 0; j < circles.colums; j++) {

        if (numbers[j][mx] == num ) {
          row += 1;
        } else if (numbers[j][mx] != num ) {
          row = 0;
        }
        if (row == 4) {
          connected = 1;
        }
      }


      row = 0;
      for (int i=mx, j=my; i<circles.rows && j<circles.colums; i++, j++) 
      { 
        if (numbers[j][i]!=num)
        {
          row=0;
        }
        row++;
        if (row == 4) {
          connected = 1;
        }
      }
      row = 0;
      for (int i=mx, j=my; i>=0 && j>=0; i--, j--) 
      { 
        if (numbers[j][i]!=num)
        {
          row=0;
        }
        row++;

        if (row == 4) {
          connected = 1;
        }
      }
      row = 0;
      for (int i=mx, j=my; i<circles.rows && j<=0; i++, j--) 
      { 
        if (numbers[j][i]!=num)
        {
          row=0;
        }
        row++;

        if (row == 4) {
          connected = 1;
        }
      }

      row = 0;
      for (int i=mx, j=my; i>=0 && j<circles.colums; i--, j++) 
      { 
        if (numbers[j][i]!=num)
        {
          row=0;
        }
        row++;

        if (row == 4) {
          connected = 1;
        }
      }

      row = 0;
    }
    if (connected == 1) {
      connects = 1;
      numbers[mx][my] = 0;
      time = millis();
      background(background);
      textSize(32);

      text("player" + num + " has won the game! ", 50, 200);
      game = true;
      fill(255);
      text("click to restart ", 130, 300);
    }
  }
}
