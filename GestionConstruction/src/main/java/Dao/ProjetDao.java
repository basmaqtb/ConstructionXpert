package Dao;

import java.util.List;

import metier.Projet;

public interface ProjetDao {

		public Projet save(Projet p);
		public Projet update(Projet p);
		public boolean  deletProjet(int id);
		public 	List<Projet> selectAllProjets();
		public Projet getProjet(int id);
		
	
}
