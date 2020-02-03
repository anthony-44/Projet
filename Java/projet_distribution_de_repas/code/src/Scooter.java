
public class Scooter extends Vehicule {
	
	// Attributs
	private double cylindre;			// Cylindr�e du scooter
	private double consoEssence;		// La consommation d'essence du scooter
	
	// Constructeur d'un scooter (initialisations des attributs)
	public Scooter(String nomVEH, double prixAchat, double chargeUtileVEH, double cylindre, double consoEssence){
		// 1. construction de l'objet Vehicule
		super(nomVEH, prixAchat, chargeUtileVEH);
		
		// 2. initialisation des attributs propres
		this.cylindre = cylindre;
		this.consoEssence = consoEssence;
	}
	
	// Accesseur du cylindr�e du scooter
	public double getCylindre() {
		return cylindre;
	}
	
	// Accessseur de la consommation d'essence du scooter
	public double getConsoEssence() {
		return consoEssence;
	}
	
	// Impl�mentation de la m�thode abstraite, du calcul du taux d'�mission en CO2 sur 1 km, d'un scooter
	public double TauxEmission() {
		return (cylindre / Param.DivTauxEmissionScooter);
	}
	
	// Impl�mentation de la m�thode abstraite, du calcul du co�t d'utilisation en euros sur un km, d'un scooter 
	public double CoutUtilisation(){
		return ((this.getPrixAchat() / Param.DivCoutUtilisationScooter) + (consoEssence * Param.PrixEssence));
	}
	
	// Impl�mentation de la m�thode abstraite, du calcul de la vitesse moyenne en km/s, d'un scooter 
	public double VitesseMoy(){
		return (Param.AdditionVitesseMoy + (cylindre / Param.DivVitesseMoy));
	}	
	
}	// Fin de la classe Scooter (sous-classe de Vehicule)
