////////////////////////////////////// Principales ////////////////////////////////////////

void deplacementCombat() {
  keyPressed();
  deplacement(s1);
  deplacement(s2);
  deplacement(s3);
  deplacement(s4);
  deplacementProj(proj);
}

void recoltePommeBonus() {
  snake_pomme(s1, pomme);
  snake_pomme(s2, pomme);
  snake_pomme(s3, pomme);
  snake_pomme(s4, pomme);

  vitesseLab(s1);
  vitesseLab(s2);
  vitesseLab(s3);
  vitesseLab(s4);

  snake_bonus(s1, bonus);
  snake_bonus(s2, bonus);
  snake_bonus(s3, bonus);
  snake_bonus(s4, bonus);
}

void dessinCombat() {
  dessinerProj(proj);
  dessinerMine(mine);
  dessinerBonus(bonus);
  dessinerPomme(pomme);
  dessinerSnake(s1);
  dessinerSnake(s2);
  dessinerSnake(s3);
  dessinerSnake(s4);
  interfaceLab();
}

void desactiverBonus() {
  desactiverSpeed(s1);
  desactiverSpeed(s2);
  desactiverSpeed(s3);
  desactiverSpeed(s4);

  desactiverBoucl(s1);
  desactiverBoucl(s2);
  desactiverBoucl(s3);
  desactiverBoucl(s4);

  desactiverLance(s1);
  desactiverLance(s2);
  desactiverLance(s3);
  desactiverLance(s4);
}

void degatCombat() {
  trident();
  chocJoueur();
  surProj(s1, proj);
  surProj(s2, proj);
  surProj(s3, proj);
  surProj(s4, proj);
  if (horsZone(s1) || surMine(s1, mine)) {
    s1.joue=false;
  }
  if (horsZone(s2) || surMine(s2, mine)) {
    s2.joue=false;
  }
  if (horsZone(s3) || surMine(s3, mine)) {
    s3.joue=false;
  }
  if (horsZone(s4) || surMine(s4, mine)) {
    s4.joue=false;
  }
}

void horsJeu() {
  if (s1.joue==false) {
    s1.positionX[0]=-100000000;
    s1.positionY[0]=-100000000;
    for (int i=1; i<50; i++) {
      s1.positionX[i]=-1000;
      s1.positionY[i]=-1000;
    }
  }
  if (s2.joue==false) {
    s2.positionX[0]=1000000000;
    s2.positionY[0]=-1000000000;
    for (int i=1; i<50; i++) {
      s2.positionX[i]=-1000;
      s2.positionY[i]=-1000;
    }
  }
  if (s3.joue==false) {
    s3.positionX[0]=-1000000000;
    s3.positionY[0]=1000000000;
    for (int i=1; i<50; i++) {
      s3.positionX[i]=-1000;
      s3.positionY[i]=-1000;
    }
  }
  if (s4.joue==false) {
    s4.positionX[0]=1000000000;
    s4.positionY[0]=1000000000;
    for (int i=1; i<50; i++) {
      s4.positionX[i]=-1000;
      s4.positionY[i]=-1000;
    }
  }
}

/////////////////////////////////////// Afichage //////////////////////////////////////////

