<%@ page import="metier.Projet" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Projets</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
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
    <h1 class="mt-5">Liste des projets</h1>

    <a href="new" class="abtn-primary">Ajouter projet</a>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Nom</th>
                <th>Description</th>
                <th>Date Début</th>
                <th>Date Fin</th>
                <th>Budget</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% List<Projet> listProjets = (List<Projet>) request.getAttribute("listProjets"); %>
            <% for(Projet projet : listProjets) { %>
                <tr>
                    <td><%= projet.getNom() %></td>
                    <td><%= projet.getDescription() %></td>
                    <td><%= projet.getDate_debut() %></td>
                    <td><%= projet.getDate_fin() %></td>
                    <td><%= projet.getBudget() %></td>
                    <td>
                        <a href="afficherP?id=<%= projet.getId_projet() %>" >
				    <i class="far fa-eye" style="color: blue; margin-right: 10px;"></i>
				</a>
				<a href="editP?id=<%= projet.getId_projet() %>" >
				    <i class="fas fa-edit" style="color: orange; margin-right: 10px;"></i>
				</a>
				<a href="confirmation?id=<%= projet.getId_projet() %>" >
				    <i class="fas fa-trash-alt" style="color: red; margin-right: 10px;"></i>
				</a>
				<a href="listTaches?id_projet=<%= projet.getId_projet() %>" >
				    <i class="fas fa-tasks" style="color: green; margin-right: 10px;"></i>
				</a> 
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
 
