Snake creer_Snake()
{
  Snake s=new Snake();
  return s;
}

void interfaceLab() {
  rectMode(CORNER);

  stroke(0);
  strokeWeight(1);
  fill(200);
  if (jeuLabyrinthe || jeu_classique || ecran_demarage_classique) {
    background(5);
    rect(25, 25, 950, 570);
  } else {
    noStroke();
    fill(0);
    rect(0, 0, 25, 800);
    rect(0, 0, 1000, 25);
    rect(975, 0, 25, 800);
    rect(0, 595, 1000, 205);
  }
  stroke(0);
  strokeWeight(1);
  fill(200);
  rect(25, 600, 350, 180);
  rect(625, 600, 350, 180);

  if (jeuLabyrinthe || jeu_classique || ecran_demarage_classique) {
    noStroke();
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    if (nombreJoueur>=1)
    {
      text(f+": "+s1.score, 110, 640);
    }
    if (nombreJoueur>=2)
    {   
      text(g+": "+s2.score, 710, 640);
    }
    if (nombreJoueur>=3)
    {    
      text(g+": "+s3.score, 110, 720);
    }
    if (nombreJoueur>=4)
    {   
      text(k+": "+s4.score, 710, 720);
    }
  }

  if (jeuCombat) {
    noStroke();
    fill(0);
    textSize(25);
    if (nombreJoueur>=1) {
      textAlign(LEFT, CENTER);
      text(f+": "+s1.score, 40, 620);
      text("Victoire(s): "+s1.vict, 40, 650);
    }
    if (nombreJoueur>=2) { 
      textAlign(RIGHT, CENTER);
      text(g+": "+s2.score, 955, 620);
      text("Victoire(s): "+s2.vict, 955, 650);
    }
    if (nombreJoueur>=3) {    
      textAlign(LEFT, CENTER);
      text(h+": "+s3.score, 40, 720);
      text("Victoire(s): "+s3.vict, 40, 750);
    }
    if (nombreJoueur>=4) {   
      textAlign(RIGHT, CENTER);
      text(k+": "+s4.score, 955, 720);
      text("Victoire(s): "+s4.vict, 955, 750);
    }
    fill(80);
    stroke(255);
    strokeWeight(1);

    if (nombreJoueur>=1) {
      image(bonusImage(s1), 275, 615, 45, 45);
    }
    if (nombreJoueur>=2) {
      image(bonusImage(s2), 675, 615, 45, 45);
    }
    if (nombreJoueur>=3) {
      image(bonusImage(s3), 275, 715, 45, 45);
    }
    if (nombreJoueur>=4) {
      image(bonusImage(s4), 675, 715, 45, 45);
    }
  }
}

void pointeur() {
  text(mouseX+" , "+mouseY, mouseX, mouseY);
}

void deplacement (Snake s) {
  s.d++;
  if (s.d >= s.v) {
    for (int i=49; i>0; i--) {
      s.positionX[i]=s.positionX[i-1];
      s.positionY[i]=s.positionY[i-1];
    }
    if (s.direction == 0) {
      s.positionY[0] = s.positionY[0]-1;
    }
    if (s.direction == 1) {
      s.positionX[0] = s.positionX[0]+1;
    }
    if (s.direction == 2) { 
      s.positionY[0] = s.positionY[0]+1;
    }
    if (s.direction == 3) {
      s.positionX[0] = s.positionX[0]-1;
    }

    s.d = 0;
  }
}

void dessinerSnake (Snake s) {
  if (s.score+4<=50) {
    for (int r=0; r<s.score+4; r++)            // s.score+4 fait reference a la taille du serpent initiale
    {
      rectMode(CENTER);
      stroke(0);
      strokeWeight(1);
      fill(s.c);
      rect(s.positionX[r]*10+30, s.positionY[r]*10+30, 10, 10 );
    }
  } else {               //Quand score+4 dépasse 50, pour eviter le bug "nullPointer", les conditions du "for" changent
    for (int r=0; r<50; r++) {
      rectMode(CENTER);
      stroke(0);
      strokeWeight(1);
      fill(s.c);
      rect(s.positionX[r]*10+30, s.positionY[r]*10+30, 10, 10 );
    }
  }
}

void dessinerPomme (Pomme[] p) {
  noStroke();
  fill(170, 0, 0);
  ellipseMode(CENTER);
  for (int i=0; i<Nombrepomme; i++) {
    ellipse(p[i].x*10+30, p[i].y*10+30, 10, 10);
  }
}

void snake_pomme(Snake s, Pomme[] p) {
  for (int i=0; i<Nombrepomme; i++) {
    if (p[i].x == s.positionX[0] && p[i].y == s.positionY[0]) {
      s.score++;                  // quand le serpent touche la pomme, le score et la taille augmentent de 1
      s.v = s.v-1;                     // quand le serpent touche la pomme, la vitesse augmente de 1
      if (s.v<2) {                   // si la vitesse est en dessous de 2, elle restera a 1
        s.v = 1;
      }
      p[i].x = floor(random(95));
      p[i].y = floor(random(57));
    }
  }
}

void timerJeu() {
  if (hour()*3600+minute()*60+second() > timer && temps!=210) {
    s1.joue=false;
    s2.joue=false;
    s3.joue=false;
    s4.joue=false;
  }
}
void afficherTimer() {
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Temps restant :", 500, 620);
  if (temps==210) {
    text("∞", 500, 640);
  } else {
    text(timer-(hour()*3600+minute()*60+second()), 500, 640);
  }
}

