
public class Repas {
	
	// Attributs
	private double poidsRepas;			// Poids d'un repas
	private double distance;			// Distance a parcourire pour transporter le repas
	
	// Constructeur d'un repas (initialisations des attributs)
	public Repas(double poidsRepas, double distance){
		this.poidsRepas = poidsRepas;
		this.distance = distance;
	}
	
	// Accesseur du poids d'un repas
	public double getPoidsRepas(){
		return poidsRepas;
	}
	
	// Accesseur de la distance a parcourire pour transporter le repas
	public double getDistance(){
		return distance;
	}
	
}	// Fin de la classe Repas

