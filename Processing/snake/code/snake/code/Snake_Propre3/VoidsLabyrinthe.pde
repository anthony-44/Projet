////////////////////////////////Recharger//////////////////////////////////////

void refresh() {
  image(replay, 420, 640, 160, 160);
}

////////////////////////////Initialisation/////////////////////////////////////

int nombreDeBlocs (int lvl) {
  int nb=0;
  if (lvl==1) {
    nb = 750;
  }
  if (lvl==2) {
    nb = 1250;
  }
  if (lvl==3) {
    nb = 1500;
  }
  if (lvl==4) {
    nb = 1750;
  }
  if (lvl==5) {
    nb = 2000;
  }
  if (lvl==6) {
  }
  return nb;
}

boolean choc(Snake s, Bloc[] b) {
  boolean r=false;
  for (i=0; i<nb; i++) {
    if ((s.positionX[0]==b[i].x && s.positionY[0]==b[i].y) || s.positionX[0]<0 || s.positionY[0]<0 || s.positionX[0]>94 || s.positionY[0]>56) {
      r=true;
      s.joue=false;
    }
  }
  return r;
}

void initialiserSnakes(Snake s1, Snake s2, Snake s3, Snake s4, int n) {
  if (n==1 || n==2) {
    s1.positionX[0]=0;
    s1.positionY[0]=28;

    s1.joue=true;
  }
  if (n==2) {
    s2.positionX[0]=94;
    s2.positionY[0]=28;

    s2.joue=true;
  }
  if (n==3 || n==4) {
    s1.positionX[0]=0;
    s1.positionY[0]=0;
    s2.positionX[0]=94;
    s2.positionY[0]=0;
    s3.positionX[0]=0;
    s3.positionY[0]=56;

    s1.joue=true;
    s2.joue=true;
    s3.joue=true;
  }
  if (n==4) {
    s4.positionX[0]=94;
    s4.positionY[0]=56;

    s4.joue=true;
  }
}

void initialiserBlocs(Bloc[] b, Objectif o) {
  int i;
  int j=0;
  for (i=0; i<nb; i++) {
    verifBloc(b, i, j, o);
    j++;
  }
}

void verifBloc(Bloc[] b, int i, int j, Objectif o) {
  b[i]=new Bloc();
  if ((o.x==b[j].x && o.y==b[j].y) || (0==b[j].x && 28==b[j].y) || (94==b[j].x && 28==b[j].y) || (0==b[j].x && 0==b[j].y) || (0==b[j].x && 56==b[j].y) || (94==b[j].x && 1==b[j].y) || (94==b[j].x && 56==b[j].y)) {
    verifBloc(b, i, j, o);
  }
}


void initialiserObjectif() {
  fin=new Objectif();
}
/////////////////////////// Affichage //////////////////////////////////////////

void dessinerBloc(Bloc[] b) {
  stroke(0);
  fill(255);
  rectMode(CENTER);
  for (i=0; i<nb; i++) {
    rect(b[i].x*10+30, b[i].y*10+30, 10, 10);
  }
}


void dessinerObjectif(Objectif f) {
  fill(#F5180C);
  rectMode(CENTER);
  rect(f.x*10+30, f.y*10+30, 10, 10);
}

////////////////////////// Victoire/Défaite ////////////////////////////////////

boolean victoireLab (Snake s1, Objectif o) {
  if (s1.positionX[0]==o.x  && s1.positionY[0]==o.y) {
    return true;
  } else {
    return false;
  }
}

void victoireLab() {
  if (victoireLab(s1, fin)) {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(50);
    fill(255);
    text("10 point pour griffondor !", width/2, height/2);
    jeuLabyrinthe = false;
    startLab = false;
  }
  if (victoireLab(s2, fin)) {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(50);
    fill(255);
    text("10 point pour serpentard !", width/2, height/2);
    jeuLabyrinthe = false;
    startLab = false;
  }
  if (victoireLab(s3, fin)) {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(50);
    fill(255);
    text("10 point pour poursouffle !", width/2, height/2);
    jeuLabyrinthe = false;
    startLab = false;
  }
  if (victoireLab(s4, fin)) {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(50);
    fill(255);
    text("10 point pour serdaigle !", width/2, height/2);
    jeuLabyrinthe = false;
    startLab = false;
  }
}


void defaiteLab() {
  if (choc(s1, blocs)) {
    for (int i=0; i<50; i++) {
      s1.positionX[i]=-1000;
      s1.positionY[i]=-1000;
    }
  }
  if (choc(s2, blocs)) {
    for (int i=0; i<50; i++) {
      s2.positionX[i]=-1000;
      s2.positionY[i]=-1000;
    }
  }
  if (choc(s3, blocs)) {
    for (int i=0; i<50; i++) {
      s3.positionX[i]=-1000;
      s3.positionY[i]=-1000;
    }
  }
  if (choc(s4, blocs)) {
    for (int i=0; i<50; i++) {
      s4.positionX[i]=-1000;
      s4.positionY[i]=-1000;
    }
  }

  if (s1.joue==false && s2.joue==false && s3.joue==false && s4.joue==false) {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(50);
    fill(255);
    text("Game Over", width/2, height/2);
    jeuLabyrinthe = false;
    startLab = false;
    if (mousePressed) {
      labyrintheParametre=true;
    }
  }
}

