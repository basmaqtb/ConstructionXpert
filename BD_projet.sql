use pmanager;

CREATE TABLE projets (
    id_projet INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    budget DECIMAL(10, 2) NOT NULL
);

drop table projets;

CREATE TABLE taches (
    id_tache INT AUTO_INCREMENT PRIMARY KEY,
    id_projet INT NOT NULL,
    description VARCHAR(255) NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    statut VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_projet) REFERENCES projets(id_projet) 
);


CREATE TABLE ressources (
    id_ressource INT AUTO_INCREMENT PRIMARY KEY,
    id_tache INT NOT NULL,
    nom VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    quantite INT NOT NULL,
    infos_fournisseur VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_tache) REFERENCES taches(id_tache)
);
