/* ============================================================
   SCRIPT P��DAGOGIQUE ��� LES JOINTURES (INNER, LEFT, RIGHT)
   Th��me : Suivi des Commandes Clients
   ============================================================

   OBJECTIFS (ce que les ��tudiants vont apprendre / faire) :
   1) Comprendre la notion de correspondance de cl��s (PK / FK).
   2) R��cup��rer des donn��es de deux tables (INNER JOIN).
   3) G��rer les donn��es sans correspondance (LEFT JOIN / RIGHT JOIN).
   4) Effectuer une jointure multiple (Lier 3 tables ou plus).
   5) Combiner Jointures + Agr��gats (Calculs complexes).
   ============================================================ */


/* ============================================================
   1) PR��PARATION DE LA BASE (Relier les tables)
   ============================================================ */

USE shop_db; -- On continue sur la m��me base

/*
CREATE TABLE produits (
    idP INT PRIMARY KEY AUTO_INCREMENT,
    designation VARCHAR(100) NOT NULL,
    categorie VARCHAR(50),
    prix_unitaire DECIMAL(10,2),
    stock INT DEFAULT 0
);
*/

CREATE TABLE acheteurs (
    idA INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    ville VARCHAR(50)
);

CREATE TABLE commandes (
    idC INT PRIMARY KEY AUTO_INCREMENT,
    date_cmd DATE,
    id_acheteur INT,
    id_produit INT,
    quantite INT,
    FOREIGN KEY (id_acheteur) REFERENCES acheteurs(idA),
    FOREIGN KEY (id_produit) REFERENCES produits(idP)
);

-- Insertion des acheteurs
INSERT INTO acheteurs (nom, ville) VALUES
('Salma Bennani', 'Casablanca'),
('Yassine Farih', 'Rabat'),
('Amine Touzani', 'Tanger'),
('Samiha Drissi', 'Marrakech'); -- Cet acheteur n'a pas encore command��

-- Insertion des commandes
INSERT INTO commandes (date_cmd, id_acheteur, id_produit, quantite) VALUES
('2026-02-01', 1, 1, 1), -- Salma ach��te un iPhone
('2026-02-02', 1, 5, 2), -- Salma ach��te 2 AirPods
('2026-02-03', 2, 3, 1), -- Yassine ach��te un MacBook
('2026-02-04', 3, 2, 1); -- Amine ach��te un Samsung


/* ============================================================
   2) LA JOINTURE INTERNE (INNER JOIN)
   Objectif : Uniquement ce qui correspond dans les deux tables.
   ============================================================ */

-- 2.1) Qui a command�� quoi ?
-- On lie l'acheteur �� sa commande
SELECT acheteurs.nom, commandes.date_cmd, commandes.quantite
FROM acheteurs
INNER JOIN commandes ON acheteurs.idA = commandes.id_acheteur;

-- 2.2) Avec des ALIAS de tables (Plus propre)
SELECT a.nom, c.date_cmd, p.designation, p.prix_unitaire
FROM acheteurs a
INNER JOIN commandes c ON a.idA = c.id_acheteur
INNER JOIN produits p  ON c.id_produit = p.idP;


/* ============================================================
   3) LES JOINTURES EXTERNES (LEFT / RIGHT JOIN)
   Objectif : Ne perdre personne, m��me ceux qui n'ont pas de lien.
   ============================================================ */

-- 3.1) LEFT JOIN : Tous les acheteurs, m��me ceux sans commandes
-- Utile pour identifier les clients inactifs.
SELECT a.nom, c.idC AS 'Num��ro Commande'
FROM acheteurs a
LEFT JOIN commandes c ON a.idA = c.id_acheteur;

-- 3.2) Trouver sp��cifiquement les clients qui n'ont JAMAIS command��
SELECT a.nom
FROM acheteurs a
LEFT JOIN commandes c ON a.idA = c.id_acheteur
WHERE c.idC IS NULL;

-- 3.3) RIGHT JOIN : Tous les produits, m��me ceux jamais vendus
-- Utile pour voir les produits qui ne sortent pas du stock.
SELECT p.designation, c.idC
FROM commandes c
RIGHT JOIN produits p ON c.id_produit = p.idP
WHERE c.idC IS NULL;


/* ============================================================
   4) PUISSANCE MAX : JOINTURES + AGR��GATS
   ============================================================ */

-- 4.1) Chiffre d'affaires total par client
SELECT a.nom, SUM(c.quantite * p.prix_unitaire) AS CA_Total
FROM acheteurs a
INNER JOIN commandes c ON a.idA = c.id_acheteur
INNER JOIN produits p  ON c.id_produit = p.idP
GROUP BY a.nom
ORDER BY CA_Total DESC;

-- 4.2) Rapport d��taill�� par ville
SELECT a.ville, COUNT(c.idC) AS 'Nombre de ventes', SUM(c.quantite) AS 'Articles vendus'
FROM acheteurs a
INNER JOIN commandes c ON a.idA = c.id_acheteur
GROUP BY a.ville
HAVING COUNT(c.idC) > 0;
