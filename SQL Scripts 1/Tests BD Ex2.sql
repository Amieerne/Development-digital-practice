/* ============================================================
   SCRIPT P��DAGOGIQUE ��� ALTER TABLE (Contraintes + Colonnes)
   Th��me : h��tel (suites, clients, r��servations)
   ============================================================

   OBJECTIFS (ce que les ��tudiants vont apprendre / faire) :
   1) Cr��er une base de donn��es et s��lectionner la BD de travail (CREATE / USE).
   2) Cr��er des tables SANS contraintes au d��part (pour comprendre ALTER TABLE).
   3) Ajouter des contraintes APR��S la cr��ation :
      - PRIMARY KEY (PK)
      - AUTO_INCREMENT
      - UNIQUE
      - CHECK
      - FOREIGN KEY + ON DELETE / ON UPDATE
   4) Ins��rer des donn��es de test (INSERT) et valider que les contraintes fonctionnent.
   5) Modifier une colonne pour autoriser/interdire NULL :
      - passer de NULL -> NOT NULL (et g��rer les valeurs NULL existantes)
      - passer de NOT NULL -> NULL
   6) Ajouter / supprimer / modifier des colonnes :
      - ADD COLUMN (+ position FIRST / AFTER)
      - DROP COLUMN
      - MODIFY (type, taille, NULL/NOT NULL, etc.)
      - RENAME COLUMN (si MySQL >= 8)
   7) Comprendre et manipuler DEFAULT :
      - ajouter un DEFAULT
      - modifier un DEFAULT
      - supprimer un DEFAULT
   8) Supprimer des contraintes :
      - DROP FOREIGN KEY
      - DROP INDEX (pour UNIQUE)
      - DROP PRIMARY KEY
      - DROP CHECK
   9) Retrouver les noms des contraintes/index :
      - SHOW CREATE TABLE
      - INFORMATION_SCHEMA
      - SHOW INDEX
  10) Supprimer les tables et la base (DROP TABLE / DROP DATABASE)
   ============================================================ */


/* ============================================================
   1) CR��ER / UTILISER LA BASE
   ============================================================ */

DROP DATABASE IF EXISTS hotel_db2;   -- Supprime la BD si elle existe d��j�� (repartir propre)

CREATE DATABASE hotel_db2;           -- Cr��e la nouvelle BD
-- (optionnel mais recommand�� en vrai projet : charset/collation)

USE hotel_db2;                       -- On se place dans la BD hotel_db2


/* ============================================================
   2) CR��ER LES TABLES SANS CONTRAINTES (au d��but)
   Objectif: ajouter ensuite PK/FK/UNIQUE/CHECK par ALTER TABLE
   ============================================================ */

/* Table SUITES (pas de PK, pas de CHECK pour l���instant) */
CREATE TABLE suites (
  codeS     VARCHAR(10) NOT NULL,
  etage     INT NOT NULL,
  nbPieces  INT NOT NULL
) ENGINE=InnoDB;

/* Table CLIENTS (pas de PK, pas de UNIQUE pour l���instant) */
CREATE TABLE clients (
  numeroC     INT NOT NULL,
  nomComplet  VARCHAR(100) NOT NULL,
  email       VARCHAR(150) NOT NULL,
  telephone   VARCHAR(30) NULL
) ENGINE=InnoDB;

/* Table RESERVATIONS (pas de PK, pas de FK pour l���instant) */
CREATE TABLE reservations (
  numeroR   INT NOT NULL,
  dateR     DATE NOT NULL,
  suite     VARCHAR(10) NOT NULL,
  client    INT NOT NULL
) ENGINE=InnoDB;


/* ============================================================
   3) AJOUTER DES CONTRAINTES APR��S COUP (ALTER TABLE)
   ============================================================ */

-- 3.1) Ajouter une cl�� primaire sur suites(codeS)
ALTER TABLE suites
  ADD CONSTRAINT pk_suites PRIMARY KEY (codeS);

-- 3.2) Ajouter une cl�� primaire sur clients(numeroC)
ALTER TABLE clients
  ADD CONSTRAINT pk_clients PRIMARY KEY (numeroC);

-- 3.3) Ajouter une cl�� primaire sur reservations(numeroR)
ALTER TABLE reservations
  ADD CONSTRAINT pk_reservations PRIMARY KEY (numeroR);

-- 3.4) Transformer numeroC et numeroR en AUTO_INCREMENT
-- (AUTO_INCREMENT doit ��tre index��: PK ou UNIQUE)
ALTER TABLE clients
  MODIFY numeroC INT NOT NULL AUTO_INCREMENT;

