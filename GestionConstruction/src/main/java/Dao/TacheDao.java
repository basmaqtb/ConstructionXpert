package Dao;

import java.util.List;

import metier.Tache;

public interface TacheDao {
	
	public Tache save(Tache tache);
	public Tache update(Tache tache);
	public boolean deleteTache(int id);
	public List<Tache> selectAllTaches();
	public Tache getTache(int id);
}
