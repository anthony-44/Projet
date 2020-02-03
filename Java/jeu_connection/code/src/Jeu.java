import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.Random;

public class Jeu {

	private Cellule[][] grille;
	private int taille; // taille de la grille taille*taille
	private int max; // valeur max d'une cellule
	private Mode mode; // Joueur contre joueur ou Joueur contre IA
	private boolean tour; // vrai = joueur 1, faux = joueur 2
	private int nbCaseJouer;// nb de case jouer pour savoir quand la partie s'arrete

	private HashMap<Cellule, Cellule> tableauParent;

	public Jeu() {
		int choix;
		boolean fait = false;
		this.tour = true; // Le premier joueur commence
		Scanner in;
		in = new Scanner(System.in);
		while (!fait) {
			System.out.println("Entrez 1 : joueur contre joueur, 2 : joueur contre ordinateur");
			choix = in.nextInt();
			switch (choix) {
			case 1:
				mode = Mode.JCJ;
				fait = true;
				break;
			case 2:
				mode = Mode.JCIA;
				fait = true;
				break;
			default:
				System.out.println("Choix erroné, réessayez");
				break;
			}
		}

		fait = false;
		while (!fait) {
			System.out.println("Entrez (1) : Grille aléatoire (2) : Grille via fichier");
			choix = in.nextInt();
			switch (choix) {
			case 1:
				System.out.println("Choisissez n, longeur et largeur de la grille du jeu");
				taille = in.nextInt();
				System.out.println("Choisissez n, valeur max d'une cellule");
				this.max = in.nextInt();
				this.nbCaseJouer = 0;
				RemplirGrilleAleatoire();
				fait = true;
				break;
			case 2:
				System.out.println("Entrez nom du fichier exemple : JeuMap.txt");
				in.nextLine();
		
				boolean ok = false;
				while(!ok) {
					String fichier = in.nextLine();
					ok = RemplirGrilleFichier("./" + fichier);
				}
				fait = true;
				break;
			default:
				System.out.println("choix erroné, réessayez");
			}
		}

		if (mode == Mode.JCJ) {
			this.JouerDeuxHumains();
		}
		if (mode == Mode.JCIA) {
			this.JouerOrdiHumain();
		}
	}

	public boolean RemplirGrilleFichier(String fichier) {
		try (FileInputStream fis = new FileInputStream(fichier)) {
			Scanner sc = new Scanner(fis);
			String[] sg;
			String ligne;
			int valeur = 0;

			ligne = sc.nextLine(); // ligne 1 du fichier
			sg = ligne.split(" "); // met chaque caractere de la ligne dans des case differentes d'un tableau
			this.taille = Integer.parseInt(sg[0]); // initialise la taille a partir de la valeur du fichier
			this.max = Integer.parseInt(sg[1]); // initialise le max a partir de la valeur du fichier
			grille = new Cellule[taille][taille];
			tableauParent = new HashMap<>();

			for (int i = 0; i <= taille - 1; i++) { // ligne n+1 du fichier
				ligne = sc.nextLine();
				sg = ligne.split(" ");
				for (int j = 0; j <= taille - 1; j++) {
					valeur = Integer.parseInt(sg[j]);
					Cellule c = new Cellule(valeur, (char) (i + 65), j);
					grille[i][j] = c; // Initialisation de la grille
					tableauParent.put(c, null); // Initialisation de la table des parents
				}
			}

			for (int i = 0; i <= taille - 1; i++) { // ligne 2n+1 du fichier
				ligne = sc.nextLine();
				sg = ligne.split(" ");
				for (int j = 0; j <= taille - 1; j++) {
					if (!sg[j].contentEquals("0")) {
						if (sg[j].contentEquals("1")) {
							this.tour = false; // Pour colorier en rouge

						} else if (sg[j].contentEquals("2")) {
							this.tour = true;
						}
						this.nbCaseJouer++;
						this.ColorerCase(i, j);
					}
				}
			}

		} catch (IOException e) {
			System.out.println("Fichier non trouvé, réessayez");
			return false;
		}
		return true;
	}

