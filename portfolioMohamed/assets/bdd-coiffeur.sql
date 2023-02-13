-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 12 avr. 2022 à 14:16
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE bdd;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `xlagenda_agenda`
--

DROP TABLE IF EXISTS `xlagenda_agenda`;
CREATE TABLE IF NOT EXISTS `xlagenda_agenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `heure_debut` time DEFAULT NULL,
  `heure_fin` time DEFAULT NULL,
  `description` text,
  `lieu` text,
  `categorie` int(11) DEFAULT NULL,
  `contact` text,
  `adresse` text,
  `email` text,
  `telephone` text,
  `fax` text,
  `lien` text,
  `url` text,
  `id_user` int(11) DEFAULT NULL,
  `actif` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_categorie` (`categorie`),
  KEY `fk_user` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='XLAgenda - Table principale';

--
-- Déchargement des données de la table `xlagenda_agenda`
--

INSERT INTO `xlagenda_agenda` (`id`, `nom`, `date_debut`, `date_fin`, `heure_debut`, `heure_fin`, `description`, `lieu`, `categorie`, `contact`, `adresse`, `email`, `telephone`, `fax`, `lien`, `url`, `id_user`, `actif`) VALUES
(1, 'Dégradé', '2022-04-22', '2022-04-22', '09:00:00', '09:30:00', '<p>Coupe de cheveux pour homme.</p>', '', 9, '', '', NULL, NULL, NULL, NULL, '', NULL, 1),
(2, 'Tresses', '2022-04-22', '2022-04-22', '14:20:00', '18:30:00', '<p>Je veux avoir des tresses fines.</p>', 'Paris', 9, '', '', 'lina@mail.com', '0666088939', NULL, NULL, '', NULL, 1),
(3, 'Teinture', '2022-07-28', '2022-07-28', '18:00:00', '20:00:00', 'Je veux avoir la teinture à Son Goku.', 'Paris', 37, NULL, 'Le Nouveau Monde, GrandLine', NULL, NULL, NULL, NULL, NULL, 10, 1),
(4, 'Coupe militaire', '2022-12-01', '2022-12-01', '14:00:00', '14:30:00', 'je souhaite avoir une coupe à 0 afin de cacher ma calvicie.', 'Paris', 9, NULL, NULL, 'victorhugo@mail.com', NULL, NULL, NULL, NULL, 8, 0),
(5, 'Mariage', '2022-06-16', '2022-06-16', '12:00:00', '18:00:00', '- Coupe de cheveux\r\n- Barbe\r\n- Teinture', 'Paris', 41, NULL, NULL, 'mail@mail.com', NULL, NULL, NULL, NULL, 4, 0),
(6, 'Soins avant match ', '2022-05-18', '2022-05-18', '06:00:00', '10:00:00', 'RDV à domicile.', 'A domicile', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0);

-- --------------------------------------------------------

--
-- Structure de la table `xlagenda_categories`
--

DROP TABLE IF EXISTS `xlagenda_categories`;
CREATE TABLE IF NOT EXISTS `xlagenda_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text,
  `couleur` text,
  `actif` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='XLAgenda - Table des categories';

--
-- Déchargement des données de la table `xlagenda_categories`
--

INSERT INTO `xlagenda_categories` (`id`, `nom`, `couleur`, `actif`) VALUES
(9, 'Coupe de cheveux', 'FFFFFF', 1),
(37, 'Teinture', 'FFFFFF', 1),
(41, 'Mariage', 'FFFFFF', 1);

-- --------------------------------------------------------

--
-- Structure de la table `xlagenda_config`
--

DROP TABLE IF EXISTS `xlagenda_config`;
CREATE TABLE IF NOT EXISTS `xlagenda_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text,
  `valeur` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='XLAgenda - Paramètres';

--
-- Déchargement des données de la table `xlagenda_config`
--

INSERT INTO `xlagenda_config` (`id`, `nom`, `valeur`) VALUES
(1, 'current_version', '4.5.2'),
(2, 'date_install', '05/04/2022');

-- --------------------------------------------------------

--
-- Structure de la table `xlagenda_demande`
--

