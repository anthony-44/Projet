/*  
 *  Auteurs: ROZEN Anthony, GUERIN Antoine
 *  Date: 26/04/19
 *  
 *
*/
#include <iostream>
#include <string>
#include <vector>
#include "Structure.hpp"
#include "bloc.hpp"

// role : constructeur d'une Structure vide
Structure::Structure() {
	victor = {};
}

// role : destructeur
Structure::~Structure() {
}

// role : retourne la valeur de la variable de la ligne 
int Structure::accesVarDansBloc(std::string var) {
	int i = victor.size();
	bool afficher = false;
	while (afficher == false && i!= 0) {
		if(victor[i-1].estDans(var) == true) {
			afficher = true;
		}else{
			i = i - 1;
		}
	}
	
	return victor[i-1].affichage(var);
}

// role : modifie la valeur de la variable passe en paramètre avec sa nouvellle valeur
void Structure::ModifierValeurVariable(std::string var, int valeur){
	int i = victor.size();
	bool afficher = false;
	while (afficher == false && i!= 0) {
		if(victor[i-1].estDans(var) == true) {
			afficher = true;
		}else{
			i = i - 1;
		}
	}
	if(i != 0){
		victor[i-1].modifier(var,valeur);
	}else{
		std::cout << std::string(6, '\t') << "La variable n'existe pas dans la structure" << std::endl;
	}
}

// role : ajoute un nouveau bloc passe en paramètre
void Structure::ajoutBloc() {
    bloc b;
	victor.push_back(b);
}

// role : ajoute une valeur dans les dernier bloc
void Structure::insererVarDansBloc(std::string var,int val){
    victor[victor.size()-1].insererVar(var,val);
    }

// role : supprime un bloc et affiche les variables declare dans ce bloc
void Structure::supprimerBloc() {
	victor[victor.size()-1].affichageTab();
	victor.pop_back();
}
