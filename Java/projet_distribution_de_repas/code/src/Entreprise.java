// Import de la classe ArrayListe
import java.util.ArrayList;

public class Entreprise {
	
	// Variables statique qui permet de savoir si il y a des courses possibles
	static boolean ok = true;
	// Attributs
	private String nomEntreprise;					// Le nom de l'entreprise
	private ArrayList<Course> trajet;				// La liste des courses pour un repas
	private ArrayList<Vehicule> locomotion;			// La liste des v�hicules de l'entreprise
	private ArrayList<Salarie> conducteur;			// La liste des salari�s de l'entreprise
	//private Repas reps;
	
	// Constructeur d'un salari� (initialisations des attributs)
	public Entreprise(String nomEntreprise) {
		this.nomEntreprise = nomEntreprise;
		trajet = new ArrayList<Course>();
		locomotion = new ArrayList<Vehicule>();
		conducteur = new ArrayList<Salarie>();
	}
	
	// Accesseur du nom de l'entreprise
	public String getNomEntreprise() {
		return nomEntreprise;
	}
	
	// Ajout d'une course dans la liste des courses
	public void AjouterCourse(Course c) {
		trajet.add(c);
	}
	
	// Ajout d'un v�hicule dans la liste des v�hicules
	public void AjouterVehicule(Vehicule v) {
		locomotion.add(v);
	}
	
	// Ajout d'un salari� dans la liste des salari�s
	public void AjouterSalarie(Salarie s) {
		conducteur.add(s);
	}
	
	/*public void CreationCourses() { 
		for(int i = 0; i < conducteur.size(); i++) {
			for(int j = 0; j < locomotion.size(); j++) {
				this.AjouterCourse(new Course(conducteur.get(i), locomotion.get(j),reps));			
			}
		}
	}*/
	
	// Affichage de toutes la listes des courses
	public void AfficherListesCourses() {
		System.out.println("La liste des courses est :");
		for(int i = 0; i < trajet.size(); i++) {	
			System.out.println("Course " + i + " : " + trajet.get(i).getSAL().getNomSAL() + " avec un/e "+ trajet.get(i).getVEH().getNomVEH() + ", doit parcourire " + trajet.get(i).getREPS().getDistance() +" km avec un repas de " +	trajet.get(i).getREPS().getPoidsRepas() + " kg");
		}
	}
	
	// Affichage de toutes la listes des v�hicules
	public void AfficherListesVehicules() {
		System.out.println("La liste des v�hicules est :");
		for(int i = 0; i < locomotion.size(); i++) {	
			System.out.println(locomotion.get(i).getNomVEH());
		}
	}
	
	// Affichages de toutes la listes des salari�s
	public void AfficherListesSalaries() {
		System.out.println("La liste des salaries est :");
		for(int i = 0; i < conducteur.size(); i++) {	
			System.out.println(conducteur.get(i).getNomSAL());
		}
	}
	
	// Modification de la liste des courses pour que toutes les courses qui ne sont pas possibles soient supprimer
	public ArrayList<Course> CoursesPossibles() {   
		ArrayList<Course> cP = new ArrayList<Course>();
		for(int i = 0; i < trajet.size(); i++) {	
			if(trajet.get(i).EstPossible() == true) {
				cP.add(cP.size(), trajet.get(i));
			}
		}
		if(cP.size() == 0) {	// Aucune course possible
			ok = false;	
			return trajet;		// Les courses qui ne sont pas possibles
		}
		return cP;
	}
	
	// Comparaison de toutes les courses entre elles, puis retourner une liste comprenant toutes les meilleures courses
	public ArrayList<Course> MeilleureCourses(){
		ArrayList<Course> cP = CoursesPossibles();
		ArrayList<Course> bestTrajet = new ArrayList<Course>();
		if(ok == true) {				// Il y a des courses possibles dans la liste des courses
		bestTrajet.add(0, cP.get(0));
			if(cP.size() == 1) {	// La liste des courses possiblew comprend qu'une seul course
				return bestTrajet;
			}
			else {
				for(int i = 1; i < cP.size(); i++) {	
					if(bestTrajet.get(0).ComparerCourses(cP.get(i)) < 0) {		// trajet(i) meilleure que bestTrajet(0)
						bestTrajet.clear();
						bestTrajet.add(0, cP.get(i));
					}
					else if(bestTrajet.get(0).ComparerCourses(cP.get(i)) == 0) {	// trajet(i) = bestTrajet(0)
						bestTrajet.add(1, cP.get(i));
					}	
				}
			}
		}
		return bestTrajet;
	}
	
	// Comparaison de toutes les courses entre elles, puis retourner une liste comprenant toutes les courses les plus ecologiques
	public ArrayList<Course> CoursesEco(){
		ArrayList<Course> bT = MeilleureCourses();
		ArrayList<Course> ecoTrajet = new ArrayList<Course>();
		if(ok == true) {					// Il y a des courses possibles dans la liste des courses
			ecoTrajet.add(0, bT.get(0)); 
			for(int i = 1; i < bT.size(); i++) {	
				if(ecoTrajet.get(0).QuantiteCO2Emis() > bT.get(i).QuantiteCO2Emis()) {	// bestCourse(i) plus ecologique que ecoTrajet(0)
					ecoTrajet.clear();
					ecoTrajet.add(0, bT.get(i));
				}
				else if(ecoTrajet.get(0).QuantiteCO2Emis() == bT.get(i).QuantiteCO2Emis()) { 	// bestCourse(i) aussi ecologique que ecoTrajet(0)
					ecoTrajet.add(1, bT.get(i));
				}
			}
		}
		return ecoTrajet;	
	}
	
	// Renvoie la liste des meilleures salari� et v�hicule pour une course a effectuer
	public void MeilleureConducteurVehicule() {	
		ArrayList<Course> eT = CoursesEco();
		if(ok == true) {							// Il y a des courses possibles dans la liste des courses
			for(int i =0; i < eT.size(); i++) {	
				System.out.println("L'une des meilleures courses ecologiques se fait avec " + eT.get(i).getSAL().getNomSAL() + " avec un/e " + eT.get(i).getVEH().getNomVEH());
			}
		}
		else {
			System.out.println("Vous avez le choix de refuser le repas car il n'y a aucune course possible");
		}
	}
	
}	// Fin de la classe Entreprise