DROP TABLE IF EXISTS `xlagenda_demande`;
CREATE TABLE IF NOT EXISTS `xlagenda_demande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text,
  `prenom` text,
  `email` text,
  `user` text,
  `pass` text,
  `motif` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='XLAgenda - Table des demandes de comptes';

-- --------------------------------------------------------

--
-- Structure de la table `xlagenda_logs`
--

DROP TABLE IF EXISTS `xlagenda_logs`;
CREATE TABLE IF NOT EXISTS `xlagenda_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` text,
  `pass` text,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `ip` text,
  `domain` text,
  `result` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='XLAgenda - Table des logs';

--
-- Déchargement des données de la table `xlagenda_logs`
--

INSERT INTO `xlagenda_logs` (`id`, `user`, `pass`, `date`, `time`, `ip`, `domain`, `result`) VALUES
(1, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-05', '23:06:03', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(2, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-05', '23:45:24', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(3, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:00:07', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(4, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:01:31', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(5, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:05:08', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(6, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:06:54', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(7, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:08:14', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(8, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:08:39', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(9, 'JeanDup', '9e80d0b3976e34480bfdd322f1795fcf', '2022-04-08', '23:10:19', '::1', 'LAPTOP-R83BQH7D', 'erreur'),
(10, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:10:25', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(11, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:11:07', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(12, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:11:15', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(13, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:11:35', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(14, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:11:42', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(15, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:12:02', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(16, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:13:35', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(17, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:13:52', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(18, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:15:31', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(19, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:16:24', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(20, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:18:05', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(21, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:18:08', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(22, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:18:37', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(23, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:18:57', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(24, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:20:02', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(25, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:23:13', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(26, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:23:36', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(27, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:24:03', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(28, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:25:26', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(29, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:25:33', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(30, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:29:33', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(31, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:40:01', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(32, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:42:37', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(33, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:42:46', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(34, 'slam', '05cc0c74bca4e5f9234386b83306d102', '2022-04-08', '23:43:54', '::1', 'LAPTOP-R83BQH7D', 'erreur'),
(35, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:44:40', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(36, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:44:52', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(37, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:52:11', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(38, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:52:19', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(39, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:52:30', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(40, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:52:44', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(41, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:54:44', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(42, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:55:00', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(43, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-08', '23:57:41', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(44, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '00:16:43', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(45, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '00:17:17', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(46, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '00:19:33', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(47, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '00:26:40', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(48, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '00:26:46', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(49, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '00:26:52', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(50, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '00:27:01', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(51, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '12:53:42', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(52, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '12:53:49', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(53, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '12:53:58', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(54, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '12:55:05', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(55, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '12:59:52', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(56, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:00:25', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(57, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:02:08', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(58, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:11:22', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(59, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:11:32', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(60, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:11:40', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(61, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:19:02', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(62, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:19:28', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(63, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:22:07', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(64, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:22:31', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(65, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:23:58', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(66, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:32:23', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(67, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:32:47', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(68, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:33:36', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(69, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:33:41', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(70, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:34:10', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(71, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:53:04', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(72, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:55:42', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(73, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:55:53', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(74, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:59:25', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(75, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '13:59:51', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(76, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:00:01', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(77, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:00:26', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(78, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:00:43', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(79, 'Elias', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:03:13', '127.0.0.1', 'LAPTOP-R83BQH7D', 'erreur'),
(80, 'Elias', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:03:20', '127.0.0.1', 'LAPTOP-R83BQH7D', 'erreur'),
(81, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:04:11', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(82, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:04:22', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(83, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:05:13', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(84, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:05:18', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(85, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:05:31', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(86, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:05:41', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(87, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:15:43', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(88, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:18:13', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(89, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:18:23', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(90, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:18:57', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(91, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:45:51', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(92, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:46:04', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(93, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:51:38', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(94, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '14:51:57', '127.0.0.1', 'LAPTOP-R83BQH7D', 'ok'),
(95, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '17:27:09', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(96, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-09', '22:13:06', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(97, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-10', '00:14:48', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(98, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-10', '00:18:00', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(99, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-10', '00:36:29', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(100, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-10', '01:19:57', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(101, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-10', '01:20:19', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(102, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-10', '15:03:25', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(103, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-10', '15:18:50', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(104, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-10', '15:24:54', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(105, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-10', '15:26:58', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(106, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-11', '09:05:23', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(107, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-11', '12:01:36', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(108, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-11', '23:21:26', '::1', 'LAPTOP-R83BQH7D', 'erreur'),
(109, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-11', '23:21:30', '::1', 'LAPTOP-R83BQH7D', 'erreur'),
(110, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-11', '23:21:37', '::1', 'LAPTOP-R83BQH7D', 'erreur'),
(111, 'slam', '74be16979710d4c4e7c6647856088456', '2022-04-11', '23:28:19', '::1', 'LAPTOP-R83BQH7D', 'erreur'),
(112, 'slam', '5bfa4354736f3c3e20b5140d22a730ec', '2022-04-11', '23:35:19', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(113, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-11', '23:36:08', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(114, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '11:03:53', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(115, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '11:30:43', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(116, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '11:31:09', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(117, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '11:33:03', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(118, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '12:16:39', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(119, 'lu', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '12:22:05', '::1', 'LAPTOP-R83BQH7D', 'erreur'),
(120, 'Luffy', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '12:22:16', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(121, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '12:25:23', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(122, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '12:44:59', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(123, 'Victor', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '12:45:46', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(124, 'Victor', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '13:13:05', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(125, 'Elias', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '13:18:16', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(126, 'Messi', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '13:24:16', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(127, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '13:29:47', '::1', 'LAPTOP-R83BQH7D', 'ok'),
(128, 'slam', '4ecfb37382be49886de1181e7eba46b0', '2022-04-12', '13:30:10', '::1', 'LAPTOP-R83BQH7D', 'ok');

-- --------------------------------------------------------

--
-- Structure de la table `xlagenda_users`
--

DROP TABLE IF EXISTS `xlagenda_users`;
CREATE TABLE IF NOT EXISTS `xlagenda_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` text,
  `password` text,
  `nom` text,
  `prenom` text,
  `email` text,
  `ajouter` tinyint(4) NOT NULL DEFAULT '0',
  `modifier` tinyint(4) NOT NULL DEFAULT '0',
  `supprimer` tinyint(4) NOT NULL DEFAULT '0',
  `valider` tinyint(4) NOT NULL DEFAULT '0',
  `gerer` tinyint(4) NOT NULL DEFAULT '0',
  `actif` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='XLAgenda - Table des utilisateurs';

--
-- Déchargement des données de la table `xlagenda_users`
--

INSERT INTO `xlagenda_users` (`id`, `user`, `password`, `nom`, `prenom`, `email`, `ajouter`, `modifier`, `supprimer`, `valider`, `gerer`, `actif`) VALUES
(1, 'slam', '4ecfb37382be49886de1181e7eba46b0', 'Saidani', 'Mohamed', 'mo.saidani.75@gmail.com', 1, 2, 2, 1, 1, 1),
(2, 'JeanDup', '4ecfb37382be49886de1181e7eba46b0', 'Dupont', 'Jean', 'momo2amin2001@gmail.com', 1, 1, 1, 0, 0, 0),
(3, 'M.Ferrara', 'd4ba354706fd8821de9c64027019236b', 'Pinaud', 'Alexandre', 'Fanclubinazuma@gmail.com', 1, 1, 1, 0, 0, 0),
(4, 'Elias', '4ecfb37382be49886de1181e7eba46b0', 'Saidani', 'Elias', 'mail@mail.com', 1, 1, 1, 0, 0, 0),
(5, 'Moha', '4ecfb37382be49886de1181e7eba46b0', 'Saidani', 'Mohamed', 'mohamed.saidani0216@gmail.com', 1, 1, 1, 0, 0, 0),
(6, 'Oda', '4ecfb37382be49886de1181e7eba46b0', 'Eiichirō', 'Oda', 'Oda@mail.com', 1, 1, 1, 0, 0, 0),
(7, 'Lina', '4ecfb37382be49886de1181e7eba46b0', 'Gravot', 'Lina', 'lina@mail.com', 1, 1, 1, 0, 0, 0),
(8, 'Victor', '4ecfb37382be49886de1181e7eba46b0', 'Hugo', 'Victor', 'victorhugo@mail.com', 1, 1, 1, 0, 0, 0),
(9, 'Messi', '4ecfb37382be49886de1181e7eba46b0', 'Messi', 'Leo', 'LeoMessi@mail.com', 1, 1, 1, 0, 0, 0),
(10, 'Luffy', '4ecfb37382be49886de1181e7eba46b0', 'Monkey', 'Luffy', 'onepiece@mail.com', 1, 1, 1, 0, 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