	public Cellule CaseColleCouleur(int x, int y) { // Retourne l'unique cellule a ajputer dans la composante concerne

		if (y > 0) {
			if (grille[x][y - 1].getCouleur() == grille[x][y].getCouleur()) {
				if (!ExisteCheminCases(x, y - 1, x, y)) {
					return grille[x][y - 1];
				}
			}
		}

		if (y < this.taille - 1) {
			if (grille[x][y + 1].getCouleur() == grille[x][y].getCouleur()) {
				if (!ExisteCheminCases(x, y + 1, x, y)) {
					return grille[x][y + 1];
				}
			}
		}

		if (x > 0) {
			if (grille[x - 1][y].getCouleur() == grille[x][y].getCouleur()) {
				if (!ExisteCheminCases(x - 1, y, x, y)) {
					return grille[x - 1][y];
				}
			}
		}

		if (x < this.taille - 1) {
			if (grille[x + 1][y].getCouleur() == grille[x][y].getCouleur()) {
				if (!ExisteCheminCases(x + 1, y, x, y)) {
					return grille[x + 1][y];
				}
			}
		}
		return null;
	}

	private void RemplirGrilleAleatoire() {
		grille = new Cellule[taille][taille];
		tableauParent = new HashMap<>();
		Random rand = new Random();
		int tirage = 0;
		for (int i = 0; i < taille; i++) {
			for (int j = 0; j < taille; j++) {
				tirage = rand.nextInt(this.max) + 1;
				Cellule c = new Cellule(tirage, (char) (i + 65), j);
				grille[i][j] = c; // Initialisation de la grille
				tableauParent.put(c, null); // Initialisation de la table des parents
			}
		}
	}

	public void ColorerCase(int x, int y) {
		if (tour) {
			grille[x][y].setCouleur(Couleur.BLEU);
		} else {
			grille[x][y].setCouleur(Couleur.ROUGE);
		}

		RelierComposantes(x, y);
		Cellule colle = CaseColleCouleur(x, y);

		if (colle != null) {
			this.Union(grille[x][y], colle);
		}
	}

	public void AfficherComposante(int x, int y) {
		Cellule c = Classe(grille[x][y]); // renvoie la racine de la composante contenant la case x,y
		LinkedList<Cellule> listeFils = new LinkedList<>(); // pour ajouter chaque fils des noeud de la composante

		for (Cellule ctab : this.tableauParent.keySet()) {
			if (this.Classe(ctab) == c) {
				listeFils.add(ctab);
			}
		}
		System.out.println(listeFils.toString());
	}

	public void Union(Cellule cx, Cellule cy) { // Fait l'union de deux composantes

		cx = Classe(cx);
		cy = Classe(cy);

		int nb = cy.getNbElem() + cx.getNbElem();
		int sc = cy.getScore() + cx.getScore();

		if (cx.getNbElem() <= cy.getNbElem()) {
			tableauParent.replace(cx, null, cy);
			cy.setNbElem(nb);
			cy.setScore(sc);
		} else {
			tableauParent.replace(cy, null, cx);
			cx.setNbElem(nb);
			cx.setScore(sc);
		}
	}

	public Cellule Classe(Cellule c) { // Retourne le representant d'une composante
		if (tableauParent.get(c) == null) {
			return c;
		} else {
			Cellule classe = Classe(tableauParent.get(c));
			tableauParent.replace(c, tableauParent.get(c), classe);
			return classe;
		}
	}

	public boolean ExisteCheminCases(int x1, int y1, int x2, int y2) {
		return Classe(grille[x1][y1]) == Classe(grille[x2][y2]);
	}

	public int AfficherScore(int x, int y) {
		return Classe(grille[x][y]).getScore();
	}

