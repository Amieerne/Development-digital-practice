/* ============================================================
   SCRIPT P��DAGOGIQUE ��� L'ART DU SELECT (Extraction & Analyse)
   Th��me : Boutique High-Tech (Produits, Cat��gories, Ventes)
   ============================================================

   OBJECTIFS (ce que les ��tudiants vont apprendre / faire) :
   1) S��lection simple et renommage (SELECT, AS).
   2) Filtrage de donn��es (WHERE, BETWEEN, IN, LIKE).
   3) Tri des r��sultats (ORDER BY ASC/DESC).
   4) Fonctions d'agr��gation (COUNT, SUM, AVG, MAX, MIN).
   5) Groupement de donn��es (GROUP BY).
   6) Filtrage sur agr��gats (HAVING vs WHERE).
   7) Limitation des r��sultats (LIMIT).
   ============================================================ */

select curdate();
select 1 as 'un','bonjour' as 'le_salut';
/* ============================================================
   1) PR��PARATION DE LA BASE ET DES DONN��ES
   ============================================================ */

DROP DATABASE IF EXISTS shop_db;
CREATE DATABASE shop_db;
USE shop_db;

CREATE TABLE produits (
    idP INT PRIMARY KEY AUTO_INCREMENT,
    designation VARCHAR(100) NOT NULL,
    categorie VARCHAR(50),
    prix_unitaire DECIMAL(10,2),
    stock INT DEFAULT 0
);

INSERT INTO produits (designation, categorie, prix_unitaire, stock) VALUES
('iPhone 15', 'Smartphone', 900.00, 15),
('Samsung S23', 'Smartphone', 850.00, 8),
('MacBook Air', 'Ordinateur', 1200.00, 5),
('Dell XPS', 'Ordinateur', 1100.00, 3),
('AirPods Pro', 'Accessoire', 250.00, 30),
('Souris Logitech', 'Accessoire', 50.00, 45),
('Clavier M��canique', 'Accessoire', 80.00, 0),
('iPad Air', 'Tablette', 600.00, 12);


/* ============================================================
   2) S��LECTION SIMPLE ET TRI (SELECT / ORDER BY)
   ============================================================ */

-- 2.1) S��lectionner tout et utiliser des alias (AS)
SELECT designation AS 'Nom du Produit', prix_unitaire AS 'Prix DH' 
FROM produits;

-- 2.2) Trier par prix (du moins cher au plus cher)
SELECT * FROM produits ORDER BY prix_unitaire ASC; #order by ... ASC (par defaut)|order by ... DESC

-- 2.3) Trier par cat��gorie puis par stock d��croissant
SELECT categorie, designation, stock 
FROM produits 
ORDER BY categorie ASC, stock DESC;


/* ============================================================
   3) FILTRAGE AVANC�� (WHERE)
   ============================================================ */

-- 3.1) Op��rateurs de comparaison (>, <, !=)
-- Produits dont le prix est sup��rieur �� 800
SELECT * FROM produits WHERE prix_unitaire > 800;

-- 3.2) BETWEEN et IN
-- Produits dont le prix est entre 500 et 1000
SELECT * FROM produits WHERE prix_unitaire BETWEEN 500 AND 1000;

-- Produits appartenant aux cat��gories 'Smartphone' ou 'Tablette'
SELECT * FROM produits WHERE categorie IN ('Smartphone', 'Tablette');

-- 3.3) Recherche textuelle (LIKE)
-- Produits dont le nom commence par 'Mac'
SELECT * FROM produits WHERE designation LIKE 'Mac%';

-- 3.4) G��rer les valeurs vides (IS NULL / IS NOT NULL)
#update produits set categorie = null where idp = 3;
SELECT * FROM produits WHERE categorie is NULL;
-- Produits en rupture de stock
SELECT * FROM produits WHERE stock = 0;


/* ============================================================
   4) FONCTIONS D'AGR��GATION (Calculs statistiques)
   ============================================================ */

-- 4.1) Compter le nombre de produits
SELECT COUNT(*) AS total_produits FROM produits; # count(*) => nombre d'enregistrements

#nombre de valeurs de 'categorie' qui sont diff��rentes de NULL
SELECT COUNT(categorie) AS total_produits FROM produits;

-- 4.2) Prix le plus ��lev�� et le plus bas
SELECT MAX(prix_unitaire) AS 'Prix Max', MIN(prix_unitaire) AS 'Prix Min' 
FROM produits;

-- 4.3) Valeur totale du stock (Prix * Quantit��)
SELECT SUM(stock) AS 'Somme du stock' FROM produits;
#somme des valeurs 'prix_unitaire * stock'
SELECT SUM(prix_unitaire * stock) AS 'Valeur Totale Stock' FROM produits;

-- 4.4) Moyenne des prix des Smartphones
SELECT AVG(prix_unitaire) AS 'Prix Moyen Smartphone' 
FROM produits 
WHERE categorie = 'Smartphone';


/* ============================================================
   5) GROUPEMENT ET FILTRAGE D'AGR��GATS (GROUP BY / HAVING)
   ============================================================ */

-- 5.1) Nombre de produits par cat��gorie
SELECT categorie, COUNT(*) AS nb_produits
FROM produits
GROUP BY categorie;

-- Test de 2 attributs
SELECT categorie, COUNT(*) AS nb_produits
FROM produits
GROUP BY categorie,designation;

SELECT categorie,designation, COUNT(*) AS nb_produits
FROM produits
GROUP BY categorie;

-- 5.2) Valeur du stock par cat��gorie
SELECT categorie, SUM(stock) AS total_stock_unites
FROM produits
GROUP BY categorie;

-- 5.3) Utilisation de HAVING (Le filtre apr��s calcul)
-- Afficher uniquement les cat��gories qui ont plus de 1 produit
-- ��� WHERE ne fonctionnerait pas ici car nb_produits est un calcul agr��g��.
SELECT categorie, COUNT(*) AS nb_produits
FROM produits
GROUP BY categorie
HAVING nb_produits > 1;

SELECT categorie, COUNT(*) AS nb_produits
FROM produits
GROUP BY categorie
HAVING categorie LIKE 'A%';

-- 5.4) M��lange complet : WHERE, GROUP BY, HAVING, ORDER BY
-- On veut le prix moyen par cat��gorie, mais uniquement pour les produits en stock,
-- et on n'affiche que les moyennes sup��rieures �� 500.
SELECT categorie, AVG(prix_unitaire) AS prix_moyen
FROM produits
WHERE stock > 0               -- Filtre les lignes avant calcul
GROUP BY categorie            -- Groupe les r��sultats
HAVING prix_moyen > 500       -- Filtre les groupes apr��s calcul
ORDER BY prix_moyen DESC;     -- Trie le r��sultat final


/* ============================================================
   6) LIMITATION (LIMIT)
   ============================================================ */

-- 6.1) Les 3 produits les plus chers
SELECT designation, prix_unitaire 
FROM produits 
ORDER BY prix_unitaire DESC 
LIMIT 3;


/* ============================================================
   NETTOYAGE FINALE
   ============================================================ */
-- DROP DATABASE shop_db;
    