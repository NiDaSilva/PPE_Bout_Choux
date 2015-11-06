-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 06 Novembre 2015 à 15:44
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `alae`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(30) NOT NULL,
  `mp` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `identifiant`, `mp`) VALUES
(1, 'pierre', '84675f2baf7140037b8f5afe54eef841');

-- --------------------------------------------------------

--
-- Structure de la table `enfant`
--

CREATE TABLE IF NOT EXISTS `enfant` (
  `id_enfant` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(32) NOT NULL,
  `prenom` varchar(32) NOT NULL,
  `commentairefamille` varchar(32) DEFAULT NULL,
  `datenaiss` date NOT NULL,
  `id_famille` int(11) NOT NULL,
  PRIMARY KEY (`id_enfant`),
  KEY `id_famille` (`id_famille`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `enfant`
--

INSERT INTO `enfant` (`id_enfant`, `nom`, `prenom`, `commentairefamille`, `datenaiss`, `id_famille`) VALUES
(3, 'Tezt', 'tezt', 'tezt', '2015-10-13', 1),
(4, 'Yahiaoui', 'Aldwin', 'ras', '2015-10-01', 1),
(5, 'Nauleau', 'Matthieu', 'ras', '2015-10-03', 1);

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

CREATE TABLE IF NOT EXISTS `famille` (
  `id_famille` int(3) NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(30) NOT NULL,
  `mp` varchar(50) NOT NULL,
  `nom1` varchar(100) NOT NULL,
  `prenom1` varchar(100) NOT NULL,
  `adresse11` varchar(100) DEFAULT NULL,
  `adresse12` varchar(100) DEFAULT NULL,
  `cp1` int(5) unsigned zerofill DEFAULT NULL,
  `ville1` varchar(100) DEFAULT NULL,
  `mail1` varchar(50) DEFAULT NULL,
  `tel11` varchar(15) NOT NULL,
  `tel12` varchar(15) DEFAULT NULL,
  `tel13` varchar(15) DEFAULT NULL,
  `fonction1` varchar(50) NOT NULL COMMENT 'Père Mère Autre',
  `nom2` varchar(100) DEFAULT NULL,
  `prenom2` varchar(100) DEFAULT NULL,
  `adresse21` varchar(100) DEFAULT NULL,
  `adresse22` varchar(100) DEFAULT NULL,
  `cp2` char(5) DEFAULT NULL,
  `ville2` varchar(100) DEFAULT NULL,
  `mail2` varchar(50) DEFAULT NULL,
  `tel21` varchar(15) DEFAULT NULL,
  `tel22` varchar(15) DEFAULT NULL,
  `tel23` varchar(15) DEFAULT NULL,
  `fonction2` varchar(50) DEFAULT NULL COMMENT 'Père Mère Autre',
  `date_envoi_mail_demande_inscription` date DEFAULT NULL,
  PRIMARY KEY (`id_famille`),
  UNIQUE KEY `identifiant` (`identifiant`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `famille`
--

INSERT INTO `famille` (`id_famille`, `identifiant`, `mp`, `nom1`, `prenom1`, `adresse11`, `adresse12`, `cp1`, `ville1`, `mail1`, `tel11`, `tel12`, `tel13`, `fonction1`, `nom2`, `prenom2`, `adresse21`, `adresse22`, `cp2`, `ville2`, `mail2`, `tel21`, `tel22`, `tel23`, `fonction2`, `date_envoi_mail_demande_inscription`) VALUES
(1, 'famille', 'ed81c0311eb5364a8d6d1d1b63f3c51d', 'Testfamille', 'testfamille', NULL, NULL, NULL, NULL, NULL, '0241772030', NULL, NULL, 'Testeur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE IF NOT EXISTS `personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(32) NOT NULL,
  `mdp` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `personnel`
--

INSERT INTO `personnel` (`id`, `identifiant`, `mdp`) VALUES
(1, 'personnel', 'f82366a9ddc064585d54e3f78bde3221');

-- --------------------------------------------------------

--
-- Structure de la table `progres`
--

CREATE TABLE IF NOT EXISTS `progres` (
  `id_enfant` int(11) NOT NULL,
  `commentaire` text NOT NULL,
  `date` date NOT NULL,
  KEY `id_enfant` (`id_enfant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `progres`
--

INSERT INTO `progres` (`id_enfant`, `commentaire`, `date`) VALUES
(3, 'Code PHP', '0000-00-00'),
(3, 'Code HTML', '0000-00-00'),
(4, 'Code C#', '2015-10-01'),
(4, 'Code C+', '2015-10-07');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `enfant`
--
ALTER TABLE `enfant`
  ADD CONSTRAINT `enfantfamille` FOREIGN KEY (`id_famille`) REFERENCES `famille` (`id_famille`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `progres`
--
ALTER TABLE `progres`
  ADD CONSTRAINT `progres_idenfant` FOREIGN KEY (`id_enfant`) REFERENCES `enfant` (`id_enfant`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
