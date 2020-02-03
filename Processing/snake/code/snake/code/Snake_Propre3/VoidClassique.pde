void ecran_demarage_classique()
{
  if (ecran_demarage_classique)
  {
    interfaceLab();
    fill(127, 127, 127, 127);            // gris semi-transparent
    rect(0, 0, 1000, 800);
    stroke(0);
    textSize(30);
    noFill();
    strokeWeight(5);
    ellipse(width/2, 330, 150, 150);    // |
    line(470, 280, 470, 380);           // | bouton play
    line(470, 280, 555, 330);           // |
    line(470, 380, 555, 330);           // |

    if (sqrt(pow(mouseX - 500, 2) + pow(mouseY - 330, 2)) < 75)
    {
      cursor(HAND); // Affiche une main
    } else
    {
      cursor(ARROW); // Affiche une flèche
    }


    if (nombreJoueur>=1)
    {
      dessinerSnake(s1);
      strokeWeight(5);
      line(65, 65, 125, 125);    // |
      line(65, 65, 75, 65);      // | flèche    
      line(65, 65, 65, 75);      // | 

      strokeWeight(1);
      fill(0);
      rectMode(CORNER);
      rect(105, 135, 40, 40);    // | 
      rect(105, 180, 40, 40);    // | carré
      rect(60, 180, 40, 40);     // | 
      rect(150, 180, 40, 40);    // |

      fill(255);
      text("Z", 125, 152);       // |
      text("S", 125, 198);       // | touche déplacement      
      text("Q", 80, 198);        // |
      text("D", 170, 198);       // |

      fill(0);
      text(f, 125, 236);
    }

    if (nombreJoueur>=2)
    {
      dessinerSnake(s2);
      strokeWeight(5);
      line(935, 65, 875, 125);   // |
      line(935, 65, 925, 65);    // | flèche
      line(935, 65, 935, 75);    // |

      strokeWeight(1);
      fill(0);
      rectMode(CORNER);      
      rect(855, 135, 40, 40);    // |    
      rect(855, 180, 40, 40);    // | carré
      rect(810, 180, 40, 40);    // |
      rect(900, 180, 40, 40);    // |

      fill(255);                                       
      text("O", 875, 152);       // |            
      text("L", 875, 198);       // | touche déplacement 
      text("K", 830, 198);       // |            
      text("M", 915, 198);       // |            

      fill(0);
      text(g, 875, 236);
    }

    if (nombreJoueur>=3)
    {
      dessinerSnake(s3);
      strokeWeight(5);                                       
      line(65, 555, 125, 495);   // |            
      line(65, 555, 65, 545);    // | flèche      
      line(65, 555, 75, 555);    // | 

      strokeWeight(1);
      fill(0);                                        
      rectMode(CORNER);
      rect(105, 445, 40, 40);    // |           
      rect(105, 400, 40, 40);    // | carré  
      rect(60, 445, 40, 40);     // |            
      rect(150, 445, 40, 40);    // |            

      fill(255);
      text("▲", 125, 415);       // |            
      text("▼", 125, 460);       // | touche déplacement    
      text("◄", 80, 460);        // |            
      text("►", 170, 460);       // |            

      fill(0);
      text(h, 125, 375);
    }

    if (nombreJoueur>=4)
    {
      dessinerSnake(s4);
      strokeWeight(5);                                             
      line(935, 555, 875, 495);  // |            
      line(935, 555, 935, 545);  // | flèche  
      line(935, 555, 925, 555);  // |             

      strokeWeight(1);
      fill(0);                                        
      rectMode(CORNER);
      rect(855, 445, 40, 40);    // |           
      rect(855, 400, 40, 40);    // | carré   
      rect(810, 445, 40, 40);    // |            
      rect(900, 445, 40, 40);    // |          

      fill(255);                                       

      text("8", 875, 415);       // |            
      text("5", 875, 460);       // | touche déplacement   
      text("4", 830, 460);       // |            
      text("6", 919, 460);       // |            

      fill(0);
      text(k, 875, 375);
    }
  }
}






