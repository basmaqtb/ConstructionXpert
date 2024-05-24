<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 21/05/2024
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Projet</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input[type="text"], input[type="date"], input[type="number"], textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<h2>Ajouter un Projet</h2>

<form action="/GestionConstruction_war/CreateProjet" method="post">
    <label for="nomProjet">Nom du Projet</label>
    <input type="text" id="nomProjet" name="nomProjet" required>

    <label for="description">Description</label>
    <textarea id="description" name="description" rows="4" required></textarea>

    <label for="dateDebut">Date de Début</label>
    <input type="date" id="dateDebut" name="dateDebut" required>

    <label for="dateFin">Date de Fin</label>
    <input type="date" id="dateFin" name="dateFin" required>

    <label for="budget">Budget</label>
    <input type="number" id="budget" name="budget" step="0.01" required>

    <input type="submit" value="Ajouter Projet">
</form>

</body>
</html>

