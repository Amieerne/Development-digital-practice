drop database if exists bd_automobile;
create database bd_automobile;
use bd_automobile;

CREATE TABLE Vehicule (
    id INT PRIMARY KEY AUTO_INCREMENT,
    immatriculation VARCHAR(20) NOT NULL UNIQUE,
    modele VARCHAR(100) NOT NULL,
    date_achat DATE NOT NULL
);

CREATE TABLE Location (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_vehicule INT,
    date_debut DATE NOT NULL,
    date_fin_prevue DATE NOT NULL,
    date_retour_reelle DATE,
    montant_journalier DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (id_vehicule) 
    REFERENCES Vehicule(id)
    ON DELETE CASCADE
);

/* 1 */
set lc_time_names = 'fr_FR';
SELECT DATE_FORMAT(NOW(), '%W %d %M %Y - %H:%i');

/* 2 */
SELECT DATEDIFF(CURDATE() ,
 CONCAT(YEAR(CURDATE()), '-01-01'));

/* 3 */
SELECT immatriculation,
 TIMESTAMPDIFF(YEAR,date_achat,now())
FROM Vehicule;

/* 4 */
SELECT DISTINCT YEAR(date_achat)
FROM Vehicule
ORDER BY YEAR(date_achat) DESC;

/* 5 */
SELECT id , DATEDIFF(date_retour_reelle, date_debut)
FROM Location
WHERE date_retour_reelle IS NOT NULL;

/* 6 */
SELECT id_vehicule , SUM(DATEDIFF(date_retour_reelle, date_debut) * montant_journalier)
FROM Location
WHERE date_retour_reelle IS NOT NULL
GROUP BY id_vehicule
HAVING MIN(YEAR(date_debut)) > 2023;

/* 7 */
SELECT vehicule.* FROM vehicule
JOIN Location ON Location.id_vehicule = vehicule.id
GROUP BY vehicule.id, immatriculation, modele, date_achat
HAVING MIN(WEEKDAY(date_debut)) >= 5
   AND MAX(WEEKDAY(date_debut)) <= 6
   AND MIN(WEEKDAY(date_retour_reelle)) >= 5
   AND MAX(WEEKDAY(date_retour_reelle)) <= 6;