void jeu_classique()
{
  if (jeu_classique)
  {
    if (mouseX>0 && mouseX<1000 && mouseY>0 && mouseY<800)
    {
      cursor(ARROW); // Affiche une main
    }
    interfaceLab();
    dessinerPomme(pomme);

    if (nombreJoueur==1)
    {
      dessinerSnake(s1);
      snake_pomme(s1, pomme);
      deplacement(s1);

      s1.joue=true;

      s2.positionX[0]=-10;
      s2.positionY[0]=-10;
      s3.positionX[0]=-20;
      s3.positionY[0]=-20;
      s4.positionX[0]=-30;
      s4.positionY[0]=-30;
      GAME_OVER(s1);
    }

    if (nombreJoueur==2)
    {
      dessinerSnake(s1);
      snake_pomme(s1, pomme);
      deplacement(s1);

      dessinerSnake(s2);
      snake_pomme(s2, pomme);
      deplacement(s2);

      s1.joue=true;
      s2.joue=true;

      s3.positionX[0]=-20;
      s3.positionY[0]=-20;
      s4.positionX[0]=-30;
      s4.positionY[0]=-30;
      GAME_OVER(s1);
      GAME_OVER(s2);
    }

    if (nombreJoueur==3)
    {
      dessinerSnake(s1);
      snake_pomme(s1, pomme);
      deplacement(s1);

      dessinerSnake(s2);
      snake_pomme(s2, pomme);
      deplacement(s2);

      dessinerSnake(s3);
      snake_pomme(s3, pomme);
      deplacement(s3);

      s1.joue=true;
      s2.joue=true;
      s3.joue=true;

      s4.positionX[0]=-30;
      s4.positionY[0]=-30;
      GAME_OVER(s1);
      GAME_OVER(s2);
      GAME_OVER(s3);
    }

    if (nombreJoueur==4)
    {
      dessinerSnake(s1);
      snake_pomme(s1, pomme);
      deplacement(s1);

      dessinerSnake(s2);
      snake_pomme(s2, pomme);
      deplacement(s2);

      dessinerSnake(s3);
      snake_pomme(s3, pomme);
      deplacement(s3);

      dessinerSnake(s4);
      snake_pomme(s4, pomme);
      deplacement(s4);

      s1.joue=true;
      s2.joue=true;
      s3.joue=true;
      s4.joue=true;

      GAME_OVER(s1);
      GAME_OVER(s2);
      GAME_OVER(s3);
      GAME_OVER(s4);
    }
  }
}


void GAME_OVER (Snake s)
{
  textAlign(CENTER, CENTER);
  for (int i=0; i<50; i++)
  {
    if (s.positionX[0]<0 | s.positionY[0]<0 | s.positionX[0]>=95 | s.positionY[0]>=57)
    {
      s.joue=false;
      s.v=0;
      s.positionX[i] = floor(random(-10000000));
      s.positionY[i] = floor(random(-10000000));

      if ((s1.joue==false && s2.joue==false && s3.joue==false) | (s2.joue==false && s3.joue==false && s4.joue==false) | (s3.joue==false && s4.joue==false && s1.joue==false) | (s4.joue==false && s1.joue==false && s2.joue==false)) {
        ecran_GAME_OVER();
      }
    }
  }
}


