class PoweUp
  // meber Variable
  float x, y, h, w, speed;
//PImage obs1;
char type;

// Constructor
PowerUp (float w, float h) {
  this.h = h;
  this.w = w;

  x = random (width);
  y = height


    void display() {
    if (type == 'h') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(2555);
      text("Health", x, y);
    }
  }
  void display() {
    if (type == 'h') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(2555);
      text("Health", x, y);

      void move() {
        y = y + speed;
      }
      boolean reachedEdge() {
        return x >= width+150 || x< -150||
