/*  
 *  Auteurs: ROZEN Anthony, GUERIN Antoine
 *  Date: 26/04/19
 *  
 *
*/
#include <iostream>
#include <string>
#include <vector>
#include "bloc.hpp"

typedef std::pair<std::string,int> t_entree;

//  role : constructeur d'un bloc vide
bloc::bloc(){
    col = {};
	variable = {};
}

// role : destructeur
bloc::~bloc(){
}

// role : declarer et initialiser la variable var avec la valeur val
void bloc::insererVar(std::string var,int val){
    if(estDans(var) == false){
        col.insert(t_entree(var,val));
	    variable.push_back(var);
    }else{
        std::cout << "la variable est deja presente dans le bloc" << std::endl;
    }
}

// role : retourne vrai si le bloc est vide
bool bloc::est_vide(){
    return col.empty();
}

// retourne vrai si la variable var est dans le bloc
bool bloc::estDans(std::string var) {
	auto it = col.find(var);
	if (it != col.cend()) {
		return true;
	}else{
        return false;    
    }
}

// role : retourne la valeur de la variable de la ligne
int bloc::affichage(std::string var){
    auto it = col.find(var);
    if (it != col.cend()){
        return it->second;
    }
}

// role : modifie la valeur de la variable passe en parametre avec sa nouvellle valeur
void bloc::modifier(std::string var, int valeur){
    col.at(var) = col.at(var) + valeur;
}


// role : affiche les variables du tableau
void bloc::affichageTab() {
	for (int i = 0; i < variable.size(); i++) {
		std::cout << std::string(6, '\t') << "variable(s) n°" << i+1 << " : " << variable[i] << std::endl;
	}
}
