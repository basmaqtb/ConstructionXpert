package metier;

import java.sql.Date;

public class Tache {
    private int id_tache;
    private int id_projet;
    private String description;
    private Date date_debut;
    private Date date_fin;
    private String statut;

    

    @Override
	public String toString() {
		return "Tache [id_tache=" + id_tache + ", id_projet=" + id_projet + ", description=" + description
				+ ", date_debut=" + date_debut + ", date_fin=" + date_fin + ", statut=" + statut + "]";
	}

	public Tache(int id_tache, int id_projet, String description, Date date_debut, Date date_fin, String statut) {
		super();
		this.id_tache = id_tache;
		this.id_projet = id_projet;
		this.description = description;
		this.date_debut = date_debut;
		this.date_fin = date_fin;
		this.statut = statut;
	}

	public Tache() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Tache(int id_projet, String description, Date date_debut, Date date_fin, String statut) {
        this.id_projet = id_projet;
        this.description = description;
        this.date_debut = date_debut;
        this.date_fin = date_fin;
        this.statut = statut;
    }

    public int getId_tache() {
        return id_tache;
    }

    public void setId_tache(int id_tache) {
        this.id_tache = id_tache;
    }

    public int getId_projet() {
        return id_projet;
    }

    public void setId_projet(int id_projet) {
        this.id_projet = id_projet;
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

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }
}
