void classiqueParametre() {
  if (classiqueParametre == true)
  {
    textAlign(CENTER);
    background(0);
    textSize(50);
    text("Paramètres du jeu classique", width/2, 150);
    textSize(30);
    text("Nombre de joueurs", 250, 400);
    text("< "+nombreJoueur+" >", 800, 400);
    text("Nombre de pommes", 250, 550);
    text("< "+Nombrepomme+" >", 800, 550);
    text("< Retour", 100, 50);
    image(pommeImage, 850, 18);
    text("J   UER >", 915, 50);
  }
}

///////////////////////////////////////////////////////////////////////////////////////////


void combatParametre() {
  if (combatParametre == true)
  {
    textAlign(CENTER);
    if (nombreJoueur == 1) {
      nombreJoueur = 2;
    }
    background(0);
    textSize(50);
    text("Paramètres du jeu de combat", width/2, 150);
    textSize(30);
    text("Nombre de joueurs", 250, 250);
    text("< "+nombreJoueur+" >", 800, 250);
    text("Temps de la partie", 250, 350);
    text("< "+temps+"s >", 800, 350);
    text("Score maximum", 250, 450);
    text("< "+score+" >", 800, 450);
    text("Nombres de matchs gagnants", 250, 550);
    text("< "+nombreMatch+" >", 800, 550);
    text("Nombre de pommes", 250, 650);
    text("< "+Nombrepomme+" >", 800, 650);
    text("Nombre de bonus", 250, 750);
    text("< "+Nombrebonus+" >", 800, 750);
    text("< Retour", 100, 50);
    image(pommeImage, 850, 18);
    text("J   UER >", 915, 50);
    if (temps==210) {
      background(0);
      textSize(50);
      text("Paramètres du jeu de combat", width/2, 150);
      textSize(30);
      text("Nombre de joueurs", 250, 250);
      text("< "+nombreJoueur+" >", 800, 250);
      text("Temps de la partie", 250, 350);
      text("< ∞ >", 800, 350);
      if (score==110) {
        text("Score maximum", 250, 450);
        text("< ∞ >", 800, 450);
      } else {
        text("Score maximum", 250, 450);
        text("< "+score+" >", 800, 450);
      }
      if (nombreMatch==11) {
        text("Nombres de matchs gagnants", 250, 550);
        text("< ∞ >", 800, 550);
      } else {
        text("Nombres de matchs gagnants", 250, 550);
        text("< "+nombreMatch+" >", 800, 550);
      }
      text("Nombre de pommes", 250, 650);
      text("< "+Nombrepomme+" >", 800, 650);
      text("Nombre de bonus", 250, 750);
      text("< "+Nombrebonus+" >", 800, 750);
      text("< Retour", 100, 50);
      image(pommeImage, 850, 18);
      text("J   UER >", 915, 50);
    }
    if (score==110) {
      background(0);
      textSize(50);
      text("Paramètres du jeu de combat", width/2, 150);
      textSize(30);
      text("Nombre de joueurs", 250, 250);
      text("< "+nombreJoueur+" >", 800, 250);
      if (temps==210) {
        text("Temps de la partie", 250, 350);
        text("< ∞ >", 800, 350);
      } else {
        text("Temps de la partie", 250, 350);
        text("< "+temps+"s >", 800, 350);
      }
      text("Score maximum", 250, 450);
      text("< ∞ >", 800, 450);
      if (nombreMatch==11) {
        text("Nombres de matchs gagnants", 250, 550);
        text("< ∞ >", 800, 550);
      } else {
        text("Nombres de matchs gagnants", 250, 550);
        text("< "+nombreMatch+" >", 800, 550);
      }
      text("Nombre de pommes", 250, 650);
      text("< "+Nombrepomme+" >", 800, 650);
      text("Nombre de bonus", 250, 750);
      text("< "+Nombrebonus+" >", 800, 750);
      text("< Retour", 100, 50);
      image(pommeImage, 850, 18);
      text("J   UER >", 915, 50);
    }
    if (nombreMatch==11) {
      background(0);
      textSize(50);
      text("Paramètres du jeu de combat", width/2, 150);
      textSize(30);
      text("Nombre de joueurs", 250, 250);
      text("< "+nombreJoueur+" >", 800, 250);
      if (temps==210) {
        text("Temps de la partie", 250, 350);
        text("< ∞ >", 800, 350);
      } else {
        text("Temps de la partie", 250, 350);
        text("< "+temps+"s >", 800, 350);
      }
      if (score==110) {
        text("Score maximum", 250, 450);
        text("< ∞ >", 800, 450);
      } else {
        text("Score maximum", 250, 450);
        text("< "+score+" >", 800, 450);
      }
      text("Nombres de matchs gagnants", 250, 550);
      text("< ∞ >", 800, 550);
      text("Nombre de pommes", 250, 650);
      text("< "+Nombrepomme+" >", 800, 650);
      text("Nombre de bonus", 250, 750);
      text("< "+Nombrebonus+" >", 800, 750);
      text("< Retour", 100, 50);
      image(pommeImage, 850, 18);
      text("J   UER >", 915, 50);
    }
  }
}

///////////////////////////////////////////////////////////////////////////////////////////


void labyrintheParametre() {
  textAlign(CENTER);
  if (labyrintheParametre == true)
  {
    background(0);
    textSize(50);
    text("Paramètres du jeu du labyrinthe", width/2, 150);
    textSize(30);
    text("Nombre de joueurs", 250, 300);
    text("< "+nombreJoueur+" >", 800, 300);
    text("Chrono d'un niveau", 250, 450);
    text("< "+temps+"s >", 800, 450);
    text("Difficulté du niveau", 250, 600);
    if (niveau==1) {
      text("< Débutant >", 800, 600);
    }
    if (niveau==2) {
      text("< Amateur >", 800, 600);
    }
    if (niveau==3) {
      text("< Confirmé >", 800, 600);
    }
    if (niveau==4) {
      text("< Expert >", 800, 600);
    }
    if (niveau==5) {
      text("< WARRIOR >", 800, 600);
    }
    if (niveau==6) {
      text("< CHUCK NORRIS >", 800, 600);
    }
    text("< Retour", 100, 50);
    image(pommeImage, 850, 18);
    text("J   UER >", 915, 50);
    if (temps==210) {
      background(0);
      textSize(50);
      text("Paramètres du jeu du labyrinthe", width/2, 150);
      textSize(30);
      text("Nombre de joueurs", 250, 300);
      text("< "+nombreJoueur+" >", 800, 300);
      text("Chrono d'un niveau", 250, 450);
      text("< ∞ >", 800, 450);
      text("Difficulté du niveau", 250, 600);
      if (niveau==1) {
        text("< Débutant >", 800, 600);
      }
      if (niveau==2) {
        text("< Amateur >", 800, 600);
      }
      if (niveau==3) {
        text("< Confirmé >", 800, 600);
      }
      if (niveau==4) {
        text("< Expert >", 800, 600);
      }
      if (niveau==5) {
        text("< WARRIOR >", 800, 600);
      }
      if (niveau==6) {
        text("< CHUCK NORRIS >", 800, 600);
      }
      text("< Retour", 100, 50);
      image(pommeImage, 850, 18);
      text("J   UER >", 915, 50);
    }
  }
}

