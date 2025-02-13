-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 24 oct. 2022 à 14:52
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet4-php`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `telephone` int(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`admin_id`, `nom`, `prenom`, `telephone`, `email`, `password`) VALUES
(1, 'Dubois', 'Olivier', 456897423, 'olivier.dubois@hotmail.fr', 'azerty78');

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `adresse_id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(10) NOT NULL,
  `adresse_livraison` varchar(255) NOT NULL,
  `complement_adresse_livraison` varchar(45) NOT NULL,
  `code_postal` int(11) NOT NULL,
  `ville` varchar(45) NOT NULL,
  `digicode` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`adresse_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`adresse_id`, `numero`, `adresse_livraison`, `complement_adresse_livraison`, `code_postal`, `ville`, `digicode`, `client_id`) VALUES
(1, 1, 'allée des cerisiers', '', 6900, 'Lyon', 1234, 1),
(2, 11, 'rue des lilas', 'Logement 45', 38290, 'Villefleurie', 546, 2),
(3, 8, 'chemin des alpes', '', 72000, 'Montagne', 0, 3);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_produit`
--

DROP TABLE IF EXISTS `categorie_produit`;
CREATE TABLE IF NOT EXISTS `categorie_produit` (
  `categorie_id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) NOT NULL,
  PRIMARY KEY (`categorie_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie_produit`
--

INSERT INTO `categorie_produit` (`categorie_id`, `libelle`) VALUES
(1, 'Plat'),
(2, 'Dessert');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`client_id`, `nom`, `prenom`, `telephone`, `email`, `password`) VALUES
(1, 'Corvest', 'Aurore', '0123456789', 'aurore-corvest@hotmail.fr', '123456789'),
(2, 'Doe', 'John', '0987654321', 'john-doe@hotmail.fr', '9876543210'),
(3, 'Dupont', 'Martin', '0254897632', 'aurore-corvest@hotmail.fr', 'azerty');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `commande_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `date_livraison` datetime NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `adresse_id` int(11) NOT NULL,
  `statut_id` int(11) NOT NULL,
  PRIMARY KEY (`commande_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`commande_id`, `date`, `date_livraison`, `livreur_id`, `client_id`, `adresse_id`, `statut_id`) VALUES
(1, '2022-10-24 00:00:00', '2022-10-24 00:00:00', 1, 1, 1, 3),
(2, '2022-10-27 23:20:00', '2022-10-27 23:50:00', 2, 2, 2, 3),
(3, '2022-10-29 14:20:00', '2022-10-29 14:27:00', 3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `entree_menu`
--

DROP TABLE IF EXISTS `entree_menu`;
CREATE TABLE IF NOT EXISTS `entree_menu` (
  `entree_id` int(11) NOT NULL AUTO_INCREMENT,
  `prix_produit` decimal(10,0) NOT NULL,
  `date` datetime NOT NULL,
  `id_produit` int(11) NOT NULL,
  PRIMARY KEY (`entree_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `entree_menu`
--

INSERT INTO `entree_menu` (`entree_id`, `prix_produit`, `date`, `id_produit`) VALUES
(1, '8', '2022-10-24 00:00:00', 1),
(2, '8', '2022-10-24 00:00:00', 2),
(3, '5', '2022-10-27 23:20:00', 3),
(4, '5', '2022-10-27 23:20:00', 4),
(5, '8', '2022-10-27 23:20:00', 1),
(6, '8', '2022-10-27 23:20:00', 2),
(7, '8', '2022-10-29 14:20:00', 2),
(8, '5', '2022-10-29 14:20:00', 4);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `commande_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`commande_id`, `produit_id`, `quantite`, `prix`) VALUES
(1, 1, 1, '8'),
(1, 2, 1, '8'),
(2, 3, 1, '5'),
(2, 4, 1, '5'),
(2, 1, 1, '8'),
(2, 2, 1, '8'),
(3, 2, 1, '8'),
(3, 4, 1, '5');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `livreur_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `statut_livreur_id` int(11) NOT NULL,
  `lattitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  PRIMARY KEY (`livreur_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`livreur_id`, `nom`, `prenom`, `telephone`, `statut_livreur_id`, `lattitude`, `longitude`) VALUES
(1, 'Bourne', 'Jason', '0123456789', 1, '45.763420', '4.834277'),
(2, 'Dubois', 'Marie', '0987654321', 1, '45,1885', '5,7245'),
(3, 'Martin', 'Denis', '0523658974', 1, '45,1885', '5,7245');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `produit_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_produit` varchar(45) NOT NULL,
  `image_produit` varchar(255) NOT NULL,
  `description_produit` varchar(255) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  PRIMARY KEY (`produit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`produit_id`, `nom_produit`, `image_produit`, `description_produit`, `categorie_id`) VALUES
(1, 'Lasagnes', 'expressfood/img/lasagnes', 'Recette de cuisine italienne à base de couches alternées de pâtes lasagnes, parmesan, mozzarella, ou ricotta, et de sauce bolognaise ou sauce béchamel, gratiné au four', 1),
(2, 'Gratin dauphinois', 'expressfood/img/gratin', 'Plat gratiné traditionnel de la cuisine française, d\'origine dauphinoise, à base de pommes de terre et de lait.', 1),
(3, 'Tiramisu', 'expressfood/img/tiramisu', 'Célèbre dessert italien composé de mascarpone, d’œufs, de boudoirs, de café et de cacao', 2),
(4, 'Mousse chocolat', 'expressfood/img/mousse_chocolat', 'Dessert dont la composition traditionnelle comporte au minimum du chocolat et du blanc d\'œuf, monté en neige', 2);

-- --------------------------------------------------------

--
-- Structure de la table `statut_commande`
--

DROP TABLE IF EXISTS `statut_commande`;
CREATE TABLE IF NOT EXISTS `statut_commande` (
  `statut_id` int(11) NOT NULL AUTO_INCREMENT,
  `statut` varchar(45) NOT NULL,
  PRIMARY KEY (`statut_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `statut_commande`
--

INSERT INTO `statut_commande` (`statut_id`, `statut`) VALUES
(1, 'En cours'),
(2, 'En attente'),
(3, 'Livré');

-- --------------------------------------------------------

--
-- Structure de la table `statut_livreur`
--

DROP TABLE IF EXISTS `statut_livreur`;
CREATE TABLE IF NOT EXISTS `statut_livreur` (
  `statut_livreur_id` int(11) NOT NULL AUTO_INCREMENT,
  `statut_livreur` varchar(45) NOT NULL,
  PRIMARY KEY (`statut_livreur_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `statut_livreur`
--

INSERT INTO `statut_livreur` (`statut_livreur_id`, `statut_livreur`) VALUES
(1, 'En livraison'),
(2, 'Libre'),
(3, 'Indisponnible');

-- --------------------------------------------------------

--
-- Structure de la table `stock_livreur`
--

DROP TABLE IF EXISTS `stock_livreur`;
CREATE TABLE IF NOT EXISTS `stock_livreur` (
  `livreur_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite_livreur` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `stock_livreur`
--

INSERT INTO `stock_livreur` (`livreur_id`, `produit_id`, `quantite_livreur`) VALUES
(1, 1, 7),
(1, 2, 7),
(1, 3, 7),
(1, 4, 7),
(2, 1, 5),
(2, 2, 5),
(2, 3, 5),
(2, 4, 5),
(3, 1, 8),
(3, 2, 8),
(3, 3, 8),
(3, 4, 8);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
