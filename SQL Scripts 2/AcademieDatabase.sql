CREATE DATABASE Academie;
USE Academie;

-- 1. College
CREATE TABLE College (
    NumCol INT PRIMARY KEY,
    nomCol VARCHAR(100)
);

-- 2. Salle
CREATE TABLE Salle (
    NumSalle INT PRIMARY KEY,
    nomSalle VARCHAR(100)
);

-- 3. Etudiant
CREATE TABLE Etudiant (
    NumEtu INT PRIMARY KEY,
    nomComplet VARCHAR(100),
    Email VARCHAR(100)
);

-- 4. Departement
CREATE TABLE Departement (
    NumDep INT PRIMARY KEY,
    nomDep VARCHAR(100),
    NumCol INT,
    FOREIGN KEY (NumCol) REFERENCES College(NumCol)
);

-- 5. Matiere
CREATE TABLE Matiere (
    NumMat INT PRIMARY KEY,
    nomMat VARCHAR(100),
    NumSalle INT,
    FOREIGN KEY (NumSalle) REFERENCES Salle(NumSalle)
);

-- 6. Enseignant
CREATE TABLE Enseignant (
    IdEns INT PRIMARY KEY,
    nomComplet VARCHAR(100),
    tel VARCHAR(20),
    email VARCHAR(100),
    NumMat INT,
    NumDep INT,
    FOREIGN KEY (NumMat) REFERENCES Matiere(NumMat),
    FOREIGN KEY (NumDep) REFERENCES Departement(NumDep)
);

-- 7. Note
CREATE TABLE note (
    Note DECIMAL(5,2),
    NumMat INT,
    NumEtu INT,
    PRIMARY KEY (NumMat, NumEtu),
    FOREIGN KEY (NumMat) REFERENCES Matiere(NumMat),
    FOREIGN KEY (NumEtu) REFERENCES Etudiant(NumEtu)
);