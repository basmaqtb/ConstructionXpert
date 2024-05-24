CREATE TABLE Projet (
    IdProjet SERIAL PRIMARY KEY,
    NomProjet VARCHAR(255) NOT NULL,
    description TEXT,
    DateDebut Date,
    DateFin Date,
    Budget DOUBLE PRECISION
);

-- Table Tache
CREATE TABLE Tache (
    IdTache SERIAL PRIMARY KEY,
    Description TEXT NOT NULL,
    DateDebut DATE,
    DateFin DATE,
    Statut VARCHAR(50),  
    IdProjet INT,
    FOREIGN KEY (IdProjet) REFERENCES Projet(IdProjet)
);

-- Table Ressource
CREATE TABLE Ressource (
    IdRessource SERIAL PRIMARY KEY,
    NomRessource VARCHAR(100) NOT NULL,
    Type VARCHAR(50),
    Quantite INT,
    NomFournisseur VARCHAR(100),
    IdTache INT,
    FOREIGN KEY (IdTache) REFERENCES Tache(IdTache)
);