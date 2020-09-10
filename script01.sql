DROP DATABASE IF EXISTS dbgestion;
CREATE DATABASE dbgestion;
USE dbgestion;
#CREATE TABLE  CLIENT
#(
#id_client int(5) auto_increment primary key not null,
#nom varchar (30) not null,
#prenom varchar(30) not null,
#adresse varchar(100) not null,
#telephone char(10)
#);
CREATE TABLE  FACTURE
(
id_facture int(5) auto_increment not null,
facture_number int (10) not null,
facture_date date,
id_client int(5),
primary key (id_facture),
foreign key (id_client) references client (id_client)
);
CREATE TABLE  PRODUIT
(
id_product int(5) auto_increment not null,
reference_number int (10) not null,
designation VARCHAR (60),
prix_unitaire DECIMAL (5,2),
primary key (id_product)
);
CREATE TABLE  PAYMENT
(
id_payment int(5) auto_increment not null,
payment_date date ,
montant decimal (7,2),
id_facture int(5),
primary key (id_payment),
foreign key (id_facture) references FACTURE (id_facture)
);
CREATE TABLE  COMMANDER
(
id_commande int(5) auto_increment not null,
qte_commande int(5),
id_facture int(5),
id_product int(5),
primary key (id_commande),
foreign key (id_facture) references FACTURE (id_facture),
foreign key (id_product) references PRODUIT (id_product)
);

