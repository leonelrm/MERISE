drop database if exists CompagnieAerienne;

CREATE DATABASE CompagnieAerienne;

USE CompagnieAerienne;

-- --------------------------------------------------------

--
-- Structure de la table `Aeroport` 
--

CREATE TABLE `Aeroport` (
  `IdAeroport` varchar(3) NOT NULL,
  `NomAeroport` varchar(255) NOT NULL,
  `NomVilleDesservie` varchar(255) NOT NULL,
  PRIMARY KEY (`IdAeroport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Aeroport` 
--

INSERT INTO `Aeroport` (`IdAeroport`,`NomAeroport`,`NomVilleDesservie`) VALUES('BAS','Poretta','Bastia');
INSERT INTO `Aeroport` (`IdAeroport`,`NomAeroport`,`NomVilleDesservie`) VALUES('BLA','Blagnac','Toulouse');
INSERT INTO `Aeroport` (`IdAeroport`,`NomAeroport`,`NomVilleDesservie`) VALUES('BRI','Brive','Brive');
INSERT INTO `Aeroport` (`IdAeroport`,`NomAeroport`,`NomVilleDesservie`) VALUES('CDG','Roissy','Paris');
INSERT INTO `Aeroport` (`IdAeroport`,`NomAeroport`,`NomVilleDesservie`) VALUES('GRE','Saint Geoir','Grenoble');
INSERT INTO `Aeroport` (`IdAeroport`,`NomAeroport`,`NomVilleDesservie`) VALUES('LYS','Saint exupéry','Lyon');
INSERT INTO `Aeroport` (`IdAeroport`,`NomAeroport`,`NomVilleDesservie`) VALUES('NAN','Saint Herblain','Nantes');
INSERT INTO `Aeroport` (`IdAeroport`,`NomAeroport`,`NomVilleDesservie`) VALUES('NIC','Nice cote d`azur','Nice');
INSERT INTO `Aeroport` (`IdAeroport`,`NomAeroport`,`NomVilleDesservie`) VALUES('ORL','Orly','Paris');

-- --------------------------------------------------------

--
-- Structure de la table `Affectation`
--

CREATE TABLE `Affectation` (
  `NumVol` INT(3)  NOT NULL AUTO_INCREMENT,
  `DateVol` date NOT NULL,
  `NumAvion` int(3) NOT NULL ,
  `idPilote` int(1) NOT NULL , 
  
  KEY `NumVol` (`NumVol` ),
  KEY `NumAvion` (`NumAvion`),
  KEY `idPilote` (`idPilote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Contenu de la table `Affectation` 
--

/* INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(100,'2001-04-6',100,1);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(100,'2001-04-7',101,2);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(101,'2001-04-6',100,2);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(101,'2001-04-7',103,4);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(102,'2001-04-6',101,1);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(102,'2001-04-7',102,3);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(103,'2001-04-6',105,3);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(103,'2001-04-7',104,2);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(104,'2001-04-6',105,3);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(104,'2001-04-7',107,8);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(105,'2001-04-6',107,7);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(105,'2001-04-7',106,7);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(106,'2001-04-6',109,8);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(106,'2001-04-7',104,5);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(107,'2001-04-6',106,9);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(107,'2001-04-6',103,8);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(108,'2001-04-6',106,9);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(108,'2001-04-7',106,5);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(109,'2001-04-6',107,7);
INSERT INTO `Affectation` (`NumVol`,`DateVol`,`NumAvion`,`idPilote`) VALUES(109,'2001-04-7',105,1); */
-- --------------------------------------------------------

--
-- Structure de la table `Avion`
--
DROP TABLE IF EXISTS  `Avion`;
CREATE TABLE `Avion` (
  `NumAvion` int(3)  NOT NULL,
  `TypeAvion` varchar(5) CHECK (`TypeAvion` LIKE "IT[0-9][0-9][0-9]"),
  `BaseAeroport` varchar(3) NOT NULL, 
 
  PRIMARY KEY (`NumAvion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Avion`
--

INSERT INTO `Avion`(`NumAvion`,`TypeAvion`,`BaseAeroport`) VALUES('100','A320','NIC');
INSERT INTO `Avion`(`NumAvion`,`TypeAvion`,`BaseAeroport`) VALUES('101','B707','CDG');
INSERT INTO `Avion`(`NumAvion`,`TypeAvion`,`BaseAeroport`) VALUES('102','A302','BLA');
INSERT INTO `Avion`(`NumAvion`,`TypeAvion`,`BaseAeroport`) VALUES('103','DC10','BLA');
INSERT INTO `Avion`(`NumAvion`,`TypeAvion`,`BaseAeroport`) VALUES('104','B747','ORL');
INSERT INTO `Avion`(`NumAvion`,`TypeAvion`,`BaseAeroport`) VALUES('105','A320','GRE');
INSERT INTO `Avion`(`NumAvion`,`TypeAvion`,`BaseAeroport`) VALUES('106','ATR42','CDG');
INSERT INTO `Avion`(`NumAvion`,`TypeAvion`,`BaseAeroport`) VALUES('107','B727','LYS');
INSERT INTO `Avion`(`NumAvion`,`TypeAvion`,`BaseAeroport`) VALUES('108','B727','NAN');
INSERT INTO `Avion`(`NumAvion`,`TypeAvion`,`BaseAeroport`) VALUES('109','A340','BAS');

-- --------------------------------------------------------

--
-- Structure de la table `Constructeur`
--

CREATE TABLE `Constructeur` (
  `IdConstructeur` int(1) NOT NULL AUTO_INCREMENT,
  `NomConstructeur` varchar(255) NOT NULL,
  PRIMARY KEY (`IdConstructeur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Contenu de la table `Constructeur` 
--

INSERT INTO `Constructeur` (`IdConstructeur`,`NomConstructeur`) VALUES(1,'Aérospatiale');
INSERT INTO `Constructeur` (`IdConstructeur`,`NomConstructeur`) VALUES(2,'Boeing');
INSERT INTO `Constructeur` (`IdConstructeur`,`NomConstructeur`) VALUES(3,'Cessna');
INSERT INTO `Constructeur` (`IdConstructeur`,`NomConstructeur`) VALUES(4,'Douglas');

-- --------------------------------------------------------

--
-- Structure de la table `Pilote`
--

CREATE TABLE `Pilote` (
  `idPilote` int(1) NOT NULL AUTO_INCREMENT, 
  `NomPilote` varchar(255) NOT NULL,
  `PrenomPilote` varchar(255) NOT NULL,
  PRIMARY KEY (`idPilote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Pilote`
--

INSERT INTO `Pilote`(`idPilote`,`NomPilote`,`PrenomPilote`) VALUES(1,'GAINSBOURB','Serge');
INSERT INTO `Pilote`(`idPilote`,`NomPilote`,`PrenomPilote`) VALUES(2,'FERRAT','Jean');
INSERT INTO `Pilote`(`idPilote`,`NomPilote`,`PrenomPilote`) VALUES(3,'NOUGARO','Claude');
INSERT INTO `Pilote`(`idPilote`,`NomPilote`,`PrenomPilote`) VALUES(4,'SHUMMAN','Robert');
INSERT INTO `Pilote`(`idPilote`,`NomPilote`,`PrenomPilote`) VALUES(5,'STROGOFF','Michel');
INSERT INTO `Pilote`(`idPilote`,`NomPilote`,`PrenomPilote`) VALUES(6,'SORREL','Lucien');
INSERT INTO `Pilote`(`idPilote`,`NomPilote`,`PrenomPilote`) VALUES(7,'TAVERNIER','Bertand');
INSERT INTO `Pilote`(`idPilote`,`NomPilote`,`PrenomPilote`) VALUES(8,'FAYOLLE','Marc');
INSERT INTO `Pilote`(`idPilote`,`NomPilote`,`PrenomPilote`) VALUES(9,'LECU','Regis');

-- --------------------------------------------------------

--
-- Structure de la table `Type`
--
DROP table IF EXISTS `Type`;
CREATE TABLE `Type` 
(
  `TypeAvion` varchar(5) CHECK (`TypeAvion` LIKE "IT[0-9][0-9][0-9]") ,
  `Capacite` INT(5) CHECK (`Capacite`< 400 AND `Capacite`>50 ) ,
  `idConstructeur` int(1) NOT NULL, 
  KEY `idConstructeur`(`idConstructeur`),
  PRIMARY KEY (`TypeAvion`)
);


--
-- Contenu de la table `Type` 
--



INSERT INTO `Type`(`TypeAvion`,`Capacite`,`idConstructeur`) VALUES('A320',300,1);
INSERT INTO `Type`(`TypeAvion`,`Capacite`,`idConstructeur`) VALUES('A340',350,1);
INSERT INTO `Type`(`TypeAvion`,`Capacite`,`idConstructeur`) VALUES('ATR42',50,1);
INSERT INTO `Type`(`TypeAvion`,`Capacite`,`idConstructeur`) VALUES('B707',250,2);
INSERT INTO `Type`(`TypeAvion`,`Capacite`,`idConstructeur`) VALUES('B727',300,2);
INSERT INTO `Type`(`TypeAvion`,`Capacite`,`idConstructeur`) VALUES('B747',400,2);
INSERT INTO `Type`(`TypeAvion`,`Capacite`,`idConstructeur`) VALUES('DC10',200,4);

-- --------------------------------------------------------

--
-- Structure de la table `Vol`
--

CREATE TABLE `Vol` (
  `NumVol` INT(3)  NOT NULL AUTO_INCREMENT,
  `AeroportDept` varchar(3) DEFAULT NULL,
  `Hdepart` time DEFAULT NULL,
  `AeroportArr` varchar(3) DEFAULT NULL,
  `HArrivee` time DEFAULT NULL,
  PRIMARY KEY (`NumVol`),
  KEY `AeroportDept`(`AeroportDept`),
  KEY `AeroportArr` (`AeroportArr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Vol` 
--

INSERT INTO `Vol` (`NumVol`,`AeroportDept`,`Hdepart`,`AeroportArr`,`HArrivee`) VALUES('100','NIC','7:00','CDG','9:00');
INSERT INTO `Vol` (`NumVol`,`AeroportDept`,`Hdepart`,`AeroportArr`,`HArrivee`) VALUES('101','ORL','11:00','BLA','12:00');
INSERT INTO `Vol` (`NumVol`,`AeroportDept`,`Hdepart`,`AeroportArr`,`HArrivee`) VALUES('102','CDG','12:00','NIC','14:00');
INSERT INTO `Vol` (`NumVol`,`AeroportDept`,`Hdepart`,`AeroportArr`,`HArrivee`) VALUES('103','GRE','9:00','BLA','11:00');
INSERT INTO `Vol` (`NumVol`,`AeroportDept`,`Hdepart`,`AeroportArr`,`HArrivee`) VALUES('104','BLA','17:00','GRE','19:00');
INSERT INTO `Vol` (`NumVol`,`AeroportDept`,`Hdepart`,`AeroportArr`,`HArrivee`) VALUES('105','LYS','6:00','ORL','7:00');
INSERT INTO `Vol` (`NumVol`,`AeroportDept`,`Hdepart`,`AeroportArr`,`HArrivee`) VALUES('106','BAS','10:00','ORL','13:00');
INSERT INTO `Vol` (`NumVol`,`AeroportDept`,`Hdepart`,`AeroportArr`,`HArrivee`) VALUES('107','NIC','7:00','BRI','8:00');
INSERT INTO `Vol` (`NumVol`,`AeroportDept`,`Hdepart`,`AeroportArr`,`HArrivee`) VALUES('108','BRI','19:00','ORL','20:00');
INSERT INTO `Vol` (`NumVol`,`AeroportDept`,`Hdepart`,`AeroportArr`,`HArrivee`) VALUES('109','NIC','18:00','ORL','19:00');
INSERT INTO `Vol` (`NumVol`,`AeroportDept`,`Hdepart`,`AeroportArr`,`HArrivee`) VALUES('110','ORL','15:00','NIC','16:00');
INSERT INTO `Vol` (`NumVol`,`AeroportDept`,`Hdepart`,`AeroportArr`,`HArrivee`) VALUES('111','NIC','17:00','NAN','19:00');


--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Affectation`
--
ALTER TABLE `Affectation`
  ADD CONSTRAINT `affectation_ibfk_1` FOREIGN KEY (`NumAvion`) REFERENCES `Avion` (`NumAvion`),  /* """"""""REVOIR ICI """""*/
  ADD CONSTRAINT `affectation_ibfk_2` FOREIGN KEY (`idPilote`) REFERENCES `Pilote` (`IdPilote`),
  ADD CONSTRAINT `affectation_ibfk_3` FOREIGN KEY (`NumVol`) REFERENCES `Vol` (`NumVol`);

--
-- Contraintes pour la table `Avion`
--
ALTER TABLE `Avion`
  ADD CONSTRAINT `avion_ibfk_1` FOREIGN KEY (`TypeAvion`) REFERENCES `Type` (`TypeAvion`),
  ADD CONSTRAINT `avion_ibfk_2` FOREIGN KEY (`BaseAeroport`) REFERENCES `Aeroport` (`IdAeroport`);

--
-- Contraintes pour la table `Type`
--
ALTER TABLE `Type`
  ADD CONSTRAINT `type_ibfk_1` FOREIGN KEY (`idConstructeur`) REFERENCES `Constructeur` (`IdConstructeur`);

--
-- Contraintes pour la table `Vol`
--
ALTER TABLE `Vol`
  ADD CONSTRAINT `vol_ibfk_1` FOREIGN KEY (`AeroportDept`) REFERENCES `Aeroport` (`IdAeroport`),
  ADD CONSTRAINT `vol_ibfk_2` FOREIGN KEY (`AeroportArr`) REFERENCES `Aeroport` (`IdAeroport`);

