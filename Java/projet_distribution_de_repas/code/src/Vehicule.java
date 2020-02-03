public abstract class Vehicule {
	
	// Attributs concrets
	private String nomVEH;					// Nom du v�hicule
	private double prixAchat;				// Pris d'achat du v�hicule
	private double chargeUtileVEH;			// Charge utile du v�hicule
	
	// Constructeur d'un v�hicule (initialisations des attributs)
	public Vehicule(String nomVEH, double prixAchat, double chargeUtileVEH) {
		this.nomVEH = nomVEH;						
		this.prixAchat = prixAchat;					
		this.chargeUtileVEH = chargeUtileVEH;		
	}
	
	// M�thodes concretes
	// Accesseur du nom du v�hicule
	public String getNomVEH() {
		return nomVEH;
	}
	
	// Accesseur du pris d'achat du v�hicule
	public double getPrixAchat() {
		return prixAchat;
	}
	
	// Accesseur de la charge utile du v�hicule
	public double getChargeUtileVEH() {
		return chargeUtileVEH;
	}
	
	// M�thode abstraite du taux d'�mission en CO2 sur 1 km du v�hicule
	public abstract double TauxEmission();
	
	// M�thode abstraite du co�t d'utilisation du v�hicule en euros
	public abstract double CoutUtilisation();
	
	// M�thode abstraite de la vitesse moyenne du v�hicule en km/s
	public abstract double VitesseMoy();
	
}	// Fin de la classe abstraite de Vehicule
