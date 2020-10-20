-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 20 oct. 2020 à 08:55
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbgestion`
--
CREATE DATABASE IF NOT EXISTS `dbgestion` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbgestion`;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(5) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `tel` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `adresse`, `tel`) VALUES
(1, 'Jean', 'Bave', ' 2 rue des pommes cuites 77200 compote', '00000'),
(2, 'oulala', 'Mourad', 'sevran', '1111111'),
(3, 'snow', 'john', 'avenue de la barrière', '2222222'),
(4, 'jean pascal', 'koffi', 'boulevard du congo', '333333'),
(5, 'croche', 'Sarah', '3 avenue magenta', '555555');

-- --------------------------------------------------------

--
-- Structure de la table `commander`
--

CREATE TABLE `commander` (
  `id_commande` int(5) NOT NULL,
  `qtecde` int(5) NOT NULL,
  `id_factureCmd` int(5) NOT NULL,
  `id_produitCmd` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commander`
--

INSERT INTO `commander` (`id_commande`, `qtecde`, `id_factureCmd`, `id_produitCmd`) VALUES
(1, 1, 1, 7),
(2, 3, 1, 8),
(3, 50, 5, 16),
(4, 10, 5, 10),
(5, 5, 5, 12),
(6, 15, 8, 14),
(7, 1, 8, 9);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id_facture` int(5) NOT NULL,
  `numfact` varchar(15) NOT NULL,
  `datefact` date DEFAULT NULL,
  `id_clientFacture` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id_facture`, `numfact`, `datefact`, `id_clientFacture`) VALUES
(1, 'fact 001', '2020-06-10', 1),
(2, 'fact 002', '2020-07-10', 1),
(3, 'fact 003', '2020-08-10', 1),
(4, 'fact 004', '2020-07-10', 3),
(5, 'fact 005', '2020-09-10', 3),
(6, 'fact 006', '2020-08-10', 5),
(7, 'fact 007', '2020-09-10', 5),
(8, 'fact 008', '2020-09-11', 5);

-- --------------------------------------------------------

--
-- Structure de la table `payement`
--

CREATE TABLE `payement` (
  `id_payement` int(5) NOT NULL,
  `datepayement` date NOT NULL,
  `montantpaye` decimal(7,2) NOT NULL,
  `id_facturePayment` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(5) NOT NULL,
  `reference` varchar(15) NOT NULL,
  `designation` varchar(150) NOT NULL,
  `prixunit` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `reference`, `designation`, `prixunit`) VALUES
(1, 'ref 0001', 'Stylo', '3.50'),
(2, 'ref 0002', 'Ordinateur', '499.85'),
(3, 'ref 0003', 'Chargeur', '20.00'),
(4, 'ref 0004', 'Clavier', '25.00'),
(5, 'ref 0005', 'Souris', '12.00'),
(6, 'ref 0006', 'Souris sans fil', '30.00'),
(7, 'ref 0007', 'Mac pro', '4000.00'),
(8, 'ref 0008', 'Ecran', '290.00'),
(9, 'ref 0009', 'Routeur cisco', '250.00'),
(10, 'ref 0010', 'Switch', '700.00'),
(11, 'ref 0011', 'Playstation 4', '400.00'),
(12, 'ref 0012', 'Bureau', '800.00'),
(13, 'ref 0013', 'Fauteuil', '350.00'),
(14, 'ref 0014', 'Tapis Souris', '4.00'),
(15, 'ref 0015', 'Template bootstrap', '300.00'),
(16, 'ref 0016', 'Bouteille d\'eau', '1.50');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `commander`
--
ALTER TABLE `commander`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_factureCmd` (`id_factureCmd`),
  ADD KEY `id_produitCmd` (`id_produitCmd`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id_facture`),
  ADD KEY `id_clientFacture` (`id_clientFacture`);

--
-- Index pour la table `payement`
--
ALTER TABLE `payement`
  ADD PRIMARY KEY (`id_payement`),
  ADD KEY `id_facturePayment` (`id_facturePayment`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `commander`
--
ALTER TABLE `commander`
  MODIFY `id_commande` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `id_facture` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `payement`
--
ALTER TABLE `payement`
  MODIFY `id_payement` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commander`
--
ALTER TABLE `commander`
  ADD CONSTRAINT `commander_ibfk_1` FOREIGN KEY (`id_factureCmd`) REFERENCES `facture` (`id_facture`),
  ADD CONSTRAINT `commander_ibfk_2` FOREIGN KEY (`id_produitCmd`) REFERENCES `produit` (`id_produit`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`id_clientFacture`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `payement`
--
ALTER TABLE `payement`
  ADD CONSTRAINT `payement_ibfk_1` FOREIGN KEY (`id_facturePayment`) REFERENCES `facture` (`id_facture`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
