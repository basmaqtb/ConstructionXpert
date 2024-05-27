package metier;

import java.sql.Date;

public class Projet {

	private int id_projet;
	private String  nom;
	private String description;
	private Date date_debut;
	private Date date_fin;
	private float budget;
	
	
	
	public int getId_projet() {
		return id_projet;
	}


	public void setId_projet(int id_projet) {
		this.id_projet = id_projet;
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Date getDate_debut() {
		return date_debut;
	}


	public void setDate_debut(Date date_debut) {
		this.date_debut = date_debut;
	}


	public Date getDate_fin() {
		return date_fin;
	}


	public void setDate_fin(Date date_fin) {
		this.date_fin = date_fin;
	}


	public float getBudget() {
		return budget;
	}


	public void setBudget(float budget) {
		this.budget = budget;
	}

	
	

	public Projet(String nom, String description, Date date_debut, Date date_fin, float budget) {
		super();
		this.nom = nom;
		this.description = description;
		this.date_debut = date_debut;
		this.date_fin = date_fin;
		this.budget = budget;
	}


	public Projet(int id_projet, String nom, String description, Date date_debut, Date date_fin, float budget) {
		super();
		this.id_projet = id_projet;
		this.nom = nom;
		this.description = description;
		this.date_debut = date_debut;
		this.date_fin = date_fin;
		this.budget = budget;
	}


	public Projet() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	public String toString() {
		return "Projet [id_projet=" + id_projet + ", nom=" + nom + ", description=" + description + ", date_debut="
				+ date_debut + ", date_fin=" + date_fin + ", budget=" + budget + "]";
	}
	
	
	
	

}
