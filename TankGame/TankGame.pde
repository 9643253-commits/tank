// 15 April 2026 | TankGame | Madelyn Ashworth
Tank Maddy;
ArrayList <ProjecTile> projectiles = new ArrayList <ProjecTile>();
ArrayList <Obstacle> obstacles = new ArrayList <Obstacle>();
PImage bg;
int score;

void setup() {
  size(500, 500);
  bg = loadImage ("bkg.png");
  Maddy = new Tank();
  obstacles.add(new Obstacle (200, 300, 100, 50, int (random(1, 10)), 10));
}

void draw() {
  background (127);
  imageMode(CORNER);
  image(bg, 0, 0);
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
  }
  for (int i = 0; i < projectiles.size(); i++) {
    ProjecTile p = projectiles.get(i);
    p.display();
    p.move();
  }
  Maddy.display();
  scorePanel();
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
void mousePressed() {
  projectiles.add(new ProjecTile(Maddy.x, Maddy.y, 4, 10));
}

void scorePanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  fill(255);
  textSize(80);
  textAlign(CENTER);

  text("score:"+ score, width/2, 50);
}
