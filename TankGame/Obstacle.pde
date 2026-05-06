class Obstacle {
  // Member Variable
  float x, y, w, h, speed, health;
  PImage obs1;
  char idir;

  //Constuctor
  Obstacle(float w, float h, float speed, float health) {
    this.h = h;
    this.w = w;
    this.speed = speed;
    this.health = health;
    idir = 'w';
    obs1 = loadImage("alien.png");
    if (int(random (4))==2) {
      idir = 'w';
      x = random (width);
      y = height + 100;
    } else if (int(random(3))==1) {
      idir= 'd';
      x = - 100;
      y = random(height);
    } else {
      idir = 'a';
      x = width + 100;
      y = random (height);
    }
  }

  void display() {
    fill(128);
    imageMode(CENTER);
    image(obs1, x, y);
  }
  boolean reachedEdge() {
    return x >= width+150 || x <= -150 || y > height + 150 || y < -150;
  }
  void move() {
    switch (idir) {
    }
  }
}
