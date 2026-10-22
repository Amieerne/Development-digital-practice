select current_date();  
select current_time();
select now(), current_timestamp(); #datetime
select utc_date(), utc_time, utc_timestamp(); #universel
select date(now()); #date part of datetime
select time(now());
select year(now()), month(now()), day(now()), hour(now()), minute(now()), second(now()), week(now());
select datediff(now(), '2022-12-15'); #'now() - 2022-12-15', exprim�� en 'day'
select date_add(now(), interval 2 minute);
select date_format(now(), "%d/%m/%Y-%H:%i:%s");
select weekday('2005-8-8'); #jour de la semaine, lundi : 0
select concat(dayname(now()), " ", monthname(now()), " ", year(now())) as 'date nomm��e';
###########################
select curdate();
#select datediff(now(), '2022-12-15');
select TIMESTAMPDIFF(WEEK , '2026-02-24' , CURDATE());
###########################
select * from stagiaire;

select cne, year(daten) from stagiaire; #(Arr��t Dev102 25/02/2026)

# Liste de toutes les ann��es de naissance pr��sentes (sans doublons)
select distinct year(daten) from stagiaire;

#somme des cne par ann��e de naissance
select year(daten), sum(cne) from stagiaire
	group by year(daten);
    
#ann��e de naissance minimale par nom et pr��nom de stagiaire
select nom, prenom, min(year(daten)) from stagiaire
	group by nom, prenom;
    
#ann��e de naissance minimale par nom et pr��nom de stagiaire pour les groupes dont tous les stagiaires
#sont n��s dans les 10 premiers jours des mois
select nom, prenom, min(year(daten)) from stagiaire
	group by nom, prenom
    having(max(day(daten)) <= 10)