import peasy.*;

PeasyCam cam;

int NbPoint = 40;                           // doit etre paire et divisible par 4 et superieur ou egal a 4
int EcartPoint = 10;                        //l'écart entre chaque point (en pixels)
float radius = NbPoint*EcartPoint;
float centreX = 0;
float centreY = 0;
float centreZ = 0;
float radiusCercle = radius + (radius/2);
float radiusSphere = radius/(NbPoint/5);
int stopRandom = int(random(0, NbPoint));    //pour stoper le random a une position aléatoire

void settings() {
  size(1000, 1000, P3D);
}

void setup() {
  cam=new PeasyCam(this, 2000);

  cam.rotateX(PI/2);                //pour déplacer la caméra avnt l'exécution du programme
  cam.rotateY(PI/2);
  cam.rotateX(PI/15);

  cam.setMinimumDistance(1200);     //pour fixer la camera 
  cam.setMaximumDistance(4000);
}


void draw() {
  background(0);
  lights();                                                              //pour éclairer les formes
  Sphere(radius, NbPoint, centreX, centreY, centreZ, 20, true, true);             
  Etoile( NbPoint, EcartPoint);                                           // peu etre rajouter un centre de la figure 
  Sphere(100, NbPoint, centreX, centreY, centreZ, 100, true, false);
  Atome(NbPoint, radiusCercle, radiusSphere, stopRandom, 100, true, true);
  keyReleased();
  /*fill(255);
  textSize(10);
  text("UP pour entrer dans la grande sphère", 100, 100);
  text("DOWN pour sortir de la grande sphère", 100, 100);*/
}

////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////INTERACTION////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

void keyReleased() {                  
  if (keyCode == UP) {                // pour entrer dans la grande sphere
    cam.setMinimumDistance(0);        //pour fixer la camera 
    cam.setMaximumDistance(475);
  } else if (keyCode == DOWN) {       //pour sortir de la grande sphere
    cam.setMinimumDistance(1200);     //pour fixer la camera 
    cam.setMaximumDistance(4000);
  }
}



////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////METHODE ATOME/////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

void Atome(int NbPoint, float radiusCercle, float radiusSphere, int stopRandom, int transparence, boolean interpoCouleur, boolean stroke) {

  PVector[] sphere1 = new PVector[NbPoint];        //tableaux regroupant tous les points des cercles
  PVector[] sphere2 = new PVector[NbPoint];
  PVector[] sphere3 = new PVector[NbPoint];
  float DeltaAngle = (2*PI)/NbPoint;

  for (int i=0; i<NbPoint; i++) {

    float currentAngle = i*DeltaAngle;
    float nextAngle = (i+1)*DeltaAngle;

    strokeWeight(4);
    PVector p1 = polarToCartesian(0, 0, radiusCercle, currentAngle);               //cercle horizontale
    p1.z = 0;
    PVector p2 = polarToCartesian(0, 0, radiusCercle, nextAngle);
    p2.z = 0;
    linePVector3D(p1, p2);
    sphere1[i] = p1;

    PVector p3 = polarToCartesian(0, 0, radiusCercle, currentAngle);               //cercle semi verticale
    p3.z = p1.y;
    PVector p4 = polarToCartesian(0, 0, radiusCercle, nextAngle);
    p4.z = p2.y;
    linePVector3D(p3, p4);
    sphere2[i] = p3;

    PVector p5 = polarToCartesian(0, 0, radiusCercle, currentAngle);               //cercle semi verticale
    p5.z = -p1.y;
    PVector p6 = polarToCartesian(0, 0, radiusCercle, nextAngle);
    p6.z = -p2.y;
    linePVector3D(p5, p6);
    sphere3[i] = p5;
  }

  // placement aleatoire des sphere sur les cercles
  randomSeed(stopRandom);
  int S1 = int(random(0, NbPoint));          //l'indice des tableaux
  int S2 = int(random(0, NbPoint));
  int S3 = int(random(0, NbPoint));


  Sphere(radiusSphere, NbPoint, sphere1[S1].x, sphere1[S1].y, sphere1[S1].z, transparence, interpoCouleur, stroke);
  Sphere(radiusSphere, NbPoint, sphere2[S2].x, sphere2[S2].y, sphere2[S2].z, transparence, interpoCouleur, stroke);
  Sphere(radiusSphere, NbPoint, sphere3[S3].x, sphere3[S3].y, sphere3[S3].z, transparence, interpoCouleur, stroke);
}


////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////METHODE ETOILE////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////


