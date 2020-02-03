void texteMenu() {
  if (menu == true) {
    background(0);
    textSize(100);
    textAlign(CENTER);
    text("Snake", width/2, 300);
    textSize(70);
    text("Jouer !", width/2, 500);
    textSize(10);
    text("Fait par Théotime TERRIER, Anthony ROZEN et Marine FILLATRE", 830, 780);
    mousex=mouseX;
    mousey=mouseY;
  }
}

void texteModes() {
  if (modes == true)
  {
    textAlign(CENTER);
    background(0);
    textSize(70);
    text("Choix du mode", width/2, 150);
    textSize(40);
    text("Jeu classique", width/2, 300);
    text("Jeu du labyrinthe", width/2, 470);
    text("Jeu de combat ", width/2, 640);
    textSize(30);
    text("< Retour", 100, 50);
    text("Option", 900, 770);
    text("Quitter", 100, 770);
    if (mouseX>350 && mouseX<650 && mouseY>250 && mouseY<310)
    {
      textSize(25);
      text("Manger le plus", 780, 250);
      text("de pommes avec", 780, 300);
      text("ou sans temps !", 780, 350);
      line(670, 210, 905, 210);
      line(670, 210, 650, 260);
      line(905, 210, 905, 370);
      line(905, 370, 670, 370);
      line(670, 370, 650, 320);
      textSize(30);
    }
    if (mouseX>350 && mouseX<670 && mouseY>430 && mouseY<480)
    {
      textSize(25);
      text("Qui sera le meilleur ?", 160, 445);
      text("Toi ou le labyrinthe ?", 160, 495);
      line(20, 410, 290, 410);
      line(20, 510, 290, 510);
      line(20, 410, 20, 510);
      line(290, 410, 310, 430);
      line(290, 510, 310, 485);
      textSize(30);
    }
    if (mouseX>330 && mouseX<680 && mouseY>570 && mouseY<650)
    {
      textSize(25);
      line(670, 575, 915, 575);
      line(915, 575, 915, 685);
      line(670, 685, 915, 685);
      line(670, 575, 655, 605);
      line(670, 685, 655, 655);
      text("Essayer d'éliminer", 790, 615);
      text("vos adversaires !", 790, 665);
      textSize(30);
    }
  }
}
