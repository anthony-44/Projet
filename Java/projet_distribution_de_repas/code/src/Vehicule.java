public abstract class Vehicule {
	
	// Attributs concrets
	private String nomVEH;					// Nom du véhicule
	private double prixAchat;				// Pris d'achat du véhicule
	private double chargeUtileVEH;			// Charge utile du véhicule
	
	// Constructeur d'un véhicule (initialisations des attributs)
	public Vehicule(String nomVEH, double prixAchat, double chargeUtileVEH) {
		this.nomVEH = nomVEH;						
		this.prixAchat = prixAchat;					
		this.chargeUtileVEH = chargeUtileVEH;		
	}
	
	// Méthodes concretes
	// Accesseur du nom du véhicule
	public String getNomVEH() {
		return nomVEH;
	}
	
	// Accesseur du pris d'achat du véhicule
	public double getPrixAchat() {
		return prixAchat;
	}
	
	// Accesseur de la charge utile du véhicule
	public double getChargeUtileVEH() {
		return chargeUtileVEH;
	}
	
	// Méthode abstraite du taux d'émission en CO2 sur 1 km du véhicule
	public abstract double TauxEmission();
	
	// Méthode abstraite du coût d'utilisation du véhicule en euros
	public abstract double CoutUtilisation();
	
	// Méthode abstraite de la vitesse moyenne du véhicule en km/s
	public abstract double VitesseMoy();
	
}	// Fin de la classe abstraite de Vehicule