void Etoile(int NbPoint, int EcartPoint) {

  PVector[] PointArrayX = new PVector[NbPoint];
  PVector[] PointArrayY = new PVector[NbPoint];
  PVector[] PointArrayZ = new PVector[NbPoint];

  //******************forme interieure************************
  for (int i=0; i<NbPoint; i++) {
    PVector pX = new PVector(i*EcartPoint, 0, 0);
    PointArrayX[i] = pX;
    PVector pY = new PVector(0, i*EcartPoint, 0);
    PointArrayY[i] = pY;
    PVector pZ = new PVector(0, 0, i*EcartPoint);
    PointArrayZ[i] = pZ;
  }

  for (int i=0; i<NbPoint; i++) {
    linePVector3D(PointArrayX[i], PointArrayZ[NbPoint-(i+1)]);
    linePVector3D(PointArrayY[i], PointArrayZ[NbPoint-(i+1)]);
  }
  //******************************************


  //******************************************
  for (int i=0; i<NbPoint; i++) {
    PVector pX = new PVector(-i*EcartPoint, 0, 0);
    PointArrayX[i] = pX;
    PVector pY = new PVector(0, -i*EcartPoint, 0);
    PointArrayY[i] = pY;
    PVector pZ = new PVector(0, 0, i*EcartPoint);
    PointArrayZ[i] = pZ;
  }

  for (int i=0; i<NbPoint; i++) {
    linePVector3D(PointArrayX[i], PointArrayZ[NbPoint-(i+1)]);
    linePVector3D(PointArrayY[i], PointArrayZ[NbPoint-(i+1)]);
  }
  //******************************************

  //******************************************
  for (int i=0; i<NbPoint; i++) {
    PVector pX = new PVector(i*EcartPoint, 0, 0);
    PointArrayX[i] = pX;
    PVector pY = new PVector(0, i*EcartPoint, 0);
    PointArrayY[i] = pY;
    PVector pZ = new PVector(0, 0, -i*EcartPoint);
    PointArrayZ[i] = pZ;
  }

  for (int i=0; i<NbPoint; i++) {
    linePVector3D(PointArrayX[i], PointArrayZ[NbPoint-(i+1)]);
    linePVector3D(PointArrayY[i], PointArrayZ[NbPoint-(i+1)]);
  }
  //******************************************

  //******************************************
  for (int i=0; i<NbPoint; i++) {
    PVector pX = new PVector(-i*EcartPoint, 0, 0);
    PointArrayX[i] = pX;
    PVector pY = new PVector(0, -i*EcartPoint, 0);
    PointArrayY[i] = pY;
    PVector pZ = new PVector(0, 0, -i*EcartPoint);
    PointArrayZ[i] = pZ;
  }

  for (int i=0; i<NbPoint; i++) {
    linePVector3D(PointArrayX[i], PointArrayZ[NbPoint-(i+1)]);
    linePVector3D(PointArrayY[i], PointArrayZ[NbPoint-(i+1)]);
  }
  //******************************************

  //******************************************
  for (int i=0; i<NbPoint; i++) {
    PVector pX = new PVector(i*EcartPoint, 0, 0);
    PointArrayX[i] = pX;
    PVector pY = new PVector(0, i*EcartPoint, 0);
    PointArrayY[i] = pY;
  }

  for (int i=0; i<NbPoint; i++) {
    linePVector3D(PointArrayX[i], PointArrayY[NbPoint-(i+1)]);
  }
  //******************************************

  //******************************************
  for (int i=0; i<NbPoint; i++) {
    PVector pX = new PVector(-i*EcartPoint, 0, 0);
    PointArrayX[i] = pX;
    PVector pY = new PVector(0, i*EcartPoint, 0);
    PointArrayY[i] = pY;
  }

  for (int i=0; i<NbPoint; i++) {
    linePVector3D(PointArrayX[i], PointArrayY[NbPoint-(i+1)]);
  }
  //******************************************

  //******************************************
  for (int i=0; i<NbPoint; i++) {
    PVector pX = new PVector(i*EcartPoint, 0, 0);
    PointArrayX[i] = pX;
    PVector pY = new PVector(0, -i*EcartPoint, 0);
    PointArrayY[i] = pY;
  }

  for (int i=0; i<NbPoint; i++) {
    linePVector3D(PointArrayX[i], PointArrayY[NbPoint-(i+1)]);
  }
  //******************************************

  //******************************************
  for (int i=0; i<NbPoint; i++) {
    PVector pX = new PVector(-i*EcartPoint, 0, 0);
    PointArrayX[i] = pX;
    PVector pY = new PVector(0, -i*EcartPoint, 0);
    PointArrayY[i] = pY;
  }

  for (int i=0; i<NbPoint; i++) {
    linePVector3D(PointArrayX[i], PointArrayY[NbPoint-(i+1)]);
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////METHODE SPHERE////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////


void Sphere(float radius, int nbPoints, float centreX, float centreY, float centreZ, int transparence, boolean interpoCouleur, boolean stroke) {

  int nbSubDivZ = (nbPoints/2);  //divise par 2 car les points se situe sur tout le cercle et en divisant par 2 on enleve les doublons de z
  float[] RayonOfEllipse = new float[(nbSubDivZ/2)+1]; //divise par 4 car on as juste a savoir les rayons des cercles d'une demi sphere parce que c'est symétrique
  float[] ZOfEllipse = new float[(nbSubDivZ/2)+1];   //divise par 4 car on as juste a savoir les valeur de z des cercles d'une demi sphere car on aura juste un - pour la demi sphere du bas
  float DeltaAngle = (2*PI)/nbPoints;
  float divCouleur = 360/nbSubDivZ;
  float currentZ = 0;
  float nextZ = 0;
  float currentRadius = 0;
  float nextRadius = 0;

  //creation d'un demi arc de cercle fictif pour calculer les rayons et l'emplacement sur z de chaque cercle de la sphere
  for (int i=(nbSubDivZ/2); i>=0; i--) { // jusqu'a la taille des deux tableaux

    float currentAngle=i*DeltaAngle;
    PVector p1 = polarToCartesian(centreX, centreY, radius, currentAngle);
    PVector p2 = polarToCartesian(centreX, centreY, radius, currentAngle+(PI-(2*currentAngle))); // calcul la distance entre deux points symetriques par rapport a un arc de cercle
    float dist = sqrt(pow((p2.x - p1.x), 2)+pow((p2.y - p1.y), 2));

    RayonOfEllipse[i] = dist/2;
    ZOfEllipse[i] = p1.y - centreY;    // -centreY pour que les z commencent a partir de 0 et non de centreY
  }

  for (int i=0; i<nbPoints; i++) {
    float currentAngle = i*DeltaAngle;
    float nextAngle = (i+1)*DeltaAngle;
    float couleur = divCouleur;            // permet de remettre au debut pour l'interpolation de couleur
    int k = nbSubDivZ/2;  // pour que la creation de la sphere se fasse de bas en haut

    for (int j=0; j<nbSubDivZ; j++) {

      if (j<nbSubDivZ/2) {                // jusqu'a la moite de la sphere
        currentZ = ZOfEllipse[j];
        nextZ = ZOfEllipse[j+1];
        currentRadius = RayonOfEllipse[j];
        nextRadius = RayonOfEllipse[j+1];
      } else {
        currentZ = -ZOfEllipse[k];          // pour recoomencer le tableau au debut et mettre au negatif le z pour atteindre la partie inferieure du repere 
        nextZ = -ZOfEllipse[k-1];          
        currentRadius = RayonOfEllipse[k];   // pour recoomencer le tableau au debut
        nextRadius = RayonOfEllipse[k-1];
        k--;
      }

      PVector p1 = polarToCartesian(centreX, centreY, currentRadius, currentAngle);
      p1.z = centreZ + currentZ;

      PVector p2 = polarToCartesian(centreX, centreY, nextRadius, currentAngle);
      p2.z = centreZ + nextZ;

      PVector p3 = polarToCartesian(centreX, centreY, nextRadius, nextAngle);
      p3.z = centreZ + nextZ;

      PVector p4 = polarToCartesian(centreX, centreY, currentRadius, nextAngle);
      p4.z = centreZ + currentZ;

      if (interpoCouleur == true) {                      //pour faire une interpolation de couleur si l'utilisatrut le souhaite
        colorMode(HSB, 360, 100, 100, 100);
        fill(couleur, 100, 100, transparence); 
        if (stroke == true) {
          stroke(couleur, 100, 100, 100);
        } else {
          noStroke();
        }
        strokeWeight(1);
        colorMode(RGB, 255);                             //pour repasser le mode de couleur en RGB
      }

      beginShape();                                      //pour creer un polygone
      vertex(p1.x, p1.y, p1.z);
      vertex(p2.x, p2.y, p2.z);
      vertex(p3.x, p3.y, p3.z);
      vertex(p4.x, p4.y, p4.z);
      endShape(CLOSE);

      couleur = couleur + divCouleur;                    //pour passer aux couleurs differentes lors de l'interpolation de couleur
    }
  }
}

void linePVector3D(PVector p1, PVector p2) {              //pour creer des lignes en 3D
  stroke(255);
  line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
}

PVector polarToCartesian(float centreX, float centreY, float rayon, float angle) {        //pour convertir un points en coordonnee cartesienne
  return new PVector(centreX+rayon*cos(angle), centreY+rayon*sin(angle));
}