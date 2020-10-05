DROP DATABASE `compagnieaerienne`;
CREATE DATABASE IF NOT EXISTS `compagnieaerienne` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `compagnieaerienne`;

-- --------------------------------------------------------

--
-- Structure de la table `aeroport`
--

CREATE TABLE `aeroport` (
  `IdAeroport` char(3) NOT NULL,
  `NomAeroport` varchar(10) NOT NULL,
  `NomVilleDesservie` varchar(10) DEFAULT NULL  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `aeroport`
--

INSERT INTO `aeroport` (`IdAeroport`, `NomAeroport`, `NomVilleDesservie`) VALUES
('BAS', 'Poretta', 'Bastia'),
('BLA', 'Blagnac', 'Toulouse'),
('BRI', 'Brive', 'Brive'),
('CDG', 'Roissy', 'Paris'),
('GRE', 'Saint Geoi', 'Grenoble'),
('LYS', 'Saint exup', 'Lyon'),
('NAN', 'Saint Herb', 'Nantes'),
('NIC', 'Nice cote ', 'Nice'),
('ORL', 'Orly', 'Paris');

-- --------------------------------------------------------

--
-- Structure de la table `affectation`
--

CREATE TABLE `affectation` (
  `NumVol` char(5) NOT NULL,
  `DateVol` date NOT NULL,
  `NumAvion` int(5) DEFAULT NULL,
  `IdPilote` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `affectation`
--

INSERT INTO `affectation` (`NumVol`, `DateVol`, `NumAvion`, `IdPilote`) VALUES
('100', '2001-04-06', 100, 1),
('100', '2001-04-07', 101, 2),
('101', '2001-04-06', 100, 2),
('101', '2001-04-07', 103, 4),
('102', '2001-04-06', 101, 1),
('102', '2001-04-07', 102, 3),
('103', '2001-04-06', 105, 3),
('103', '2001-04-07', 104, 2),
('104', '2001-04-06', 105, 3),
('104', '2001-04-07', 107, 8),
('105', '2001-04-06', 107, 7),
('105', '2001-04-07', 106, 7),
('106', '2001-04-06', 109, 8),
('106', '2001-04-07', 104, 5),
('107', '2001-04-06', 106, 9),
('107', '2001-04-07', 103, 8),
('108', '2001-04-06', 106, 9),
('108', '2001-04-07', 106, 5),
('109', '2001-04-06', 107, 7),
('109', '2001-04-07', 105, 1);

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

CREATE TABLE `avion` (
  `NumAvion` int(3) NOT NULL,
  `TypeAvion` char(5) DEFAULT NULL,
  `BaseAeroport` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `avion`
--

INSERT INTO `avion` (`NumAvion`, `TypeAvion`, `BaseAeroport`) VALUES
(100, 'A320', 'NIC'),
(101, 'B707', 'CDG'),
(102, 'A320', 'BLA'),
(103, 'DC10', 'BLA'),
(104, 'B747', 'ORL'),
(105, 'A320', 'GRE'),
(106, 'ATR42', 'CDG'),
(107, 'B727', 'LYS'),
(108, 'B727', 'NAN'),
(109, 'A340', 'BAS');

-- --------------------------------------------------------

--
-- Structure de la table `constructeur`
--

CREATE TABLE `constructeur` (
  `IdConstructeur` int(1) NOT NULL,
  `NomConstructeur` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `constructeur`
--

INSERT INTO `constructeur` (`IdConstructeur`, `NomConstructeur`) VALUES
(1, 'Aérospatiale'),
(2, 'Boeing'),
(3, 'Cessna'),
(4, 'Douglas');

-- --------------------------------------------------------

--
-- Structure de la table `pilote`
--

CREATE TABLE `pilote` (
  `IdPilote` int(3) NOT NULL,
  `NomPilote` varchar(10) NOT NULL,
  `PrenomPilote` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pilote`
--

INSERT INTO `pilote` (`IdPilote`, `NomPilote`, `PrenomPilote`) VALUES
(8, 'FAYOLLE', 'Marc'),
(2, 'FERRAT', 'Jean'),
(1, 'GAINSBOURB', 'Serge'),
(9, 'LECU', 'Regis'),
(3, 'NOUGARO', 'Claude'),
(4, 'SHUMMAN', 'Robert'),
(6, 'SORREL', 'Lucien'),
(5, 'STROGOFF', 'Michel'),
(7, 'TAVERNIER', 'Bertand');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `TypeAvion` char(5) NOT NULL,
  `Capacite` int(5) NOT NULL DEFAULT 100 CHECK (`Capacite` <= 400 and `Capacite` >= 50),
  `IdConstructeur` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`TypeAvion`, `Capacite`, `IdConstructeur`) VALUES
('A320', 300, 1),
('A340', 350, 1),
('ATR42', 50, 1),
('B707', 250, 2),
('B727', 300, 2),
('B747', 400, 2),
('DC10', 200, 4);

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

CREATE TABLE `vol` (
  `NumVol` char(5) NOT NULL,
  `AeroportDept` char(3) DEFAULT NULL,
  `Hdepart` time DEFAULT NULL,
  `AeroportArr` char(3) DEFAULT NULL,
  `Harrive` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`NumVol`, `AeroportDept`, `Hdepart`, `AeroportArr`, `Harrive`) VALUES
('100', 'NIC', '07:00:00', 'CDG', '09:00:00'),
('101', 'ORL', '11:00:00', 'BLA', '12:00:00'),
('102', 'CDG', '12:00:00', 'NIC', '14:00:00'),
('103', 'GRE', '09:00:00', 'BLA', '11:00:00'),
('104', 'BLA', '17:00:00', 'GRE', '19:00:00'),
('105', 'LYS', '06:00:00', 'ORL', '07:00:00'),
('106', 'BAS', '10:00:00', 'ORL', '13:00:00'),
('107', 'NIC', '07:00:00', 'BRI', '08:00:00'),
('108', 'BRI', '19:00:00', 'ORL', '20:00:00'),
('109', 'NIC', '18:00:00', 'ORL', '19:00:00'),
('110', 'ORL', '15:00:00', 'NIC', '16:00:00'),
('111', 'NIC', '17:00:00', 'NAN', '19:00:00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aeroport`
--
ALTER TABLE `aeroport`
  ADD PRIMARY KEY (`IdAeroport`);

--
-- Index pour la table `affectation`
--
ALTER TABLE `affectation`
  ADD PRIMARY KEY (`NumVol`,`DateVol`),
  ADD KEY `NumAvion` (`NumAvion`),
  ADD KEY `IdPilote` (`IdPilote`);

--
-- Index pour la table `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`NumAvion`),
  ADD KEY `TypeAvion` (`TypeAvion`),
  ADD KEY `BaseAeroport` (`BaseAeroport`);

--
-- Index pour la table `constructeur`
--
ALTER TABLE `constructeur`
  ADD PRIMARY KEY (`IdConstructeur`);

--
-- Index pour la table `pilote`
--
ALTER TABLE `pilote`
  ADD PRIMARY KEY (`IdPilote`),
  ADD UNIQUE KEY `pilote` (`NomPilote`,`PrenomPilote`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`TypeAvion`),
  ADD KEY `IdConstruteur` (`IdConstructeur`);

--
-- Index pour la table `vol`
--
ALTER TABLE `vol`
  ADD PRIMARY KEY (`NumVol`),
  ADD KEY `AeroportDept` (`AeroportDept`),
  ADD KEY `AeroportArr` (`AeroportArr`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avion`
--
ALTER TABLE `avion`
  MODIFY `NumAvion` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT pour la table `constructeur`
--
ALTER TABLE `constructeur`
  MODIFY `IdConstructeur` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pilote`
--
ALTER TABLE `pilote`
  MODIFY `IdPilote` int(3) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `affectation`
--
ALTER TABLE `affectation`
  ADD CONSTRAINT `IdPilote` FOREIGN KEY (`IdPilote`) REFERENCES `pilote` (`IdPilote`),
  ADD CONSTRAINT `NumAvion` FOREIGN KEY (`NumAvion`) REFERENCES `avion` (`NumAvion`),
  ADD CONSTRAINT `NumVol` FOREIGN KEY (`NumVol`) REFERENCES `vol` (`NumVol`);

--
-- Contraintes pour la table `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `TypeAvion` FOREIGN KEY (`TypeAvion`) REFERENCES `type` (`TypeAvion`),
  ADD CONSTRAINT `avion_ibfk_1` FOREIGN KEY (`BaseAeroport`) REFERENCES `aeroport` (`IdAeroport`);

--
-- Contraintes pour la table `type`
--
ALTER TABLE `type`
  ADD CONSTRAINT `IdConstruteur` FOREIGN KEY (`IdConstructeur`) REFERENCES `constructeur` (`IdConstructeur`);

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `AeroportArr` FOREIGN KEY (`AeroportArr`) REFERENCES `aeroport` (`IdAeroport`),
  ADD CONSTRAINT `AeroportDept` FOREIGN KEY (`AeroportDept`) REFERENCES `aeroport` (`IdAeroport`);

