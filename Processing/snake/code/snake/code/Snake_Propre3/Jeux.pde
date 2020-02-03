void classique() {
  ecran_demarage_classique();
  jeu_classique ();
  keyPressed();
  GAME_OVER2(s1, s2, s3, s4);
  println("Vitesse snake 1: "+s1.v+" ---- Vitesse snake 2: "+s2.v+" ---- Vitesse snake 3: "+s3.v+" ---- Vitesse snake 4: "+s4.v);
}

void labyrinthe() { 
  keyPressed();

  interfaceLab();
  refresh();

  deplacement(s1);
  deplacement(s2);
  deplacement(s3);
  deplacement(s4);

  dessinerBloc(blocs);
  dessinerObjectif(fin);
  dessinerSnake(s1);
  dessinerSnake(s2);
  dessinerSnake(s3);
  dessinerSnake(s4);
  
  victoireLab();
  defaiteLab();
}

void combat() {
  if (finDuJeu==false) {
    background(200);
    deplacementCombat(); //Calcule les deplacements
    recoltePommeBonus(); //Gere les récoltes
    dessinCombat();      //Dessine le jeu
    degatCombat();       //Degats des bonus (pas tous)
    score();             //Victoire au score
    desactiverBonus();   //Désactive les bonus quand le temps est terminé
    horsJeu();           //Enlève les joueurs ayant perdu
  }
  timerJeu();
  afficherTimer();
  victoireDefaite();
  println(temps);
}

