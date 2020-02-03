void keyPressed() {

  //////////////////////////// LE PREMIER JOUEUR ////////////////////////////////

  if (keyPressed)
  {
    if (key=='z' | key=='Z')       //le snake monte
    {
      if (s1.direction != 2)
      {
        s1.direction = 0;
      }
    }
    if (key=='q' | key=='Q')             //le snake va a gauche
    {
      if (s1.direction != 1)
      {
        s1.direction = 3;
      }
    }
    if (key=='d' | key=='D')             //le snake va a droite
    {
      if (s1.direction != 3)
      {
        s1.direction = 1;
      }
    }
    if (key=='s' | key=='S')             //le snake dessend
    {
      if (s1.direction != 0)
      {
        s1.direction = 2;
      }
    }
  }


  //////////////////////////// LE DEUXIEME JOUEUR ////////////////////////////////


  if (keyPressed)
  {
    if (key=='o' | key=='O')       //le snake monte
    {
      if (s2.direction != 2)
      {
        s2.direction = 0;
      }
    }
    if (key=='k' | key=='K')             //le snake va a gauche
    {
      if (s2.direction != 1)
      {
        s2.direction = 3;
      }
    }
    if (key=='m' | key=='M')             //le snake va a droite
    {
      if (s2.direction != 3)
      {
        s2.direction = 1;
      }
    }
    if (key=='l' | key=='L')             //le snake dessend
    {
      if (s2.direction != 0)
      {
        s2.direction = 2;
      }
    }
  }





  //////////////////////////// LE TROISIEME JOUEUR ////////////////////////////////


  switch(keyCode) {
  case UP:
    if (s3.direction != 2) {
      s3.direction = 0;
    }
    break;          
  case LEFT:             
    if (s3.direction != 1) {
      s3.direction = 3;
    }
    break;
  case RIGHT:            
    if (s3.direction != 3) {
      s3.direction = 1;
    }
    break;
  case DOWN:            
    if (s3.direction != 0) {
      s3.direction = 2;
    }
    break;
  }

  //////////////////////////// LE QUATRIEME JOUEUR ////////////////////////////////

  if (keyPressed)
  {
    if (key=='8')       //le snake monte
    {
      if (s4.direction != 2)
      {
        s4.direction = 0;
      }
    }
    if (key=='4')             //le snake va a gauche
    {
      if (s4.direction != 1)
      {
        s4.direction = 3;
      }
    }
    if (key=='6')             //le snake va a droite
    {
      if (s4.direction != 3)
      {
        s4.direction = 1;
      }
    }
    if (key=='5')             //le snake dessend
    {
      if (s4.direction != 0)
      {
        s4.direction = 2;
      }
    }
  }
}

/////////////////////////////BONUS////////////////////////////////////////

void keyReleased() {
  if (key=='a' || key=='A') {
    utilisationBonus(s1);
  }
  if ((key=='i' || key=='I')) {
    utilisationBonus(s2);
  }
  if (keyCode==SHIFT) {
    utilisationBonus(s3);
  }
  if (key=='7') {
    utilisationBonus(s4);
  }

//  if (key=='&') {
//    s1.bonus=1;
//    s1.nombre=1;
//  }
//  if (key=='é') {
//    s1.bonus=1;
//    s1.nombre=3;
//  }
//  if (key=='"') {
//    s1.bonus=3;
//    s1.nombre=1;
//  }
//  if (key=='(') {
//    s1.bonus=5;
//    s1.nombre=1;
//  }
//  if (key=='-') {
//    s1.bonus=6;
//    s1.nombre=1;
//  }
//  if (key=='è') {
//    s1.bonus=7;
//    s1.nombre=1;
//  }
//  if (key=='_') {
//    s1.bonus=8;
//    s1.nombre=1;
//  }
//  if (key=='ç') {
//    s1.score=50;
//    s2.score=50;
//  }
}
