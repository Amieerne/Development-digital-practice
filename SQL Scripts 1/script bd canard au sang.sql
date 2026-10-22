# --------Creation de la base de donnee--------
create database restauration 
		character set utf8mb4
        collate utf8mb4_unicode_ci ;
        
# ---------Selectionner la base de donnee---------
use restauration ;

# ---------Creation des tables---------

# ---table tables---
create table tables (
     idTable int ,
     NomTable varchar(50) not null unique,
     
     constraint pk_table primary key (idTable)
     ) ENGINE=InnoDB;
     
# ---Table maitre---
create table maitre (
     idMaitre int ,
     NomMaitre varchar(50) not null,
     
     constraint pk_maitre primary key (idMaitre)
     ) ENGINE=InnoDB;
     
# ---table client---
create table client (
     idClient int ,
     NomClient varchar(50) not null,
     
     constraint pk_client primary key (idClient)
     ) ENGINE=InnoDB;

# ---table eleveur---
create table eleveur (
     idEleveur int ,
     NomEleveur varchar(50) not null,
     
     constraint pk_eleveur primary key (idEleveur)
     ) ENGINE=InnoDB;
     

# ---table service---
create table service (
     idService int ,
     daTeService datetime default now(), # Valeur par defaut = date / heure courante
     idTable int ,
     idMaitre int ,
     constraint pk_service primary key (idService),
     
	 constraint fk_table 
     foreign key (idTable)
     references tables(idTable)
     on delete restrict 
     on update cascade,
     
     constraint fk_maitre
     foreign key (idMaitre)
     references maitre(idMaitre)
     on delete restrict 
     on update cascade )
     ENGINE=InnoDB ;

# ---table canard---
create table canard (
    NumCanard int auto_increment,
    AgeCanard int check (AgeCanard >= 1),
    idService int ,
    idEleveur int ,
    
    constraint pk_canard primary key (NumCanard),
    
    constraint fk_service 
    foreign key (idService)
    references service(idService)
    on delete restrict 
    on update cascade,
    
    constraint fk_eleveur
    foreign key (idEleveur)
    references eleveur(idEleveur)
    on delete restrict 
    on update cascade)
    engine=InnoDB;

     
# ---table serivceClient---
create table serviceClient(
    idService int ,
    idClient int ,
    
    constraint idServiceClient primary key (idService,idClient),
    
    constraint fk_service_client
    foreign key (idService)
    references service(idService)
	on delete restrict 
	on update cascade,
	
    constraint fk_client_service
    foreign key (idClient)
    references client(idClient)
    on delete restrict 
	on update cascade )
	ENGINE=InnoDB ;
    

    
    
     


     
     








     
     
     
     
     
     
     
     
     
     
     