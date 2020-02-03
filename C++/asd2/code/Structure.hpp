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

class Structure {
public:
	// role : constructeur d'une Structure vide
	Structure();

	// role : destructeur
	~Structure();

	// role : retourne la valeur de la variable de la ligne
    // Precondition : il doit y avoir au moins un bloc dans la structure des blocs
	int accesVarDansBloc(std::string var);

    // role : modifie la valeur de la variable passe en paramètre avec sa nouvellle valeur
    void ModifierValeurVariable(std::string var, int valeur);

    // role : ajoute un nouveau bloc passe en paramètre
    // Precondition : la structure des blocs existe
	void ajoutBloc();

    // role : ajoute une valeur dans les dernier bloc
    // Precondition : il doit y avoir au moins un bloc dans la structure des blocs
    void insererVarDansBloc(std::string var,int val);


    // role : supprime un bloc
    // Precondition : il doit y avoir au moins un bloc dans la structure des blocs
	void supprimerBloc();

private:
	std::vector<bloc> victor;		//tableau dynamique
};
