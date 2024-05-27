package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import metier.Projet;
import metier.Tache;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import Dao.ProjetDao;
import Dao.ProjetDaoImpl;
import Dao.TacheDao;
import Dao.TacheDaoImpl;

@WebServlet(name = "ServletAfficher", value = "/ServletAfficher")
public class ServletAfficher extends HttpServlet {
    ProjetDao projetDao = new ProjetDaoImpl();
    TacheDao tacheDao = new TacheDaoImpl();


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/new":
                addProjetPage(request, response);
                break;
            case "/List":
                listProjets(request, response);
                break;
            case "/save":
            	processSave(request, response);
                break;
            case "/editP":
                processEdit(request, response);
                break;
            case "/update":
            	processUpdate(request, response);
                break;
            case "/confirmation":
            	Deletform(request, response);
                break;
            case "/delete":
            	processDelete(request, response);
                break;
            case "/afficherP":
            	processAffiche(request, response);
            	break;
            	
           //------------------------------------------//
           
            case "/listTaches":
                tacheHome(request, response);
                break;
            case "/listTT":
                tacheHomeAll(request, response);
                break;
            case "/newT":
            	addTachePage(request, response);
                break;
            case "/saveT":
            	processSaveT(request, response);
                break;
            case "/Tconfirmation":
            	DeletformT(request, response);
                break;
            case "/deleteT":
            	processDeleteT(request, response);
                break;
            case "/editT":
                processEditT(request, response);
                break;
            case "/Tupdate":
            	processUpdateT(request, response);
                break;
        }
    }
    
    
    
    private void tacheHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("id_project");
    	List<Tache> listTaches = tacheDao.selectAllTaches();
        request.setAttribute("listTaches",listTaches);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/ListeT.jsp");
        dispatcher.forward(request, response);
    }
    
    private void tacheHomeAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("id_project");
    	List<Tache> listTaches = tacheDao.selectAllTaches();
        request.setAttribute("listTaches",listTaches);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/ListeTAll.jsp");
        dispatcher.forward(request, response);
    }
    
    private void addTachePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/NewT.jsp");
        dispatcher.forward(request, response);
    }
    private void processSaveT(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int id_projet = Integer.parseInt(request.getParameter("id_projet"));
        String description = request.getParameter("description");
        Date date_debut = Date.valueOf(request.getParameter("date_debut"));
        Date date_fin = Date.valueOf(request.getParameter("date_fin"));
        String statut = request.getParameter("statut");

 
        Tache tache = new Tache(id_projet, description, date_debut, date_fin, statut);
        tacheDao.save(tache);
       
        response.sendRedirect(request.getContextPath() + "/listTT");

    }
    
    private void DeletformT(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/TFormdelet.jsp");
        dispatcher.forward(request, response);
    }
    
    private void processDeleteT(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id_tache"));
        tacheDao.deleteTache(id);
        response.sendRedirect(request.getContextPath() + "/List");
    }
    
    private void processEditT(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int id = Integer.parseInt(request.getParameter("id"));
        Tache tache = tacheDao.getTache(id);
        request.setAttribute("Tache", tache);
        request.getRequestDispatcher("/WEB-INF/editT.jsp").forward(request, response);
    }

    private void processUpdateT(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id_tache"));
        String description = request.getParameter("description");
        Date dateDebut = Date.valueOf(request.getParameter("date_debut"));
        Date dateFin = Date.valueOf(request.getParameter("date_fin"));
        String statut = request.getParameter("statut");
		int id_projet = Integer.parseInt(request.getParameter("id_projet"));

        

        Tache tache = new Tache();
        tache.setId_tache(id);
        tache.setDescription(description);
        tache.setDate_debut(dateDebut);
        tache.setDate_fin(dateFin);
        tache.setStatut(statut);
        tache.setId_projet(id_projet);

       tacheDao.update(tache);

        response.sendRedirect(request.getContextPath() + "/listTT");
    }

    
    //-----------------------------------------------------------------------------------------------//

    private void listProjets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Projet> listProjets = projetDao.selectAllProjets();
        request.setAttribute("listProjets", listProjets);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/ListeProjet.jsp");
        dispatcher.forward(request, response);
    }

    private void addProjetPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Code to display the add project page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/NewProjet.jsp");
        dispatcher.forward(request, response);
    }
    
    private void processSave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        Date dateDebut = Date.valueOf(request.getParameter("date_debut"));
        Date dateFin = Date.valueOf(request.getParameter("date_fin"));
        float budget = Float.parseFloat(request.getParameter("budget"));

 
        Projet projet = new Projet(nom, description, dateDebut, dateFin, budget);
        
        projetDao.save(projet);

        response.sendRedirect(request.getContextPath() + "/List");
    }
    
    private void processEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int id = Integer.parseInt(request.getParameter("id"));
        Projet projet = projetDao.getProjet(id);
        request.setAttribute("Projet", projet);
      request.getRequestDispatcher("/WEB-INF/editP.jsp").forward(request, response);

    }
    
    private void processUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProjetStr = request.getParameter("id_projet");
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        String dateDebutStr = request.getParameter("date_debut");
        String dateFinStr = request.getParameter("date_fin");
        String budgetStr = request.getParameter("budget");
     
            int idProjet = Integer.parseInt(idProjetStr);
            float budget = Float.parseFloat(budgetStr);
            java.sql.Date dateDebut = java.sql.Date.valueOf(dateDebutStr);
            java.sql.Date dateFin = java.sql.Date.valueOf(dateFinStr);

            Projet projet = new Projet();
            projet.setId_projet(idProjet);
            projet.setNom(nom);
            projet.setDescription(description);
            projet.setDate_debut(dateDebut);
            projet.setDate_fin(dateFin);
            projet.setBudget(budget);

            Projet updatedProjet = projetDao.update(projet);

            response.sendRedirect(request.getContextPath() + "/List");
    }
    
    private void Deletform(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Formdelet.jsp");
        dispatcher.forward(request, response);
    }
    
    private void processDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id_projet"));
        projetDao.deletProjet(id);
        response.sendRedirect(request.getContextPath() + "/List");
    }
    
    
    
    private void processAffiche(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing project ID");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid project ID format");
            return;
        }

        Projet projet = projetDao.getProjet(id);
        if (projet == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Project not found");
            return;
        }

     // Log retrieved project details
        System.out.println("Retrieved Project: " + projet.getNom());

        request.setAttribute("Projet", projet);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Details.jsp");
        dispatcher.forward(request, response);    }
}








