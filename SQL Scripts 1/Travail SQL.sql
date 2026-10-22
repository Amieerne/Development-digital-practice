/*Travail a faire (CRUD):*/

/*Pour selectionner la bd :*/
use ma_db;
/*Extraire les donnes de la table "Etudiant": (Read)*/
select * from ma_db.etudiant;
/*Voir la structure de la table:*/
describe etudiant;
/*Inserer un nouvel enregistrement: (Create)*/
insert into etudiant ( CneEtu ,NomCompletEtu , EmailEtu , AdresseEtu , TelEtu) values ( 303 , 'Amine Boubekraoui' , 'Test@email.com' , 'exampleadresse' , 18292928);
/*Modifier un enregistrement: (Update)*/
update etudiant set EmailEtu = 'Test1@gmail.com' where CneEtudiant=303;
/*Supprimer un enregistrement: (Delete)*/
delete from etudiant where CneEtudiant=303;

/* Pour la 2eme table*/
/*selectionner la bd :*/
use ma_db;
/*Extraire les donnes de la table "Module": (Read)*/
select * from ma_db.module;
/*Voir la structure de la table:*/
describe module;
/*Inserer un nouvel enregistrement: (Create)*/
insert into module ( CodeModule ,IntModule , CoeModule, Description) values ( 05 , 'Programmer en Javascript' , 3 , 'Descri');
/*Modifier un enregistrement: (Update)*/
update module set CoeModule = 4 where CodeModule=05;
/*Supprimer un enregistrement: (Delete)*/
delete from Module where code=05;