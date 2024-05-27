<%@ page import="metier.Projet" %>
<%@ page import="Dao.ProjetDaoImpl" %>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Projet</title>
</head>
<body>
    <h1>Update Projet</h1>
    <% 
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            ProjetDaoImpl dao = new ProjetDaoImpl();
            Projet projet = dao.getProjet(id); 
            if (projet != null) {
    %>
                <form action="delete" method="post">
                    <input type="hidden" name="id_projet" value="<%= projet.getId_projet() %>">
                    <label>Nom:</label><br>
                    <input type="text" name="nom" value="<%= projet.getNom() %>"><br>
                    <label>Description:</label><br>
                    <input type="text" name="description" value="<%= projet.getDescription() %>"><br>
                    <label>Date de début:</label><br>
                    <input type="date" name="date_debut" value="<%= projet.getDate_debut() %>"><br>
                    <label>Date de fin:</label><br>
                    <input type="date" name="date_fin" value="<%= projet.getDate_fin() %>"><br>
                    <label>Budget:</label><br>
                    <input type="text" name="budget" value="<%= projet.getBudget() %>"><br><br>
                    
                	<a href="delete?id=<%= projet.getId_projet() %>">Delete</a>
                </form>
    <% 
            } else {
    %>
                <p>Le projet a été supprimé..</p>
    <% 
            }
        } else {
    %>
            <p>Ce projet n'existe pas.</p>
    <% 
        }
    %>

</body>
</html>
