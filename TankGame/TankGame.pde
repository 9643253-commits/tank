// 15 April 2026 | TankGame | Madelyn Ashworth
Tank Maddy;
ArrayList <ProjecTile> projectiles = new ArrayList <ProjecTile>();
ArrayList <Obstacle> obstacles = new ArrayList <Obstacle>();
PImage bg;
int score;
Timer objTimer;

void setup() {
  size(500, 500);
  bg = loadImage ("bkg.png");
  Maddy = new Tank();
  objTimer= new Timer(1000);
  objTimer.start();
  //obstacles.add(new Obstacle (200, 300, 100, 50, int (random(1, 10)), 10));
}

void draw() {
  background (127);
  imageMode(CORNER);
  image(bg, 0, 0);
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (oreachEdge()) {
      obstacle

        //Render and detect collision
        for (int i= 0; i< projectiles.size(); i++) {
        Projectile p = projectiles.get (i);
        for (int j= 0; j< obstacles.size(); j++) {
          Obstacle o = obstacles.get (j);
          if (p.intersect(o)) {


            //Distribute objects on timer
            if (objTimer.isFinished()) {
            }
            // Add object
            obstacles.add(new Obstacle (200, 300, 100, 50, int (random(1, 10)), 10));
            //Restart Timer
            objTimer.start();
          }

          for (int i = 0; i < projectiles.size(); i++) {
            ProjecTile p = projectiles.get(i);
            p.display();
            p.move();
            if (p.reachedEdge()) {
              projectiles.remove(i);
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
            float dx = mouseX - Maddy.x;
            float dy = mouseY - Maddy.y;
            float mag = sqrt(dx*dx + dy*dy);

            if (mag > 0) {
              dx /= mag;
              dy /= mag;

              float speed = 5;
              projectiles.add(new ProjecTile(Maddy.x, Maddy.y, dx * speed, dy * speed));
            }
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
