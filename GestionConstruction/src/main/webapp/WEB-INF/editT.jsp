<%@ page import="Dao.TacheDaoImpl" %>
<%@ page import="metier.Tache" %>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Task</title>
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
    <h1>Edit Task</h1>
    <% String idParam = request.getParameter("id"); %>
    <% if (idParam != null && !idParam.isEmpty()) { %>
        <% int id = Integer.parseInt(idParam); %>
        <% TacheDaoImpl tacheDao = new TacheDaoImpl(); %>
        <% Tache tache = tacheDao.getTache(id); %>
        <% if (tache != null) { %>
            <form action="Tupdate" method="post">
                <input type="hidden" name="id_tache" value="<%= tache.getId_tache() %>">
                <div class="form-group">
                    <label>Description:</label>
                    <input type="text" class="form-control" name="description" value="<%= tache.getDescription() %>">
                </div>
                <div class="form-group">
                    <label>Date de Début:</label>
                    <input type="date" class="form-control" name="date_debut" value="<%= tache.getDate_debut() %>">
                </div>
                <div class="form-group">
                    <label>Date de Fin:</label>
                    <input type="date" class="form-control" name="date_fin" value="<%= tache.getDate_fin() %>">
                </div>
                <div class="form-group">
                    <label>Statut:</label>
                    <input type="text" class="form-control" name="statut" value="<%= tache.getStatut() %>">
                </div>
                <div class="form-group">
                    <label>id_projet:</label>
                    <input type="text" class="form-control" name="id_projet" value="<%= tache.getId_projet() %>">
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        <% } else { %>
            <p>No Task found.</p>
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
