void musique() {
  if (menu || modes || classiqueParametre || labyrintheParametre || combatParametre) {
    if (u!=0) {
      u=0;
      musique[1].close();
    }
  }
  if (jeuLabyrinthe || jeu_classique || jeuCombat) {
    if (u!=1) {
      u=1;
      musique[0].close();
    }
  }
}

