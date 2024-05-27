<%@ page import="metier.Tache" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Taches</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
    <h1 class="mt-5">Liste des tâches</h1>

	<a href="newT?id=<%= request.getParameter("id_projet") %>" class="abtn-primary">Ajouter tache</a>
	<a href="List" class="abtn-primary">return</a>
	

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Description</th>
                <th>Date Début</th>
                <th>Date Fin</th>
                <th>Statut</th>
                <th>Id projet</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% List<Tache> listTaches = (List<Tache>) request.getAttribute("listTaches");
               String id_projet_param = request.getParameter("id_projet");
               if (id_projet_param != null && !id_projet_param.isEmpty()) {
                   int id_projet = Integer.parseInt(id_projet_param);
                   boolean hasTasks = false;
                   for(Tache tache : listTaches) {
                       if (tache.getId_projet() == id_projet) {
            %>
                <tr>
                    <td><%= tache.getDescription() %></td>
                    <td><%= tache.getDate_debut() %></td>
                    <td><%= tache.getDate_fin() %></td>
                    <td><%= tache.getStatut() %></td>
                    <td><%= tache.getId_projet() %></td>
                    
                    
                    <td>
                        <a href="Tconfirmation?id=<%= tache.getId_tache() %>" class="btn btn-info">Delete</a>
                        <a href="editT?id=<%= tache.getId_tache() %>" class="btn btn-info">Edit</a>
                        
                    </td>
                </tr>
            <%           hasTasks = true;
                       }
                   }
                   if (!hasTasks) { %>
                <tr>
                    <td colspan="6">Il n'y a pas de tâches pour ce projet.</td>
                </tr>
            <%       }
               } else { %>
                <tr>
                    <td colspan="6">Veuillez sélectionner un projet pour afficher les tâches.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
