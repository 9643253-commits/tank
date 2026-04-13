// 1 April 2026 | TankGame By Madelyn Ashworth
Tank Maddy;
Obstacle o1;
Obstacle o2;
Obstacle o3;
PImage bg;

void setup() {
  size(500, 500);
  bg = loadImage ("bkg.png");
  Maddy = new Tank();
  o1= new Obstacle(100, 100, 100, 50, 5, 100);
  o2= new Obstacle(300, 100, 100, 50, 5, 100);
  o3= new Obstacle(500, 100, 100, 50, 5, 100);
}

void draw() {
  background (127);
  imageMode(CORNER);
  image(bg, 0, 0);
  o1.display();
  o1.move();
  o2.display();
  o2.move();
  o3.display();
  o3.move();
  Maddy.display();
}

void keyPressed() {
  if (key == 'w') {
    Maddy.move('w');
  } else if (key == 's') {
    Maddy.move('s');
  } else if (key == 'a') {
    Maddy.move('a');
  } else if (key == 'd') {
    Maddy.move('d');
  }
}
