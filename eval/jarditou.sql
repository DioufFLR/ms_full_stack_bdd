-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 15 fév. 2023 à 15:51
-- Version du serveur : 10.6.11-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `jarditou`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `cli_id` int(11) NOT NULL,
  `cli_type` tinyint(1) DEFAULT NULL,
  `cli_nom` varchar(50) NOT NULL,
  `cli_prenom` varchar(50) NOT NULL,
  `cli_adresse` varchar(100) NOT NULL,
  `cli_cp` char(5) NOT NULL,
  `cli_ville` varchar(10) NOT NULL,
  `cli_tel` varchar(10) NOT NULL,
  `cli_mail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`cli_id`, `cli_type`, `cli_nom`, `cli_prenom`, `cli_adresse`, `cli_cp`, `cli_ville`, `cli_tel`, `cli_mail`) VALUES
(1, NULL, 'Djibril', 'Clement', '11 rue de garenne', '20111', 'Amiens', '0647589663', 'terje250@tubidu.com'),
(2, NULL, 'Rali', 'Romain', '11 rue de safd', '60000', 'Beauvais', '0647589663', 'asfa@sd.com'),
(3, NULL, 'Kere', 'Karim', '11 rue de boulanger', '76000', 'Rouen', '0647589663', 'seee@ged.fr'),
(4, NULL, 'Goui', 'Seydina', '11 rue de la verdure', '59000', 'Calais', '0647589663', 'sedere@petit.com'),
(5, NULL, 'Douosd', 'Clement', '11 rue de careme', '13000', 'Marseille', '0647589663', 'rss@ripo.com'),
(6, NULL, 'Goeoeo', 'Paul', '11 rue de la calle', '30000', 'Nîmes', '0647589663', 'elo@la.fr'),
(7, NULL, 'Wiou', 'Ibo', '11 rue des deporté', '59000', 'Lens', '0647589663', 'boudina@gmail.com'),
(8, NULL, 'Qthil', 'Arthur', '11 rue de asfd', '67000', 'Strasbourg', '0647589663', 'fautei@dsaf.ce'),
(9, NULL, 'DjAibril', 'Johny', '11 rue de bonojour', '33000', 'Bordeaux', '0647589663', 'asdfasdf@colo.com'),
(10, NULL, 'Ribbril', 'Quentin', '11 rue de rip', '44000', 'Nantes', '0647589663', 'commentaitr@rubi.com');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `com_id` int(11) NOT NULL,
  `com_dateCommande` date NOT NULL,
  `com_dateLivraison` date NOT NULL,
  `com_etatCommande` varchar(25) NOT NULL,
  `com_editionFacture` bit(1) DEFAULT NULL,
  `cli_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`com_id`, `com_dateCommande`, `com_dateLivraison`, `com_etatCommande`, `com_editionFacture`, `cli_id`) VALUES
(1, '2021-04-24', '2022-05-23', 'En cours', NULL, 1),
(2, '2021-04-24', '2023-12-23', 'En cours', NULL, 2),
(3, '2021-05-22', '2023-11-24', 'En retard', NULL, 3),
(4, '2021-01-13', '2023-05-23', 'En cours', NULL, 2),
(5, '2022-04-27', '2023-10-19', 'En retard', NULL, 6),
(6, '2021-04-24', '2023-08-15', 'En cours', NULL, 5),
(7, '2021-02-11', '2023-07-23', 'En retard', NULL, 4),
(8, '2021-07-08', '2023-01-15', 'Livré', NULL, 8),
(9, '2021-03-03', '2023-05-23', 'En cours', NULL, 3),
(10, '2021-04-12', '2023-01-23', 'Livré', NULL, 9);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `fourni_id` int(11) NOT NULL,
  `fourni_nom` varchar(50) NOT NULL,
  `fourni_adress` varchar(100) NOT NULL,
  `fourni_cp` char(5) NOT NULL,
  `fourni_ville` varchar(50) NOT NULL,
  `fourni_tel` varchar(10) DEFAULT NULL,
  `fourni_mail` varchar(50) DEFAULT NULL,
  `fourni_type` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`fourni_id`, `fourni_nom`, `fourni_adress`, `fourni_cp`, `fourni_ville`, `fourni_tel`, `fourni_mail`, `fourni_type`) VALUES
