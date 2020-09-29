#suppression de in base si elle existe
drop database if exists dbgestion;

#création de la base de données dbgestion
create database dbgestion;

#ouverture de la base
use dbgestion;

#create table client 
#(
#	id_client 	int(5) auto_increment primary key not null,
#	nom			varchar(30) not null,
#	prenom		varchar(30) not null,
#	adresse		varchar(100) not null,
#	tel			char(10) not null
#) INNODB;
create table client 
(
	id_client 	int(5) auto_increment not null,
	nom			varchar(30) not null,
	prenom		varchar(30) not null,
	adresse		varchar(100) not null,
	tel			char(10) not null,
	primary key (id_client)
);

create table facture
(
	id_facture 	int(5) auto_increment not null,
	numfact 	varchar(15) not null,
	datefact	date,
	id_clientFacture 	int(5),
	primary key (id_facture),
	foreign key (id_clientFacture) references client(id_client)
);

create table payement
(
	id_payement 	int(5) auto_increment not null,
	datepayement	date not null,
	montantpaye		decimal(7,2) not null,
	id_facturePayment		int(5),
	primary key (id_payement),
	foreign key (id_facturePayment) references facture(id_facture)
	
);

create table produit
(
	id_produit 	int(5) auto_increment not null,
	reference	varchar(15) not null,
	designation	varchar(150) not null,
	prixunit	decimal(7,2) not null,
	primary key (id_produit)
); 

create table commander 
(
	id_commande int(5) auto_increment not null,
	qtecde		int(5) not null,
	id_factureCmd 	int(5) not null,
	id_produitCmd	int(5) not null,
	primary key (id_commande),
	foreign key (id_factureCmd) references facture(id_facture),
	foreign key (id_produitCmd) references produit(id_produit)
);

insert into client (prenom, nom, adresse, tel) values 
('Bave','Jean',' 2 rue des pommes cuites 77200 compote','00000'),
('Mourad','oulala','sevran','1111111'),
('john','snow','avenue de la barrière','2222222'),
('koffi','jean pascal','boulevard du congo','333333'),
('Sarah','croche','3 avenue magenta','555555');

insert into produit (reference, designation, prixunit) values
("ref 0001","Stylo",3.5),
("ref 0002","Ordinateur",499.85),
("ref 0003","Chargeur",20.00),
("ref 0004","Clavier",25),
("ref 0005","Souris",12),
("ref 0006","Souris sans fil",30.00),
("ref 0007","Mac pro",4000),
("ref 0008","Ecran",290),
("ref 0009","Routeur cisco",250),
("ref 0010","Switch",700),
("ref 0011","Playstation 4",400),
("ref 0012","Bureau",800),
("ref 0013","Fauteuil",350),
("ref 0014","Tapis Souris",4),
("ref 0015","Template bootstrap",300),
("ref 0016","Bouteille d'eau",1.5);

insert into facture (numfact, datefact, id_clientFacture) values 
("fact 001","2020-06-10",1),
("fact 002","2020-07-10",1),
("fact 003","2020-08-10",1),
("fact 004","2020-07-10",3),
("fact 005","2020-09-10",3),
("fact 006","2020-08-10",5),
("fact 007","2020-09-10",5),
("fact 008","2020-09-11",5);

insert into commander (qtecde, id_produitCmd, id_factureCmd) values
(1,7,1),
(3,8,1),
(50,16,5),
(10,10,5),
(5,12,5),
(15,14,8),
(1,9,8);

#ajouter  une colonne dans une table

ALTER TABLE client
ADD codePostal CHAR(5);

ALTER TABLE facture
DROP FOREIGN KEY id_client;

update table
set colonne=nouvelle valeur
where condition


#select 2 ville IN
SELECT * FROM client WHERE ville IN ("ville", "ville");

#like

SELECT * FROM table WHERE colonne "%l"

#between
SELECT * FROM table
WHERE colonne BETWEEN valeur AND valeur2;

#AVG() = moyenne
#count() =compte les lignes

#alias
SELECT  count(DISTINCT ville) "nombre de ville" FROM client;

#group by
SELECT c.nom, c.prenom, count(f.facture_number) FROM client c, facture f WHERE c.id_client= f.id_client group BY c.id_client;

#inner JOIN
SELECT client.nom,client.prenom, facture.numfact FROM client INNER JOIN facture ON client.id_client=facture.id_clientFacture;

#LEFT JOIN 
SELECT * FROM client LEFT JOIN facture ON client.id_client=facture.id_clientFacture WHERE numfact is null ;