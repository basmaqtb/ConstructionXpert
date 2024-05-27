<%@ page import="Dao.ProjetDaoImpl" %>
<%@ page import="metier.Projet" %>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Project</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit Project</h1>
    <% String idParam = request.getParameter("id"); %>
    <% if (idParam != null && !idParam.isEmpty()) { %>
        <% int id = Integer.parseInt(idParam); %>
        <% ProjetDaoImpl projetDao = new ProjetDaoImpl(); %>
        <% Projet projet = projetDao.getProjet(id); %>
        <% if (projet != null) { %>
            <form action="update" method="post">
                <input type="hidden" name="id_projet" value="<%= projet.getId_projet() %>">
                <div class="form-group">
                    <label>Nom:</label>
                    <input type="text" class="form-control" name="nom" value="<%= projet.getNom() %>">
                </div>
                <div class="form-group">
                    <label>Description:</label>
                    <input type="text" class="form-control" name="description" value="<%= projet.getDescription() %>">
                </div>
                <div class="form-group">
                    <label>Date de Début:</label>
                    <input type="date" class="form-control" name="date_debut" value="<%= projet.getDate_debut() %>">
                </div>
                <div class="form-group">
                    <label>Date de Fin:</label>
                    <input type="date" class="form-control" name="date_fin" value="<%= projet.getDate_fin() %>">
                </div>
                <div class="form-group">
                    <label>Budget:</label>
                    <input type="number" step="0.01" class="form-control" name="budget" value="<%= projet.getBudget() %>">
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        <% } else { %>
            <p>No Project found.</p>
        <% } %>
    <% } else { %>
        <p>No ID.</p>
    <% } %>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
