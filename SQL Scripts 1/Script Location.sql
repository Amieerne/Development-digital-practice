DROP DATABASE IF EXISTS Location;
create database Location;
use Location;
create table Categorie (
     Codecat varchar(5),
     libelle varchar(50) not null,
     constraint Codecat primary key (Codecat))
     engine=Innodb;
     
create table Engin (
     idEngin int auto_increment,
     Nom varchar(30),
     codeCat varchar(5),
     etat varchar(11) check (etat = 'Disponible' or etat = 'Maintenance' or etat = 'Loue'),
     constraint idEngin primary key (idEngin),
     constraint codecat foreign key (codeCat)
     references Categorie(Codecat)
     on update cascade)
     engine=Innodb;
     
create table Location (
     idLoc int auto_increment,
     dateDebut date,
     dateFin date check (dateFin >= dateDebut),
     idEngin int,
     NomClient varchar(30),
     
     constraint idLoc primary key (idLoc),
     constraint idEngin foreign key (idEngin) references Engin(idEngin)
     on delete restrict
     ) engine=Innodb;
# Q1
INSERT INTO Categorie (Codecat, libelle)
VALUES ('LEV01', 'Example'), ('TER01', 'example');

# Q2
insert into engin (idEngin,Nom,codeCat,etat) 
values ('1','Grue mobile','LEV01','Disponible'),('2','Bulldozer','TER01','Maintenance'),('3','Namex','TER01','Lou��');

#Q3
insert into location (idLoc,dateDebut,dateFin,idEngin,NomClient) 
values ('1','2025/02/05','2025/02/04','1','ExNom');

# Q4 
SELECT * FROM Location WHERE CURDATE() BETWEEN dateDebut AND dateFin;



     