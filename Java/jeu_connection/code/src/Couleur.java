
public enum Couleur { // Trois couleur : rouge, bleu ou non definie
	ROUGE("R"), BLEU("B"), NONDEF(" ");
	
	private String string;
	
	Couleur(final String string) {
		this.string = string;
	}
	
	public String toString() {
		return string;
	}
}
