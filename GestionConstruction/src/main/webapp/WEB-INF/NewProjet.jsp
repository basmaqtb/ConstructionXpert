<%@ page import="Dao.ProjetDaoImpl" %>
<%@ page import="metier.Projet" %>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>New Project</title>
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
    <h1>New Project</h1>
    <form action="save" method="post">
        <div class="form-group">
            <label>Nom:</label>
            <input type="text" class="form-control" name="nom" required>
        </div>
        <div class="form-group">
            <label>Description:</label>
            <input type="text" class="form-control" name="description" required>
        </div>
        <div class="form-group">
            <label>Date de Début:</label>
            <input type="date" class="form-control" name="date_debut" required>
        </div>
        <div class="form-group">
            <label>Date de Fin:</label>
            <input type="date" class="form-control" name="date_fin" required>
        </div>
        <div class="form-group">
            <label>Budget:</label>
            <input type="number" step="0.01" class="form-control" name="budget" required>
        </div>
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
