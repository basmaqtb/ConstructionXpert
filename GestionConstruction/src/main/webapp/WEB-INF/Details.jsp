<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails du Projet</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        /* Add custom styles here */
        body {
            padding: 20px;
        }
        .details {
            max-width: 500px;
            margin: auto;
        }
        label {
            font-weight: bold;
        }
        .detail-item {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Détails du Projet</h1>
        <div class="details">
            <div class="form-group">
                <label for="nom">Nom :</label>
                <div class="detail-item" id="nom">${Projet.nom}</div>
            </div>

            <div class="form-group">
                <label for="description">Description :</label>
                <div class="detail-item" id="description">${Projet.description}</div>
            </div>

            <div class="form-group">
                <label for="date_debut">Date de Début :</label>
                <div class="detail-item" id="date_debut">${Projet.date_debut}</div>
            </div>

            <div class="form-group">
                <label for="date_fin">Date de Fin :</label>
                <div class="detail-item" id="date_fin">${Projet.date_fin}</div>
            </div>

            <div class="form-group">
                <label for="budget">Budget :</label>
                <div class="detail-item" id="budget">${Projet.budget}</div>
            </div>
	
         

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
