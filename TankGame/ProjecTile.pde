class ProjecTile {
  // Member Variable
  float x, y, w, h, speed;

  //Constuctor
  ProjecTile (float x, float y, float w, float h) {
    this.y = y;
    this.x = x;
    this.h = h;
    this.w = w;
    speed = 8;
  }

  void display() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
    if (x>width) {
      x = 0;
    }
  }
}