(1, 'Valeo', '95, avenue Toussaint Chien', '26170', 'PROPIAC', NULL, NULL, NULL),
(2, 'HyperU', '11, rue Julien Maurices', '47470', 'CAUZAC', NULL, NULL, NULL),
(3, 'Lamoule', '8, avenue Gérard Petin', '67580', 'FORSTHEIM', NULL, NULL, NULL),
(4, 'TapisVolant', '55, rue Corinne Labombe', '63320', 'VERRIERES', NULL, NULL, NULL),
(5, 'MosaiquePizza', '66, boulevard Stephane Duchet', '78930', 'GUERVILLE', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `pan_quantiProduit` int(11) NOT NULL,
  `pan_prixVentePar` float NOT NULL,
  `pan_prixVentePro` float NOT NULL,
  `prod_code` char(6) NOT NULL,
  `com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`pan_quantiProduit`, `pan_prixVentePar`, `pan_prixVentePro`, `prod_code`, `com_id`) VALUES
(10, 2, 1.75, 'AB8164', 2),
(4, 3, 2.1, 'AB8654', 2),
(4, 5, 4.5, 'AB8766', 6),
(2, 3, 2.5, 'AB8854', 2),
(2, 2, 1.75, 'AB8854', 9),
(7, 2, 1.75, 'AD8788', 1),
(1, 2, 1.75, 'AD8788', 4),
(6, 2, 1.75, 'AD8788', 8),
(11, 3, 2, 'CB8349', 1),
(1, 5, 3.5, 'CB8349', 3);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `prod_code` char(6) NOT NULL,
  `prod_lib` varchar(100) NOT NULL,
  `prod_desc` varchar(250) DEFAULT NULL,
  `prod_phot` varchar(250) DEFAULT NULL,
  `prod_affichage` bit(1) DEFAULT NULL,
  `prod_prixAchat` int(11) NOT NULL,
  `prod_stockPhy` int(11) NOT NULL,
  `prod_stockAlerte` int(11) NOT NULL,
  `fourni_id` int(11) DEFAULT NULL,
  `rubri_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`prod_code`, `prod_lib`, `prod_desc`, `prod_phot`, `prod_affichage`, `prod_prixAchat`, `prod_stockPhy`, `prod_stockAlerte`, `fourni_id`, `rubri_id`) VALUES
('AB8164', 'Fourchette', NULL, NULL, NULL, 4, 500, 205, 3, NULL),
('AB8436', 'Kiwi', NULL, NULL, NULL, 1, 500, 205, 1, NULL),
('AB8654', 'Lait', NULL, NULL, NULL, 2, 350, 150, 2, NULL),
('AB8733', 'Peau', NULL, NULL, NULL, 8, 500, 250, 2, NULL),
('AB8744', 'Miroir', NULL, NULL, NULL, 22, 50, 25, 3, NULL),
('AB8745', 'Chien', NULL, NULL, NULL, 150, 30, 15, 4, NULL),
('AB8751', 'Carte', NULL, NULL, NULL, 5, 50, 25, 3, NULL),
('AB8753', 'Pomme', NULL, NULL, NULL, 2, 550, 300, 1, NULL),
('AB8755', 'Artichaut', NULL, NULL, NULL, 3, 500, 250, 2, NULL),
('AB8756', 'Chips', NULL, NULL, NULL, 5, 500, 250, 1, NULL),
('AB8757', 'Fromage', NULL, NULL, NULL, 6, 350, 150, 2, NULL),
('AB8759', 'Farine', NULL, NULL, NULL, 1, 350, 250, 4, NULL),
('AB8766', 'Ortie', NULL, NULL, NULL, 3, 5000, 2500, 3, NULL),
('AB8778', 'Chat', NULL, NULL, NULL, 500, 50, 25, 2, NULL),
('AB8789', 'Asiette', NULL, NULL, NULL, 6, 500, 205, 2, NULL),
('AB8796', 'Banane', NULL, NULL, NULL, 1, 500, 250, 2, NULL),
('AB8854', 'Miel', NULL, NULL, NULL, 5, 5000, 2500, 1, NULL),
('AC8736', 'Peluche', NULL, NULL, NULL, 35, 50, 25, 1, NULL),
('AD8788', 'Sanglier', NULL, NULL, NULL, 66, 50, 25, 4, NULL),
('CB8349', 'Couteau', NULL, NULL, NULL, 4, 500, 205, 4, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

CREATE TABLE `rubrique` (
  `rubri_id` int(11) NOT NULL,
  `rubri_lib` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`cli_id`),
  ADD KEY `index_nom_client` (`cli_nom`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `cli_id` (`cli_id`),
  ADD KEY `index_date_commande` (`com_dateCommande`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`fourni_id`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`prod_code`,`com_id`),
  ADD KEY `com_id` (`com_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`prod_code`),
  ADD KEY `FK_produitFourni` (`fourni_id`),
  ADD KEY `FK_produitRubrique` (`rubri_id`);

--
-- Index pour la table `rubrique`
--
ALTER TABLE `rubrique`
  ADD PRIMARY KEY (`rubri_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `fourni_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `rubrique`
--
ALTER TABLE `rubrique`
  MODIFY `rubri_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `client` (`cli_id`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`com_id`) REFERENCES `commande` (`com_id`),
  ADD CONSTRAINT `panier_ibfk_2` FOREIGN KEY (`prod_code`) REFERENCES `produit` (`prod_code`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_produitFourni` FOREIGN KEY (`fourni_id`) REFERENCES `fournisseur` (`fourni_id`),
  ADD CONSTRAINT `FK_produitRubrique` FOREIGN KEY (`rubri_id`) REFERENCES `rubrique` (`rubri_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
