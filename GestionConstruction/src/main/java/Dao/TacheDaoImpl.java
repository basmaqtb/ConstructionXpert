package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import metier.Tache;

public class TacheDaoImpl implements TacheDao {
    
    private Connection connection;

    public TacheDaoImpl() {
        this.connection = ConnectionJDBC.getConnection();
    }

    @Override
    public Tache save(Tache tache) {
        String insertSQL = "INSERT INTO tache (id_projet, description, date_debut, date_fin, statut) VALUES (?, ?, ?, ?, ?)";
        String selectSQL = "SELECT LAST_INSERT_ID() AS id";

        try (PreparedStatement ps = connection.prepareStatement(insertSQL);
             PreparedStatement ps2 = connection.prepareStatement(selectSQL)) {

            ps.setInt(1, tache.getId_projet());
            ps.setString(2, tache.getDescription());
            ps.setDate(3, tache.getDate_debut());
            ps.setDate(4, tache.getDate_fin());
            ps.setString(5, tache.getStatut());
            ps.executeUpdate();

            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                tache.setId_tache(rs.getInt("id"));
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error saving task: " + e.getMessage());
        }
        return tache;
    }

    @Override
    public Tache update(Tache tache) {
        String updateSQL = "UPDATE tache SET id_projet = ?, description = ?, date_debut = ?, date_fin = ?, statut = ? WHERE id_tache = ?";

        try (PreparedStatement ps = connection.prepareStatement(updateSQL)) {

            ps.setInt(1, tache.getId_projet());
            ps.setString(2, tache.getDescription());
            ps.setDate(3, tache.getDate_debut());
            ps.setDate(4, tache.getDate_fin());
            ps.setString(5, tache.getStatut());
            ps.setInt(6, tache.getId_tache());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error updating task: " + e.getMessage());
        }
        return tache;
    }

    @Override
    public boolean deleteTache(int id) {
        String deleteSQL = "DELETE FROM tache WHERE id_tache = ?";

        try (PreparedStatement ps = connection.prepareStatement(deleteSQL)) {

            ps.setInt(1, id);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error deleting task: " + e.getMessage());
        }
    }

    @Override
    public List<Tache> selectAllTaches() {
        List<Tache> taches = new ArrayList<>();
        String selectSQL = "SELECT * FROM tache";

        try (PreparedStatement ps = connection.prepareStatement(selectSQL);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Tache tache = new Tache(
                        rs.getInt("id_tache"),
                        rs.getInt("id_projet"),
                        rs.getString("description"),
                        rs.getDate("date_debut"),
                        rs.getDate("date_fin"),
                        rs.getString("statut")
                );
                taches.add(tache);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching tasks: " + e.getMessage());
        }
        return taches;
    }

    @Override
    public Tache getTache(int id) {
        Tache tache = null;
        String selectSQL = "SELECT * FROM tache WHERE id_tache = ?";

        try (PreparedStatement ps = connection.prepareStatement(selectSQL)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    tache = new Tache(
                            rs.getInt("id_tache"),
                            rs.getInt("id_projet"),
                            rs.getString("description"),
                            rs.getDate("date_debut"),
                            rs.getDate("date_fin"),
                            rs.getString("statut")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching task: " + e.getMessage());
        }
        return tache;
    }
}
