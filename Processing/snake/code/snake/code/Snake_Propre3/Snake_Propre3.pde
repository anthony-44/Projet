//                Le Nord = 0
//                    |
// L'Ouest = 3 -------|-------- L'Est = 1
//                    |
//                Le Sud = 2


import readBox.*;
String f = "Joueur 1";                                   // |
String g = "Joueur 2";                                   // | variable qui désigne les joueurs
String h = "Joueur 3";                                   // |
String k = "Joueur 4";                                   // |

import ddf.minim.*;
Minim minim;
AudioPlayer [] musique = new AudioPlayer[2];
int u;

boolean animation;
boolean menu = true;
boolean modes = false;
boolean classiqueParametre = false;
boolean labyrintheParametre = false;
boolean combatParametre = false;
boolean jeuLabyrinthe = false;
boolean startLab = false;
boolean ecran_demarage_classique = false;
boolean jeu_classique = false;
boolean startClass = false;
boolean jeuCombat = false;
boolean startCombat = false;
boolean finDuJeu = false;
boolean Option = false;
boolean ecran_GAME_OVER = false;

float a, b, c;
int mousex, mousey;
int couleur= 4;
int nombreJoueur= 1;
int temps = 30;
int timer;
int score = 10;
int niveau = 1;
int nombreMatch = 1;

PImage pommeImage;

Snake s1, s2, s3, s4;

//Labyrinthe
PImage replay;
int i, j, lignes, colones, nb, d1;
Bloc[] blocs;
Objectif fin;
//

//Classique
PImage triste;
int Nombrepomme=10;
Pomme[] pomme = new Pomme[Nombrepomme];
//

//Combat
int Nombrebonus = 6;
Bonus[] bonus = new Bonus[Nombrebonus];
Mine[] mine =new Mine[100];
Projectile[] proj =new Projectile[100];
int comptMine, comptProj;
PImage mineIm, mineImX2, mineImX3, projIm, projImX2, projImX3, lance, bouclier, speed, reboot, rien, Mine, Bonus;
PImage[] Proj = new PImage[4];
//

void setup() {
  minim = new Minim(this);
  musique[0] = minim.loadFile("Electronika.mp3"); // then load the files
  musique[1] = minim.loadFile("Grandioso.mp3");
  size(1000, 800);
  background(0);
  pommeImage = loadImage("pomme.png");
  triste = loadImage("triste.png");
  replay = loadImage("refresh.png");
  mineIm = loadImage("Combat/1.png");
  mineImX2 = loadImage("Combat/22.png");
  mineImX3 = loadImage("Combat/2.png");
  projIm = loadImage("Combat/3.png");
  projImX2 = loadImage("Combat/42.png");
  projImX3 = loadImage("Combat/4.png");
  lance = loadImage("Combat/5.png");
  bouclier = loadImage("Combat/6.png");
  speed = loadImage("Combat/7.png");
  reboot = loadImage("Combat/8.png");
  rien = loadImage("Combat/0.png");
  Mine = loadImage("Combat/Mine.png");
  Bonus = loadImage("Combat/Bonus.png");
  for (int i=0; i<4; i++) {
    Proj[i] = loadImage("Combat/Proj-"+i+".png");
  }

  s1=creer_Snake();
  s2=creer_Snake();
  s3=creer_Snake();
  s4=creer_Snake();
}

void draw() {
  couleur++;
  if (couleur>=5 && menu == true) {
    a = random (256);
    b = random (256);
    c = random (256);
    couleur=0;
    fill(a, b, c);
    stroke(a, b, c);
  }
  if (couleur==50 && menu == false) {
    a = random (256);
    b = random (256);
    c = random (256);
    couleur=0;
    fill(a, b, c);
    stroke(a, b, c);
  }
  musique();
  musique[u].play();
  texteMenu();
  texteModes();
  classiqueParametre();
  labyrintheParametre();
  combatParametre();
  Option();

  if (jeuLabyrinthe) {
    if (startLab) {
      nb=nombreDeBlocs(niveau);

      s1=creer_Snake();
      s2=creer_Snake();
      s3=creer_Snake();
      s4=creer_Snake();

      blocs = new Bloc[nb];
      initialiserObjectif();
      initialiserSnakes(s1, s2, s3, s4, nombreJoueur);
      initialiserBlocs(blocs, fin);
      lignes=57;
      colones=95;
      startLab=false;
    } else {
      labyrinthe();
    }
  }

  if (ecran_demarage_classique) {
    for (int i=0; i<Nombrepomme; i++) {
      pomme[i]=new Pomme();
    }

    s1=creer_Snake();
    s2=creer_Snake();
    s3=creer_Snake();
    s4=creer_Snake();

    s1.positionX[0]=2;
    s1.positionY[0]=2;
    s1.direction = 2;
    s1.c=#00AA00;

    s2.positionX[0] = 92;
    s2.positionY[0] = 2;
    s2.direction = 2;
    s2.c=#0000AA;

    s3.positionX[0] = 2;
    s3.positionY[0] = 54;
    s3.direction = 0;
    s3.c=#00AAAA;

    s4.positionX[0] = 92;
    s4.positionY[0] = 54;
    s4.direction = 0;
    s4.c=#AAAA00;

    ecran_demarage_classique();
  }

  if (jeu_classique) {
    if (startClass) {
      startClass=false;
    } else {
      classique();
    }
  }

  if (jeuCombat) {
    if (startCombat) {
      //Initialisation des pommes et bonus
      for (int i=0; i<Nombrepomme; i++) {
        pomme[i]=new Pomme();
      }
      for (int i=0; i<Nombrebonus; i++) {
        bonus[i]=new Bonus();
      }
      for (int i=0; i<100; i++) {
        mine[i]=new Mine();
      }
      for (int i=0; i<100; i++) {
        proj[i]=new Projectile();
      }
      comptMine=0;
      comptProj=0;

      //Initialisation des snakes
      s1=new Snake(s1.vict);
      s2=new Snake(s2.vict);
      s3=new Snake(s3.vict);
      s4=new Snake(s4.vict);
      initialiserSnakesCombat(nombreJoueur);
      timer=hour()*3600+minute()*60+second()+temps;

      startCombat=false;
    } else {
      combat();
    }
  }

  //pointeur();
}

void stop() {
  minim.stop();
  super.stop();
}