void GAME_OVER2 (Snake s1, Snake s2, Snake s3, Snake s4)
{
  textAlign(CENTER, CENTER);

  for (int r=1; r<s1.score+4; r++)
  {
    if ((s1.positionX[0] == s1.positionX[r] && s1.positionY[0] == s1.positionY[r]) | (s1.positionX[0] == s2.positionX[r] && s1.positionY[0] == s2.positionY[r]) | (s1.positionX[0] == s3.positionX[r] && s1.positionY[0] == s3.positionY[r]) | (s1.positionX[0] == s4.positionX[r] && s1.positionY[0] == s4.positionY[r]) | (s1.positionX[0] == s2.positionX[0] && s1.positionY[0] == s2.positionY[0]) | (s1.positionX[0] == s3.positionX[0] && s1.positionY[0] == s3.positionY[0]) | (s1.positionX[0] == s4.positionX[0] && s1.positionY[0] == s4.positionY[0])) 
    {
      for (int i=0; i<50; i++)
      {
        s1.joue=false;
        s1.v=0;
        s1.positionX[i] = floor(random(-10000000));
        s1.positionY[i] = floor(random(-10000000));

        if ((s1.joue==false && s2.joue==false && s3.joue==false) | (s2.joue==false && s3.joue==false && s4.joue==false) | (s3.joue==false && s4.joue==false && s1.joue==false) | (s4.joue==false && s1.joue==false && s2.joue==false)) {
          ecran_GAME_OVER();
        }
      }
    }
  }

  for (int r=1; r<s2.score+4; r++)
  {
    if ((s2.positionX[0] == s2.positionX[r] && s2.positionY[0] == s2.positionY[r]) | (s2.positionX[0] == s1.positionX[r] && s2.positionY[0] == s1.positionY[r]) | (s2.positionX[0] == s3.positionX[r] && s2.positionY[0] == s3.positionY[r]) | (s2.positionX[0] == s4.positionX[r] && s2.positionY[0] == s4.positionY[r]) | (s2.positionX[0] == s1.positionX[0] && s2.positionY[0] == s1.positionY[0]) | (s2.positionX[0] == s3.positionX[0] && s2.positionY[0] == s3.positionY[0]) | (s2.positionX[0] == s4.positionX[0] && s2.positionY[0] == s4.positionY[0]))  
    {
      for (int i=0; i<50; i++)
      {
        s2.joue=false;
        s2.v=0;
        s2.positionX[i] = floor(random(-10000000));
        s2.positionY[i] = floor(random(-10000000));

        if ((s1.joue==false && s2.joue==false && s3.joue==false) | (s2.joue==false && s3.joue==false && s4.joue==false) | (s3.joue==false && s4.joue==false && s1.joue==false) | (s4.joue==false && s1.joue==false && s2.joue==false)) {
          ecran_GAME_OVER();
        }
      }
    }
  }

  for (int r=1; r<s3.score+4; r++)
  {
    if ((s3.positionX[0] == s3.positionX[r] && s3.positionY[0] == s3.positionY[r]) | (s3.positionX[0] == s1.positionX[r] && s3.positionY[0] == s1.positionY[r]) | (s3.positionX[0] == s2.positionX[r] && s3.positionY[0] == s2.positionY[r]) | (s3.positionX[0] == s4.positionX[r] && s3.positionY[0] == s4.positionY[r]) | (s3.positionX[0] == s1.positionX[0] && s3.positionY[0] == s1.positionY[0]) | (s3.positionX[0] == s2.positionX[0] && s3.positionY[0] == s2.positionY[0]) | (s3.positionX[0] == s4.positionX[0] && s3.positionY[0] == s4.positionY[0])) 
    {
      for (int i=0; i<50; i++)
      {
        s3.joue=false;
        s3.v=0;
        s3.positionX[i] = floor(random(-10000000));
        s3.positionY[i] = floor(random(-10000000));

        if ((s1.joue==false && s2.joue==false && s3.joue==false) | (s2.joue==false && s3.joue==false && s4.joue==false) | (s3.joue==false && s4.joue==false && s1.joue==false) | (s4.joue==false && s1.joue==false && s2.joue==false)) {
          ecran_GAME_OVER();
        }
      }
    }
  }

  for (int r=1; r<s4.score+4; r++)
  {
    if ((s4.positionX[0] == s4.positionX[r] && s4.positionY[0] == s4.positionY[r]) | (s4.positionX[0] == s1.positionX[r] && s4.positionY[0] == s1.positionY[r]) | (s4.positionX[0] == s2.positionX[r] && s4.positionY[0] == s2.positionY[r]) | (s4.positionX[0] == s3.positionX[r] && s4.positionY[0] == s3.positionY[r]) | (s4.positionX[0] == s1.positionX[0] && s4.positionY[0] == s1.positionY[0]) | (s4.positionX[0] == s2.positionX[0] && s4.positionY[0] == s2.positionY[0]) | (s4.positionX[0] == s3.positionX[0] && s4.positionY[0] == s3.positionY[0])) 
    {
      for (int i=0; i<50; i++)
      {
        s4.joue=false;
        s4.v=0;
        s4.positionX[i] = floor(random(-10000000));
        s4.positionY[i] = floor(random(-10000000));

        if ((s1.joue==false && s2.joue==false && s3.joue==false) | (s2.joue==false && s3.joue==false && s4.joue==false) | (s3.joue==false && s4.joue==false && s1.joue==false) | (s4.joue==false && s1.joue==false && s2.joue==false)) {
          ecran_GAME_OVER();
        }
      }
    }
  }
}

void ecran_GAME_OVER()
{
  ecran_GAME_OVER = true;
  ecran_demarage_classique = false;
  jeu_classique = false;
  background(0);
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text("GAME OVER", 500, 200);
  textSize(20);
  text("(cliquer sur l'image pour revenir au paramètres)", 500, 225);
  textSize(30);
  fill(255);
  if (nombreJoueur>=1)
  {
    text(f+" : "+s1.score, 105, 710);         // PLAYER 1
  }
  if (nombreJoueur>=2)
  {   
    text(g+" : "+s2.score, 865, 710);         // PLAYER 2
  }
  if (nombreJoueur>=3)
  {    
    text(h+" : "+s3.score, 105, 760);          // PLAYER 3
  }
  if (nombreJoueur>=4)
  {   
    text(k+" : "+s4.score, 865, 760);         // PLAYER 4
  }
  image(triste, 500, 400, 300, 300);
  //noLoop();
  text("< Retour au menu", 150, 50);
}

