create database bd1;
use bd1;
create table client(id int, nom varchar(50));
insert into client values(2222,"sadiki"), (333,"soubhi");

drop temporary table cli;
create temporary table cli(id int, nom varchar(50));
insert into cli select id, nom from client limit 3;
select * from cli;

-- *** tests CRUD *** 
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

update client set nom='Nabili' where id=2222;
insert into client (id,nom) values (10,'Hafidi') , (12,'Karimi');
insert into cli select id,nom from client;
delete from client where id = 10;
delete from cli where id = 12 ;
select * from client where id = 2222;
select count(*) as nombre_client from client;
select * from client;
select * from cli;
select nom from client;
select nom from cli;



#union => supported since mariad 10.3.
#intersect => supported since mariad 10.3.
#except => supported since mariad 10.3.
#IN
#EXISTS
#ALL/ANY
###########################################################################
use bd_test;

#create table personnes(id int auto_increment primary key, nom_prenom varchar(50));
create or replace table personnes(id int primary key auto_increment, nom_prenom char(20));
describe personnes;
create or replace table etudiants(numero int auto_increment primary key, nom_complet varchar(50));

insert into personnes(nom_prenom) values('karimi farid'), 
            ('sadiki rachid'), ('rabh israe'), ('nassiri farid');
insert into etudiants(nom_complet) values('chakiri hanae'), ('kamali sanae'), 
                 ('rabh israe'); 

#union
(select * from personnes) union (select * from etudiants); #elimination de doublons; SELECTs doivent avoir m��me nombre colonnes; noms des colonnes de 'personnes'
select id as identifiant, nom_prenom as nom_et_prenom from personnes union select * from etudiants; 
select id as identifiant from personnes union select numero from etudiants; 

#except
(select * from personnes) except (select * from etudiants); #ok
select id as identifiant, nom_prenom as nom_et_prenom from personnes except select * from etudiants; 

#intersect
(select * from personnes) intersect (select * from etudiants); #ok
select id as identifiant, nom_prenom as nom_et_prenom from personnes intersect select * from etudiants; 

#ALL
select * from personnes 
        where id >= ALL(select numero from etudiants where nom_complet like 'a%');

#ANY/SOME
select * from personnes where id > ANY(select numero from etudiants);
select * from personnes where id > SOME(select numero from etudiants);


#IN
select * from personnes where id in (select numero from etudiants);
#utilisation aussi de l'op��rateur not (s'utilise aussi avec exsits, between)
select * from personnes where id not in (select numero from etudiants); 

#EXISTS
select * from personnes where EXISTS(select * from personnes where id > 3);
select * from personnes where not EXISTS(select * from personnes where id > 3);


-- *** Tests *** --

-- Union --
(select nom_prenom from personnes) union (select nom_complet from etudiants);
(select id from personnes) union (select nom_complet from etudiants);
(select nom_complet from etudiants) union (select id from personnes);

-- Except --
(select id, nom_prenom from personnes) except (select numero, nom_complet from etudiants where nom_complet like 'n%');
(select id, nom_prenom from personnes) except (select numero, nom_complet from etudiants where nom_complet not like 'a%');

-- intersect --
(select id from personnes where id > 1 ) intersect (select numero from etudiants);
(select id from personnes) intersect (select numero from etudiants where numero > 1);
select id from personnes intersect select numero from etudiants where numero >= 2;

-- All --
select * from personnes where id < ALL (select numero from etudiants);
select * from personnes where id <= all (select numero from etudiants);
select id from personnes where id <= ALL (select numero from etudiants where numero > 2);

-- Any/Some --
select * from personnes where id < ANY (select numero from etudiants);
select * from personnes where id >= any (select numero from etudiants where numero > 2);

-- In -- 
select * from personnes where id in (select numero from etudiants where numero between 2 and 4);

-- Exists --
select * from personnes where exists (select numero from etudiants where numero > 2);
select * from personnes where not exists (select numero from etudiants where numero > 2);


