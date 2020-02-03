class Bloc {
  int x, y;
  Bloc() {
    x=floor(random(95));
    y=floor(random(57));
  }
}

class Bonus {
  int x, y;
  Bonus() {
    x=floor(random(95));
    y=floor(random(57));
  }
}

class Mine {
  int x, y;
  Mine(int a, int b) {
    x=a;
    y=b;
  }
  Mine() {
    x=-100;
    y=-100;
  }
}

class Projectile {
  int x, y, d, v, c ;
  Projectile(int a, int b, int c, int e, int f) {
    x=a;
    y=b;
    d=c;
    v=e;
    c=f;
  }
  Projectile() {
    x=-100;
    y=0;
    d=0;
    v=9999;
    c=-1000000;
  }
}

class Objectif {
  int x, y;
  Objectif() {
    x=47;
    y=28;
  }
}

class Snake {
  int[] positionX = new int[50];                   // | la taille maximum du serpent est de 50 carrés
  int[] positionY = new int[50];                   // |
  int direction;
  int score;
  int v;  // la vitesse du serpent
  int d;  // compteur
  color c;
  boolean joue;
  int bonus;    //Nr du bonus
  int vict;     //Nb de victoires
  boolean speed, boucl, lance; //Detecte les bonus activés
  int timerSpeed, timerBoucl, timerLance; //Temps d'activation des bonus
  int nombre;   //Nb de bonus restant
  Snake() {
    positionX[0]=-10000;
    positionY[0]=-10000;
    for (int i=1; i<50; i++) 
    {
      positionX[i] = -100;                    // | toutes les coordonees du serpent vaut -100 , sauf les coordonnées de la tete
      positionY[i] = -100;                    // |
    }
    direction = 4;
    score = 0;
    v = 25;
    c=#00AA00;
    joue=false;
    bonus=0;
    vict=0;
    nombre=0;
    speed=false; 
    boucl=false; 
    lance=false;
    timerSpeed=0;
    timerBoucl=0; 
    timerLance=0;
  }
  
  Snake(int a) { //Pour conserver le compteur de victoires
    positionX[0]=-10000;
    positionY[0]=-10000;
    for (int i=1; i<50; i++) 
    {
      positionX[i] = -100;                    // | toutes les coordonees du serpent vaut -100 , sauf les coordonnées de la tete
      positionY[i] = -100;                    // |
    }
    direction = 4;
    score = 0;
    v = 25;
    c=#00AA00;
    joue=false;
    bonus=0;
    vict=a;
    nombre=0;
    speed=false; 
    boucl=false; 
    lance=false;
    timerSpeed=0;
    timerBoucl=0; 
    timerLance=0;
  }
}

class Pomme
{
  int x;
  int y;
  Pomme()
  {
    x = floor(random(95));
    y = floor(random(57));
  }
}