ALTER TABLE reservations
  MODIFY numeroR INT NOT NULL AUTO_INCREMENT;

-- 3.5) Ajouter UNIQUE sur email
ALTER TABLE clients
  ADD CONSTRAINT uq_clients_email UNIQUE (email);

-- 3.6) Ajouter un CHECK (MySQL 8+ l���applique ; MariaDB d��pend version)
ALTER TABLE suites
  ADD CONSTRAINT chk_suites_etage_nbPieces
  CHECK (etage >= 0 AND nbPieces >= 1);

-- 3.7) Ajouter les Foreign Keys (FK) dans reservations
ALTER TABLE reservations
  ADD CONSTRAINT fk_res_suite
    FOREIGN KEY (suite) REFERENCES suites(codeS)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE reservations
  ADD CONSTRAINT fk_res_client
    FOREIGN KEY (client) REFERENCES clients(numeroC)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;


/* ============================================================
   4) DONN��ES DE TEST (INSERT)
   ============================================================ */

INSERT INTO suites(codeS, etage, nbPieces) VALUES
('S101', 1, 2),
('S201', 2, 3);

INSERT INTO clients(nomComplet, email, telephone) VALUES
('Amina El Idrissi', 'amina@gmail.com', '0612345678'),
('Youssef Benali',  'youssef@gmail.com', '0698765432');

INSERT INTO reservations(dateR, suite, client) VALUES
('2026-02-02', 'S101', 1),
('2026-02-05', 'S201', 2);


/* ============================================================
   5) NULL / NOT NULL : rendre un champ optionnel ou obligatoire
   ============================================================ */

-- 5.1) Passer une colonne de NULL -> NOT NULL
-- IMPORTANT: si des NULL existent d��j��, MySQL les transforme en chaines vides.
-- Exemple p��dagogique : on met d'abord un t��l��phone �� NULL (pour cr��er la situation)
UPDATE clients SET telephone = NULL WHERE numeroC = 2;

-- ��� Si on essaie maintenant : NULL se transforme en chaine vide
-- ALTER TABLE clients MODIFY telephone VARCHAR(30) NOT NULL;

-- 5.2) Passer une colonne de NOT NULL -> NULL (on autorise l���absence de valeur)
ALTER TABLE clients
  MODIFY telephone VARCHAR(30) NULL;


/* ============================================================
   6) AJOUTER / SUPPRIMER / MODIFIER DES COLONNES
   ============================================================ */

-- 6.1) Ajouter une colonne (ADD COLUMN)
-- Ajouter "date_naissance" apr��s nomComplet (NULL autoris��)
ALTER TABLE clients
  ADD COLUMN date_naissance DATE NULL
  AFTER nomComplet;

-- Ajouter une colonne en premi��re position (FIRST)
ALTER TABLE clients
  ADD COLUMN code_client VARCHAR(20) NULL FIRST;

-- 6.2) Supprimer une colonne (DROP COLUMN)
-- ATTENTION: perte d��finitive des donn��es de cette colonne
ALTER TABLE clients
  DROP COLUMN code_client;

-- 6.3) Modifier une colonne (MODIFY)
-- Exemple : agrandir l���email (taille) + garder NOT NULL
ALTER TABLE clients
  MODIFY email VARCHAR(200) NOT NULL;

-- Exemple : changer le type (numeroR en BIGINT)
ALTER TABLE reservations
  MODIFY numeroR BIGINT NOT NULL AUTO_INCREMENT;

-- 6.4) Renommer une colonne (RENAME COLUMN)
-- (MySQL 8+)
ALTER TABLE reservations
CHANGE dateR date_reservation DATE NOT NULL;


/* ============================================================
   7) LA CONTRAINTE DEFAULT (valeur par d��faut)
   ============================================================ */

-- 7.1) Ajouter un DEFAULT
-- Exemple : si telephone est NULL, on peut lui donner un default
ALTER TABLE clients
  MODIFY telephone VARCHAR(30) NULL DEFAULT 'INCONNU';

-- 7.2) Modifier un DEFAULT (changer la valeur par d��faut)
ALTER TABLE clients
  MODIFY telephone VARCHAR(30) NULL DEFAULT 'NON RENSEIGNE';

-- 7.3) Supprimer un DEFAULT
-- (il suffit de red��finir la colonne sans DEFAULT)
ALTER TABLE clients
  MODIFY telephone VARCHAR(30) NULL;

