// 15 April 2026 | TankGame | Madelyn Ashworth
Tank Maddy;
ArrayList<ProjecTile> projectiles = new ArrayList<ProjecTile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
PImage bg;
int score;
Timer objTimer, puTimer;

void setup() {
  size(500, 500);
  bg = loadImage ("bkg.png");
  Maddy = new Tank();
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  //obstacles.add(new Obstacle(300, 200, 100, 100, int(random(1, 10)), 10));
}

void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);

  // Distribute object on timer
  if (objTimer.isFinished()) {
    // Add object
    obstacles.add(new Obstacle(100, 100, int(random(1, 10)), 10));
    // Restart Timer
    objTimer.start();
  }

  // Distribute powerups on a timer
  if (puTimer.isFinished()) {
    // Add power up
    powerups.add(new PowerUp());
    // Restart Timer
    puTimer.start();
  }

  // Display and remove power ups
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedEdge()) {
      powerups.remove(pu);
    }
    if (pu.intersect(Maddy)) {
      if (pu.type == 'h') {
        Maddy.health = Maddy.health + 100;
        powerups.remove(pu);
      } else if (pu.type == 'a') {
        Maddy.laserCount = Maddy.laserCount + 100;
        powerups.remove(pu);
      } else if (pu.type == 't') {
        Maddy.turretCount = Maddy.turretCount + 1;
        powerups.remove(pu);
      }
    }
  }


  //Displays and removes powerups
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedEdge()) {
      powerups.remove(pu);
    }
    if (pu.intersect(Maddy)) {
      // Turret
      if (pu.type == 't') {
        Maddy.turretCount++;
      } else if (pu.type == 'a') { // Ammo
        Maddy.laserCount = Maddy.laserCount + 100;
      } else if (pu.type == 'h') { // Health
        Maddy.health = Maddy.health + 100;
      }
    }
  }

  // Displays and removes obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.reachedEdge()) {
      obstacles.remove(i);
    }
    // detect collision to tank
    if (Maddy.intersect(o)) {
      // impact to change score, health, and obstacle
    }
  }
  // Render and detect collision
  for (int i = 0; i < projectiles.size(); i++) {
    ProjecTile p = projectiles.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score = score + 100;
        projectiles.remove(p);
        obstacles.remove(o);
        continue;
      }
    }
    p.display();
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(i);
    }
  }
  Maddy.display();

  scorePanel();
  println("Objects in Memory:"+obstacles.size());
  println("Projectiles in Memory:"+projectiles.size());
}
void keyPressed() {
  if (key == 'w') {
    Maddy.move('w');
  } else if (key == 's') {
    Maddy.move('s');
  } else if (key == 'd') {
    Maddy.move('d');
  } else if (key == 'a') {
    Maddy.move('a');
  }
}
void mousePressed() {
  float dx = mouseX - Maddy.x;
  float dy = mouseY - Maddy.y;
  float mag = sqrt(dx*dx + dy*dy);
  float speed = 5;
  if (mag > 0) {
    dx /= mag;
    dy /= mag;
  }
  if (Maddy.turretCount == 1) {
    projectiles.add(new ProjecTile(Maddy.x-20, Maddy.y, dx * speed, dy * speed));
  } else if (Maddy.turretCount==2) {
    projectiles.add(new ProjecTile(Maddy.x-20, Maddy.y, dx * speed, dy * speed));
    //projectiles.add(new Projectile(Maddy.x-20, Maddy.y, dx * speed, dy * speed));
  }
  //projectiles.add(new Projectile(Maddy.x-20, Maddy.y, dx * speed, dy * speed));
  //println(projectiles.size());



  //if (Maddy.turretCount == 1 && Maddy.laserCount > 0) {
  //  projectiles.add(new Projectile(Maddy.x, Maddy.y, dx * speed, dy * speed));
  //  Maddy.laserCount = Maddy.laserCount - 1;
  //} else if (Maddy.turretCount == 2 && Maddy.laserCount > 2) {
  //  projectiles.add(new Projectile(Maddy.x-20, Maddy.y, dx * speed, dy * speed));
  //  projectiles.add(new Projectile(Maddy.x+20, Maddy.y, dx * speed, dy * speed));
  //  Maddy.laserCount = Maddy.laserCount - 2;
  //}
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, width/2, 25);
  text("Health:" + Maddy.health, width/2-150, 25);
  text("Ammo:" + Maddy.laserCount, width/2+150, 25);
}
