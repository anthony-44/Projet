void mouseReleased() {

  if (labyrintheParametre) {
    if (mouseX>820 && mouseX<1000 && mouseY>0 && mouseY<65) {
      labyrintheParametre = false;
      jeuLabyrinthe = true;
      startLab = true;
    }

    if (mouseX>740 && mouseX<780 && mouseY>270 && mouseY<310 && nombreJoueur>1)
    {
      nombreJoueur = nombreJoueur-1;
    }
    if (mouseX>820 && mouseX<860 && mouseY>270 && mouseY<310 && nombreJoueur<4)
    {
      nombreJoueur = nombreJoueur+1;
    }
    if (mouseX>730 && mouseX<770 && mouseY>420 && mouseY<460 && temps>30)
    {
      temps=temps-30;
    }
    if (mouseX>830 && mouseX<870 && mouseY>420 && mouseY<460 && temps<210)
    {
      temps=temps+30;
    } 
    if (mouseX>635 && mouseX<750 && mouseY>570 && mouseY<610 && niveau>1)
    {
      niveau=niveau-1;
    }
    if (mouseX>850 && mouseX<950 && mouseY>570 && mouseY<610 && niveau<6)
    {
      niveau=niveau+1;
    }
  }


  if (combatParametre) {
    if (mouseX>820 && mouseX<1000 && mouseY>0 && mouseY<65) {
      combatParametre = false;
      jeuCombat = true;
      startCombat = true;
      s1.vict=0;
      s2.vict=0;
      s3.vict=0;
      s4.vict=0;
    }
    if (mouseX>740 && mouseX<780 && mouseY>225 && mouseY<260 && nombreJoueur>2)
    {
      nombreJoueur = nombreJoueur-1;
    }
    if (mouseX>820 && mouseX<860 && mouseY>225 && mouseY<260 && nombreJoueur<4)
    {
      nombreJoueur = nombreJoueur+1;
    }
    if (mouseX>730 && mouseX<770 && mouseY>325 && mouseY<350 && temps>30)
    {
      temps=temps-30;
    }
    if (mouseX>830 && mouseX<870 && mouseY>325 && mouseY<350 && temps<210)
    {
      temps=temps+30;
    }
    if (mouseX>740 && mouseX<780 && mouseY>425 && mouseY<455 && score>10)
    {
      score=score-10;
    }
    if (mouseX>820 && mouseX<860 && mouseY>425 && mouseY<455 && score<110)
    {
      score=score+10;
    }
    if (mouseX>740 && mouseX<780 && mouseY>525 && mouseY<555 && nombreMatch>1)
    {
      nombreMatch = nombreMatch-1;
    }
    if (mouseX>820 && mouseX<860 && mouseY>525 && mouseY<555 && nombreMatch<11)
    {
      nombreMatch = nombreMatch+1;
    }
    if (mouseX>740 && mouseX<780 && mouseY>625 && mouseY<655 && Nombrepomme>1)
    {
      Nombrepomme = Nombrepomme-1;
    }
    if (mouseX>820 && mouseX<860 && mouseY>625 && mouseY<655 && Nombrepomme<10)
    {
      Nombrepomme = Nombrepomme+1;
    }
    if (mouseX>740 && mouseX<780 && mouseY>725 && mouseY<755 && Nombrebonus>1)
    {
      Nombrebonus = Nombrebonus-1;
    }
    if (mouseX>820 && mouseX<860 && mouseY>725 && mouseY<755 && Nombrebonus<6)
    {
      Nombrebonus = Nombrebonus+1;
    }
    
  }


  if (classiqueParametre) {
    if (mouseX>820 && mouseX<1000 && mouseY>0 && mouseY<65) {
      classiqueParametre = false;
      ecran_demarage_classique = true;
    }
    if (mouseX>740 && mouseX<780 && mouseY>370 && mouseY<405 && nombreJoueur>1)
    {
      nombreJoueur = nombreJoueur-1;
    }
    if (mouseX>820 && mouseX<860 && mouseY>370 && mouseY<405 && nombreJoueur<4)
    {
      nombreJoueur = nombreJoueur+1;
    }
    if (mouseX>740 && mouseX<780 && mouseY>525 && mouseY<555 &&  Nombrepomme>1)
    {
      Nombrepomme=Nombrepomme-1;
    }
    if (mouseX>820 && mouseX<860 && mouseY>525 && mouseY<555 &&  Nombrepomme<10)
    {
      Nombrepomme=Nombrepomme+1;
    }
  }
  
  if (ecran_demarage_classique) 
  {
    if (sqrt(pow(mouseX - width/2, 2) + pow(mouseY - 330, 2)) < 75)
    {
      ecran_demarage_classique = false;
      jeu_classique = true;
      startClass = true;
    }
  }


  if (modes) {
    if (mouseX>350 && mouseX<650 && mouseY>250 && mouseY<310)
    {
      modes = false;
      classiqueParametre = true;
    }
    if (mouseX>350 && mouseX<670 && mouseY>430 && mouseY<480)
    {
      modes = false;
      labyrintheParametre = true;
    }
    if (mouseX>330 && mouseX<680 && mouseY>570 && mouseY<650)
    {
      modes = false;
      combatParametre = true;
    }
    if (mouseX>0 && mouseX<250 && mouseY>0 && mouseY<100)
    {
      modes = false;
      menu = true;
    }
    if (mouseX>840 && mouseX<960 && mouseY>740 && mouseY<780)
    {
      modes = false;
      Option = true;
    }
    if (mouseX>40 && mouseX<160 && mouseY>740 && mouseY<780)
    {
      exit();
    }
  }

  if (Option) {
    if (mouseX>270 && mouseX<730 && mouseY>275 && mouseY<310) {
      f=new Dialog().readString("Saisir le nom du player 1");
    }
    if (mouseX>270 && mouseX<730 && mouseY>425 && mouseY<460) {
      g=new Dialog().readString("Saisir le nom du player 2");
    }
    if (mouseX>270 && mouseX<730 && mouseY>575 && mouseY<610) {
      h=new Dialog().readString("Saisir le nom du player 3");
    }
    if (mouseX>270 && mouseX<730 && mouseY>725 && mouseY<760) {
      k=new Dialog().readString("Saisir le nom du player 4");
    }
    if (mouseX>0 && mouseX<250 && mouseY>0 && mouseY<100)
    {
      modes = true;
      Option = false;
    }
  }

  if (menu) {
    if (mouseX>340 && mouseX<650 && mouseY>430 && mouseY<530) {
      menu = false;
      modes = true;
    }
  }


  if (labyrintheParametre) {

    if (mouseX>0 && mouseX<250 && mouseY>0 && mouseY<100)
    {
      labyrintheParametre = false;
      modes = true;
    }
  }


  if (combatParametre) {
    if (mouseX>0 && mouseX<250 && mouseY>0 && mouseY<100)
    {
      combatParametre = false;
      modes = true;
    }
  }


  if (classiqueParametre) {
    if (mouseX>0 && mouseX<250 && mouseY>0 && mouseY<100)
    {
      classiqueParametre = false;
      modes = true;
    }
  }

  if (jeuLabyrinthe) {
    if (mouseX>420 && mouseY>640 && mouseX<580 && mouseY<800 && s1.direction==4 && s2.direction==4 && s3.direction==4 && s4.direction==4) {
      startLab=true;
    }
  }

  if (ecran_GAME_OVER) {
    if (mouseX>0 && mouseX<300 && mouseY>0 && mouseY<60) {
      ecran_GAME_OVER = false;
      jeu_classique = false;
      modes = true;
    }

    if (sqrt(pow(mouseX - 650, 2) + pow(mouseY - 550, 2)) < 140)
    {
      ecran_GAME_OVER = false;
      jeu_classique = false;
      classiqueParametre = true;
    }
  }
}

