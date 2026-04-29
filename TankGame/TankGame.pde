// 15 April 2026 | TankGame | Madelyn Ashworth
Tank Maddy;
ArrayList <ProjecTile> projectiles = new ArrayList <ProjecTile>();
ArrayList <Obstacle> obstacles = new ArrayList <Obstacle>();
ArrayList <PowerUp> powerups = new ArrayList <PowerUp>();
PImage bg;
int score;
Timer objTimer, puTimer;

void setup() {
  size(500, 500);
  bg = loadImage ("bkg.png");
  Maddy = new Tank();
  objTimer= new Timer(1000);
  objTimer.start();
  puTimer = new Timer (1000);
 puTimer = start();
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
      obstacles.remove(i);
    }
    // detect collision to tank
    if (Maddy.intersect(o)) {
      //impact to change score, health, and obstacle
    }
    //impact to change score, health,  and obstacle
  }
  //Render and detect collision
  for (int i= 0; i< projectiles.size(); i++) {
    Projectile p = projectiles.get (i);
    for (int j= 0; j< obstacles.size(); j++) {
      Obstacle o = obstacles.get (j);
      if (p.intersect(o)) {
      }
    }
    //Distribute objects on timer
    if (objTimer.isFinished()) {
      // Add object
      obstacles.add(new Obstacle (200, 300, 100, 50, int (random(1, 10)), 10));
      //Restart Timer
      objTimer.start();
    }
    // Distribute on power up
    poweups.add
      puTimer.start();
  }
  // Display and removes powerups
  for (int i = 0; i< powerups.size(); i++) {
    PowerUp pu= pwerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedEdge()) {
      powerups.remove(pu);
    }
    if (pu.intersect(t1)) {
      //Turret
      if (pu.type == 't') {
        Maddy.turretCount++;
      } else if (pu.type == 'a') {
        Maddy.laserCount = Maddy.laserCount + 100;
      } else if (pu.type == 'a') {
        Maddy.health = Maddy.healthCount + 30;
      }
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
        if (Maddy.turretCount == 1) {
          projectiles.add(new ProjecTile(Maddy.x, Maddy.y, dx * speed, dy * speed));
        } else if (Maddy.turretCount == 2 && Maddy.laserCount > 2) {
          projectiles.add (new Projectile
            projectiles.add (new Projectile
        }
      }


      void scorePanel() {
        fill(127, 127);
        rectMode(CENTER);
        rect(width/2, 30, width, 60);
        fill(255);
        textSize(80);
        textAlign(CENTER);
        text("Score:"+ score, width/2, 50);
        text("Health:"+ Maddy.healthCount, width/2-150, 50);
        text("Ammo:"+ Maddy.laserCount, width/2+150, 50);
      }
