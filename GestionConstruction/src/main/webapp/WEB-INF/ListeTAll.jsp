<%@ page import="metier.Tache" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Tâches</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #fff;
        }
        .mt-5 {
            margin-top: 3rem !important;
        }
        .abtn-primary {
            margin-bottom: 1rem;
            display: inline-block;
            padding: .375rem .75rem;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            user-select: none;
            border: 1px solid transparent;
            border-radius: .25rem;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
        }
        .abtn-primary:hover {
            background-color: #0056b3;
            color: #fff;
            text-decoration: none;
        }
        
        nav a.nav-link {
            color: black !important;
            font-weight: 500;
        }
        .navbar-brand img {
            height: 40px;
        }
        .navbar-light .navbar-toggler {
            border-color: rgba(0, 0, 0, 0.1);
        }
        .navbar-light .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(0, 0, 0, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }
        .card {
            border: none;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-title {
            color: #5392A6;
            font-size: 1.25rem;
            font-weight: bold;
        }
        .card-text {
            color: #333;
        }
        .btn-icon {
            background: none;
            border: none;
            color: #007bff;
            cursor: pointer;
            padding: 0;
            font-size: 1.2rem;
            margin-right: 0.5rem;
        }
        .btn-icon:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <a class="navbar-brand" href="#">
        <img src="Capture d'écran 2024-05-27 111345.png" alt="Cornerstone Steel">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="List">Projets</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="listTT">Taches</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Ressources</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <h1 class="mt-5">Liste des tâches</h1>

    <a href="newT" class="abtn-primary"><i class="fas fa-plus" ></i></a>
    <div class="row">
        <% List<Tache> listTaches = (List<Tache>) request.getAttribute("listTaches");
           if (listTaches != null && !listTaches.isEmpty()) {
               for (Tache tache : listTaches) { %>
                <div class="col-md-4">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title"><%= tache.getDescription() %></h5>
                            <p class="card-text"><strong>Date Début:</strong> <%= tache.getDate_debut() %></p>
                            <p class="card-text"><strong>Date Fin:</strong> <%= tache.getDate_fin() %></p>
                            <p class="card-text"><strong>Statut:</strong> <%= tache.getStatut() %></p>
                            <p class="card-text"><strong>Id Projet:</strong> <%= tache.getId_projet() %></p>
                            <button class="btn-icon" onclick="location.href='Tconfirmation?id=<%= tache.getId_tache() %>'" title="Delete">
				    <i class="fas fa-trash-alt" style="color: red; margin-right: 10px;"></i>
                            </button>
                            <button class="btn-icon" onclick="location.href='editT?id=<%= tache.getId_tache() %>'" title="Edit">
                                <i class="fas fa-edit" style="color: green; margin-right: 10px;"></i>
                            </button>
                        </div>
                    </div>
                </div>
        <%     }
           } else { %>
            <div class="col-12">
                <p>Il n'y a pas de tâches disponibles.</p>
            </div>
        <% } %>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>