	public boolean RelierComposantes(int x, int y) {

		boolean realise = false; // booléen indiquant si au moins deux composantes ont été reliées.

		if (x > 0 && x < this.taille - 1) {
			if (grille[x - 1][y].getCouleur() == grille[x + 1][y].getCouleur()
					&& grille[x + 1][y].getCouleur() == grille[x][y].getCouleur()) {// teste si les composantes que la
																					// case[x][y] relie ont les meme
																					// couleur
				if (!ExisteCheminCases(x - 1, y, x + 1, y)) {

					this.Union(grille[x - 1][y], grille[x + 1][y]); //
					if (!ExisteCheminCases(x, y, x - 1, y)) { // Fait l'union des deux composantes
						this.Union(grille[x][y], grille[x - 1][y]); //
					}

					realise = true;
				}
			}
		}

		if (y > 0 && y < this.taille - 1) {
			if (grille[x][y - 1].getCouleur() == grille[x][y + 1].getCouleur()
					&& grille[x][y + 1].getCouleur() == grille[x][y].getCouleur()) {
				if (!ExisteCheminCases(x, y - 1, x, y + 1)) {
					this.Union(grille[x][y - 1], grille[x][y + 1]);
					if (!ExisteCheminCases(x, y, x, y - 1)) {
						this.Union(grille[x][y], grille[x][y - 1]);
					}

					realise = true;
				}
			}
		}

		if (x > 0 && y > 0) {
			if (grille[x - 1][y].getCouleur() == grille[x][y - 1].getCouleur()
					&& grille[x][y - 1].getCouleur() == grille[x][y].getCouleur()) {
				if (!ExisteCheminCases(x - 1, y, x, y - 1)) {

					this.Union(grille[x - 1][y], grille[x][y - 1]);
					if (!ExisteCheminCases(x, y, x - 1, y)) {
						this.Union(grille[x][y], grille[x - 1][y]);
					}
					realise = true;
				}
			}
		}

		if (x > 0 && y < this.taille - 1) {
			if (grille[x - 1][y].getCouleur() == grille[x][y + 1].getCouleur()
					&& grille[x][y + 1].getCouleur() == grille[x][y].getCouleur()) {
				if (!ExisteCheminCases(x - 1, y, x, y + 1)) {

					this.Union(grille[x - 1][y], grille[x][y + 1]);
					if (!ExisteCheminCases(x, y, x - 1, y)) {
						this.Union(grille[x][y], grille[x - 1][y]);
					}
					realise = true;

				}
			}
		}

		if (x < taille - 1 && y > 0) {
			if (grille[x + 1][y].getCouleur() == grille[x][y - 1].getCouleur()
					&& grille[x][y - 1].getCouleur() == grille[x][y].getCouleur()) {
				if (!ExisteCheminCases(x + 1, y, x, y - 1)) {
					this.Union(grille[x + 1][y], grille[x][y - 1]);
					if (!ExisteCheminCases(x, y, x + 1, y)) {
						this.Union(grille[x][y], grille[x + 1][y]);
					}
					realise = true;

				}
			}
		}

		if (x < taille - 1 && y < taille - 1) {
			if (grille[x + 1][y].getCouleur() == grille[x][y + 1].getCouleur()
					&& grille[x][y + 1].getCouleur() == grille[x][y].getCouleur()) {
				if (!ExisteCheminCases(x + 1, y, x, y + 1)) {

					this.Union(grille[x + 1][y], grille[x][y + 1]);
					if (!ExisteCheminCases(x, y, x + 1, y)) {
						this.Union(grille[x][y], grille[x + 1][y]);
					}
					realise = true;
				}
			}
		}
		return realise;
	}

	public int Gagnant() { // determine le gagnant de la partie : 0 si aucun, 1 si J1, 2 si J2
		int scoreJ1 = 0;
		int scoreJ2 = 0;
		for (Cellule c : this.tableauParent.keySet()) {
			if (tableauParent.get(c) == null) {
				switch (c.getCouleur()) {

				case ROUGE:
					if (c.getScore() > scoreJ2) {
						scoreJ2 = c.getScore();
					}
					break;
				case BLEU:
					if (c.getScore() > scoreJ1) {
						scoreJ1 = c.getScore();
					}
					break;
				default:
					// impossible car fonction appelé lorsque toutes les couleurs ont été remplies.
					break;
				}
			}
		}

		System.out.println("Score J1 : " + scoreJ1 + " Score J2 : " + scoreJ2);

		if (scoreJ1 == scoreJ2) {
			return 0;
		} else if (scoreJ1 > scoreJ2) {
			return 1;
		} else { // scoreJ2 > scoreJ1
			return 2;
		}
	}

