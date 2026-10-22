CREATE DATABASE bibliotheque;
USE bibliotheque;

CREATE TABLE region (
    codeRe INT PRIMARY KEY,
    nomRe VARCHAR(100)
);

CREATE TABLE depot (
    NumeroD INT PRIMARY KEY,
    nom VARCHAR(100),
    codeRe INT,
    FOREIGN KEY (codeRe) REFERENCES region(codeRe)
);

CREATE TABLE theme (
    codeT INT PRIMARY KEY
);

CREATE TABLE livre (
    numLi INT PRIMARY KEY,
    nomLi VARCHAR(150),
    codeT INT,
    FOREIGN KEY (codeT) REFERENCES theme(codeT)
);

CREATE TABLE Ecrivain (
    CodeE INT PRIMARY KEY,
    nom VARCHAR(100)
);

CREATE TABLE LivEcri (
    NumLi INT,
    CodeE INT,
    PRIMARY KEY (NumLi, CodeE),
    FOREIGN KEY (NumLi) REFERENCES livre(numLi),
    FOREIGN KEY (CodeE) REFERENCES ecrivain(CodeE)
);

CREATE TABLE editeur (
    NumED INT PRIMARY KEY,
    nomEd VARCHAR(100)
);

CREATE TABLE EditLivre (
    NumLi INT,
    NumEd INT,
    PRIMARY KEY (NumLi, NumEd),
    FOREIGN KEY (NumLi) REFERENCES livre(numLi),
    FOREIGN KEY (NumEd) REFERENCES editeur(NumED)
);

CREATE TABLE Ec (
    quantite INT,
    NumD INT,
    NumLi INT,
    NumEd INT,
    FOREIGN KEY (NumD) REFERENCES depot(NumeroD),
    FOREIGN KEY (NumLi) REFERENCES livre(numLi),
    FOREIGN KEY (NumEd) REFERENCES editeur(NumED)
);