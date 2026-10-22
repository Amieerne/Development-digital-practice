CREATE DATABASE IF NOT EXISTS labo_recherche;
USE labo_recherche;

-- 1) Création des tables
CREATE OR REPLACE TABLE enseignants (
    id_ens INT PRIMARY KEY AUTO_INCREMENT, 
    nom VARCHAR(50),
    grade INT, -- 3: PES, 2: PH, 1: PA
    departement VARCHAR(20),
    date_embauche DATE
);

CREATE OR REPLACE TABLE chercheurs (
    id_cher INT PRIMARY KEY AUTO_INCREMENT, 
    nom_complet VARCHAR(50),
    grade INT, -- 3: PES, 2: PH, 1: PA
    specialite VARCHAR(20),
    date_embauche DATE
);

-- 2) Insertion des données (Valeurs entières pour les grades)
INSERT INTO enseignants (nom, grade, departement, date_embauche) VALUES 
('Alami Ahmed', 3, 'Informatique', '2010-03-15'), 
('Bennani Salma', 2, 'Maths', '2015-06-20'),       
('Rami Omar', 1, 'Physique', '2020-01-10'),        
('Chakiri Hanae', 2, 'Informatique', '2018-11-05');

INSERT INTO chercheurs (nom_complet, grade, specialite, date_embauche) VALUES 
('Alami Ahmed', 3, 'IA', '2010-03-15'),            
('Drissi Khalid', 1, 'Bio-tech', '2021-09-12'),    
('Chakiri Hanae', 2, 'Réseaux', '2018-11-05');

#  -- Question 1 --
(Select nom from enseignants) union (select nom_complet from chercheurs) ;

#  -- Question 2 --
(select nom from enseignants) intersect (select nom_complet from chercheurs);
(select nom from enseignants) in (select nom_complet from chercheurs);

#  -- Question 3 --
(select nom from enseignants) except (select nom_complet from chercheurs);
(select nom from enseignants) not in  (select nom_complet from chercheurs);

#  -- Question 4 --
select nom,grade from enseignants where grade > any (select grade from chercheurs);

#  -- Question 5 --
select nom, date_embauche from enseignants where date_embauche > all (select date_embauche from chercheurs);

#  -- Question 6 --
select nom_complet from chercheurs where exists (select nom from enseignants where departement = 'maths')