	public void JouerDeuxHumains() { // Humain versus Humain
		Scanner in;
		in = new Scanner(System.in);
		String choix;
		int choixJouerTest;
		int choixTest;
		boolean fait = false;
		boolean fait2 = false;
		int x = 0;
		int y = 0;
		int x1 = 0;
		int y1 = 0;

		while (this.nbCaseJouer != taille * taille) {
			fait = false;
			fait2 = false;

			while (!fait2) {
				this.AfficherJeu();

				System.out.println("Entrez 1 : Jouer coup, 2 : Appel de fonction");
				choixJouerTest = in.nextInt();
				switch (choixJouerTest) {
				case 1:

					if (tour) {
						System.out.println("Joueur 1 : Entrez la position d'une case, exemple : A0");
					} else {
						System.out.println("Joueur 2 : Entrez la position d'une case, exemple : A0");
					}

					while (!fait) {
						choix = in.nextLine();

						if (choix.length() != 2) {
							fait = false;
						} else {
							char lettre = choix.charAt(0);
							y = Integer.parseInt(choix.substring(1));

							x = (int) lettre - 65;
							fait = true;
							if (x < 0 || x >= taille) {
								fait = false;
							}
							if (y < 0 || y >= taille) {
								fait = false;
							}
							if (((x >= 0 && x < taille) && (y >= 0 && y < taille))
									&& grille[x][y].getCouleur() != Couleur.NONDEF) {
								fait = false;
							}

						}
					}
					this.ColorerCase(x, y);
					nbCaseJouer++;
					tour = !tour;
					fait2 = true;
					break;
				case 2:
					System.out.println(
							"Entrez 1 : AfficherComposante(int x, int y), 2 : ExisteCheminCases(int x1, int y1, int x2, int y2), 3 : AfficherScore(int x, int y)");
					choixTest = in.nextInt();
					fait = false;
					Coord c;
					Coord c2;
					while (!fait) {
						switch (choixTest) {
						case 1:
							c = demanderCase();
							AfficherComposante(c.x, c.y);

							fait = true;
							break;
						case 2:
							c = demanderCase();
							c2 = demanderCase();
							System.out.println("existe il un chemin : " + ExisteCheminCases(c.x, c.y, c2.x, c2.y));
							fait = true;
							break;
						case 3:
							c = demanderCase();
							System.out.println("le score de la composante qui contient la case " + (char)(65+c.x) + c.y
									+ " est " + AfficherScore(c.x, c.y));
							fait = true;
							break;
						default:
							System.out.println("Choix erroné, réessayez");
							break;
						}
					}
					fait2 = true;
					break;
				default:
					System.out.println("Choix erroné, réessayez");
					break;
				}
			}
		}

		int gagnant = this.Gagnant();
		if (gagnant == 1) {
			System.out.println("Victoire du JOUEUR 1");
		} else if (gagnant == 2) {
			System.out.println("Victoire du JOUEUR 2");
		} else {
			System.out.println("EGALITE");
		}
	}

	public void JouerOrdiHumain() { // Humain versus Ordi
		Scanner in;
		in = new Scanner(System.in);
		String choix;
		int choixJouerTest;
		int choixTest;
		boolean fait = false;
		boolean fait2 = false;
		LinkedList<Coord> listeFait = new LinkedList<>(); // Liste servant à L'IA, permettant à L'IA de stocker ses
		// coups
		int x = 0;
		int y = 0;
		int x1 = 0;
		int y1 = 0;

		while (this.nbCaseJouer != taille * taille) {
			fait = false;
			fait2 = false;

			while (!fait2) {
				this.AfficherJeu();

				if (tour) {
					System.out.println("Entrez 1 : Jouer coup, 2 : Appel de fonction");
					choixJouerTest = in.nextInt();

					switch (choixJouerTest) {
					case 1:

						System.out.println("Joueur 1 : Entrez la position d'une case, exemple : A0");

						while (!fait) {
							choix = in.nextLine();

							if (choix.length() != 2) {
								fait = false;
							} else {
								char lettre = choix.charAt(0);
								y = Integer.parseInt(choix.substring(1));

								x = (int) lettre - 65;
								fait = true;
								if (x < 0 || x >= taille) {
									fait = false;
								}
								if (y < 0 || y >= taille) {
									fait = false;
								}
								if (((x >= 0 && x < taille) && (y >= 0 && y < taille))
										&& grille[x][y].getCouleur() != Couleur.NONDEF) {
									fait = false;
								}

							}
						}
						if (tour) {
							this.ColorerCase(x, y);
							// Pour l'IA, la fonction est appelé dans coupIA()
						}
						nbCaseJouer++;
						tour = !tour;
						fait2 = true;
						break;
					case 2:
						System.out.println(
								"Entrez 1 : AfficherComposante(int x, int y), 2 : ExisteCheminCases(int x1, int y1, int x2, int y2), 3 : AfficherScore(int x, int y)");
						choixTest = in.nextInt();
						fait = false;
						Coord c;
						Coord c2;
						while (!fait) {

							switch (choixTest) {
							case 1:
								c = demanderCase();
								AfficherComposante(c.x, c.y);

								fait = true;
								break;
							case 2:
								c = demanderCase();
								c2 = demanderCase();
								System.out.println("existe il un chemin : " + ExisteCheminCases(c.x, c.y, c2.x, c2.y));
								fait = true;
								break;
							case 3:
								c = demanderCase();
								System.out.println("le score de la composante qui contient la case " + (char)(65+c.x) + c.y
										+ " est " + AfficherScore(c.x, c.y));
								fait = true;
								break;
							default:
								System.out.println("Choix erroné, réessayez");
								break;
							}
						}
						fait2 = true;
						break;
					default:
						System.out.println("Choix erroné, réessayez");
						break;
					}

				} else {
					CoupIA(listeFait);
					nbCaseJouer++;
					tour = !tour;
					fait2 = true;
				}

			}

		}

		this.AfficherJeu();
		int gagnant = this.Gagnant();
		if (gagnant == 1) {
			System.out.println("Victoire du JOUEUR 1");
		} else if (gagnant == 2) {
			System.out.println("Victoire de l'IA");
		} else {
			System.out.println("EGALITE");
		}
	}

