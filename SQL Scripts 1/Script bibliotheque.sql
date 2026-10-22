/* --- Create database --- */
drop database if exists bd_bibliotheque;
create database bd_bibliotheque;
use bd_bibliotheque;
/* --- Create table --- */
create table livres (
    idL int primary key auto_increment,
    titre varchar(50),
    auteur varchar(50),
    genre varchar(30),
    prix_achat decimal(10,2) ,
    nombre_exemplaires int);

/* --- Insert --- */  
insert into livres (idL,titre,auteur,genre,prix_achat,nombre_exemplaires) values 
 ('1','Ti','Ex','Roman','50','2')  ,
 ('2','Tit','Exe','Roman','60','2') , 
 ('3','Titr','Exem','Science fiction','15','3'),
 ('4','LeTitre','Exeme','Roman','80','6'),
 ('5','Titree','Exemeple','Roman','10','10'),
 ('6','Titreee','Exemple','BD','12','8'),
 ('7','Titreee','Exemple','BD','5','8'); 

 
 /* Pour verifier : select * from livres ;*/

# -----A-----
-- 1 
select titre , auteur as 'Écrivain' from livres ;

-- 2 
select * from livres where prix_achat > 15 ; 

-- 3 
select * from livres where genre = 'Roman' or genre = 'Science fiction';
select * from livres where genre in ('Roman' , 'Science fiction');

-- 4 
select * from livres where titre like '%Le%';

# -----B----- 
-- 5
select avg(prix_achat) as prix_moyen from livres;

-- 6
select sum(prix_achat * nombre_exemplaires) as valeur_totale from livres;

-- 7
select min(prix_achat) as min_livre
from livres where genre = 'BD';

# -----C----- 
-- 8
select genre,count(titre) as nombre_titres from livres group by genre;

-- 9 
select count(nombre_exemplaires) as total_exemplaires 
from livres 
group by genre 
having count(nombre_exemplaires) > 10 ;

-- 10
select genre,avg(prix_achat) as prix_moyen from livres
where nombre_exemplaires > 0
group by genre 
order by prix_moyen desc ;






    
    
