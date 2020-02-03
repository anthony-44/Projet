// Exemple de l'extensibilite du projet (l'implémentation des méthodes de cette classe n'est pas valide car on ne connaît pas les calculs à éffectuer)

public class Voiture extends Vehicule {
	
	// Attributs
	private int chevaux;				// Les chevaux de la voiture
	private double consoEssenceVoi;		// La consommation d'essence de la voiture
	
	// Constructeur d'un scooter (initialisations des attributs)
	public Voiture(String nomVEH, double prixAchat, double chargeUtileVEH, int chevaux, double consoEssenceVoi){
		// 1. construction de l'objet Vehicule
		super(nomVEH, prixAchat, chargeUtileVEH);
		
		// 2. initialisation des attributs propres
		this.chevaux = chevaux;
		this.consoEssenceVoi = consoEssenceVoi;
	}
	
	// Accesseur des chevaux d'une voiture
	public int getChevaux() {
		return chevaux;
	}
	
	// Accessseur de la consommation d'essence d'une voiture
	public double getConsoEssenceVoi() {
		return consoEssenceVoi;
	}
	
	// Impl�mentation de la m�thode abstraite, du calcul du taux d'�mission en CO2 sur 1 km, d'une voiture
	public double TauxEmission() {
		return (chevaux / Param.DivTauxEmissionVoiture);
	}
	
	// Impl�mentation de la m�thode abstraite, du calcul du co�t d'utilisation en euros sur un km, d'une voiture
	public double CoutUtilisation(){
		return ((this.getPrixAchat() / Param.DivCoutUtilisationVoiture) + (consoEssenceVoi * Param.PrixEssence));
	}
	
	// Impl�mentation de la m�thode abstraite, du calcul de la vitesse moyenne en km/s, d'une voiture
	public double VitesseMoy(){
		return (Param.AdditionVitesseMoy + (chevaux / Param.DivVitesseMoy ));
	}	
	
}	// Fin de la classe Voiture (sous-classe de Vehicule)
