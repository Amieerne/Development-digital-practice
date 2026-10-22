# --- Creation et selection de BD ---
drop database if exists bd_tech;
create database bd_tech;
use bd_tech;

# --- Creation des tables --- 
create table vehicules (
    idv int primary key auto_increment,
    matricule varchar(20),
    modele varchar(50),
    annee int
);

create table mecaniciens (
    idm int primary key auto_increment,
    nom varchar(50),
    specialite varchar(50)
);

create table interventions (
    idi int primary key auto_increment,
    date_inter date,
    id_vehicule int,
    id_mecanicien int,
    cout decimal(10,2),
    foreign key (id_vehicule) references vehicules(idv),
    foreign key (id_mecanicien) references mecaniciens(idm)
);
    
# --- Insertion ---
INSERT INTO vehicules (matricule, modele, annee) VALUES
('A1234', 'Dacia Sandero', 2020),
('B4567', 'Golf 8', 2022),
('C7890', 'Tesla Model 3', 2023);

INSERT INTO mecaniciens (nom, specialite) VALUES
('Ahmed', 'Expert Moteur'),
('Said', 'Electricien'),
('Karim', 'Carrossier');

INSERT INTO interventions (date_inter, id_vehicule, id_mecanicien, cout) VALUES
('2026-01-10', 1, 1, 500),
('2026-01-12', 2, 2, 1200);

-- A --
# 1
select v.matricule, m.nom, i.date_inter
from interventions i
inner join vehicules v on v.idv = i.id_vehicule
inner join mecaniciens m on m.idm = i.id_mecanicien;

# 2
select v.modele, i.cout
from interventions i
inner join vehicules v on v.idv = i.id_vehicule;

# 3
select m.nom, m.specialite, i.idi
from interventions i
inner join mecaniciens m on m.idm = i.id_mecanicien;

-- B --
# 4
select v.modele, max(i.date_inter) as derniere_intervention
from vehicules v
left join interventions i on v.idv = i.id_vehicule
group by v.idv;

# 5
select v.matricule
from vehicules v
left join interventions i on v.idv = i.id_vehicule
where i.idi is null;

-- C --
# 6
select m.nom, i.cout
from interventions i
right join mecaniciens m on i.id_mecanicien = m.idm;

# 7
select m.nom, m.specialite
from interventions i
right join mecaniciens m on i.id_mecanicien = m.idm
where i.idi is null;

-- D --
# 8
select m.nom, v.modele, i.cout
from interventions i
inner join mecaniciens m on i.id_mecanicien = m.idm
inner join vehicules v on i.id_vehicule = v.idv;

# 9
select m.nom, sum(i.cout) as total
from mecaniciens m
left join interventions i on m.idm = i.id_mecanicien
group by m.idm;

# 10
select v.annee, avg(i.cout) as cout_moyen
from vehicules v
inner join interventions i on v.idv = i.id_vehicule
where v.annee > 2020
group by v.annee;