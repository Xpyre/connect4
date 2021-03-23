public class Grid {
  boolean grid;
  int colums;
  int rows;

  public Grid() {
    grid = false;
    colums = 10;
    rows = 10;
  }
  public void draw() {
    if (grid == false) {
      for ( int i = 0; i < rows; i++) {
        for (int j = 0; j < colums; j++) {
          fill(255);   
          ellipse((j*width/colums)+25, (i * height/rows)+25, 50, 50);
          fill(0);
          grid = true;
        }
      }
    }
  }
}
