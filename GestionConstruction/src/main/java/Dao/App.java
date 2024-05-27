package Dao;

import java.sql.Date;
import metier.Projet;
import metier.Tache;

public class App {

    public static void main(String[] args) {

        ProjetDaoImpl projetDao = new ProjetDaoImpl();
        TacheDaoImpl tacheDao = new TacheDaoImpl();

        // Convertir les valeurs de date en objets Date
        Date dateDebut = Date.valueOf("2024-05-21");
        Date dateFin = Date.valueOf("2024-05-30");

        // Créer une nouvelle tâche
        Tache nouvelleTache = new Tache();
        nouvelleTache.setId_tache(7);
        nouvelleTache.setDescription("Description de la tâche");
        nouvelleTache.setDate_debut(dateDebut);
        nouvelleTache.setDate_fin(dateFin);
        nouvelleTache.setStatut("Statut de la tâche");
        nouvelleTache.setId_projet(8);  // Assurez-vous de mettre un ID de projet valide

        // Enregistrer la tâche
        Tache tacheSaved = tacheDao.update(nouvelleTache);

        System.out.println("Tâche modifier avec succès : " + tacheSaved);
    }
}
