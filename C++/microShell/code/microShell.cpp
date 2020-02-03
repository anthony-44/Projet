/*
 *  Auteur: ROZEN Anthony, GUERIN Antoine
 *  Groupe:485
 *
 *
*/
#include <iostream>
#include <string>
#include <unistd.h>
#include <vector>
#include <sys/types.h>
#include <sys/wait.h>
#include <cstdlib>
#include <stdlib.h>
#include <fstream>
#include <stdio.h>
#include <cstring>
#include "parsing.hpp"
#include <string.h>
#include <glob.h>


using namespace std;

/******************************************************************/
/**************************   Fonctions   *************************/
/******************************************************************/

//role : execute la commande cmd en utilisant le tableau de commande composé
void traitement(string cmd,vector<compound_command_t> commands){
    char** var;
    pid_t p1;
    glob_t globe;

    parse_line(cmd,commands); //decoupe la commande cmd pour remplir le tableau dynamique commands
    for (auto compound_command : commands) {
        for (auto simple_command : compound_command) {
            int cpt=0;
            for(string param : simple_command){
                if(cpt==0){
                    glob(param.c_str(), GLOB_NOCHECK, NULL, &globe);
                    cpt=1;
                }else{
                    glob(param.c_str(), GLOB_NOCHECK | GLOB_APPEND, NULL, &globe);
                }
            }
                p1 = fork();//creation d'un processus fils
                if(p1==-1){
                    perror("fork");
                    exit(1);
                }
                if(p1==0){ 
                   //effectue par le fils
                   execvp(globe.gl_pathv[0],globe.gl_pathv);
                   exit(1);
                }   
            wait(NULL);                                
        }
    }
    commands.clear();
}

/*****************************************************************/
/**************************   MAIN   *****************************/
/*****************************************************************/
int main(int argc, char* argv[]){

    string entry;
    vector<compound_command_t> commands;

    if(argc > 1){  //si l'utilisateur passe un fichier en argument
        fstream f_ent;
        f_ent.open(argv[1],ios::in); //ouverture du fichier
        if(f_ent.is_open()){ //si le fichier est bien ouvert
            while(getline(f_ent,entry)){ //tant qu'il y a une ligne dans le fichier
                traitement(entry,commands); //on traite la ligne
                cout << endl;            
            }
        } else{
            cout << "Erreur lors de l'ouverture du fichier" << endl;
        }  
    } else { //si l'utilisateur souhaite taper les commandes sur le terminal
        cout << "mush > ";
        getline(cin,entry); //on traite ce que l'utilisateur ecrit
        while(entry.compare("quit") != 0){ //tant que l'utilisateur ne rentre pas la commande terminant le programme
            traitement(entry,commands);
            cout << "mush > ";
            getline(cin,entry);
        }
    } 
}