-- 7.4) Exemple tr��s courant : DEFAULT sur une date (ou timestamp)
-- Ici, on utilise CURRENT_DATE (date du jour)
-- (Selon versions, CURRENT_DATE peut ��tre accept��; sinon on mettra la date c��t�� application)
ALTER TABLE reservations
  MODIFY date_reservation DATE NOT NULL DEFAULT (CURRENT_DATE); #select CURRENT_DATE, curdate(); # CURRENT_DATE, curdate() => jour&mois&ann��e

-- Enlever ce DEFAULT
ALTER TABLE reservations
  MODIFY date_reservation DATE NOT NULL;


/* ============================================================
   8) COMMENT SUPPRIMER (DROP) DES CONTRAINTES
   ============================================================ */

-- 8.1) Supprimer une FK (il faut conna��tre SON NOM)
-- Ici on l���a appel��e fk_res_suite et fk_res_client
ALTER TABLE reservations
  DROP FOREIGN KEY fk_res_suite;

ALTER TABLE reservations
  DROP FOREIGN KEY fk_res_client;

-- 8.2) Supprimer un UNIQUE
-- UNIQUE = index unique => DROP INDEX
ALTER TABLE clients
  DROP INDEX uq_clients_email;

-- 8.3) Supprimer une PK
#si la PK est d��finie en tant que auto-increment, if faut en premier lieu enlever cette contrainte:
ALTER TABLE reservations
MODIFY numeroR INT NOT NULL;
#puis supprimer la PK
ALTER TABLE reservations
  DROP PRIMARY KEY;

-- 8.4) Supprimer un CHECK (MySQL 8+)
-- sinon on obtient le nom de la contraite en premier lieu:
show create table suites;
-- ou
select * from information_schema.table_constraints where table_name= 'suites'; 
ALTER TABLE suites
  DROP constraint chk_suites_etage_nbPieces;


/* ============================================================
   9) RETROUVER LES NOMS DES CONTRAINTES / INDEX (tr��s utile)
   ============================================================ */

-- Voir les CREATE TABLE complets (on y voit PK, FK, CHECK, index)
SHOW CREATE TABLE reservations;
SHOW CREATE TABLE clients;
SHOW CREATE TABLE suites;

-- Lister les contraintes connues par MySQL
SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_schema = DATABASE()
  AND table_name = 'reservations';

-- Lister les index (PK/UNIQUE) d���une table
-- SHOW INDEX FROM clients;


/* ============================================================
   10) SUPPRIMER DES TABLES ET SUPPRIMER LA BASE
   ============================================================ */

-- 10.1) Supprimer les tables (ordre important si FK existent)
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS suites;

-- 10.2) Supprimer la base enti��re (attention: tout dispara��t)
DROP DATABASE IF EXISTS hotel_db2;

/* ===============================
   CONSTRAINT TESTS
   Run before dropping constraints
   =============================== */


/* 1) PRIMARY KEY TEST */
INSERT INTO suites(codeS, etage, nbPieces)
VALUES ('S101', 3, 2);

INSERT INTO clients(numeroC, nomComplet, email)
VALUES (1, 'Test PK', 'testpk@gmail.com');

/* 2) UNIQUE TEST */
INSERT INTO clients(nomComplet, email)
VALUES ('Duplicate Email', 'amina@gmail.com');

/* 3) CHECK CONSTRAINT TEST */
INSERT INTO suites(codeS, etage, nbPieces)
VALUES ('S300', -1, 2);

/*(nbPieces < 1)*/ 
INSERT INTO suites(codeS, etage, nbPieces)
VALUES ('S301', 3, 0);

/* 4) FOREIGN KEY TEST */
/*(suite does not exist)*/ 
INSERT INTO reservations(date_reservation, suite, client)
VALUES ('2026-03-01', 'S999', 1);

/*(client does not exist)*/
INSERT INTO reservations(date_reservation, suite, client)
VALUES ('2026-03-01', 'S101', 999);

/* 5) ON DELETE RESTRICT TEST */
DELETE FROM suites WHERE codeS = 'S101';
DELETE FROM clients WHERE numeroC = 1;

/* 6) AUTO_INCREMENT TEST */
INSERT INTO clients(nomComplet, email)
VALUES ('Client Auto', 'auto@gmail.com');
SELECT * FROM clients;

/* 7) NOT NULL TEST */
/*(nomComplet is NOT NULL)*/ 
INSERT INTO clients(email)
VALUES ('testnull@gmail.com');

/* 8) DEFAULT TEST */
INSERT INTO clients(nomComplet, email)
VALUES ('Client Default', 'default@gmail.com');

/* 9) ON UPDATE CASCADE TEST */
UPDATE suites
SET codeS = 'S111'
WHERE codeS = 'S101';

SELECT * FROM reservations;
