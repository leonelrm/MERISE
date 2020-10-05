drop database if exists compagnieAerienne;
create database compagnieAerienne;
USE compagnieAerienne;

--
-- Base de données :  `compagnieAerienne`
--

-- --------------------------------------------------------
--
-- Structure de la table `CONSTRUCTEUR`
--
CREATE TABLE IF NOT EXISTS CONSTRUCTEUR
(
IdConstructeur INT(1) AUTO_INCREMENT not null,
NomConstructeur VARCHAR(30) not null,
PRIMARY KEY (IdConstructeur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `PILOTE`
--

CREATE TABLE IF NOT EXISTS  PILOTE
(
IdPilote INT (3) auto_increment not null,
NomPilote VARCHAR(10) UNIQUE not null,
PrenomPilote VARCHAR (10) UNIQUE not null,
PRIMARY KEY (IdPilote),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `TYPE`
--
CREATE TABLE IF NOT EXISTS TYPE
(
TypeAvion CHAR (5) CHECK ( COALESCE(SUBSTRING(TypeAvion, 1, 1),'X') BETWEEN 'A' AND 'Z'),
Capacite INT(5) DEFAULT 100 CHECK (Capacite<= 400 AND Capacite>= 50) not null,
IdConstructeur INT (1),
PRIMARY KEY (TypeAvion),
KEY IdConstruteur (IdConstructeur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `AVION`
--

CREATE TABLE IF NOT EXISTS AVION
(
NumAvion INT(3) auto_increment NOT NULL,
TypeAvion CHAR (5),
BaseAeroport CHAR (3),
PRIMARY KEY (NumAvion),
KEY TypeAvion (TypeAvion),
KEY BaseAeroport (BaseAeroport)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE AVION auto_increment=100;

--
-- Structure de la table `AEROPORT`
--

CREATE TABLE IF NOT EXISTS AEROPORT
(
IdAeroport CHAR(3),
NomAeroport VARCHAR(10) not null,
NomVilleDesservie VARCHAR(10),
PRIMARY KEY(IdAeroport)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Structure de la table `VOL`
--

CREATE TABLE IF NOT EXISTS  VOL
(
NumVol CHAR (5) not null,    
AeroportDept CHAR(3),
Hdepart TIME,
AeroportArr CHAR(3),
Harrive TIME, 
PRIMARY KEY (NumVol),
KEY AeroportDept (AeroportDept),
KEY AeroportArr (AeroportArr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `AFFECTATION`
--

CREATE TABLE IF NOT EXISTS AFFECTATION
(
NumVol CHAR(5),
DateVol DATE,
NumAvion int(5),
IdPilote INT (3),
PRIMARY KEY (NumVol,DateVol),
KEY NumAvion (NumAvion),
KEY IdPilote (IdPilote)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Contraintes pour les tables exportées
--
-- Contraintes pour la table `AFFECTATION`
ALTER TABLE AFFECTATION
ADD CONSTRAINT NumVol
FOREIGN KEY (NumVol) REFERENCES VOL (NumVol),
ADD CONSTRAINT NumAvion
FOREIGN KEY (NumAvion) REFERENCES AVION (NumAvion),
ADD CONSTRAINT IdPilote
FOREIGN KEY (IdPilote) REFERENCES PILOTE (IdPilote);

-- Contraintes pour la table `VOL`
ALTER TABLE VOL 
ADD CONSTRAINT AeroportDept
FOREIGN KEY (AeroportDept) REFERENCES AEROPORT (IdAeroport),
ADD CONSTRAINT AeroportArr
FOREIGN KEY (AeroportArr) REFERENCES AEROPORT (IdAeroport);

--
-- Contraintes pour la table `TYPE`
ALTER TABLE TYPE 
ADD CONSTRAINT IdConstruteur 
FOREIGN KEY (IdConstructeur) REFERENCES CONSTRUCTEUR (IdConstructeur);

-- Contraintes pour la table `AVION`
ALTER TABLE AVION 
ADD CONSTRAINT TypeAvion
FOREIGN KEY (TypeAvion) REFERENCES TYPE (TypeAvion);
ADD CONSTRAINT AVION_ibfk_1
FOREIGN KEY (BaseAeroport) REFERENCES AEROPORT (IdAeroport),




--
-- Contenu de la table `Constructeur` 
--

INSERT INTO CONSTRUCTEUR (NomConstructeur) VALUES
("Aerospatiale"),
("Boeing"),
("Cessna"),
("Douglas");

--
-- Contenu de la table `PILOTE`
--

INSERT INTO PILOTE (NomPilote,PrenomPilote) VALUES
('GAINSBOURB','Serge'),
('FERRAT','Jean'),
('NOUGARO','Claude'),
('SHUMMAN','Robert'),
('STROGOFF','Michel'),
('SORREL','Lucien'),
('TAVERNIER','Bertand'),
('FAYOLLE','Marc'),
('LECU','Regis');

--
-- Contenu de la table `TYPE`
--
INSERT INTO TYPE (TypeAvion,Capacite,IdConstructeur) VALUES
('A320',300,1),
('A340',350,1),
('ATR42',50,1),
('B707',250,2),
('B727',300,2),
('B747',400,2),
('DC10',200,4);


--
-- Contenu de la table `Aeroport` 
--
INSERT INTO AEROPORT (IdAeroport,NomAeroport,NomVilleDesservie) VALUES
('BAS','Poretta','Bastia'),
('BLA','Blagnac','Toulouse'),
('BRI','Brive','Brive'),
('CDG','Roissy','Paris'),
('GRE','Saint Geoir','Grenoble'),
('LYS','Saint exupéry','Lyon'),
('NAN','Saint Herblain','Nantes'),
('NIC','Nice cote d`azur','Nice'),
('ORL','Orly','Paris');

--
-- Contenu de la table `VOL` 
--

INSERT INTO VOL (NumVol,AeroportDept,Hdepart,AeroportArr,HArrive) VALUES
('100','NIC','7:00','CDG','9:00'),
('101','ORL','11:00','BLA','12:00'),
('102','CDG','12:00','NIC','14:00'),
('103','GRE','9:00','BLA','11:00'),
('104','BLA','17:00','GRE','19:00'),
('105','LYS','6:00','ORL','7:00'),
('106','BAS','10:00','ORL','13:00'),
('107','NIC','7:00','BRI','8:00'),
('108','BRI','19:00','ORL','20:00'),
('109','NIC','18:00','ORL','19:00'),
('110','ORL','15:00','NIC','16:00'),
('111','NIC','17:00','NAN','19:00');


--
-- Contenu de la table `AVION`
--

INSERT INTO AVION (TypeAvion,BaseAeroport) VALUES
('A320','NIC'),
('B707','CDG'),
('A302','BLA'),
('DC10','BLA'),
('B747','ORL'),
('A320','GRE'),
('ATR42','CDG'),
('B727','LYS'),
('B727','NAN'),
('A340','BAS');

--
-- Contenu de la table AFFECTATION
--

INSERT INTO AFFECTATION (NumVol,DateVol,NumAvion,idPilote) VALUES
(100,'2001-04-06',100,1),
(100,'2001-04-07',101,2),
(101,'2001-04-06',100,2),
(101,'2001-04-07',103,4),
(102,'2001-04-06',101,1),
(102,'2001-04-07',102,3),
(103,'2001-04-06',105,3),
(103,'2001-04-07',104,2),
(104,'2001-04-06',105,3),
(104,'2001-04-07',107,8),
(105,'2001-04-06',107,7),
(105,'2001-04-07',106,7),
(106,'2001-04-06',109,8),
(106,'2001-04-07',104,5),
(107,'2001-04-06',106,9),
(107,'2001-04-07',103,8),
(108,'2001-04-06',106,9),
(108,'2001-04-07',106,5),
(109,'2001-04-06',107,7),
(109,'2001-04-07',105,1); 




