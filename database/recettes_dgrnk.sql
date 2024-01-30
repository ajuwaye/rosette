-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 30 jan. 2024 à 10:37
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `recettes_dgrnk`
--

-- --------------------------------------------------------

--
-- Structure de la table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `sexe` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `etat_civil` varchar(100) NOT NULL,
  `matricule` varchar(100) NOT NULL,
  `permission` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `agents`
--

INSERT INTO `agents` (`id`, `nom`, `prenom`, `sexe`, `age`, `etat_civil`, `matricule`, `permission`, `status`, `email`, `password`) VALUES
(1, 'AJUWA', 'Immaculée ', 'Femme', 23, 'Marié ', '445', 'agent taxateur', 1, 'immaculee@gmail.com', '63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1'),
(2, 'Nzighali', 'Yehosh', '', 23, 'Celibataire', '2322', 'Recouvreur', 1, 'yeh@gmail.com', '63982e54a7aeb0d89910475ba6dbd3ca6dd4e5a1');

-- --------------------------------------------------------

--
-- Structure de la table `fiche_paie`
--

CREATE TABLE `fiche_paie` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `sexe` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `localisation_immeuble` varchar(255) NOT NULL,
  `nb_locataires` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fiche_paie`
--

INSERT INTO `fiche_paie` (`id`, `nom`, `prenom`, `sexe`, `age`, `adresse`, `localisation_immeuble`, `nb_locataires`, `status`) VALUES
(3, 'AJUWA', 'Immaculé ', 'Femme', 23, 'Goma', 'Goma, Kyeshero, De la paix, 45', 12, 1),
(4, 'Nzighali', 'Yehosh', 'Homme', 23, 'Goma', 'Goma, Kasika, De la paix, 65', 9, 0);

-- --------------------------------------------------------

--
-- Structure de la table `note_perception`
--

CREATE TABLE `note_perception` (
  `id` int(11) NOT NULL,
  `id_contribuable` int(11) NOT NULL,
  `type_paie` varchar(100) NOT NULL,
  `montant` float NOT NULL,
  `motif` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `note_perception`
--

INSERT INTO `note_perception` (`id`, `id_contribuable`, `type_paie`, `montant`, `motif`, `date`, `status`) VALUES
(2, 3, 'Compte bancaire', 15000, 'taxes', '2024-01-29', 0),
(3, 4, 'Compte bancaire', 4500, 'taxes', '2024-01-30', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fiche_paie`
--
ALTER TABLE `fiche_paie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `note_perception`
--
ALTER TABLE `note_perception`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_contribuable` (`id_contribuable`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `fiche_paie`
--
ALTER TABLE `fiche_paie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `note_perception`
--
ALTER TABLE `note_perception`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `note_perception`
--
ALTER TABLE `note_perception`
  ADD CONSTRAINT `note_perception_ibfk_1` FOREIGN KEY (`id_contribuable`) REFERENCES `fiche_paie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
