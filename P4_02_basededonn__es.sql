-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : sam. 23 oct. 2021 à 13:18
-- Version du serveur :  5.7.32
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `P4_02_basededonnées`
--

-- --------------------------------------------------------

--
-- Structure de la table `Addresse`
--

CREATE TABLE `Addresse` (
  `idAdresse` int(5) UNSIGNED NOT NULL,
  `destinataire` smallint(5) UNSIGNED NOT NULL,
  `numeroVoie` varchar(60) NOT NULL,
  `complementNumeroVoie` varchar(60) NOT NULL,
  `codePostal` int(5) UNSIGNED NOT NULL,
  `ville` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Addresse`
--

INSERT INTO `Addresse` (`idAdresse`, `destinataire`, `numeroVoie`, `complementNumeroVoie`, `codePostal`, `ville`) VALUES
(1, 18, 'Rue du pont', 'Gruissan', 11620, 'y');

-- --------------------------------------------------------

--
-- Structure de la table `Categorie_has_Plat`
--

CREATE TABLE `Categorie_has_Plat` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name_product` varchar(40) NOT NULL,
  `description_product` varchar(255) NOT NULL,
  `category_product` mediumtext NOT NULL,
  `is_daily_dish` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Categorie_has_Plat`
--

INSERT INTO `Categorie_has_Plat` (`id`, `name_product`, `description_product`, `category_product`, `is_daily_dish`) VALUES
(1, 'cassoulet', 'haricots tarbais et confit de canard', 'plat du jour', 'oui'),
(2, 'Truite Meuniere', 'Truite Grillé sauce au beurre persil citron', 'plat du jour', 'oui'),
(3, 'Tieb', 'riz cassé, tomate concentré, cube de boulions de poulet, sel, poivre, poisson, légume ', 'plat du jour ', 'non'),
(4, 'tarte tatin', 'tarte aux pomme caramelise', 'dessert', 'non');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `user` smallint(5) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `payment_method` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `user`, `date_created`, `payment_method`) VALUES
(1, 1, '2021-06-30 00:00:00', 'cash');

-- --------------------------------------------------------

--
-- Structure de la table `Commande`
--

CREATE TABLE `Commande` (
  `commande_numeroCommande` int(11) NOT NULL,
  `article_numProduit` int(6) NOT NULL,
  `quantité` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Commande_has_Plat`
--

CREATE TABLE `Commande_has_Plat` (
  `commande_numeroCommande` int(5) UNSIGNED NOT NULL,
  `name_product` varchar(40) NOT NULL,
  `description_product` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Commande_has_Plat`
--

INSERT INTO `Commande_has_Plat` (`commande_numeroCommande`, `name_product`, `description_product`) VALUES
(1, 'cassoulet', 'haricots tarbais et confit de canard'),
(2, 'Truite Meuniere', 'Truite Grillé sauce au beurre persil citron'),
(3, 'profiterolle', 'choux farci  glace vanille nappage chantilly et chocolat'),
(4, 'tarte tatin', 'tarte aux pomme caramelise');

-- --------------------------------------------------------

--
-- Structure de la table `Livreur`
--

CREATE TABLE `Livreur` (
  `idLivreur` smallint(5) UNSIGNED NOT NULL,
  `status` tinytext,
  `longitude` smallint(6) NOT NULL,
  `latitude` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Livreur`
--

INSERT INTO `Livreur` (`idLivreur`, `status`, `longitude`, `latitude`) VALUES
(1, 'y', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `Livreur_has_Plat`
--

CREATE TABLE `Livreur_has_Plat` (
  `quantité` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Plat`
--

CREATE TABLE `Plat` (
  `numProduit` int(10) NOT NULL,
  `quantiteTotale` int(10) NOT NULL,
  `image` json NOT NULL,
  `descriptif` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `$ prixUnitaireHT` float NOT NULL,
  `$ tauxTVA100` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `idUsers` smallint(5) UNSIGNED NOT NULL,
  `nom_famille` varchar(50) NOT NULL,
  `prénom` varchar(50) NOT NULL,
  `e-mail` varchar(50) NOT NULL,
  `téléphone` int(10) UNSIGNED ZEROFILL NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `motsDePasse` varchar(255) NOT NULL,
  `latitude` decimal(10,0) NOT NULL,
  `longitude` decimal(10,0) NOT NULL,
  `is_admin` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`idUsers`, `nom_famille`, `prénom`, `e-mail`, `téléphone`, `pseudo`, `motsDePasse`, `latitude`, `longitude`, `is_admin`) VALUES
(1, 'dubois', 'pierre', 'pierrot@gmail.com', 0633259802, 'pierrot', 'abc', '45', '56', 'non'),
(2, 'defeu', 'paul', 'polo@altavista.fr', 0435688741, 'polo', 'def', '66', '32', 'non'),
(3, 'demarbre', 'alain', 'lilnlin@nestcape.com', 0154852102, 'linlin', 'ghi', '66', '33', 'non'),
(4, 'duvent', 'lydia', 'lili@enercom.com', 0156875681, 'lili', 'jkl', '65', '58', 'non'),
(5, 'marx', 'thierry', 'ChefCuisinier@expressfood.com', 0633249832, 'titi', 'mno', '48', '47', 'oui');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Addresse`
--
ALTER TABLE `Addresse`
  ADD PRIMARY KEY (`idAdresse`),
  ADD UNIQUE KEY `destinationataire` (`destinataire`),
  ADD KEY `id` (`idAdresse`);

--
-- Index pour la table `Categorie_has_Plat`
--
ALTER TABLE `Categorie_has_Plat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user`);

--
-- Index pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`commande_numeroCommande`),
  ADD KEY `numeroCommande` (`commande_numeroCommande`,`article_numProduit`,`quantité`);

--
-- Index pour la table `Commande_has_Plat`
--
ALTER TABLE `Commande_has_Plat`
  ADD PRIMARY KEY (`commande_numeroCommande`);

--
-- Index pour la table `Livreur`
--
ALTER TABLE `Livreur`
  ADD PRIMARY KEY (`idLivreur`);

--
-- Index pour la table `Livreur_has_Plat`
--
ALTER TABLE `Livreur_has_Plat`
  ADD PRIMARY KEY (`quantité`);

--
-- Index pour la table `Plat`
--
ALTER TABLE `Plat`
  ADD PRIMARY KEY (`numProduit`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`idUsers`),
  ADD UNIQUE KEY `pseudo` (`pseudo`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Addresse`
--
ALTER TABLE `Addresse`
  MODIFY `idAdresse` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Categorie_has_Plat`
--
ALTER TABLE `Categorie_has_Plat`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Commande`
--
ALTER TABLE `Commande`
  MODIFY `commande_numeroCommande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Commande_has_Plat`
--
ALTER TABLE `Commande_has_Plat`
  MODIFY `commande_numeroCommande` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Livreur`
--
ALTER TABLE `Livreur`
  MODIFY `idLivreur` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Livreur_has_Plat`
--
ALTER TABLE `Livreur_has_Plat`
  MODIFY `quantité` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Plat`
--
ALTER TABLE `Plat`
  MODIFY `numProduit` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  MODIFY `idUsers` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Categorie_has_Plat`
--
ALTER TABLE `Categorie_has_Plat`
  ADD CONSTRAINT `categorie_has_plat_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Utilisateur` (`idUsers`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Utilisateur` (`idUsers`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user`) REFERENCES `expressfood`.`User` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
