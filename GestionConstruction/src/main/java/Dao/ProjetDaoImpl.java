package Dao;

import metier.Projet;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProjetDaoImpl implements ProjetDao {

    private Connection connection;

    public ProjetDaoImpl() {
        this.connection = ConnectionJDBC.getConnection();
    }

    @Override
    public Projet save(Projet projet) {
        String query = "INSERT INTO projet (nom, description, date_debut, date_fin, budget) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            // Set parameters
            preparedStatement.setString(1, projet.getNom());
            preparedStatement.setString(2, projet.getDescription());
            preparedStatement.setDate(3, projet.getDate_debut());
            preparedStatement.setDate(4, projet.getDate_fin());
            preparedStatement.setFloat(5, projet.getBudget());

            System.out.println("Executing query: " + preparedStatement);

            int affectedRows = preparedStatement.executeUpdate();

            // Check if insert was successful and retrieve generated key
            if (affectedRows > 0) {
                try (ResultSet rs = preparedStatement.getGeneratedKeys()) {
                    if (rs.next()) {
                        projet.setId_projet(rs.getInt(1));
                    }
                }
            } else {
                throw new SQLException("Insert failed, no rows affected.");
            }

            return projet;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Projet update(Projet projet) {
        Projet updatedProjet = new Projet();
        try {
            // Set the fields of updatedProjet with the values from projet
            updatedProjet.setId_projet(projet.getId_projet());
            updatedProjet.setNom(projet.getNom());
            updatedProjet.setDescription(projet.getDescription());
            updatedProjet.setDate_debut(projet.getDate_debut());
            updatedProjet.setDate_fin(projet.getDate_fin());
            updatedProjet.setBudget(projet.getBudget());

            // Prepare the SQL update statement
            PreparedStatement ps = connection.prepareStatement(
                "UPDATE projet SET nom = ?, description = ?, date_debut = ?, date_fin = ?, budget = ? WHERE id_projet = ?"
            );
            ps.setString(1, projet.getNom());
            ps.setString(2, projet.getDescription());
            ps.setDate(3, projet.getDate_debut());
            ps.setDate(4, projet.getDate_fin());
            ps.setFloat(5, projet.getBudget());
            ps.setInt(6, projet.getId_projet());

            // Execute the update
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updatedProjet;
    }


    @Override
    public boolean deletProjet(int id){
    	 String query = "DELETE FROM projet WHERE id_projet = ?";

         try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
             preparedStatement.setInt(1, id);

             int affectedRows = preparedStatement.executeUpdate();

             return affectedRows > 0;

         } catch (SQLException e) {
             e.printStackTrace();
             return false;
         }
    }

    @Override
    public List<Projet> selectAllProjets() {
        String query = "SELECT * FROM projet";
        List<Projet> projets = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Projet projet = new Projet();
                projet.setId_projet(resultSet.getInt("id_projet"));
                projet.setNom(resultSet.getString("nom"));
                projet.setDescription(resultSet.getString("description"));
                projet.setDate_debut(resultSet.getDate("date_debut"));
                projet.setDate_fin(resultSet.getDate("date_fin"));
                projet.setBudget(resultSet.getFloat("budget"));

                projets.add(projet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return projets;
    }

    @Override
    public Projet getProjet(int id) {
        String query = "SELECT * FROM projet WHERE id_projet = ?";
        Projet projet = null;

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    projet = new Projet();
                    projet.setId_projet(resultSet.getInt("id_projet"));
                    projet.setNom(resultSet.getString("nom"));
                    projet.setDescription(resultSet.getString("description"));
                    projet.setDate_debut(resultSet.getDate("date_debut"));
                    projet.setDate_fin(resultSet.getDate("date_fin"));
                    projet.setBudget(resultSet.getFloat("budget"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return projet;
    }
}
