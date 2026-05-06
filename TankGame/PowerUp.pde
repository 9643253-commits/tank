class PowerUp {
  // member Variable
  float x, y, h, w, speed;
  //PImage obs1;
  char type;

  // Constructor
  PowerUp () {
    h = 100;
    w = 100;
    speed = 5;

    if (int(random(4))==2) {
      type = 'h';
      x = random (width);
      y = -100;
    } else if (int(random(3))==1) {
      type = 't';
      x = random(width);
      y=-100;
    } else {
      type = 'a';
      x = random(width);
      y = -100;
    }
  }
  void display() {
    if (type == 'h') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(2555);
      textAlign(CENTER, CENTER);
      text("Health", x, y);
    } else if (type == 'a') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(2555);
      textAlign(CENTER, CENTER);
      text("Ammo", x, y);
    } else if (type == 't') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(2555);
      textAlign(CENTER, CENTER);
      text("Turret", x, y);
    }
  }
  
  void move() {
    y = y + speed;
  }
  
  boolean reachedEdge() {
    return x >= width+150 || x <= -150 || y > height + 150 || y < -150;
  }

  boolean intersect(Tank t) {
    float distance = dist(x, y, t.x, t.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
}
