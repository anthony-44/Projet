
public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Repas r = new Repas(5.0,3.0);
		
		Salarie s0 = new Salarie("Louise",55.0,7.4);
		Salarie s1 = new Salarie("Alfred",80.0,7.2);
		Salarie s2 = new Salarie("Camille",67.0,7.5);
		Salarie s3 = new Salarie("Pierre",62.0,7.2);
		
		Velo v0 = new Velo("Velov",450.0);
		Velo v1 = new Velo("Bicloo",500.0);
		
		Scooter sc0 = new Scooter("Yamama",3500.0,50.0,300.0,7.5);
		Scooter sc1 = new Scooter("Vespo",2500.0,30.0,125.0,5.5);
		Scooter sc2 = new Scooter("Piagi",2000.0,35.0,150.0,6.0);
		
		//Voiture voi0 = new Voiture("poucepouce",10.0,150.0,110,4.2);

		Course c0 = new Course(s0 ,  v0,  r);
		Course c1 = new Course(s0 ,  v1,  r);
		Course c2 = new Course(s0 ,  sc0,  r);
		Course c3 = new Course(s0 ,  sc1,  r);
		Course c4 = new Course(s0 ,  sc2,  r);
		
		Course c5 = new Course(s1 ,  v0,  r);
		Course c6 = new Course(s1 ,  v1,  r);
		Course c7 = new Course(s1,  sc0,  r);
		Course c8 = new Course(s1 ,  sc1,  r);
		Course c9 = new Course(s1 ,  sc2,  r);
		
		Course c10 = new Course(s2 ,  v0,  r);
		Course c11 = new Course(s2 ,  v1,  r);
		Course c12 = new Course(s2 ,  sc0,  r);
		Course c13 = new Course(s2 ,  sc1,  r);
		Course c14 = new Course(s2 ,  sc2,  r);
		
		Course c15 = new Course(s3 ,  v0,  r);
		Course c16 = new Course(s3 ,  v1,  r);
		Course c17 = new Course(s3 ,  sc0,  r);
		Course c18 = new Course(s3 ,  sc1,  r);
		Course c19 = new Course(s3 ,  sc2,  r);
		
		/*Course c20 = new Course(s0 ,  voi0,  r);
		Course c21 = new Course(s1 ,  voi0,  r);
		Course c22 = new Course(s2 ,  voi0,  r);
		Course c23 = new Course(s3 ,  voi0,  r);*/
				
		Entreprise e = new Entreprise("vodkabull");
		
		e.AjouterCourse(c0);	
		e.AjouterCourse(c1);	
		e.AjouterCourse(c2);	
		e.AjouterCourse(c3);	
		e.AjouterCourse(c4);
		e.AjouterCourse(c5);	
		e.AjouterCourse(c6);	
		e.AjouterCourse(c7);	
		e.AjouterCourse(c8);	
		e.AjouterCourse(c9);	
		e.AjouterCourse(c10);
		e.AjouterCourse(c11);
		e.AjouterCourse(c12);
		e.AjouterCourse(c13);
		e.AjouterCourse(c14);
		e.AjouterCourse(c15);
		e.AjouterCourse(c16);
		e.AjouterCourse(c17);
		e.AjouterCourse(c18);
		e.AjouterCourse(c19);
		
		
		
		e.AjouterSalarie(s3);e.AjouterVehicule(v0);
		e.AjouterSalarie(s2);e.AjouterVehicule(v1);
		e.AjouterSalarie(s1);e.AjouterVehicule(sc0);
		e.AjouterSalarie(s0);e.AjouterVehicule(sc1);
		e.AjouterVehicule(sc2);
		
		/*e.AjouterCourse(c20);
		e.AjouterCourse(c21);
		e.AjouterCourse(c22);
		e.AjouterCourse(c23);*/

		
		e.MeilleureConducteurVehicule();
		//e.AfficherListesCourses();

	}

}