void dessinerBonus (Bonus[] b) {
  noStroke();
  fill(#F70AE8);
  ellipseMode(CENTER);
  for (int i=0; i<Nombrebonus; i++) {
    image(Bonus, b[i].x*10+22, b[i].y*10+22, 14, 14);
  }
}

void dessinerMine(Mine[] m) {
  ellipseMode(CENTER);
  strokeWeight(3);
  stroke(#DB1616);
  fill(#FF0000);
  for (int i=0; i<100; i++) {
    ellipse(m[i].x*10+30, m[i].y*10+30, 34, 34);      //Zone d'explosion
    image(Mine, m[i].x*10+16, m[i].y*10+14, 30, 30);
  }
}

void dessinerProj(Projectile[] p) {
  for (int i=0; i<100; i++) {
    image(Proj[p[i].d], p[i].x*10+14, p[i].y*10+14, 30, 30);
  }
}

/////////////////////////////////////// Initialisation ////////////////////////////////////////

void initialiserSnakesCombat(int n) {
  if (n>=2) {
    s1.positionX[0]=2;
    s1.positionY[0]=2;
    s1.direction = 2;
    s1.c=#00AA00;
    s1.joue=true;

    s2.positionX[0] = 92;
    s2.positionY[0]= 2;
    s2.direction = 2;
    s2.c=#0000AA;
    s2.joue=true;
  }
  if (n>=3) {
    s3.positionX[0] = 2;
    s3.positionY[0] = 54;
    s3.direction = 0;
    s3.c=#00AAAA;
    s3.joue=true;
  }
  if (n>=4) {
    s4.positionX[0] = 92;
    s4.positionY[0] = 54;
    s4.direction = 0;
    s4.c=#AAAA00;
    s4.joue=true;
  }
}

//////////////////////////////// Pioche/Utilisation de Bonus ///////////////////////////////////////////////////

void snake_bonus(Snake s, Bonus[] b) {
  for (int i=0; i<Nombrebonus; i++) {
    if (b[i].x == s.positionX[0] && b[i].y == s.positionY[0]) {
      bonus(s);
      b[i].x = floor(random(95));
      b[i].y = floor(random(57));
    }
  }
}

void bonus(Snake s) {
  int i;
  i=floor(random(100));
  // 0:Rien - 1:Mine (x1 ou x3) - 3:Projectile (x1 ou x3) - 5:Lance - 6:Bouclier - 7:Vitesse - 8:Tlm à 0
  if (i<30) {  //30%
    s.bonus=1;
    if (i<25) {
      s.nombre=1;
    } else {
      s.nombre=3;
    }
  }
  if (i>=30 && i<60) {  //30%
    s.bonus=3;
    if (i<55) {
      s.nombre=1;
    } else {
      s.nombre=3;
    }
  }
  if (i>=60 && i<75) {  //15%
    s.bonus=5;
    s.nombre=1;
  }
  if (i>=75 && i<90) {  //15%
    s.bonus=6;
    s.nombre=1;
  }
  if (i>=90 && i<99) {  //9%
    s.bonus=7;
    s.nombre=1;
  }
  if (i==99) {          //1%
    s.bonus=8;
    s.nombre=1;
  }
}

PImage bonusImage (Snake s) {
  PImage r=rien;
  if (s.nombre>0) {
    if (s.bonus==1 || s.bonus==2) {
      if (s.nombre==1) {
        r=mineIm;
      }
      if (s.nombre==2) {
        r=mineImX2;
      }
      if (s.nombre==3) {
        r=mineImX3;
      }
    }
    if (s.bonus==3 || s.bonus==4) {
      if (s.nombre==1) {
        r=projIm;
      }
      if (s.nombre==2) {
        r=projImX2;
      }
      if (s.nombre==3) {
        r=projImX3;
      }
    }
    if (s.bonus==5) {
      r=lance;
    }
    if (s.bonus==6) {
      r=bouclier;
    }
    if (s.bonus==7) {
      r=speed;
    }
    if (s.bonus==8) {
      r=reboot;
    }
  }
  return r;
}


void utilisationBonus(Snake s) {
  int b=s.bonus;
  if (s.nombre>0) {
    if (b==1 | b==2) {
      pose(s);
    }
    if (b==3 | b==4) {
      tir(s);
    }
    if (b==5) {
      activerLance(s);
    }
    if (b==6) {
      activerBoucl(s);
    }
    if (b==7) {
      activerSpeed(s);
    }
    if (b==8) {
      resetScore();
    }
    s.nombre--;
  }
}

///////////////////////////////////// Effet des bonus ////////////////////////////////////////////////

void resetScore() {
  s1.score=0;
  s2.score=0;
  s3.score=0;
  s4.score=0;
}

void activerSpeed (Snake s) {
  s.speed=true;
  s.timerSpeed=hour()*3600+minute()*60+second()+8;
}

void activerBoucl (Snake s) {
  s.boucl=true;
  s.timerBoucl=hour()*3600+minute()*60+second()+10;
}

void activerLance (Snake s) {
  s.lance=true;
  s.timerLance=hour()*3600+minute()*60+second()+5;
}

void desactiverSpeed (Snake s) {
  if (s.speed) {
    if (hour()*3600+minute()*60+second() >= s.timerSpeed) {
      s.speed=false;
    }
  }
}

void desactiverBoucl (Snake s) {
  if (s.boucl) {
    if (hour()*3600+minute()*60+second() >= s.timerBoucl) {
      s.boucl=false;
    }
  }
}

void desactiverLance (Snake s) {
  if (s.lance) {
    if (hour()*3600+minute()*60+second() >= s.timerLance) {
      s.lance=false;
    }
  }
}

void tir(Snake s) {
  int dX=0, dY=0;
  if (s.direction==0) {
    dY=-2;
  }
  if (s.direction==1) {
    dX=2;
  }
  if (s.direction==2) {
    dY=2;
  }
  if (s.direction==3) {
    dX=-2;
  }
  proj[comptProj] = new Projectile(s.positionX[0]+dX, s.positionY[0]+dY, s.direction, s.v/2, s.d+1);
  comptProj++;
  if (comptProj==100) {
    comptProj=0;
  }
}

void pose(Snake s) {
  int p;

  if (s.score+4>=50) {
    p=50;
  } else {
    p=s.score+4;
  }

  mine[comptMine] = new Mine(s.positionX[p], s.positionY[p]);
  comptMine++;
  if (comptMine==100) {
    comptMine=0;
  }
}

void vitesseLab(Snake s) {
  int k = s.score;
  if (k<10) {
    s.v=24;
  }
  if (k>=10 && k<25) {
    s.v=14;
  }
  if (k>=25 && k<50) {
    s.v=10;
  }
  if (k>=50) {
    s.v=6;
  }

  if (s.speed==true) {
    s.v=s.v/2;
  }
}

/////////////////////////////////////// Deplacement ////////////////////////////////////////////

void deplacementProj (Projectile[] p) {
  for (int i=0; i<100; i++) {
    p[i].c++;
    if (p[i].c >= p[i].v) {
      if (p[i].d == 0) {
        p[i].y--;
      }
      if (p[i].d == 1) {
        p[i].x++;
      }
      if (p[i].d == 2) { 
        p[i].y++;
      }
      if (p[i].d == 3) {
        p[i].x--;
      }
    }
  }
}

///////////////////////////////////////// Victoire/Défaite ////////////////////////////////////////

boolean horsZone (Snake s) {
  boolean r;
  if (s.positionX[0]<0 || s.positionY[0]<0 || s.positionX[0]>94 || s.positionY[0]>56) {
    r=true;
  } else {
    r=false;
  }
  return r;
}

boolean surMine (Snake s, Mine[] m) {
  boolean r=false;
  for (int i=0; i<100; i++) {
    if (s.positionX[0]<=m[i].x+1 && s.positionX[0]>=m[i].x-1 && s.positionY[0]<=m[i].y+1 && s.positionY[0]>=m[i].y-1 && s.boucl==false) {
      r=true;
      m[i]=new Mine();
    }
  }
  return r;
}

void surProj (Snake s, Projectile[] p) {
  for (int i=0; i<100; i++) {
    if (s.score+4<=50) {
      for (int j=0; j<s.score+4; j++) {
        if (p[i].x==s.positionX[j] && p[i].y==s.positionY[j]) {
          if (s.boucl==false) {
            if (j<=3) {
              s.joue=false;
            }
            if (j>3) {
              s.score=j-4;
            }
          }
          p[i]=new Projectile();
        }
      }
    } else {
      for (int j=0; j<50; j++) {
        if (p[i].x==s.positionX[j] && p[i].y==s.positionY[j]) {
          if (s.boucl==false) {
            if (j<=3) {
              s.joue=false;
            }
            if (j>3) {
              s.score=j-4;
            }
          }
          p[i]=new Projectile();
        }
      }
    }
  }
}

void trident() {
  int m1, m2, m3, m4, r1, r2, r3, r4;
  if (s1.score+4<=50) {
    m1=s1.score+4;
  } else {
    m1=50;
  }
  if (s2.score+4<=50) {
    m2=s2.score+4;
  } else {
    m2=50;
  }
  if (s3.score+4<=50) {
    m3=s3.score+4;
  } else {
    m3=50;
  }
  if (s4.score+4<=50) {
    m4=s4.score+4;
  } else {
    m4=50;
  }

  for (r1=1; r1<m1; r1++) {
    if ((s1.positionX[0] == s1.positionX[r1] && s1.positionY[0] == s1.positionY[r1] && (s1.lance && s1.boucl==false)) || (s2.positionX[0] == s1.positionX[r1] && s2.positionY[0] == s1.positionY[r1] && (s2.lance && s1.boucl==false)) || (s3.positionX[0] == s1.positionX[r1] && s3.positionY[0] == s1.positionY[r1] && (s3.lance && s1.boucl==false)) || (s4.positionX[0] == s1.positionX[r1] && s4.positionY[0] == s1.positionY[r1] && (s4.lance && s1.boucl==false))) {
      if (r1<=3) {
        s1.score=0;
        s1.joue=false;
      }
      if (r1>3) {
        s1.score=r1-4;
      }
    }
  }
  for (r2=1; r2<m2; r2++) {
    if ((s1.positionX[0] == s2.positionX[r2] && s1.positionY[0] == s2.positionY[r2] && (s1.lance && s2.boucl==false)) || (s2.positionX[0] == s2.positionX[r2] && s2.positionY[0] == s2.positionY[r2] && (s2.lance && s2.boucl==false)) || (s3.positionX[0] == s2.positionX[r2] && s3.positionY[0] == s2.positionY[r2] && (s3.lance && s2.boucl==false)) || (s4.positionX[0] == s2.positionX[r2] && s4.positionY[0] == s2.positionY[r2] && (s4.lance && s2.boucl==false))) {
      if (r2<=3) {
        s2.score=0;
        s2.joue=false;
      }
      if (r2>3) {
        s2.score=r2-4;
      }
    }
  }
  for (r3=1; r3<m3; r3++) {
    if ((s1.positionX[0] == s3.positionX[r3] && s1.positionY[0] == s3.positionY[r3] && (s1.lance && s3.boucl==false)) || (s2.positionX[0] == s3.positionX[r3] && s2.positionY[0] == s3.positionY[r3] && (s2.lance && s3.boucl==false)) || (s3.positionX[0] == s3.positionX[r3] && s3.positionY[0] == s3.positionY[r3] && (s3.lance && s3.boucl==false)) || (s4.positionX[0] == s3.positionX[r3] && s4.positionY[0] == s3.positionY[r3] && (s4.lance && s3.boucl==false))) {
      if (r3<=3) {
        s3.score=0;
        s3.joue=false;
      }
      if (r3>3) {
        s3.score=r3-4;
      }
    }
  }
  for (r4=1; r4<m4; r4++) {
    if ((s1.positionX[0] == s4.positionX[r4] && s1.positionY[0] == s4.positionY[r4] && (s1.lance && s4.boucl==false)) || (s2.positionX[0] == s4.positionX[r4] && s2.positionY[0] == s4.positionY[r4] && (s2.lance && s4.boucl==false)) || (s3.positionX[0] == s4.positionX[r4] && s3.positionY[0] == s4.positionY[r4] && (s3.lance && s4.boucl==false)) || (s4.positionX[0] == s4.positionX[r4] && s4.positionY[0] == s4.positionY[r4] && (s4.lance && s4.boucl==false))) {
      if (r4<=3) {
        s4.score=0;
        s4.joue=false;
      }
      if (r4>3) {
        s4.score=r4-4;
      }
    }
  }
}


void chocJoueur() {
  int m1, m2, m3, m4, r1, r2, r3, r4;

  if (s1.score+4<=50) {
    m1=s1.score+4;
  } else {
    m1=50;
  }
  if (s2.score+4<=50) {
    m2=s2.score+4;
  } else {
    m2=50;
  }
  if (s3.score+4<=50) {
    m3=s3.score+4;
  } else {
    m3=50;
  }
  if (s4.score+4<=50) {
    m4=s4.score+4;
  } else {
    m4=50;
  }
  for (r1=1; r1<m1; r1++) {
    for (r2=1; r2<m2; r2++) {
      for (r3=1; r3<m3; r3++) {
        for (r4=1; r4<m4; r4++) { //                                                                                                                                                                                                                                                                                                                                                                                                                                    | Détection de chocs de têtes - 1er                                                                                                                                                                                                                      -2eme                                                                                                                                                                                                                                             -3eme                                                                                                                                                                                                                                                    
          if ((s1.positionX[0] == s1.positionX[r1] && s1.positionY[0] == s1.positionY[r1] && (s1.lance==false | s1.boucl)) | (s1.positionX[0] == s2.positionX[r1] && s1.positionY[0] == s2.positionY[r1] && (s1.lance==false | s2.boucl)) | (s1.positionX[0] == s3.positionX[r1] && s1.positionY[0] == s3.positionY[r1] && (s1.lance==false | s3.boucl)) | (s1.positionX[0] == s4.positionX[r1] && s1.positionY[0] == s4.positionY[r1] && (s1.lance==false | s4.boucl)) | ((s1.positionX[0] == s2.positionX[0] && s1.positionY[0] == s2.positionY[0]) && ((s2.lance && s2.boucl) || (s1.lance==false && s1.boucl==false) || (s1.boucl==false && s2.boucl) || (s1.lance==false && s2.boucl) || (s1.boucl==false && s2.boucl))) | ((s1.positionX[0] == s3.positionX[0] && s1.positionY[0] == s3.positionY[0]) && ((s3.lance && s3.boucl) || (s1.lance==false && s1.boucl==false) || (s1.boucl==false && s3.boucl) || (s1.lance==false && s3.boucl) || (s1.boucl==false && s3.boucl))) | ((s1.positionX[0] == s4.positionX[0] && s1.positionY[0] == s4.positionY[0]) && ((s4.lance && s4.boucl) || (s1.lance==false && s1.boucl==false) || (s1.boucl==false && s4.boucl) || (s1.lance==false && s4.boucl) || (s1.boucl==false && s4.boucl)))) {
            s1.joue=false;
          }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
          if ((s2.positionX[0] == s1.positionX[r2] && s2.positionY[0] == s1.positionY[r2] && (s2.lance==false | s1.boucl)) | (s2.positionX[0] == s2.positionX[r2] && s2.positionY[0] == s2.positionY[r2] && (s2.lance==false | s2.boucl)) | (s2.positionX[0] == s3.positionX[r2] && s2.positionY[0] == s3.positionY[r2] && (s2.lance==false | s3.boucl)) | (s2.positionX[0] == s4.positionX[r2] && s2.positionY[0] == s4.positionY[r2] && (s2.lance==false | s4.boucl)) | ((s1.positionX[0] == s2.positionX[0] && s1.positionY[0] == s2.positionY[0]) && ((s1.lance && s1.boucl) || (s2.lance==false && s2.boucl==false) || (s2.boucl==false && s1.boucl) || (s2.lance==false && s1.boucl) || (s2.boucl==false && s1.boucl))) | ((s2.positionX[0] == s3.positionX[0] && s2.positionY[0] == s3.positionY[0]) && ((s3.lance && s3.boucl) || (s2.lance==false && s2.boucl==false) || (s2.boucl==false && s3.boucl) || (s2.lance==false && s3.boucl) || (s2.boucl==false && s3.boucl))) | ((s2.positionX[0] == s4.positionX[0] && s2.positionY[0] == s4.positionY[0]) && ((s4.lance && s4.boucl) || (s2.lance==false && s2.boucl==false) || (s2.boucl==false && s4.boucl) || (s2.lance==false && s4.boucl) || (s2.boucl==false && s4.boucl)))) {
            s2.joue=false;
          }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
          if ((s3.positionX[0] == s1.positionX[r3] && s3.positionY[0] == s1.positionY[r3] && (s3.lance==false | s1.boucl)) | (s3.positionX[0] == s2.positionX[r3] && s3.positionY[0] == s2.positionY[r3] && (s3.lance==false | s2.boucl)) | (s3.positionX[0] == s3.positionX[r3] && s3.positionY[0] == s3.positionY[r3] && (s3.lance==false | s3.boucl)) | (s3.positionX[0] == s4.positionX[r3] && s3.positionY[0] == s4.positionY[r3] && (s3.lance==false | s4.boucl)) | ((s3.positionX[0] == s2.positionX[0] && s3.positionY[0] == s2.positionY[0]) && ((s2.lance && s2.boucl) || (s3.lance==false && s3.boucl==false) || (s3.boucl==false && s2.boucl) || (s3.lance==false && s2.boucl) || (s3.boucl==false && s2.boucl))) | ((s1.positionX[0] == s3.positionX[0] && s1.positionY[0] == s3.positionY[0]) && ((s1.lance && s1.boucl) || (s3.lance==false && s3.boucl==false) || (s3.boucl==false && s1.boucl) || (s3.lance==false && s1.boucl) || (s3.boucl==false && s1.boucl))) | ((s3.positionX[0] == s4.positionX[0] && s3.positionY[0] == s4.positionY[0]) && ((s4.lance && s4.boucl) || (s3.lance==false && s3.boucl==false) || (s3.boucl==false && s4.boucl) || (s3.lance==false && s4.boucl) || (s3.boucl==false && s4.boucl)))) {
            s3.joue=false;
          }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
          if ((s4.positionX[0] == s1.positionX[r4] && s4.positionY[0] == s1.positionY[r4] && (s4.lance==false | s1.boucl)) | (s4.positionX[0] == s2.positionX[r4] && s4.positionY[0] == s2.positionY[r4] && (s4.lance==false | s2.boucl)) | (s4.positionX[0] == s3.positionX[r4] && s4.positionY[0] == s3.positionY[r4] && (s4.lance==false | s3.boucl)) | (s4.positionX[0] == s4.positionX[r4] && s4.positionY[0] == s4.positionY[r4] && (s4.lance==false | s4.boucl)) | ((s4.positionX[0] == s2.positionX[0] && s4.positionY[0] == s2.positionY[0]) && ((s2.lance && s2.boucl) || (s4.lance==false && s4.boucl==false) || (s4.boucl==false && s2.boucl) || (s4.lance==false && s2.boucl) || (s4.boucl==false && s2.boucl))) | ((s4.positionX[0] == s3.positionX[0] && s4.positionY[0] == s3.positionY[0]) && ((s3.lance && s3.boucl) || (s4.lance==false && s4.boucl==false) || (s4.boucl==false && s3.boucl) || (s4.lance==false && s3.boucl) || (s4.boucl==false && s3.boucl))) | ((s1.positionX[0] == s4.positionX[0] && s1.positionY[0] == s4.positionY[0]) && ((s1.lance && s1.boucl) || (s4.lance==false && s4.boucl==false) || (s4.boucl==false && s1.boucl) || (s4.lance==false && s1.boucl) || (s4.boucl==false && s1.boucl)))) {
            s4.joue=false;
          }
        }
      }
    }
  }
}

void score() {
  if (s1.score >= score) {
    s2.joue=false;
    s3.joue=false;
    s4.joue=false;
  }
  if (s2.score >= score) {
    s1.joue=false;
    s3.joue=false;
    s4.joue=false;
  }
  if (s3.score >= score) {
    s2.joue=false;
    s1.joue=false;
    s4.joue=false;
  }
  if (s4.score >= score) {
    s2.joue=false;
    s3.joue=false;
    s1.joue=false;
  }
}

void victoireDefaite() {
  textAlign(CENTER, CENTER);
  textSize(50);
  fill(255);
  if (s1.vict==nombreMatch) {
    background(0);
    text(f+" gagne la partie", width/2, height/2);
    if (mousePressed) {
      combatParametre=true;
      finDuJeu = false;
      jeuCombat=false;
    }
  }
  if (s2.vict==nombreMatch) {
    background(0);
    text(g+" gagne la partie", width/2, height/2);
    if (mousePressed) {
      combatParametre=true;
      finDuJeu = false;
      jeuCombat=false;
    }
  }
  if (s3.vict==nombreMatch) {
    background(0);
    text(h+" gagne la partie", width/2, height/2);
    if (mousePressed) {
      combatParametre=true;
      finDuJeu = false;
      jeuCombat=false;
    }
  }
  if (s4.vict==nombreMatch) {
    background(0);
    text(k+" gagne la partie", width/2, height/2);
    if (mousePressed) {
      combatParametre=true;
      finDuJeu = false;
      jeuCombat=false;
    }
  }

  if ((s1.vict | s2.vict | s3.vict | s4.vict)<nombreMatch) {
    if (s1.joue && s2.joue==false && s3.joue==false && s4.joue==false) {
      background(0);
      finDuJeu = true;
      text(f+" gagne la manche", width/2, height/2);
      if (mousePressed) {
        startCombat=true;
        finDuJeu = false;
        s1.vict++;
        delay(1000);
      }
    }
    if (s1.joue==false && s2.joue && s3.joue==false && s4.joue==false) {
      background(0);
      finDuJeu = true;
      text(g+" gagne la manche", width/2, height/2);
      if (mousePressed) {
        startCombat=true;
        finDuJeu = false;
        s2.vict++;
        delay(1000);
      }
    }
    if (s1.joue==false && s2.joue==false && s3.joue && s4.joue==false) {
      background(0);
      finDuJeu = true;
      text(h+" gagne la manche", width/2, height/2);
      if (mousePressed) {
        startCombat=true;
        finDuJeu = false;
        s3.vict++;
        delay(1000);
      }
    }
    if (s1.joue==false && s2.joue==false && s3.joue==false && s4.joue) {
      background(0);
      finDuJeu = true;
      text(k+" gagne la manche", width/2, height/2);
      if (mousePressed) {
        startCombat=true;
        finDuJeu = false;
        s4.vict++;
        delay(1000);
      }
    }
    if (s1.joue==false && s2.joue==false && s3.joue==false && s4.joue==false) {
      background(0);
      finDuJeu = true;
      text("Game Over", width/2, height/2);
      if (mousePressed) {
        startCombat=true;
        finDuJeu = false;
      }
    }
  }
}

