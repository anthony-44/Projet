/*  
 *  Auteurs: ROZEN Anthony, GUERIN Antoine
 *  Date: 26/04/19
 *  
 *
*/

#include <cstdlib>
#include <iostream>
#include <string>
#include "parser.hpp"
#include "bloc.hpp"
#include "Structure.hpp"

using namespace std;

int main(void)
{
	bool start = false;
	int blocCpt = 0;		//permet de compter le nombre de bloc pour que quand on les as tous fermer, on sort du programme
	int numLine = 1;        //permet de noter la ligne

	parser a_parser;
	string line;
	TOKEN tok;
	Structure _struct;

    cout << "Manuel d'utilisation du programme :" << endl;
    cout << string(1,'\t') << " { : ouvre un bloc" << endl;
    cout << string(1,'\t') << " } : ferme un bloc" << endl;
    cout << string(1,'\t') << " var val : declaration d'une variable var avec la valeur val" << endl;
    cout << string(1,'\t') << " > var : affiche la valeur de la variable var" << endl;
    cout << string(1,'\t') << " + var : incremente de 1 la valeur de var" << endl;
    cout << string(1,'\t') << " - var : decremente de 1 la valeur de var" << endl;
    cout << endl;

	cout << "Ecrivez un '{' pour commencer:" << endl;

	while(start == false)      //la gestion d'erreur au debut du programme
	{
		cout << numLine << " ";
		getline(cin,line);
		tok = a_parser.parse(line);
		switch(tok)
		{
			case TOKEN_OPEN:
			{
				_struct.ajoutBloc();  
				start = true;
				blocCpt++;
				numLine++;
				break;
			}
			default:  //si il rentre autre chose que '{'
			{
				cout << "Commencez avec un '{' " << endl;
			}
		}
	}

	while(blocCpt>0)
	{
		cout << numLine << " ";         //permet d'afficher le numero de ligne du programme et de faire un espace
		cout << string(blocCpt,'\t');  //permet de faire des tabulations pour rendre le code plus lisible
		getline(cin,line);
		tok = a_parser.parse(line);
		switch(tok)
		{
			case TOKEN_OPEN:
			{
				_struct.ajoutBloc();
				blocCpt++;
				numLine++;
				break;
			}
			case TOKEN_CLOSE:
			{
				_struct.supprimerBloc();
				blocCpt--;
				numLine++;
				break;
			}
			case TOKEN_VAR:
			{
				_struct.insererVarDansBloc(a_parser.var(), a_parser.value());
				numLine++;
				break;
			}
			case TOKEN_PRINT:
			{
				cout << string(6, '\t') << "affiche " << a_parser.var() << " = " << _struct.accesVarDansBloc(a_parser.var()) << endl;
				numLine++;
				break;
			}
            case TOKEN_INCR:
            {
              _struct.ModifierValeurVariable(a_parser.var(), 1);
              numLine++;
              break;
            }
            case TOKEN_DECR:
            {
              _struct.ModifierValeurVariable(a_parser.var(), -1);
              numLine++;
              break;
            }
			case TOKEN_ERROR:
			{
				cout << string(6,'\t') << a_parser.error() << endl;
				break;
			}
		}
	}
	_struct.~Structure();
  	return EXIT_SUCCESS;
}
