/*  
 *  Auteurs: ROZEN Anthony, GUERIN Antoine
 *  Date: 26/04/19
 *  
 *
*/
#ifndef LISTE_HPP
#define LISTE_HPP

#include <iostream>
#include <string>
#include <vector>
#include <unordered_map>

class bloc {
public:
  // role : constructeur d'un bloc vide
  bloc();

  // role : destructeur
  ~bloc();

  // role : declarer et initialiser la variable c avec la valeur i
  // Precondition : la table de hachage est mise en paramètre de SDA d'un bloc 
  void insererVar(std::string c,int i);


  // role : retourne vrai si le bloc est vide
  bool est_vide();


  // role : retourne vrai si la variable var est dans le bloc
  bool estDans(std::string var);
 
 
  // role : retourne la valeur de la variable de la ligne
  // Precondition : la table de hachage est mise en paramètre de SDA d'un bloc 
  int affichage(std::string var);

  // role : modifie la valeur de la variable passe en parametre avec sa nouvellle valeur
  //Precondition : la variable doit etre presente dans le bloc
  void modifier(std::string var, int valeur);

  // role : affiche les variables du tableau
  void affichageTab();

private:
    std::unordered_map<std::string,int> col;	//table de hachage
	std::vector<std::string> variable;			//tableau dynamique
};

#endif
