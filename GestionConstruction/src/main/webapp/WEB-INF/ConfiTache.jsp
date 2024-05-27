<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="metier.Tache" %>
<%@ page import="Dao.TacheDaoImpl" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supprimer Tâche</title>
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
        <h1>Supprimer Tâche</h1>
        <p>Êtes-vous sûr de vouloir supprimer cette Tâche?</p>
        <% 
            String idParam = request.getParameter("id_tache");
            if (idParam != null && !idParam.isEmpty()) {
                int id = Integer.parseInt(idParam);
                TacheDaoImpl dao = new TacheDaoImpl();
                Tache tache = dao.getTache(id); 
                if (tache != null) { 
        %>
                    <form action="deleteT" method="post">
                        <div>
                            <input type="hidden" name="id_tache" value="<%= tache.getId_tache() %>">
                            <label><%= tache.getDescription() %> - <%= tache.getDate_debut() %> - <%= tache.getDate_fin() %></label>
                        </div>
                        <button type="submit" class="btn btn-danger">Oui, Supprimer</button>
                        <a href="listTaches" class="btn btn-secondary">Annuler</a>
                    </form>
        <% 
                } else { 
        %>
                    <p>Aucune Tâche trouvée.</p>
        <% 
                } 
            } 
        %>
    </div>
</body>
</html>
