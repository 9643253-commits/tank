class Obstacle {
  // Member Variable
  float x, y, w, h, speed, health;
  PImage iTankW;
  char idir;

  //Constuctor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.y = y;
    this.x = x;
    this.h = h;
    this.w = w;
    this.speed = speed;
    this.health = health;
    idir = 'w';
  }

  void display() {
    fill(128);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y=y+speed;
  }
}
