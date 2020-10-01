drop database if exists compagnieAerienne;
create database compagnieAerienne;
USE compagnieAerienne;

CREATE TABLE IF NOT EXISTS AVION
(
NumAvion INT (3) auto_increment NOT NULL,
TypeAvion VARCHAR (10),
BaseAeroport VARCHAR (3),
PRIMARY KEY (NumAvion)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE AVION auto_increment=100;


CREATE TABLE IF NOT EXISTS `TYPE`
(
TypeAvion VARCHAR (10) not null,
Capacite INT(5) DEFAULT 100,
IdConstructeur int(5),
PRIMARY KEY (TypeAvion)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS CONSTRUCTEUR
(
IdConstructeur INT(10)  not null,
NomConstructeur VARCHAR(30) not null,
PRIMARY KEY (IdConstructeur)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE CONSTRUCTEUR auto_increment=2;

CREATE TABLE IF NOT EXISTS  PILOTE
(
IdPilote VARCHAR (10) not null,
NomPilote INT(10) UNIQUE not null,
PrenomPilote int(5) UNIQUE not null,
PRIMARY KEY (IdPilote)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE PILOTE auto_increment=2;

CREATE TABLE IF NOT EXISTS AEROPORT
(
IdAeroport VARCHAR(3) not null,
NomAeroport VARCHAR(10) not null,
NomVilleDesservie VARCHAR(10),
PRIMARY KEY(IdAeroport)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS  VOL
(
NomVol VARCHAR (5),
AeroportDept VARCHAR(3),
Hdepart TIME,
AeroportArr VARCHAR(3),
Harrive TIME, 
PRIMARY KEY (NomVol)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS AFFECTATION
(
NumVol VARCHAR(5),
DateVol DATE,
NumAvion int(5) not null,
IdPilote INT(3),
PRIMARY KEY (NumVol)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE AVION 
ADD CONSTRAINT BaseAeroport 
FOREIGN KEY (BaseAeroport) REFERENCES AEROPORT (IdAeroport);

ALTER TABLE AVION 
ADD CONSTRAINT TypeAvion 
FOREIGN KEY (TypeAvion) REFERENCES `TYPE`(TypeAvion);

ALTER TABLE `TYPE`
ADD CONSTRAINT IdConstructeur 
FOREIGN KEY (IdConstructeur) REFERENCES `TYPE`(TypeAvion);

