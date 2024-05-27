<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="metier.Projet" %>
<%@ page import="Dao.ProjetDaoImpl" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supprimer Projet</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        h1 {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Supprimer Projet</h1>
        <p>Êtes-vous sûr de vouloir supprimer ce projet?</p>
        <% 
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                int id = Integer.parseInt(idParam);
                ProjetDaoImpl dao = new ProjetDaoImpl();
                Projet projet = dao.getProjet(id); 
                if (projet != null) { 
        %>
                    <form action="delete" method="post">
                        <div>
                            <input type="hidden" name="id_projet" value="<%= projet.getId_projet() %>">
                            <label><%= projet.getNom() %> - <%= projet.getDescription() %> - <%= projet.getBudget() %></label>
                        </div>
                        <button type="submit" class="btn btn-danger">Oui, Supprimer</button>
                        <a href="List" class="btn btn-secondary">Annuler</a>
                    </form>
        <% 
                } else { 
        %>
                    <p>Aucun Projet trouvé.</p>
        <% 
                } 
            } 
        %>
    </div>
</body>
</html>