	public void CoupIA(LinkedList<Coord> listeFait) {
		// TODO
		int x = 0;
		int y = 0;

		boolean fait = false;
		Coord max = null;

		if (this.nbCaseJouer == 0 || this.nbCaseJouer == 1) {
			while (!fait) { // Première cellule
				Random rand = new Random();
				x = rand.nextInt(this.taille);
				y = rand.nextInt(this.taille);

				if (grille[x][y].getCouleur() == Couleur.NONDEF) {
					this.ColorerCase(x, y);
					listeFait.add(new Coord(x, y));
					fait = true;
				}
			}
			fait = false;
		} else {
			for (Coord c : listeFait) {
				if (c.y > 0) {
					if (grille[c.x][c.y - 1].getCouleur() == Couleur.NONDEF) {
						if (max == null) {
							max = new Coord(c.x, c.y - 1);
						} else {
							if (grille[max.x][max.y].getValeur() < grille[c.x][c.y - 1].getValeur()) {
								max = new Coord(c.x, c.y - 1);
							}
						}
					}
				}

				if (c.y < this.taille - 1) {
					if (grille[c.x][c.y + 1].getCouleur() == Couleur.NONDEF) {
						if (max == null) {
							max = new Coord(c.x, c.y + 1);
						} else {
							if (grille[max.x][max.y].getValeur() < grille[c.x][c.y + 1].getValeur()) {
								max = new Coord(c.x, c.y + 1);
							}
						}
					}
				}

				if (c.x > 0) {
					if (grille[c.x - 1][c.y].getCouleur() == Couleur.NONDEF) {
						if (max == null) {
							max = new Coord(c.x - 1, c.y);
						} else {
							if (grille[max.x][max.y].getValeur() < grille[c.x - 1][c.y].getValeur()) {
								max = new Coord(c.x - 1, c.y);
							}
						}
					}
				}

				if (c.x < this.taille - 1) {
					if (grille[c.x + 1][c.y].getCouleur() == Couleur.NONDEF) {
						if (max == null) {
							max = new Coord(c.x + 1, c.y);
						} else {
							if (grille[max.x][max.y].getValeur() < grille[c.x + 1][c.y].getValeur()) {
								max = new Coord(c.x + 1, c.y);
							}
						}
					}
				}
			}
			if (max == null) {
				while (!fait) { // Première cellule
					Random rand = new Random();
					x = rand.nextInt(this.taille);
					y = rand.nextInt(this.taille);

					if (grille[x][y].getCouleur() == Couleur.NONDEF) {
						this.ColorerCase(x, y);
						listeFait.add(new Coord(x, y));
						fait = true;
					}
				}
				fait = false;
			} else {
				listeFait.add(max);
				this.ColorerCase(max.x, max.y);
			}

		}

	}

	public void AfficherJeu() { // L'affichage de la grille dans la console
		for (int i = 0; i < this.taille; i++) {
			if (i == 0) {
				System.out.print("   || ");
				for (int j = 0; j < this.taille; j++) {
					System.out.print(" " + j + " | ");
				}
				System.out.println("");
				for (int j = 0; j < this.taille; j++) {
					System.out.print("======");
				}
				System.out.println("");
			}
			for (int j = 0; j < this.taille; j++) {
				if (j == 0) {
					System.out.print(" " + (char) (65 + i) + " || ");
				}
				System.out.print(this.grille[i][j].getCouleur().toString() + this.grille[i][j].getValeur() + " | ");
			}
			System.out.println("");
			for (int j = 0; j < this.taille; j++) {
				System.out.print("------");
			}
			System.out.println("");
		}
	}

	private Coord demanderCase() {
		Scanner in = new Scanner(System.in);
		System.out.println("Entrez la position d'une case, exemple : A0");
		boolean fait = false;
		String choix = "";
		int x = 0;
		int y = 0;
		while (!fait) {
			choix = in.nextLine();
			if (choix.length() != 2) {
				fait = false;
			} else {
				char lettre = choix.charAt(0);
				y = Integer.parseInt(choix.substring(1));

				x = (int) lettre - 65;
				fait = true;
				if (x < 0 || x >= taille) {
					fait = false;
				}
				if (y < 0 || y >= taille) {
					fait = false;
				}
			}
		}
		return new Coord(x, y);
	}
}
