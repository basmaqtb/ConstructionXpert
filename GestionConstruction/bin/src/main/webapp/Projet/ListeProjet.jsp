<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Projet" %>
<%@ page import="com.dao.DaoProjet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Projets</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h1 class="mt-5">Liste des Projets</h1>
    <table class="table table-bordered mt-3">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nom du Projet</th>
            <th>Description</th>
            <th>Date de Début</th>
            <th>Date de Fin</th>
            <th>Budget</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Projet> listProjet = (List<Projet>) request.getAttribute("afficherList");
            if (listProjet != null) {
                for (Projet projet : listProjet) {
        %>
        <tr>
            <td><%= projet.getIdProjet() %></td>
            <td><%= projet.getNomProjet() %></td>
            <td><%= projet.getDescription()%></td>
            <td><%= projet.getDateDebut() %></td>
            <td><%= projet.getDateFin() %></td>
            <td><%= projet.getBudget()%></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">Aucun projet disponible.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>