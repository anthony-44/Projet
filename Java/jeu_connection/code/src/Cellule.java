//Cellule d'un tableau et d'une structure Union-Find


public class Cellule {
	private Cellule parent; 
	private Couleur couleur;
	private int valeur;
	private int nbElem; //Nombre d'element de la classe lorsqu'il est repr�sentant de sa classe
	private int score; //Score total lorsque la cellule est repr�sentant
	
	private char ligne;
	private int colonne;
	
	
	public Cellule(int valeur, char ligne, int colonne) {
		this.parent = null;
		this.couleur = Couleur.NONDEF;
		this.valeur = valeur;
		this.nbElem = 1;
		this.score = this.valeur;
		
		this.ligne = ligne;
		this.colonne = colonne;
	}
	
	public Couleur getCouleur() {
		return this.couleur;
	}
	
	public Cellule getParent() {
		return this.parent;
	}
	
	public int getScore() {
		return this.score;
	}
	
	public void setScore(int sc) {
		this.score = sc;
	}
	
	public void setCouleur(Couleur couleur) {
		this.couleur = couleur;
	}
	
	public int getValeur() {
		return this.valeur;
	}
	
	public int getNbElem() {
		return this.nbElem;
	}
	
	public void setNbElem(int nb) {
		this.nbElem = nb;
	}
	
	public String toString() {
		return this.ligne+Integer.toString(this.colonne);
	}
}
