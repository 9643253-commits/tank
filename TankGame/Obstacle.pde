class Obstacle {
  // Member Variable
  float x, y, w, h, speed, health;
  PImage obs1;
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
    obs1 = loadImage("alien.png");
    if (int(random (4))==2) {
      idir = 'w';
      x = random (width);
      y = height + 100;
  } else if (int(random(3))==1) {
    idir= 'd';
    x = -100;
    y = random(height)
  } else if (int(random(2))==1) {
      idir = 'a';
      x = width+100;
      y = random (height);
    }

  void display() {
    fill(128);
    imageMode(CENTER);
    image(obs1,x, y);
  }

  void move() {
switch (idir) {
    }
    }
  }
