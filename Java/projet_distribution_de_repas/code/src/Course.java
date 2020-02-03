
public class Course {
	
	// Attributs
	private Salarie sal;			// Le salari� qui effectue la course
	private Vehicule veh;			// Le v�hicule utiliser pour la course
	private Repas reps;				// Le repas a livr� lors de la course
	
	// Constructeur d'une Course (initialisations des attributs)
	public Course(Salarie sal, Vehicule veh, Repas reps){
		this.sal = sal;
		this.veh = veh;
		this.reps = reps;
	}
	
	// Accesseur du salari�
	public Salarie getSAL(){
		return sal;
	}
	
	// Accesseur du v�hicule
	public Vehicule getVEH(){
		return veh;
	}
	
	// Accesseur du repas 
	public Repas getREPS(){
		return reps;
	}
	
	// Calcul de la charge utile de la course
	public double ChargeUtileCourse(){
		if(sal.ChargeUtileSAL() < veh.getChargeUtileVEH()){
			return (veh.getChargeUtileVEH());
		}
		else {
			return (sal.ChargeUtileSAL());
		}
	}
	
	// Calcul du temps de parcour pour faire un aller-retour (pour livrer le repas)
	public double TempsParcour(){
		return ((reps.getDistance() / veh.VitesseMoy()) * Param.AllerRetour);
	}
	
	// M�thode qui permet de savoir si il est possible d'�ffectuer la course
	public boolean EstPossible(){
		if((this.ChargeUtileCourse() >= reps.getPoidsRepas()) && (this.TempsParcour() <= Param.Heure)){
			return true;
		}
		else {
			return false;
		}
	}
	
	// Calcule de la quantit� de CO2 �mis par le v�hicule lors de l'aller-retour
	public double QuantiteCO2Emis() {
		return ((reps.getDistance() * veh.TauxEmission()) * Param.AllerRetour);
	}
	
	// Calcul du prix de la course 
	public double PrixCourse() {	//modifier en double 
		return((sal.getSalaire()  + (veh.CoutUtilisation() * reps.getDistance())) * Param.AllerRetour);
	}
	
	// Comparaison entre deux course pour savoir laquel des deux co�te le moins ch�re et �met le moins de CO2
	public int ComparerCourses(Course c2) {
		if(((this.QuantiteCO2Emis() > c2.QuantiteCO2Emis()) && (this.PrixCourse() > c2.PrixCourse())) || ((this.QuantiteCO2Emis() > c2.QuantiteCO2Emis()) && (this.PrixCourse() == c2.PrixCourse())) || ((this.QuantiteCO2Emis() == c2.QuantiteCO2Emis()) && (this.PrixCourse() > c2.PrixCourse()))) {
			return -1;	//c2 meilleure que this
		}
		else if(((this.QuantiteCO2Emis() < c2.QuantiteCO2Emis()) && (this.PrixCourse() < c2.PrixCourse())) || ((this.QuantiteCO2Emis() < c2.QuantiteCO2Emis()) && (this.PrixCourse() == c2.PrixCourse())) || ((this.QuantiteCO2Emis() == c2.QuantiteCO2Emis()) && (this.PrixCourse() < c2.PrixCourse()))) {
			return +1;	//this meilleure que c2
		}
		else {
			return 0;	//this = c2
		}
	}
	
}	// Fin de la classe Course
