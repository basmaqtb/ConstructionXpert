<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Task</title>
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

        .error-message {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>New Task</h1>
    <form action="saveT" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label>Projet ID:</label>
            <input type="number" class="form-control" name="id_projet" id="id_projet" required>
        </div>
        <div class="form-group">
            <label>Description:</label>
            <input type="text" class="form-control" name="description" id="description" required>
        </div>
        <div class="form-group">
            <label>Date Début:</label>
            <input type="date" class="form-control" name="date_debut" id="date_debut" required>
        </div>
        <div class="form-group">
            <label>Date Fin:</label>
            <input type="date" class="form-control" name="date_fin" id="date_fin" required>
        </div>
        <div class="form-group">
            <label>Statut:</label>
            <input type="text" class="form-control" name="statut" id="statut" required>
        </div>
        <!-- Add input for project ID -->

        <button type="submit" class="btn btn-primary">Save</button>
        <a href="listTT" class="btn btn-primary">Return</a>

        <div id="error-message-container"></div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function validateForm() {
        var id_projet = document.getElementById("id_projet").value;
        var description = document.getElementById("description").value;
        var date_debut = document.getElementById("date_debut").value;
        var date_fin = document.getElementById("date_fin").value;
        var statut = document.getElementById("statut").value;
        var errorMessage = "";

        if (id_projet === "") {
            errorMessage += "Projet ID is required.<br>";
        }
        if (description === "") {
            errorMessage += "Description is required.<br>";
        }
        if (date_debut === "") {
            errorMessage += "Date Début is required.<br>";
        }
        if (date_fin === "") {
            errorMessage += "Date Fin is required.<br>";
        }
        if (statut === "") {
            errorMessage += "Statut is required.<br>";
        }

        if (errorMessage !== "") {
            document.getElementById("error-message-container").innerHTML = '<div class="error-message">' + errorMessage + '</div>';
            return false;
        }

        return true;
    }
</script>
</body>
</html>
