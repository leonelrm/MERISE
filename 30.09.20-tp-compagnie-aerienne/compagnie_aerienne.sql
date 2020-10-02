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
IdConstructeur INT(10)  not null,
NomConstructeur VARCHAR(30) not null,
PRIMARY KEY (IdConstructeur)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE CONSTRUCTEUR auto_increment=2;

--
-- Structure de la table `PILOTE`
--

CREATE TABLE IF NOT EXISTS  PILOTE
(
IdPilote VARCHAR (10) auto_increment not null,
NomPilote INT(10) UNIQUE not null,
PrenomPilote int(5) UNIQUE not null,
PRIMARY KEY (IdPilote)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE PILOTE auto_increment=2;

--
-- Structure de la table `AVION`
--

CREATE TABLE IF NOT EXISTS AVION
(
NumAvion INT (3) auto_increment NOT NULL,
TypeAvion VARCHAR (5),
BaseAeroport VARCHAR (3),
PRIMARY KEY (NumAvion)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE AVION auto_increment=100;

--
-- Contenu de la table `avion`
--

--
-- Structure de la table `CONSTRUCTEUR`
--
CREATE TABLE IF NOT EXISTS CONSTRUCTEUR
(
IdConstructeur INT(10)  auto_increment not null,
NomConstructeur VARCHAR(30) not null,
PRIMARY KEY (IdConstructeur)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE CONSTRUCTEUR auto_increment=2;

--
-- Structure de la table `TYPE`
--
CREATE TABLE IF NOT EXISTS TYPE
(
TypeAvion VARCHAR (5) CHECK ( TypeAvion LIKE "[a-z]*"),
Capacite INT(5) DEFAULT 100 CHECK (Capacite<= 400 AND Capacite>= 50),
IdConstructeur int(10),
PRIMARY KEY (TypeAvion)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Structure de la table `AEROPORT`
--

CREATE TABLE IF NOT EXISTS AEROPORT
(
IdAeroport VARCHAR(3) not null,
NomAeroport VARCHAR(10) not null,
NomVilleDesservie VARCHAR(10),
PRIMARY KEY(IdAeroport)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `VOL`
--

CREATE TABLE IF NOT EXISTS  VOL
(
NumVol VARCHAR (5),
AeroportDept VARCHAR(3),
Hdepart TIME,
AeroportArr VARCHAR(3),
Harrive TIME, 
PRIMARY KEY (NumVol)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `AFFECTATION`
--

CREATE TABLE IF NOT EXISTS AFFECTATION
(
NumVol VARCHAR(5) CHECK (NumVol LIKE "IT[0-9][0-9][0-9]"),
DateVol DATE,
NumAvion int(5) not null,
IdPilote varchar(10),
PRIMARY KEY (NumVol)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `AVION`
ALTER TABLE AVION 
ADD CONSTRAINT BaseAeroport 
FOREIGN KEY (BaseAeroport) REFERENCES AEROPORT (IdAeroport);

ALTER TABLE AVION 
ADD CONSTRAINT TypeAvion 
FOREIGN KEY (TypeAvion) REFERENCES TYPE (TypeAvion);

-- Contraintes pour la table `TYPE`
ALTER TABLE TYPE 
ADD CONSTRAINT IdConstruteur 
FOREIGN KEY (IdConstructeur) REFERENCES CONSTRUCTEUR (IdConstructeur);

-- Contraintes pour la table `VOL`
ALTER TABLE VOL 
ADD CONSTRAINT AeroportDept
FOREIGN KEY (AeroportDept) REFERENCES AEROPORT (IdAeroport),
ADD CONSTRAINT AeroportArr
FOREIGN KEY (AeroportArr) REFERENCES AEROPORT (IdAeroport);

-- Contraintes pour la table `AFFECTATION`
ALTER TABLE AFFECTATION
ADD CONSTRAINT numVol
FOREIGN KEY (NumVol) REFERENCES VOL (NumVol),
ADD CONSTRAINT numAvion
FOREIGN KEY (NumAvion) REFERENCES AVION (NumAvion),
ADD CONSTRAINT IdPilote
FOREIGN KEY (IdPilote) REFERENCES PILOTE (IdPilote);