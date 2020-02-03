
public class Velo extends Vehicule{
	
	// Constructeur d'un v�lo (initialisations des attributs)
	public Velo(String nomVEH, double prixAchat) {
		// construction de l'objet Vehicule
		super(nomVEH, prixAchat, 0);
	}
	
	// Impl�mentation de la m�thode abstraite, du calcul du taux d'�mission en CO2 sur 1 km, d'un v�lo
	public double TauxEmission() {
		return 0;
	}
	
	// Impl�mentation de la m�thode abstraite, du calcul du co�t d'utilisation en euros, d'un v�lo
	public double CoutUtilisation(){
		return (this.getPrixAchat() / Param.DivCoutUtilisationVelo);
	}
	
	// Impl�mentation de la m�thode abstraite, du calcul de la vitesse moyenne en km/s, d'un v�lo 
	public double VitesseMoy(){
		return Param.CteVitesseMoyVelo;
	}
	
}	// Fin de la classe Velo (sous-classe de Vehicule)
