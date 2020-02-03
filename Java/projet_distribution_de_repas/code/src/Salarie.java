public class Salarie {
	
	// Attributs
	private String nomSAL;			// Nom d'un salari�
	private double poidsSAL;		// Poids d'un salari�
	private double salaire;			// Salaire d'un salari�
	
	// Constructeur d'un salari� (initialisations des attributs)
	public Salarie(String nomSAL, double poidsSAL, double salaire) {
		this.nomSAL = nomSAL;
		this.poidsSAL = poidsSAL;
		this.salaire = salaire;
	}
	
	// Accesseurs du nom d'un salari�
	public String getNomSAL(){
		return nomSAL;
	}
	
	// Accesseur du poids d'un salari�
	public double getPoidsSAL(){
		return poidsSAL;
	}
	
	// Accesseur du salaire d'un salari�
	public double getSalaire(){
		return salaire;
	}
	
	// Calcul de la Charge utile d'un salari�
	public double ChargeUtileSAL(){
		return (poidsSAL / Param.DivChargeUtileSAL);
	}
	
}	// Fin de la classe Salarie
