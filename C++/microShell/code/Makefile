#  Makefile
#  μsh --- un micro-shell
#  Mini-projet de travaux pratiques pour le module "Systèmes d'exploitations" (X22I030)
#  2018/2019, Université de Nantes.

.PHONY: clean

CXX = g++
LINK.o = $(LINK.cc)
CXXFLAGS = -Wall -std=c++11 -Wpedantic

EXE = microShell
OBJECTS = parsing.o # Ajouter ici la liste des fichiers objets à compiler.

all: $(EXE)

$(EXE): microShell.cpp $(OBJECTS)

# Chaque fichier '.cpp' dans $(OBJECTS) dépend du fichier '.hpp' de même nom.
$(OBJECTS): %.o: %.cpp %.hpp

#> Ajouter ici les autres dépendances entre fichiers sources.
main.cpp: parsing.hpp
#<

clean:
	-rm $(EXE) $(OBJECTS)
