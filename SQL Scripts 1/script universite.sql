drop database if exists universite ;
create database universite ;
use universite ;
create table Livre (
    CodeL int ,
    titre varchar(50),
    auteur varchar(50)
    )engine=innoDB;
    
create table Etudiant (
    idE int ,
    nom varchar(50),
    email varchar(50)
    )engine=innoDB;
    
create table Emprunt (
    CodeL int ,
    idE int,
    dateSortie date 
    )engine=innoDB;
# ----- Defi A -----
# 1      
alter table Livre add constraint CodeL primary key (CodeL);
# 2
alter table etudiant add constraint idE primary key (idE),
modify idE int auto_increment ;
# 3
alter table etudiant modify email varchar (50) unique;

# ----- Defi B -----
# 1
alter table livre 
add column nbPages INT after titre ;
# 2
alter table emprunt 
add column dateRetour date  ;
# 3
alter table livre
modify titre varchar (255) not null ;

# Defi C
# 1
alter table livre 
add constraint check (nbPages > 0);
# 2
alter table emprunt
modify dateSortie date default (current_date);
# 3 
alter table livre
add column statut varchar(50) default 'Disponible';

# Defi D
# 1
alter table emprunt 
add constraint CodeL foreign key (CodeL) references livre(CodeL) ON UPDATE CASCADE;
# 2
alter table emprunt
add constraint idE foreign key (idE) references etudiant(idE) ON DELETE RESTRICT;

# Defi E
# 1
alter table livre
drop column auteur ;
# 2 
alter table livre
DROP constraint CONSTRAINT_1;







