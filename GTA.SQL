SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `addon_account`
-- ----------------------------
DROP TABLE IF EXISTS `addon_account`;
CREATE TABLE `addon_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of addon_account
-- ----------------------------
INSERT INTO `addon_account` VALUES ('1', 'society_ambulance', 'Ambulance', '1');
INSERT INTO `addon_account` VALUES ('2', 'society_banker', 'Banque', '1');
INSERT INTO `addon_account` VALUES ('3', 'bank_savings', 'Livret Bleu', '0');
INSERT INTO `addon_account` VALUES ('6', 'caution', 'Caution', '0');
INSERT INTO `addon_account` VALUES ('7', 'society_cartel', 'cartel', '1');
INSERT INTO `addon_account` VALUES ('8', 'society_gang', 'gang', '1');
INSERT INTO `addon_account` VALUES ('9', 'society_mafia', 'Mafia', '1');
INSERT INTO `addon_account` VALUES ('11', 'society_mecano', 'Mécano', '1');
INSERT INTO `addon_account` VALUES ('12', 'society_police', 'Police', '1');
INSERT INTO `addon_account` VALUES ('13', 'property_black_money', 'Argent Sale Propriété', '0');
INSERT INTO `addon_account` VALUES ('14', 'society_realestateagent', 'Agent immobilier', '1');
INSERT INTO `addon_account` VALUES ('15', 'society_taxi', 'Taxi', '1');
INSERT INTO `addon_account` VALUES ('16', 'society_unicorn', 'Unicorn', '1');
INSERT INTO `addon_account` VALUES ('17', 'society_cardealer', 'Concessionnaire', '1');
INSERT INTO `addon_account` VALUES ('18', 'society_foodtruck', 'Foodtruck', '1');
INSERT INTO `addon_account` VALUES ('19', 'society_gouv', 'Gouvernement', '1');
INSERT INTO `addon_account` VALUES ('22', 'property_black_money', 'Argent Sale Propriété', '0');
INSERT INTO `addon_account` VALUES ('23', 'society_lawyer', 'Avocat', '1');
INSERT INTO `addon_account` VALUES ('26', 'society_reporter', 'Reporter', '1');
INSERT INTO `addon_account` VALUES ('28', 'society_bahama', 'bahama', '1');
INSERT INTO `addon_account` VALUES ('29', 'society_brinks', 'brinks', '1');
INSERT INTO `addon_account` VALUES ('30', 'society_state', 'state', '1');
INSERT INTO `addon_account` VALUES ('31', 'society_dock', 'Marina', '1');
INSERT INTO `addon_account` VALUES ('32', 'society_vigne', 'Vigneron', '1');
INSERT INTO `addon_account` VALUES ('35', 'society_armurier', 'Armurier', '1');
INSERT INTO `addon_account` VALUES ('36', 'society_mafia', 'Mafia', '1');
INSERT INTO `addon_account` VALUES ('37', 'society_baladins', 'baladins', '1');
INSERT INTO `addon_account` VALUES ('39', 'society_driveschool', 'driveschool', '1');
INSERT INTO `addon_account` VALUES ('40', 'society_pecheur', 'Pécheur', '1');
INSERT INTO `addon_account` VALUES ('41', 'society_pizza', 'Domino\'s Pizza', '1');
INSERT INTO `addon_account` VALUES ('42', 'society_SantaMuerte', 'SantaMuerte', '1');

-- ----------------------------
-- Table structure for `addon_account_data`
-- ----------------------------
DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6733 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of addon_account_data
-- ----------------------------
INSERT INTO `addon_account_data` VALUES ('1', 'society_ambulance', '0', null);
INSERT INTO `addon_account_data` VALUES ('2', 'society_banker', '0', null);
INSERT INTO `addon_account_data` VALUES ('3', 'society_cartel', '0', null);
INSERT INTO `addon_account_data` VALUES ('4', 'society_gang', '0', null);
INSERT INTO `addon_account_data` VALUES ('5', 'society_mafia', '0', null);
INSERT INTO `addon_account_data` VALUES ('6', 'society_mecano', '0', null);
INSERT INTO `addon_account_data` VALUES ('7', 'society_police', '0', null);
INSERT INTO `addon_account_data` VALUES ('8', 'society_realestateagent', '0', null);
INSERT INTO `addon_account_data` VALUES ('9', 'society_taxi', '0', null);
INSERT INTO `addon_account_data` VALUES ('10', 'society_unicorn', '0', null);
INSERT INTO `addon_account_data` VALUES ('11', 'society_cardealer', '0', null);
INSERT INTO `addon_account_data` VALUES ('12', 'society_foodtruck', '0', null);
INSERT INTO `addon_account_data` VALUES ('13', 'society_gouv', '0', null);
INSERT INTO `addon_account_data` VALUES ('14', 'society_lawyer', '0', null);
INSERT INTO `addon_account_data` VALUES ('15', 'society_reporter', '0', null);
INSERT INTO `addon_account_data` VALUES ('16', 'society_bahama', '0', null);
INSERT INTO `addon_account_data` VALUES ('17', 'society_brinks', '0', null);
INSERT INTO `addon_account_data` VALUES ('18', 'society_state', '0', null);
INSERT INTO `addon_account_data` VALUES ('19', 'society_dock', '0', null);
INSERT INTO `addon_account_data` VALUES ('20', 'society_vigne', '0', null);
INSERT INTO `addon_account_data` VALUES ('21', 'society_army', '0', null);
INSERT INTO `addon_account_data` VALUES ('73', 'society_armurier', '0', null);

-- ----------------------------
-- Table structure for `addon_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE `addon_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of addon_inventory
-- ----------------------------
INSERT INTO `addon_inventory` VALUES ('1', 'society_cartel', 'Cartel', '1');
INSERT INTO `addon_inventory` VALUES ('2', 'society_cartel', 'Cartel', '1');
INSERT INTO `addon_inventory` VALUES ('3', 'society_gang', 'Gang', '1');
INSERT INTO `addon_inventory` VALUES ('4', 'society_mafia', 'Mafia', '1');
INSERT INTO `addon_inventory` VALUES ('5', 'society_mafia', 'Mafia', '1');
INSERT INTO `addon_inventory` VALUES ('6', 'society_mecano', 'Mécano', '1');
INSERT INTO `addon_inventory` VALUES ('7', 'society_police', 'Police', '1');
INSERT INTO `addon_inventory` VALUES ('8', 'property', 'Propriété', '0');
INSERT INTO `addon_inventory` VALUES ('9', 'society_taxi', 'Taxi', '1');
INSERT INTO `addon_inventory` VALUES ('10', 'society_unicorn', 'Unicorn', '1');
INSERT INTO `addon_inventory` VALUES ('11', 'society_unicorn_fridge', 'Unicorn (frigo)', '1');
INSERT INTO `addon_inventory` VALUES ('12', 'society_cardealer', 'Concesionnaire', '1');
INSERT INTO `addon_inventory` VALUES ('13', 'society_ambulance', 'Ambulance', '1');
INSERT INTO `addon_inventory` VALUES ('15', 'society_lawyer', 'Avocat', '1');
INSERT INTO `addon_inventory` VALUES ('18', 'society_reporter', 'Reporter', '1');
INSERT INTO `addon_inventory` VALUES ('21', 'society_bahama', 'bahama', '1');
INSERT INTO `addon_inventory` VALUES ('22', 'society_bahama_fridge', 'bahama (frigo)', '1');
INSERT INTO `addon_inventory` VALUES ('23', 'society_brinks', 'brinks', '1');
INSERT INTO `addon_inventory` VALUES ('24', 'society_state', 'state', '1');
INSERT INTO `addon_inventory` VALUES ('25', 'society_dock', 'Marina', '1');
INSERT INTO `addon_inventory` VALUES ('26', 'society_vigne', 'Vigneron', '1');
INSERT INTO `addon_inventory` VALUES ('29', 'society_army', 'Army', '1');
INSERT INTO `addon_inventory` VALUES ('30', 'society_armurier', 'Armurier', '1');
INSERT INTO `addon_inventory` VALUES ('31', 'society_mafia', 'Mafia', '1');
INSERT INTO `addon_inventory` VALUES ('32', 'society_baladins', 'baladins', '1');
INSERT INTO `addon_inventory` VALUES ('33', 'society_baladins', 'baladins', '1');
INSERT INTO `addon_inventory` VALUES ('34', 'society_driveschool', 'driveschool', '1');
INSERT INTO `addon_inventory` VALUES ('35', 'society_driveschool_fridge', 'driveschool (frigo)', '1');
INSERT INTO `addon_inventory` VALUES ('36', 'society_pecheur', 'Pécheur', '1');
INSERT INTO `addon_inventory` VALUES ('37', 'society_pizza', 'Domino\'s Pizza', '1');
INSERT INTO `addon_inventory` VALUES ('38', 'society_pizza_fridge', 'Domino\'s Pizza (frigo)', '1');
INSERT INTO `addon_inventory` VALUES ('39', 'society_SantaMuerte', 'SantaMuerte', '1');

-- ----------------------------
-- Table structure for `addon_inventory_items`
-- ----------------------------
DROP TABLE IF EXISTS `addon_inventory_items`;
CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of addon_inventory_items
-- ----------------------------

-- ----------------------------
-- Table structure for `banlist`
-- ----------------------------
DROP TABLE IF EXISTS `banlist`;
CREATE TABLE `banlist` (
  `identifier` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of banlist
-- ----------------------------
INSERT INTO `banlist` VALUES ('steam:110000XXXXXXXX', 'RAISON DU BAN');

-- ----------------------------
-- Table structure for `billing`
-- ----------------------------
DROP TABLE IF EXISTS `billing`;
CREATE TABLE `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of billing
-- ----------------------------

-- ----------------------------
-- Table structure for `cardealer_vehicles`
-- ----------------------------
DROP TABLE IF EXISTS `cardealer_vehicles`;
CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cardealer_vehicles
-- ----------------------------

-- ----------------------------
-- Table structure for `characters`
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'f',
  `height` varchar(128) NOT NULL,
  PRIMARY KEY (`identifier`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of characters
-- ----------------------------

-- ----------------------------
-- Table structure for `datastore`
-- ----------------------------
DROP TABLE IF EXISTS `datastore`;
CREATE TABLE `datastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of datastore
-- ----------------------------
INSERT INTO `datastore` VALUES ('2', 'society_cartel', 'Cartel', '1');
INSERT INTO `datastore` VALUES ('3', 'society_gang', 'Gang', '1');
INSERT INTO `datastore` VALUES ('5', 'society_mafia', 'Mafia', '1');
INSERT INTO `datastore` VALUES ('6', 'user_mask', 'Masque', '0');
INSERT INTO `datastore` VALUES ('7', 'society_police', 'Police', '1');
INSERT INTO `datastore` VALUES ('8', 'property', 'Propriété', '0');
INSERT INTO `datastore` VALUES ('9', 'society_unicorn', 'Unicorn', '1');
INSERT INTO `datastore` VALUES ('12', 'society_lawyer', 'Avocat', '1');
INSERT INTO `datastore` VALUES ('13', 'society_security', 'Sécurité', '1');
INSERT INTO `datastore` VALUES ('15', 'society_reporter', 'Reporter', '1');
INSERT INTO `datastore` VALUES ('17', 'society_bahama', 'bahama', '1');
INSERT INTO `datastore` VALUES ('18', 'society_brinks', 'brinks', '1');
INSERT INTO `datastore` VALUES ('19', 'society_state', 'state', '1');
INSERT INTO `datastore` VALUES ('20', 'user_ears', 'Ears', '0');
INSERT INTO `datastore` VALUES ('21', 'user_glasses', 'Glasses', '0');
INSERT INTO `datastore` VALUES ('22', 'user_helmet', 'Helmet', '0');
INSERT INTO `datastore` VALUES ('23', 'user_mask', 'Mask', '0');
INSERT INTO `datastore` VALUES ('24', 'society_vigne', 'Vigneron', '1');
INSERT INTO `datastore` VALUES ('25', 'society_billaboula', 'billaboula', '1');
INSERT INTO `datastore` VALUES ('26', 'society_army', 'Army', '1');
INSERT INTO `datastore` VALUES ('27', 'society_armurier', 'Armurier', '1');
INSERT INTO `datastore` VALUES ('28', 'society_mafia', 'Mafia', '1');
INSERT INTO `datastore` VALUES ('29', 'society_baladins', 'baladins', '1');
INSERT INTO `datastore` VALUES ('30', 'society_baladins', 'baladins', '1');
INSERT INTO `datastore` VALUES ('31', 'society_driveschool', 'driveschool', '1');
INSERT INTO `datastore` VALUES ('32', 'society_pecheur', 'Pécheur', '1');
INSERT INTO `datastore` VALUES ('33', 'society_pizza', 'Domino\'s Pizza', '1');
INSERT INTO `datastore` VALUES ('34', 'society_SantaMuerte', 'SantaMuerte', '1');

-- ----------------------------
-- Table structure for `datastore_data`
-- ----------------------------
DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10926 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of datastore_data
-- ----------------------------
INSERT INTO `datastore_data` VALUES ('1', 'society_cartel', null, '{}');
INSERT INTO `datastore_data` VALUES ('2', 'society_gang', null, '{}');
INSERT INTO `datastore_data` VALUES ('3', 'society_mafia', null, '{}');
INSERT INTO `datastore_data` VALUES ('4', 'society_police', null, '{}');
INSERT INTO `datastore_data` VALUES ('5', 'society_unicorn', null, '{}');
INSERT INTO `datastore_data` VALUES ('6', 'society_lawyer', null, '{}');
INSERT INTO `datastore_data` VALUES ('7', 'society_security', null, '{}');
INSERT INTO `datastore_data` VALUES ('8', 'society_reporter', null, '{}');
INSERT INTO `datastore_data` VALUES ('9', 'society_bahama', null, '{}');
INSERT INTO `datastore_data` VALUES ('10', 'society_brinks', null, '{}');
INSERT INTO `datastore_data` VALUES ('11', 'society_state', null, '{}');
INSERT INTO `datastore_data` VALUES ('12', 'society_billaboula', null, '{}');
INSERT INTO `datastore_data` VALUES ('13', 'society_army', null, '{}');
INSERT INTO `datastore_data` VALUES ('14', 'society_armurier', null, '{}');
INSERT INTO `datastore_data` VALUES ('15', 'society_vigne', null, '{}');

-- ----------------------------
-- Table structure for `dock`
-- ----------------------------
DROP TABLE IF EXISTS `dock`;
CREATE TABLE `dock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dock
-- ----------------------------
INSERT INTO `dock` VALUES ('1', 'Seashark', 'seashark', '10000', 'dock');
INSERT INTO `dock` VALUES ('2', 'Seashark2', 'seashark2', '11000', 'dock');
INSERT INTO `dock` VALUES ('3', 'Yacht Seashark', 'seashark3', '12000', 'dock');
INSERT INTO `dock` VALUES ('4', 'Suntrap', 'suntrap', '15000', 'dock');
INSERT INTO `dock` VALUES ('5', 'Dinghy', 'dinghy', '20000', 'dock');
INSERT INTO `dock` VALUES ('6', 'Dinghy2 ', 'dinghy2', '22000', 'dock');
INSERT INTO `dock` VALUES ('7', 'Yacht Dinghy', 'dinghy4', '23000', 'dock');
INSERT INTO `dock` VALUES ('8', 'Tropic', 'tropic', '12000', 'dock');
INSERT INTO `dock` VALUES ('9', 'Yacht Tropic', 'tropic2', '13000', 'dock');
INSERT INTO `dock` VALUES ('10', 'Squalo', 'squalo', '27500', 'dock');
INSERT INTO `dock` VALUES ('11', 'Yacht Toro', 'toro2', '34000', 'dock');
INSERT INTO `dock` VALUES ('12', 'Toro', 'toro', '36000', 'dock');
INSERT INTO `dock` VALUES ('13', 'Jetmax', 'jetmax', '28000', 'dock');
INSERT INTO `dock` VALUES ('14', 'Voilier Marquis', 'marquis', '55000', 'dock');

-- ----------------------------
-- Table structure for `dock_categories`
-- ----------------------------
DROP TABLE IF EXISTS `dock_categories`;
CREATE TABLE `dock_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dock_categories
-- ----------------------------
INSERT INTO `dock_categories` VALUES ('1', 'dock', 'Bateaux');

-- ----------------------------
-- Table structure for `dock_vehicles`
-- ----------------------------
DROP TABLE IF EXISTS `dock_vehicles`;
CREATE TABLE `dock_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dock_vehicles
-- ----------------------------
INSERT INTO `dock_vehicles` VALUES ('1', 'dinghy', '2500');
INSERT INTO `dock_vehicles` VALUES ('2', 'seashark', '35000');
INSERT INTO `dock_vehicles` VALUES ('3', 'seashark', '35000');
INSERT INTO `dock_vehicles` VALUES ('4', 'seashark', '35000');

-- ----------------------------
-- Table structure for `essence`
-- ----------------------------
DROP TABLE IF EXISTS `essence`;
CREATE TABLE `essence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `montant` varchar(100) NOT NULL DEFAULT '1000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of essence
-- ----------------------------
INSERT INTO `essence` VALUES ('1', '500');
INSERT INTO `essence` VALUES ('2', '500');
INSERT INTO `essence` VALUES ('3', '500');
INSERT INTO `essence` VALUES ('4', '500');
INSERT INTO `essence` VALUES ('5', '500');
INSERT INTO `essence` VALUES ('6', '500');
INSERT INTO `essence` VALUES ('7', '500');
INSERT INTO `essence` VALUES ('8', '500');
INSERT INTO `essence` VALUES ('9', '500');
INSERT INTO `essence` VALUES ('10', '500');
INSERT INTO `essence` VALUES ('11', '500');
INSERT INTO `essence` VALUES ('12', '500');
INSERT INTO `essence` VALUES ('13', '500');
INSERT INTO `essence` VALUES ('14', '500');
INSERT INTO `essence` VALUES ('15', '500');
INSERT INTO `essence` VALUES ('16', '500');
INSERT INTO `essence` VALUES ('17', '500');
INSERT INTO `essence` VALUES ('18', '500');
INSERT INTO `essence` VALUES ('19', '500');
INSERT INTO `essence` VALUES ('20', '500');
INSERT INTO `essence` VALUES ('21', '500');
INSERT INTO `essence` VALUES ('22', '500');
INSERT INTO `essence` VALUES ('23', '500');
INSERT INTO `essence` VALUES ('24', '500');
INSERT INTO `essence` VALUES ('25', '500');
INSERT INTO `essence` VALUES ('26', '500');
INSERT INTO `essence` VALUES ('27', '500');
INSERT INTO `essence` VALUES ('28', '500');
INSERT INTO `essence` VALUES ('29', '500');
INSERT INTO `essence` VALUES ('30', '500');
INSERT INTO `essence` VALUES ('31', '500');

-- ----------------------------
-- Table structure for `fine_types`
-- ----------------------------
DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fine_types
-- ----------------------------
INSERT INTO `fine_types` VALUES ('1', 'Usage abusif du klaxon', '200', '0');
INSERT INTO `fine_types` VALUES ('2', 'Franchir une ligne continue', '350', '0');
INSERT INTO `fine_types` VALUES ('3', 'Circulation à contresens', '1000', '0');
INSERT INTO `fine_types` VALUES ('4', 'Demi-tour non autorisé', '100', '0');
INSERT INTO `fine_types` VALUES ('5', 'Circulation hors-route', '200', '0');
INSERT INTO `fine_types` VALUES ('6', 'Non-respect des distances de sécurité', '200', '0');
INSERT INTO `fine_types` VALUES ('7', 'Arrêt dangereux / interdit', '300', '0');
INSERT INTO `fine_types` VALUES ('8', 'Stationnement gênant / interdit', '200', '0');
INSERT INTO `fine_types` VALUES ('9', 'Non respect  de la priorité à droite', '250', '0');
INSERT INTO `fine_types` VALUES ('10', 'Non-respect à un véhicule prioritaire', '250', '0');
INSERT INTO `fine_types` VALUES ('11', 'Non-respect d\'un stop', '400', '0');
INSERT INTO `fine_types` VALUES ('12', 'Non-respect d\'un feu rouge', '500', '0');
INSERT INTO `fine_types` VALUES ('13', 'Dépassement dangereux', '200', '0');
INSERT INTO `fine_types` VALUES ('14', 'Véhicule non en état', '500', '0');
INSERT INTO `fine_types` VALUES ('15', 'Conduite sans permis', '2000', '0');
INSERT INTO `fine_types` VALUES ('16', 'Délit de fuite', '8000', '0');
INSERT INTO `fine_types` VALUES ('17', 'Excès de vitesse < 5 kmh', '100', '0');
INSERT INTO `fine_types` VALUES ('18', 'Excès de vitesse 5-15 kmh', '250', '0');
INSERT INTO `fine_types` VALUES ('19', 'Excès de vitesse 15-30 kmh', '500', '0');
INSERT INTO `fine_types` VALUES ('20', 'Excès de vitesse > 30 kmh', '1000', '0');
INSERT INTO `fine_types` VALUES ('21', 'Entrave de la circulation', '1000', '1');
INSERT INTO `fine_types` VALUES ('22', 'Dégradation de la voie publique', '5000', '1');
INSERT INTO `fine_types` VALUES ('23', 'Trouble à l\'ordre publique', '3000', '1');
INSERT INTO `fine_types` VALUES ('24', 'Entrave opération de police', '3500', '1');
INSERT INTO `fine_types` VALUES ('25', 'Insulte envers / entre civils', '700', '1');
INSERT INTO `fine_types` VALUES ('26', 'Outrage à agent de police', '2000', '1');
INSERT INTO `fine_types` VALUES ('27', 'Menace verbale ou intimidation envers civil', '900', '1');
INSERT INTO `fine_types` VALUES ('28', 'Menace verbale ou intimidation envers policier', '2500', '1');
INSERT INTO `fine_types` VALUES ('29', 'Manifestation illégale', '500', '1');
INSERT INTO `fine_types` VALUES ('30', 'Tentative de corruption', '2300', '1');
INSERT INTO `fine_types` VALUES ('32', 'Arme léthale sortie en ville', '1700', '2');
INSERT INTO `fine_types` VALUES ('33', 'Port d\'arme non autorisé (défaut de license)', '1500', '2');
INSERT INTO `fine_types` VALUES ('34', 'Port d\'arme illégal', '8000', '2');
INSERT INTO `fine_types` VALUES ('35', 'Pris en flag lockpick', '2500', '2');
INSERT INTO `fine_types` VALUES ('36', 'Vol de voiture', '5000', '2');
INSERT INTO `fine_types` VALUES ('37', 'Vente de drogue', '20000', '2');
INSERT INTO `fine_types` VALUES ('38', 'Fabriquation de drogue', '15000', '2');
INSERT INTO `fine_types` VALUES ('39', 'Possession de drogue', '10000', '2');
INSERT INTO `fine_types` VALUES ('40', 'Prise d\'ôtage civil', '12000', '2');
INSERT INTO `fine_types` VALUES ('41', 'Prise d\'ôtage agent de l\'état', '50000', '2');
INSERT INTO `fine_types` VALUES ('42', 'Braquage particulier', '7500', '2');
INSERT INTO `fine_types` VALUES ('43', 'Braquage magasin', '13000', '2');
INSERT INTO `fine_types` VALUES ('44', 'Braquage de banque', '100000', '2');
INSERT INTO `fine_types` VALUES ('45', 'Tir sur civil', '15000', '3');
INSERT INTO `fine_types` VALUES ('46', 'Tir sur agent de l\'état', '40000', '3');
INSERT INTO `fine_types` VALUES ('47', 'Tentative de meurtre sur civil', '20000', '3');
INSERT INTO `fine_types` VALUES ('48', 'Tentative de meurtre sur agent de l\'état', '50000', '3');
INSERT INTO `fine_types` VALUES ('49', 'Meurtre sur civil', '30000', '3');
INSERT INTO `fine_types` VALUES ('50', 'Meurte sur agent de l\'état', '70000', '3');
INSERT INTO `fine_types` VALUES ('51', 'Meurtre involontaire', '10000', '3');
INSERT INTO `fine_types` VALUES ('52', 'Escroquerie à l\'entreprise', '20000', '2');

-- ----------------------------
-- Table structure for `fine_types_ambulance`
-- ----------------------------
DROP TABLE IF EXISTS `fine_types_ambulance`;
CREATE TABLE `fine_types_ambulance` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fine_types_ambulance
-- ----------------------------
INSERT INTO `fine_types_ambulance` VALUES ('1', 'Soin pour membre de la police', '400', '0');
INSERT INTO `fine_types_ambulance` VALUES ('2', ' Soin de base', '500', '0');
INSERT INTO `fine_types_ambulance` VALUES ('3', 'Soin longue distance', '650', '0');
INSERT INTO `fine_types_ambulance` VALUES ('4', 'Soin patient inconscient', '550', '0');

-- ----------------------------
-- Table structure for `fine_types_baladins`
-- ----------------------------
DROP TABLE IF EXISTS `fine_types_baladins`;
CREATE TABLE `fine_types_baladins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fine_types_baladins
-- ----------------------------
INSERT INTO `fine_types_baladins` VALUES ('1', 'Raket', '500', '0');
INSERT INTO `fine_types_baladins` VALUES ('2', 'Raket', '1000', '0');
INSERT INTO `fine_types_baladins` VALUES ('3', 'Raket', '2000', '1');
INSERT INTO `fine_types_baladins` VALUES ('4', 'Raket', '5000', '1');
INSERT INTO `fine_types_baladins` VALUES ('5', 'Raket', '10000', '2');
INSERT INTO `fine_types_baladins` VALUES ('6', 'Raket', '20000', '3');
INSERT INTO `fine_types_baladins` VALUES ('7', 'Raket', '50000', '3');

-- ----------------------------
-- Table structure for `fine_types_cartel`
-- ----------------------------
DROP TABLE IF EXISTS `fine_types_cartel`;
CREATE TABLE `fine_types_cartel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fine_types_cartel
-- ----------------------------
INSERT INTO `fine_types_cartel` VALUES ('1', 'Raket', '300', '0');
INSERT INTO `fine_types_cartel` VALUES ('2', 'Raket', '500', '0');
INSERT INTO `fine_types_cartel` VALUES ('3', 'Raket', '1000', '1');
INSERT INTO `fine_types_cartel` VALUES ('4', 'Raket', '2000', '1');

-- ----------------------------
-- Table structure for `fine_types_gang`
-- ----------------------------
DROP TABLE IF EXISTS `fine_types_gang`;
CREATE TABLE `fine_types_gang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fine_types_gang
-- ----------------------------
INSERT INTO `fine_types_gang` VALUES ('1', 'Raket', '300', '0');
INSERT INTO `fine_types_gang` VALUES ('2', 'Raket', '500', '0');
INSERT INTO `fine_types_gang` VALUES ('3', 'Raket', '1000', '1');
INSERT INTO `fine_types_gang` VALUES ('4', 'Raket', '2000', '1');

-- ----------------------------
-- Table structure for `fine_types_mafia`
-- ----------------------------
DROP TABLE IF EXISTS `fine_types_mafia`;
CREATE TABLE `fine_types_mafia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fine_types_mafia
-- ----------------------------
INSERT INTO `fine_types_mafia` VALUES ('1', 'Raket', '3000', '0');
INSERT INTO `fine_types_mafia` VALUES ('2', 'Raket', '5000', '0');
INSERT INTO `fine_types_mafia` VALUES ('3', 'Raket', '10000', '1');
INSERT INTO `fine_types_mafia` VALUES ('4', 'Raket', '20000', '1');
INSERT INTO `fine_types_mafia` VALUES ('5', 'Raket', '50000', '2');
INSERT INTO `fine_types_mafia` VALUES ('6', 'Raket', '150000', '3');
INSERT INTO `fine_types_mafia` VALUES ('7', 'Raket', '350000', '3');

-- ----------------------------
-- Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2119 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', 'bandage', 'Bandage', '50', '0', '1');
INSERT INTO `items` VALUES ('2', 'medikit', 'Medikit', '20', '0', '1');
INSERT INTO `items` VALUES ('3', 'bread', 'Pain', '100', '0', '1');
INSERT INTO `items` VALUES ('4', 'water', 'Eau', '100', '0', '1');
INSERT INTO `items` VALUES ('5', 'jumelles', 'Jumelles', '1', '0', '1');
INSERT INTO `items` VALUES ('6', 'alive_chicken', 'Poulet vivant', '300', '0', '1');
INSERT INTO `items` VALUES ('7', 'slaughtered_chicken', 'Poulet abattu', '300', '0', '1');
INSERT INTO `items` VALUES ('8', 'packaged_chicken', 'Poulet en barquette', '300', '0', '1');
INSERT INTO `items` VALUES ('9', 'fish', 'Poisson', '300', '0', '1');
INSERT INTO `items` VALUES ('10', 'stone', 'Pierre', '300', '0', '1');
INSERT INTO `items` VALUES ('11', 'washed_stone', 'Pierre Lavée', '300', '0', '1');
INSERT INTO `items` VALUES ('12', 'copper', 'Cuivre', '2400', '0', '1');
INSERT INTO `items` VALUES ('13', 'iron', 'Fer', '1800', '0', '1');
INSERT INTO `items` VALUES ('14', 'gold', 'Or', '900', '0', '1');
INSERT INTO `items` VALUES ('15', 'diamond', 'Diamant', '100', '0', '1');
INSERT INTO `items` VALUES ('16', 'wood', 'Bois', '300', '0', '1');
INSERT INTO `items` VALUES ('17', 'cutted_wood', 'Bois coupé', '200', '0', '1');
INSERT INTO `items` VALUES ('18', 'packaged_plank', 'Paquet de planches', '100', '0', '1');
INSERT INTO `items` VALUES ('19', 'petrol', 'Pétrole', '500', '0', '1');
INSERT INTO `items` VALUES ('20', 'petrol_raffin', 'Pétrole Raffiné', '500', '0', '1');
INSERT INTO `items` VALUES ('21', 'essence', 'Essence', '500', '0', '1');
INSERT INTO `items` VALUES ('22', 'whool', 'Laine', '300', '0', '1');
INSERT INTO `items` VALUES ('23', 'fabric', 'Tissu', '200', '0', '1');
INSERT INTO `items` VALUES ('24', 'clothe', 'Vêtement', '100', '0', '1');
INSERT INTO `items` VALUES ('25', 'weed', 'Weed', '650', '0', '1');
INSERT INTO `items` VALUES ('26', 'weed_pooch', 'Pochon de weed', '130', '0', '1');
INSERT INTO `items` VALUES ('27', 'coke', 'Coke', '650', '0', '1');
INSERT INTO `items` VALUES ('28', 'coke_pooch', 'Pochon de coke', '130', '0', '1');
INSERT INTO `items` VALUES ('29', 'meth', 'Meth', '650', '0', '1');
INSERT INTO `items` VALUES ('30', 'meth_pooch', 'Pochon de meth', '130', '0', '1');
INSERT INTO `items` VALUES ('31', 'opium', 'Opium', '650', '0', '1');
INSERT INTO `items` VALUES ('32', 'opium_pooch', 'Pochon de opium', '130', '0', '1');
INSERT INTO `items` VALUES ('33', 'gazbottle', 'bouteille de gaz', '15', '0', '1');
INSERT INTO `items` VALUES ('34', 'fixtool', 'outils réparation', '15', '0', '1');
INSERT INTO `items` VALUES ('35', 'carotool', 'outils carosserie', '50', '0', '1');
INSERT INTO `items` VALUES ('36', 'blowpipe', 'Chalumeaux', '15', '0', '1');
INSERT INTO `items` VALUES ('37', 'fixkit', 'Kit réparation', '50', '0', '1');
INSERT INTO `items` VALUES ('38', 'carokit', 'Trousse de réparation', '50', '0', '1');
INSERT INTO `items` VALUES ('39', 'cerveau', 'Cerveau', '-1', '0', '1');
INSERT INTO `items` VALUES ('40', 'coeur', 'Coeur', '-1', '0', '1');
INSERT INTO `items` VALUES ('41', 'moelle', 'grammes de Moelle', '-1', '0', '1');
INSERT INTO `items` VALUES ('42', 'intestin', 'Intestin', '-1', '0', '1');
INSERT INTO `items` VALUES ('43', 'os', 'Os', '-1', '0', '1');
INSERT INTO `items` VALUES ('44', 'organ_pooch', 'Corps humain', '-1', '0', '1');
INSERT INTO `items` VALUES ('45', 'jager', 'Jägermeister', '5', '0', '1');
INSERT INTO `items` VALUES ('46', 'vodka', 'Vodka', '5', '0', '1');
INSERT INTO `items` VALUES ('47', 'rhum', 'Rhum', '5', '0', '1');
INSERT INTO `items` VALUES ('48', 'whisky', 'Whisky', '5', '0', '1');
INSERT INTO `items` VALUES ('49', 'tequila', 'Tequila', '5', '0', '1');
INSERT INTO `items` VALUES ('50', 'martini', 'Martini blanc', '5', '0', '1');
INSERT INTO `items` VALUES ('51', 'soda', 'Soda', '5', '0', '1');
INSERT INTO `items` VALUES ('52', 'jusfruit', 'Jus de fruits', '5', '0', '1');
INSERT INTO `items` VALUES ('53', 'icetea', 'Ice-Tea', '50', '0', '1');
INSERT INTO `items` VALUES ('54', 'energy', 'Energy Drink', '5', '0', '1');
INSERT INTO `items` VALUES ('55', 'drpepper', 'Dr. Pepper', '5', '0', '1');
INSERT INTO `items` VALUES ('56', 'limonade', 'Limonade', '5', '0', '1');
INSERT INTO `items` VALUES ('57', 'bolcacahuetes', 'Bol de cacahuètes', '5', '0', '1');
INSERT INTO `items` VALUES ('58', 'bolnoixcajou', 'Bol de noix de cajou', '5', '0', '1');
INSERT INTO `items` VALUES ('59', 'bolpistache', 'Bol de pistaches', '5', '0', '1');
INSERT INTO `items` VALUES ('60', 'bolchips', 'Donut', '50', '0', '1');
INSERT INTO `items` VALUES ('61', 'saucisson', 'Saucisson', '5', '0', '1');
INSERT INTO `items` VALUES ('62', 'grapperaisin', 'Grappe de raisin', '500', '0', '1');
INSERT INTO `items` VALUES ('63', 'jagerbomb', 'Jägerbomb', '5', '0', '1');
INSERT INTO `items` VALUES ('64', 'golem', 'Golem', '5', '0', '1');
INSERT INTO `items` VALUES ('65', 'whiskycoca', 'Whisky-coca', '5', '0', '1');
INSERT INTO `items` VALUES ('66', 'vodkaenergy', 'Vodka-energy', '5', '0', '1');
INSERT INTO `items` VALUES ('67', 'vodkafruit', 'Vodka-jus de fruits', '5', '0', '1');
INSERT INTO `items` VALUES ('68', 'rhumfruit', 'Rhum-jus de fruits', '5', '0', '1');
INSERT INTO `items` VALUES ('69', 'teqpaf', 'Teq\'paf', '5', '0', '1');
INSERT INTO `items` VALUES ('70', 'rhumcoca', 'Rhum-coca', '5', '0', '1');
INSERT INTO `items` VALUES ('71', 'mojito', 'Mojito', '5', '0', '1');
INSERT INTO `items` VALUES ('72', 'ice', 'Glaçon', '5', '0', '1');
INSERT INTO `items` VALUES ('73', 'mixapero', 'Mix Apéritif', '3', '0', '1');
INSERT INTO `items` VALUES ('74', 'metreshooter', 'Mètre de shooter', '3', '0', '1');
INSERT INTO `items` VALUES ('75', 'jagercerbere', 'Jäger Cerbère', '3', '0', '1');
INSERT INTO `items` VALUES ('76', 'menthe', 'Feuille de menthe', '10', '0', '1');
INSERT INTO `items` VALUES ('77', 'pizza', 'Pizza', '100', '0', '1');
INSERT INTO `items` VALUES ('78', 'cola', 'Coca', '20', '0', '1');
INSERT INTO `items` VALUES ('79', 'vegetables', 'Légume', '20', '0', '1');
INSERT INTO `items` VALUES ('80', 'meat', 'Viande', '20', '0', '1');
INSERT INTO `items` VALUES ('81', 'tacos', 'Tacos', '20', '0', '1');
INSERT INTO `items` VALUES ('82', 'burger', 'Burger', '20', '0', '1');
INSERT INTO `items` VALUES ('207', 'silencieux', 'Silencieux', '-1', '0', '1');
INSERT INTO `items` VALUES ('208', 'flashlight', 'Lampe', '-1', '0', '1');
INSERT INTO `items` VALUES ('209', 'grip', 'Poignée', '-1', '0', '1');
INSERT INTO `items` VALUES ('300', 'jusorange', 'Jus D\'orange', '5', '0', '1');
INSERT INTO `items` VALUES ('301', 'grenadine', 'Grenadine', '5', '0', '1');
INSERT INTO `items` VALUES ('302', 'sexonthebeach', 'sex on the beach', '5', '0', '1');
INSERT INTO `items` VALUES ('303', 'monaco', 'Monaco', '5', '0', '1');
INSERT INTO `items` VALUES ('304', 'biere', 'Bière', '5', '0', '1');
INSERT INTO `items` VALUES ('305', 'oiseaujaune', 'oiseau jaune', '5', '0', '1');
INSERT INTO `items` VALUES ('306', 'tequilasunrise', 'tequila sunrise', '5', '0', '1');
INSERT INTO `items` VALUES ('307', 'lu_chiew', 'Mei Kuei Lu Chiew', '5', '0', '1');
INSERT INTO `items` VALUES ('308', 'juscitron', 'jus de citron', '5', '0', '1');
INSERT INTO `items` VALUES ('309', 'rosedelanuit', 'rose de la nuit', '5', '0', '1');
INSERT INTO `items` VALUES ('310', 'saumon', 'saumon', '600', '0', '1');
INSERT INTO `items` VALUES ('311', 'thon', 'thon', '600', '0', '1');
INSERT INTO `items` VALUES ('312', 'crevette', 'crevette', '600', '0', '1');
INSERT INTO `items` VALUES ('313', 'saumon_fume', 'saumon fumé', '600', '0', '1');
INSERT INTO `items` VALUES ('314', 'boite_thon', 'boîte de thon', '600', '0', '1');
INSERT INTO `items` VALUES ('315', 'samoussa_crevette', 'samoussa au crevette', '500', '0', '1');
INSERT INTO `items` VALUES ('2010', 'yusuf', 'Skin de luxe', '-1', '0', '1');
INSERT INTO `items` VALUES ('2035', 'ammo', 'Munition', '100', '0', '1');
INSERT INTO `items` VALUES ('2056', 'clip', 'Chargeur', '-1', '0', '1');
INSERT INTO `items` VALUES ('2057', 'moneybag', 'Sac de money', '200', '0', '1');
INSERT INTO `items` VALUES ('2058', 'phone', 'Iphone', '1', '0', '1');
INSERT INTO `items` VALUES ('2059', 'sacbillets', 'Sac de Billets', '100', '0', '1');
INSERT INTO `items` VALUES ('2060', 'raisin', 'Raisin', '500', '0', '1');
INSERT INTO `items` VALUES ('2061', 'jus_raisin', 'Jus de raisin', '500', '0', '1');
INSERT INTO `items` VALUES ('2062', 'grand_cru', 'Grand cru', '300', '0', '1');
INSERT INTO `items` VALUES ('2063', 'vine', 'Vin', '500', '0', '1');
INSERT INTO `items` VALUES ('2064', 'cigarett', 'Forfume', '30', '0', '1');
INSERT INTO `items` VALUES ('2065', 'lighter', 'Braguette', '30', '0', '1');
INSERT INTO `items` VALUES ('2066', 'cigarettr', 'Balaclope', '30', '0', '1');
INSERT INTO `items` VALUES ('2067', 'joint', 'BillAboula', '30', '0', '1');
INSERT INTO `items` VALUES ('2068', 'ocb', 'Carnet OCB', '30', '0', '1');
INSERT INTO `items` VALUES ('2069', 'feui', 'Feuille a rouler', '100', '0', '1');
INSERT INTO `items` VALUES ('2070', 'croquettes', 'Croquettes', '-1', '0', '1');
INSERT INTO `items` VALUES ('2071', 'poubelle', 'Poubelle', '-1', '0', '1');
INSERT INTO `items` VALUES ('2072', 'viande', 'Viande Cru', '15', '0', '1');
INSERT INTO `items` VALUES ('2073', 'pateapizza', 'Pâte a Pizza', '200', '0', '1');
INSERT INTO `items` VALUES ('2074', 'levure', 'Levure', '200', '0', '1');
INSERT INTO `items` VALUES ('2075', 'fromage', 'Fromage', '200', '0', '1');
INSERT INTO `items` VALUES ('2076', 'salade', 'Salade', '200', '0', '1');
INSERT INTO `items` VALUES ('2077', 'tomate', 'Tomate', '200', '0', '1');
INSERT INTO `items` VALUES ('2078', 'vinaigrette', 'Vinaigrette', '200', '0', '1');
INSERT INTO `items` VALUES ('2079', 'saladef', 'Salade Fraiche', '200', '0', '1');
INSERT INTO `items` VALUES ('2080', 'petrole', 'Petrole', '100', '0', '1');
INSERT INTO `items` VALUES ('2081', 'essence', 'Essence', '1000', '0', '1');
INSERT INTO `items` VALUES ('2082', 'ble', 'Blé', '500', '0', '1');
INSERT INTO `items` VALUES ('2083', 'farine', 'Farine', '500', '0', '1');
INSERT INTO `items` VALUES ('2085', 'malt', 'Houblon', '1000', '0', '1');
INSERT INTO `items` VALUES ('2087', 'canette_biere', 'Canette de Bière', '500', '0', '1');
INSERT INTO `items` VALUES ('2088', 'blackberry', 'Blackberry', '500', '0', '1');
INSERT INTO `items` VALUES ('2089', 'gps', 'GPS', '-1', '0', '1');
INSERT INTO `items` VALUES ('2090', 'flour', 'Farine', '200', '0', '1');
INSERT INTO `items` VALUES ('2091', 'saucetomate', 'Sauce Tomate', '200', '0', '1');
INSERT INTO `items` VALUES ('2092', 'chorizo', 'Chorizo', '200', '0', '1');
INSERT INTO `items` VALUES ('2093', 'mozzarella', 'Mozzarella', '200', '0', '1');
INSERT INTO `items` VALUES ('2094', 'lardon', 'Lardon', '200', '0', '1');
INSERT INTO `items` VALUES ('2095', 'merguez', 'Merguez', '200', '0', '1');
INSERT INTO `items` VALUES ('2096', 'viandehache', 'Viande Hachée', '200', '0', '1');
INSERT INTO `items` VALUES ('2097', 'saucebarbecue', 'Sauce Barbecue', '200', '0', '1');
INSERT INTO `items` VALUES ('2098', 'cremefraiche', 'Crème Fraiche', '200', '0', '1');
INSERT INTO `items` VALUES ('2099', 'ananas', 'Ananas', '200', '0', '1');
INSERT INTO `items` VALUES ('2100', 'origan', 'Origan', '200', '0', '1');
INSERT INTO `items` VALUES ('2101', 'olive', 'Olive', '200', '0', '1');
INSERT INTO `items` VALUES ('2102', 'pizza_chorizo', 'Pizza Chorizo', '200', '0', '1');
INSERT INTO `items` VALUES ('2103', 'pizza_canibale', 'Pizza Canibale', '200', '0', '1');
INSERT INTO `items` VALUES ('2104', 'pizza_barbecue', 'Pizza Barbecue', '200', '0', '1');
INSERT INTO `items` VALUES ('2105', 'pizza_saumon', 'Pizza Saumon', '200', '0', '1');
INSERT INTO `items` VALUES ('2106', 'pizza_thon', 'Pizza Thon', '200', '0', '1');
INSERT INTO `items` VALUES ('2107', 'coca', 'Coca Cola', '200', '0', '1');
INSERT INTO `items` VALUES ('2108', 'fanta', 'Fanta', '200', '0', '1');
INSERT INTO `items` VALUES ('2109', 'sprite', 'Sprite', '200', '0', '1');
INSERT INTO `items` VALUES ('2110', 'oasis', 'Oasis', '200', '0', '1');
INSERT INTO `items` VALUES ('2111', '7up', '7up', '200', '0', '1');
INSERT INTO `items` VALUES ('2112', 'orangina', 'Orangina', '200', '0', '1');
INSERT INTO `items` VALUES ('2113', 'minute_maid', 'Minute Maid', '200', '0', '1');
INSERT INTO `items` VALUES ('2114', 'jusfruit', 'Minute Maid', '200', '0', '1');
INSERT INTO `items` VALUES ('2115', 'pepsi', 'Pepsi', '200', '0', '1');
INSERT INTO `items` VALUES ('2116', 'tropico', 'Tropico', '200', '0', '1');
INSERT INTO `items` VALUES ('2117', 'redbull', 'Redbull', '200', '0', '1');
INSERT INTO `items` VALUES ('2118', 'monster', 'Monster', '200', '0', '1');

-- ----------------------------
-- Table structure for `job_grades`
-- ----------------------------
DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of job_grades
-- ----------------------------
INSERT INTO `job_grades` VALUES ('1', 'unemployed', '0', 'rsa', 'D\'ENTREPRISE', '350', '{}', '{}');
INSERT INTO `job_grades` VALUES ('2', 'ambulance', '1', 'ambulance', 'sapeur 2ème classe', '1500', '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}');
INSERT INTO `job_grades` VALUES ('3', 'ambulance', '2', 'doctor', 'sapeur 1ère classe', '2000', '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}');
INSERT INTO `job_grades` VALUES ('4', 'ambulance', '3', 'chief_doctor', 'caporal', '2500', '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}');
INSERT INTO `job_grades` VALUES ('5', 'ambulance', '5', 'capo_chef', 'caporal-chef', '3000', '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}');
INSERT INTO `job_grades` VALUES ('6', 'banker', '0', 'advisor', 'Conseiller', '200', '{}', '{}');
INSERT INTO `job_grades` VALUES ('7', 'banker', '1', 'banker', 'Banquier', '300', '{}', '{}');
INSERT INTO `job_grades` VALUES ('8', 'banker', '2', 'business_banker', 'Banquier d\'affaire', '320', '{}', '{}');
INSERT INTO `job_grades` VALUES ('9', 'banker', '3', 'trader', 'Trader', '350', '{}', '{}');
INSERT INTO `job_grades` VALUES ('10', 'banker', '4', 'boss', 'Patron', '400', '{}', '{}');
INSERT INTO `job_grades` VALUES ('11', 'lumberjack', '0', 'interim', 'Intérimaire', '400', '{}', '{}');
INSERT INTO `job_grades` VALUES ('12', 'fisherman', '0', 'interim', 'Intérimaire', '400', '{}', '{}');
INSERT INTO `job_grades` VALUES ('13', 'fueler', '0', 'interim', 'Intérimaire', '400', '{}', '{}');
INSERT INTO `job_grades` VALUES ('15', 'textil', '0', 'interim', 'Intérimaire', '400', '{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}', '{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}');
INSERT INTO `job_grades` VALUES ('16', 'miner', '0', 'interim', 'Intérimaire', '400', '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}', '{}');
INSERT INTO `job_grades` VALUES ('17', 'slaughterer', '0', 'interim', 'Intérimaire', '400', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}');
INSERT INTO `job_grades` VALUES ('18', 'cartel', '0', 'soldato', 'MEMBRE', '2800', '{}', '{}');
INSERT INTO `job_grades` VALUES ('19', 'cartel', '1', 'capo', 'GROS BRAS', '3100', '{}', '{}');
INSERT INTO `job_grades` VALUES ('20', 'cartel', '2', 'consigliere', ' SGT D\'ARME', '3300', '{}', '{}');
INSERT INTO `job_grades` VALUES ('21', 'cartel', '3', 'boss', 'PRESIDENT', '3499', '{}', '{}');
INSERT INTO `job_grades` VALUES ('22', 'gang', '0', 'soldato', 'Vigil', '1850', '{}', '{}');
INSERT INTO `job_grades` VALUES ('23', 'gang', '1', 'capo', 'Sécurité', '2350', '{}', '{}');
INSERT INTO `job_grades` VALUES ('24', 'gang', '2', 'consigliere', 'Sécuriter', '3350', '{}', '{}');
INSERT INTO `job_grades` VALUES ('25', 'gang', '3', 'boss', 'Patron', '3495', '{}', '{}');
INSERT INTO `job_grades` VALUES ('26', 'garagiste', '0', 'employee_test', 'Employé à l\'essai', '300', '{}', '{}');
INSERT INTO `job_grades` VALUES ('27', 'garagiste', '1', 'employee', 'Salarié', '450', '{}', '{}');
INSERT INTO `job_grades` VALUES ('28', 'garagiste', '2', 'employee_confirme', 'Salarié confirme', '500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('29', 'garagiste', '3', 'mecano_expert', 'Expert Mécanicien', '500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('30', 'garagiste', '4', 'manager', 'Manager', '500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('31', 'garagiste', '5', 'PDG', 'PDG', '500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('32', 'mafia', '0', 'soldato', 'recrue', '1000', '{}', '{}');
INSERT INTO `job_grades` VALUES ('33', 'mafia', '2', 'mafioso', 'Mafioso', '2000', '{}', '{}');
INSERT INTO `job_grades` VALUES ('34', 'mafia', '3', 'capo', 'Capo', '2500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('35', 'mafia', '4', 'assassin', 'Assassin', '100', '{}', '{}');
INSERT INTO `job_grades` VALUES ('36', 'mafia', '5', 'consigliere', 'Consigliere', '3250', '{}', '{}');
INSERT INTO `job_grades` VALUES ('37', 'mafia', '6', 'boss', 'Parain', '3499', '{}', '{}');
INSERT INTO `job_grades` VALUES ('38', 'mecano', '0', 'recrue', 'Recrue', '600', '{}', '{}');
INSERT INTO `job_grades` VALUES ('39', 'mecano', '1', 'novice', 'Novice', '600', '{}', '{}');
INSERT INTO `job_grades` VALUES ('40', 'mecano', '2', 'experimente', 'Experimente', '800', '{}', '{}');
INSERT INTO `job_grades` VALUES ('41', 'mecano', '3', 'chief', 'Chef d\'équipe', '1200', '{}', '{}');
INSERT INTO `job_grades` VALUES ('42', 'mecano', '4', 'boss', 'Patron', '1500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('48', 'realestateagent', '0', 'location', 'Location', '600', '{}', '{}');
INSERT INTO `job_grades` VALUES ('49', 'realestateagent', '1', 'vendeur', 'Vendeur', '600', '{}', '{}');
INSERT INTO `job_grades` VALUES ('50', 'realestateagent', '2', 'gestion', 'Gestion', '700', '{}', '{}');
INSERT INTO `job_grades` VALUES ('51', 'realestateagent', '3', 'boss', 'Patron', '800', '{}', '{}');
INSERT INTO `job_grades` VALUES ('52', 'taxi', '0', 'recrue', 'Recrue', '250', '{}', '{}');
INSERT INTO `job_grades` VALUES ('53', 'taxi', '1', 'novice', 'Novice', '250', '{}', '{}');
INSERT INTO `job_grades` VALUES ('54', 'taxi', '2', 'experimente', 'Experimente', '250', '{}', '{}');
INSERT INTO `job_grades` VALUES ('55', 'taxi', '3', 'uber', 'Uber', '250', '{}', '{}');
INSERT INTO `job_grades` VALUES ('56', 'taxi', '4', 'boss', 'Patron', '500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('57', 'unicorn', '0', 'barman', 'Barman', '900', '{}', '{}');
INSERT INTO `job_grades` VALUES ('58', 'unicorn', '1', 'dancer', 'Danseur', '900', '{}', '{}');
INSERT INTO `job_grades` VALUES ('59', 'unicorn', '2', 'dj', 'DJ', '1000', '{}', '{}');
INSERT INTO `job_grades` VALUES ('60', 'unicorn', '5', 'boss', 'Patron', '1700', '{}', '{}');
INSERT INTO `job_grades` VALUES ('61', 'cardealer', '0', 'recruit', 'Recrue', '500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('62', 'cardealer', '1', 'novice', 'Novice', '700', '{}', '{}');
INSERT INTO `job_grades` VALUES ('63', 'cardealer', '2', 'experienced', 'Experimente', '800', '{}', '{}');
INSERT INTO `job_grades` VALUES ('64', 'cardealer', '3', 'boss', 'Patron', '1500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('65', 'trucker', '0', 'employee', 'Employé', '400', '{\"tshirt_1\":59,\"torso_1\":89,\"arms\":31,\"pants_1\":36,\"glasses_1\":19,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":2,\"glasses_2\":0,\"torso_2\":1,\"shoes\":35,\"hair_1\":0,\"skin\":0,\"sex\":0,\"glasses_1\":19,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":5}', '{\"tshirt_1\":36,\"torso_1\":0,\"arms\":68,\"pants_1\":30,\"glasses_1\":15,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":27,\"glasses_2\":0,\"torso_2\":11,\"shoes\":26,\"hair_1\":5,\"skin\":0,\"sex\":1,\"glasses_1\":15,\"pants_2\":2,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":19}');
INSERT INTO `job_grades` VALUES ('67', 'foodtruck', '0', 'livreur', 'Livreur', '1100', '{}', '{}');
INSERT INTO `job_grades` VALUES ('68', 'foodtruck', '1', 'serveur', 'Serveur', '1300', '{}', '{}');
INSERT INTO `job_grades` VALUES ('98', 'police', '0', 'recruit', 'Eleve Gendarme', '800', '{\"shoes_2\":1,\"eyebrows_2\":10,\"makeup_2\":1,\"eyebrows_3\":27,\"age_1\":0,\"ears_1\":-1,\"makeup_4\":1,\"lipstick_2\":0,\"skin\":0,\"eyebrows_1\":12,\"pants_2\":0,\"ears_2\":0,\"beard_4\":0,\"bproof_1\":14,\"hair_1\":39,\"helmet_2\":0,\"face\":0,\"lipstick_1\":0,\"makeup_3\":0,\"lipstick_3\":0,\"shoes_1\":56,\"arms\":0,\"glasses\":0,\"torso_1\":55,\"decals_2\":0,\"torso_2\":0,\"glasses_1\":0,\"bags_1\":0,\"lipstick_4\":0,\"glasses_2\":0,\"sex\":0,\"chain_1\":0,\"hair_color_1\":1,\"chain_2\":0,\"tshirt_2\":0,\"hair_color_2\":0,\"beard_1\":18,\"decals_1\":0,\"bags_2\":0,\"hair_2\":0,\"shoes\":10,\"beard_3\":0,\"bproof_2\":0,\"eyebrows_4\":27,\"mask_1\":0,\"mask_2\":0,\"pants_1\":35,\"age_2\":0,\"makeup_1\":0,\"beard_2\":10,\"tshirt_1\":58,\"helmet_1\":46}', '{\"tshirt_1\":35,\"bproof_2\":0,\"chain_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"glasses\":0,\"ears_1\":-1,\"tshirt_2\":0,\"makeup_4\":1,\"eyebrows_3\":27,\"eyebrows_4\":27,\"eyebrows_2\":10,\"helmet_1\":45,\"shoes_1\":55,\"lipstick_2\":0,\"chain_1\":0,\"arms\":14,\"torso_1\":48,\"mask_1\":0,\"eyebrows_1\":12,\"makeup_3\":0,\"makeup_2\":1,\"beard_3\":0,\"shoes\":10,\"mask_2\":0,\"glasses_2\":0,\"face\":0,\"beard_1\":18,\"shoes_2\":0,\"bags_1\":0,\"bproof_1\":14,\"decals_2\":0,\"beard_2\":0,\"pants_2\":0,\"hair_color_2\":0,\"beard_4\":0,\"age_1\":0,\"ears_2\":0,\"helmet_2\":0,\"hair_1\":41,\"age_2\":0,\"pants_1\":34,\"hair_color_1\":1,\"bags_2\":0,\"glasses_1\":5,\"torso_2\":0,\"lipstick_3\":0,\"skin\":0,\"sex\":1,\"decals_1\":0,\"hair_2\":0,\"lipstick_1\":0}');
INSERT INTO `job_grades` VALUES ('99', 'police', '1', 'officer', 'Gendarme adjoint', '800', '{\"shoes_2\":1,\"eyebrows_2\":10,\"makeup_2\":1,\"eyebrows_3\":27,\"age_1\":0,\"ears_1\":-1,\"makeup_4\":1,\"lipstick_2\":0,\"skin\":0,\"eyebrows_1\":12,\"pants_2\":0,\"ears_2\":0,\"beard_4\":0,\"bproof_1\":14,\"hair_1\":39,\"helmet_2\":0,\"face\":0,\"lipstick_1\":0,\"makeup_3\":0,\"lipstick_3\":0,\"shoes_1\":56,\"arms\":0,\"glasses\":0,\"torso_1\":55,\"decals_2\":0,\"torso_2\":0,\"glasses_1\":0,\"bags_1\":0,\"lipstick_4\":0,\"glasses_2\":0,\"sex\":0,\"chain_1\":0,\"hair_color_1\":1,\"chain_2\":0,\"tshirt_2\":0,\"hair_color_2\":0,\"beard_1\":18,\"decals_1\":8,\"bags_2\":0,\"hair_2\":0,\"beard_3\":0,\"bproof_2\":0,\"eyebrows_4\":27,\"mask_1\":0,\"mask_2\":0,\"pants_1\":35,\"age_2\":0,\"makeup_1\":0,\"beard_2\":10,\"tshirt_1\":58,\"helmet_1\":8}', '{\"tshirt_1\":35,\"bproof_2\":0,\"chain_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"glasses\":0,\"ears_1\":-1,\"tshirt_2\":0,\"makeup_4\":1,\"eyebrows_3\":27,\"eyebrows_4\":27,\"eyebrows_2\":10,\"helmet_1\":57,\"shoes_1\":55,\"lipstick_2\":0,\"chain_1\":0,\"arms\":14,\"torso_1\":48,\"mask_1\":0,\"eyebrows_1\":12,\"makeup_3\":0,\"makeup_2\":1,\"beard_3\":0,\"shoes\":10,\"mask_2\":0,\"glasses_2\":0,\"face\":0,\"beard_1\":18,\"shoes_2\":0,\"bags_1\":0,\"bproof_1\":14,\"decals_2\":0,\"beard_2\":0,\"pants_2\":0,\"hair_color_2\":0,\"beard_4\":0,\"age_1\":0,\"ears_2\":0,\"helmet_2\":0,\"hair_1\":41,\"age_2\":0,\"pants_1\":34,\"hair_color_1\":1,\"bags_2\":0,\"glasses_1\":5,\"torso_2\":0,\"lipstick_3\":0,\"skin\":0,\"sex\":1,\"decals_1\":7,\"hair_2\":0,\"lipstick_1\":0}');
INSERT INTO `job_grades` VALUES ('100', 'police', '2', 'sergeant', 'Maréchal des logis-chef', '1100', '{\"shoes_2\":1,\"eyebrows_2\":10,\"makeup_2\":1,\"eyebrows_3\":27,\"age_1\":0,\"ears_1\":-1,\"makeup_4\":1,\"lipstick_2\":0,\"skin\":0,\"eyebrows_1\":12,\"pants_2\":0,\"ears_2\":0,\"beard_4\":0,\"bproof_1\":14,\"hair_1\":39,\"helmet_2\":0,\"face\":0,\"lipstick_1\":0,\"makeup_3\":0,\"lipstick_3\":0,\"shoes_1\":56,\"arms\":0,\"glasses\":0,\"torso_1\":55,\"decals_2\":1,\"torso_2\":0,\"glasses_1\":0,\"bags_1\":0,\"lipstick_4\":0,\"glasses_2\":0,\"sex\":0,\"chain_1\":0,\"hair_color_1\":1,\"chain_2\":0,\"tshirt_2\":0,\"hair_color_2\":0,\"beard_1\":18,\"decals_1\":8,\"bags_2\":0,\"hair_2\":0,\"shoes\":10,\"beard_3\":0,\"bproof_2\":0,\"eyebrows_4\":27,\"mask_1\":0,\"mask_2\":0,\"pants_1\":35,\"age_2\":0,\"makeup_1\":0,\"beard_2\":10,\"tshirt_1\":58,\"helmet_1\":8}', '{\"tshirt_1\":35,\"bproof_2\":0,\"chain_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"glasses\":0,\"ears_1\":-1,\"tshirt_2\":0,\"makeup_4\":1,\"eyebrows_3\":27,\"eyebrows_4\":27,\"eyebrows_2\":10,\"helmet_1\":57,\"shoes_1\":55,\"lipstick_2\":0,\"chain_1\":0,\"arms\":14,\"torso_1\":48,\"mask_1\":0,\"eyebrows_1\":12,\"makeup_3\":0,\"makeup_2\":1,\"beard_3\":0,\"shoes\":10,\"mask_2\":0,\"glasses_2\":0,\"face\":0,\"beard_1\":18,\"shoes_2\":0,\"bags_1\":0,\"bproof_1\":14,\"decals_2\":1,\"beard_2\":0,\"pants_2\":0,\"hair_color_2\":0,\"beard_4\":0,\"age_1\":0,\"ears_2\":0,\"helmet_2\":0,\"hair_1\":41,\"age_2\":0,\"pants_1\":34,\"hair_color_1\":1,\"bags_2\":0,\"glasses_1\":5,\"torso_2\":0,\"lipstick_3\":0,\"skin\":0,\"sex\":1,\"decals_1\":7,\"hair_2\":0,\"lipstick_1\":0}');
INSERT INTO `job_grades` VALUES ('101', 'police', '3', 'inspecteur', 'Adjudant', '1200', '', '');
INSERT INTO `job_grades` VALUES ('102', 'police', '4', 'swat', 'Major	', '1400', '{\"skin\":0,\"lipstick_2\":0,\"beard_1\":18,\"ears_2\":0,\"helmet_2\":0,\"beard_4\":0,\"torso_2\":0,\"pants_2\":0,\"makeup_2\":0,\"bags_2\":0,\"face\":13,\"eyebrows_2\":10,\"arms\":61,\"makeup_3\":0,\"bproof_1\":0,\"hair_1\":4,\"lipstick_3\":0,\"lipstick_1\":0,\"makeup_1\":0,\"beard_3\":0,\"eyebrows_1\":22,\"mask_2\":0,\"eyebrows_4\":0,\"torso_1\":50,\"hair_color_2\":0,\"lipstick_4\":0,\"beard_2\":10,\"glasses_2\":0,\"chain_2\":0,\"helmet_1\":-1,\"ears_1\":-1,\"mask_1\":0,\"age_2\":0,\"hair_2\":0,\"decals_2\":0,\"glasses_1\":0,\"hair_color_1\":0,\"tshirt_2\":0,\"pants_1\":33,\"makeup_4\":0,\"tshirt_1\":15,\"bags_1\":0,\"bproof_2\":0,\"chain_1\":0,\"age_1\":0,\"decals_1\":0,\"sex\":0,\"eyebrows_3\":56,\"shoes_2\":0,\"shoes_1\":25}', '');
INSERT INTO `job_grades` VALUES ('103', 'police', '5', 'sergeantchief', 'Lieutenant', '2000', '{\"shoes_2\":0,\"eyebrows_2\":10,\"makeup_2\":1,\"eyebrows_3\":27,\"age_1\":0,\"ears_1\":-1,\"makeup_4\":1,\"lipstick_2\":0,\"skin\":0,\"eyebrows_1\":12,\"pants_2\":0,\"ears_2\":0,\"beard_4\":0,\"bproof_1\":14,\"hair_1\":39,\"helmet_2\":0,\"face\":0,\"lipstick_1\":0,\"makeup_3\":0,\"lipstick_3\":0,\"shoes_1\":51,\"arms\":0,\"glasses\":0,\"torso_1\":55,\"decals_2\":1,\"torso_2\":0,\"glasses_1\":0,\"bags_1\":0,\"lipstick_4\":0,\"glasses_2\":0,\"sex\":0,\"chain_1\":0,\"hair_color_1\":1,\"chain_2\":0,\"tshirt_2\":0,\"hair_color_2\":0,\"beard_1\":18,\"decals_1\":8,\"bags_2\":0,\"hair_2\":0,\"shoes\":10,\"beard_3\":0,\"bproof_2\":0,\"eyebrows_4\":27,\"mask_1\":0,\"mask_2\":0,\"pants_1\":35,\"age_2\":0,\"makeup_1\":0,\"beard_2\":10,\"tshirt_1\":58,\"helmet_1\":8}', '{\"shoes_2\":0,\"eyebrows_2\":10,\"makeup_2\":1,\"eyebrows_3\":27,\"age_1\":0,\"ears_1\":-1,\"makeup_4\":1,\"lipstick_2\":0,\"skin\":0,\"eyebrows_1\":12,\"pants_2\":0,\"ears_2\":0,\"beard_4\":0,\"bproof_1\":14,\"hair_1\":39,\"helmet_2\":0,\"face\":0,\"lipstick_1\":0,\"makeup_3\":0,\"lipstick_3\":0,\"shoes_1\":51,\"arms\":0,\"glasses\":0,\"torso_1\":55,\"decals_2\":1,\"torso_2\":0,\"glasses_1\":0,\"bags_1\":0,\"lipstick_4\":0,\"glasses_2\":0,\"sex\":0,\"chain_1\":0,\"hair_color_1\":1,\"chain_2\":0,\"tshirt_2\":0,\"hair_color_2\":0,\"beard_1\":18,\"decals_1\":8,\"bags_2\":0,\"hair_2\":0,\"shoes\":10,\"beard_3\":0,\"bproof_2\":0,\"eyebrows_4\":27,\"mask_1\":0,\"mask_2\":0,\"pants_1\":35,\"age_2\":0,\"makeup_1\":0,\"beard_2\":10,\"tshirt_1\":58,\"helmet_1\":8}');
INSERT INTO `job_grades` VALUES ('104', 'police', '6', 'lieutenant', 'Lieutenant-colonel', '3000', '{\"shoes_2\":1,\"eyebrows_2\":10,\"makeup_2\":1,\"eyebrows_3\":27,\"age_1\":0,\"ears_1\":-1,\"makeup_4\":1,\"lipstick_2\":0,\"skin\":0,\"eyebrows_1\":12,\"pants_2\":0,\"ears_2\":0,\"beard_4\":0,\"bproof_1\":14,\"hair_1\":39,\"helmet_2\":0,\"face\":0,\"lipstick_1\":0,\"makeup_3\":0,\"lipstick_3\":0,\"shoes_1\":56,\"arms\":0,\"glasses\":0,\"torso_1\":55,\"decals_2\":3,\"torso_2\":0,\"glasses_1\":0,\"bags_1\":0,\"lipstick_4\":0,\"glasses_2\":0,\"sex\":0,\"chain_1\":0,\"hair_color_1\":1,\"chain_2\":0,\"tshirt_2\":0,\"hair_color_2\":0,\"beard_1\":18,\"decals_1\":8,\"bags_2\":0,\"hair_2\":0,\"shoes\":10,\"beard_3\":0,\"bproof_2\":0,\"eyebrows_4\":27,\"mask_1\":0,\"mask_2\":0,\"pants_1\":35,\"age_2\":0,\"makeup_1\":0,\"beard_2\":10,\"tshirt_1\":58,\"helmet_1\":8}', '{\"tshirt_1\":35,\"bproof_2\":0,\"chain_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"glasses\":0,\"ears_1\":-1,\"tshirt_2\":0,\"makeup_4\":1,\"eyebrows_3\":27,\"eyebrows_4\":27,\"eyebrows_2\":10,\"helmet_1\":57,\"shoes_1\":55,\"lipstick_2\":0,\"chain_1\":0,\"arms\":14,\"torso_1\":48,\"mask_1\":0,\"eyebrows_1\":12,\"makeup_3\":0,\"makeup_2\":1,\"beard_3\":0,\"shoes\":10,\"mask_2\":0,\"glasses_2\":0,\"face\":0,\"beard_1\":18,\"shoes_2\":0,\"bags_1\":0,\"bproof_1\":14,\"decals_2\":3,\"beard_2\":0,\"pants_2\":0,\"hair_color_2\":0,\"beard_4\":0,\"age_1\":0,\"ears_2\":0,\"helmet_2\":0,\"hair_1\":41,\"age_2\":0,\"pants_1\":34,\"hair_color_1\":1,\"bags_2\":0,\"glasses_1\":5,\"torso_2\":0,\"lipstick_3\":0,\"skin\":0,\"sex\":1,\"decals_1\":7,\"hair_2\":0,\"lipstick_1\":0}');
INSERT INTO `job_grades` VALUES ('105', 'police', '7', 'boss', 'Colonel', '3000', '{\"shoes_2\":1,\"eyebrows_2\":10,\"makeup_2\":1,\"eyebrows_3\":27,\"age_1\":0,\"ears_1\":-1,\"makeup_4\":1,\"lipstick_2\":0,\"skin\":0,\"eyebrows_1\":12,\"pants_2\":0,\"ears_2\":0,\"beard_4\":0,\"bproof_1\":14,\"hair_1\":39,\"helmet_2\":0,\"face\":0,\"lipstick_1\":0,\"makeup_3\":0,\"lipstick_3\":0,\"shoes_1\":56,\"arms\":0,\"glasses\":0,\"torso_1\":55,\"decals_2\":2,\"torso_2\":0,\"glasses_1\":5,\"bags_1\":0,\"lipstick_4\":0,\"glasses_2\":1,\"sex\":0,\"chain_1\":0,\"hair_color_1\":1,\"chain_2\":0,\"tshirt_2\":0,\"hair_color_2\":0,\"beard_1\":18,\"decals_1\":8,\"bags_2\":0,\"hair_2\":0,\"shoes\":10,\"beard_3\":0,\"bproof_2\":0,\"eyebrows_4\":27,\"mask_1\":0,\"mask_2\":0,\"pants_1\":35,\"age_2\":0,\"makeup_1\":0,\"beard_2\":10,\"tshirt_1\":58,\"helmet_1\":8}', '{\"tshirt_1\":35,\"bproof_2\":0,\"chain_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"glasses\":0,\"ears_1\":-1,\"tshirt_2\":0,\"makeup_4\":1,\"eyebrows_3\":27,\"eyebrows_4\":27,\"eyebrows_2\":10,\"helmet_1\":57,\"shoes_1\":55,\"lipstick_2\":0,\"chain_1\":0,\"arms\":14,\"torso_1\":48,\"mask_1\":0,\"eyebrows_1\":12,\"makeup_3\":0,\"makeup_2\":1,\"beard_3\":0,\"shoes\":10,\"mask_2\":0,\"glasses_2\":0,\"face\":0,\"beard_1\":18,\"shoes_2\":0,\"bags_1\":0,\"bproof_1\":14,\"decals_2\":2,\"beard_2\":0,\"pants_2\":0,\"hair_color_2\":0,\"beard_4\":0,\"age_1\":0,\"ears_2\":0,\"helmet_2\":0,\"hair_1\":41,\"age_2\":0,\"pants_1\":34,\"hair_color_1\":1,\"bags_2\":0,\"glasses_1\":5,\"torso_2\":0,\"lipstick_3\":0,\"skin\":0,\"sex\":1,\"decals_1\":7,\"hair_2\":0,\"lipstick_1\":0}');
INSERT INTO `job_grades` VALUES ('106', 'lawyer', '0', 'lawyer', 'Avocat', '1000', '', '');
INSERT INTO `job_grades` VALUES ('107', 'lawyer', '1', 'boss', 'Patron Avocat', '1500', '', '');
INSERT INTO `job_grades` VALUES ('114', 'reporter', '0', 'news', 'journaliste', '1500', '', '');
INSERT INTO `job_grades` VALUES ('115', 'reporter', '1', 'boss', 'Patron', '2000', '', '');
INSERT INTO `job_grades` VALUES ('117', null, '1', 'dj', 'DJ', '350', '{}', '{}');
INSERT INTO `job_grades` VALUES ('118', null, '2', 'secu', 'Sécurité', '400', '{}', '{}');
INSERT INTO `job_grades` VALUES ('119', null, '3', 'viceboss', 'Co-gérant', '400', '{}', '{}');
INSERT INTO `job_grades` VALUES ('120', null, '4', 'boss', 'Gérant', '400', '{}', '{}');
INSERT INTO `job_grades` VALUES ('121', 'brinks', '0', 'interim', 'Intérimaire', '400', '', '');
INSERT INTO `job_grades` VALUES ('122', 'brinks', '1', 'member', 'Employer', '500', '', '');
INSERT INTO `job_grades` VALUES ('123', 'brinks', '2', 'drive', 'Chauffeur', '600', '', '');
INSERT INTO `job_grades` VALUES ('124', 'brinks', '3', 'manager', 'Formateur', '700', '', '');
INSERT INTO `job_grades` VALUES ('125', 'brinks', '4', 'boss', 'Patron', '800', '', '');
INSERT INTO `job_grades` VALUES ('126', 'bahama', '0', 'barman', 'Barman', '800', '{}', '{}');
INSERT INTO `job_grades` VALUES ('127', 'bahama', '1', 'dj', 'DJ', '1000', '{}', '{}');
INSERT INTO `job_grades` VALUES ('128', 'bahama', '2', 'secu', 'Sécurité', '1200', '{}', '{}');
INSERT INTO `job_grades` VALUES ('129', 'bahama', '3', 'viceboss', 'Co-gérant', '1300', '{}', '{}');
INSERT INTO `job_grades` VALUES ('130', 'bahama', '4', 'boss', 'Gérant', '2000', '{}', '{}');
INSERT INTO `job_grades` VALUES ('131', 'state', '0', 'interim', 'Secrétaire', '2000', '', '');
INSERT INTO `job_grades` VALUES ('132', 'state', '1', 'member', 'Garde-Du-Corp', '2600', '', '');
INSERT INTO `job_grades` VALUES ('133', 'state', '2', 'drive', 'Chauffeure', '2600', '', '');
INSERT INTO `job_grades` VALUES ('134', 'state', '3', 'manager', 'Ministre', '4300', '', '');
INSERT INTO `job_grades` VALUES ('135', 'state', '4', 'boss', 'Président', '5000', '', '');
INSERT INTO `job_grades` VALUES ('136', 'dock', '0', 'recruit', 'Recrue', '10', '{}', '{}');
INSERT INTO `job_grades` VALUES ('137', 'dock', '1', 'novice', 'Novice', '25', '{}', '{}');
INSERT INTO `job_grades` VALUES ('138', 'dock', '2', 'experienced', 'Experimente', '40', '{}', '{}');
INSERT INTO `job_grades` VALUES ('139', 'dock', '3', 'boss', 'Patron', '0', '{}', '{}');
INSERT INTO `job_grades` VALUES ('140', 'vigne', '0', 'recrue', 'Intérimaire', '600', '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}');
INSERT INTO `job_grades` VALUES ('141', 'vigne', '1', 'novice', 'Vigneron', '650', '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}');
INSERT INTO `job_grades` VALUES ('142', 'vigne', '2', 'cdisenior', 'Chef de groupe', '700', '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}');
INSERT INTO `job_grades` VALUES ('143', 'vigne', '3', 'boss', 'Patron', '1400', '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":14,\"torso_2\":15,\"shoes_1\":12,\"shoes_2\":0,\"pants_1\":9, \"pants_2\":5, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}');
INSERT INTO `job_grades` VALUES ('145', 'army', '0', 'recruit', 'Soldat', '1200', '{}', '{}');
INSERT INTO `job_grades` VALUES ('146', 'army', '1', 'firstclass', '1er Classe', '1350', '{}', '{}');
INSERT INTO `job_grades` VALUES ('147', 'army', '2', 'capo', 'Caporal', '1500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('148', 'army', '3', 'chiefcapo', 'Caporal-Chef', '1700', '{}', '{}');
INSERT INTO `job_grades` VALUES ('149', 'army', '4', 'sergeant', 'Sergent', '1850', '{}', '{}');
INSERT INTO `job_grades` VALUES ('150', 'army', '5', 'chiefsergeant', 'Sergent-Chef', '2000', '{}', '{}');
INSERT INTO `job_grades` VALUES ('151', 'army', '6', 'adjudant', 'Adjudant', '2100', '{}', '{}');
INSERT INTO `job_grades` VALUES ('152', 'army', '7', 'chiefadjudant', 'Adjudant-Chef', '2250', '{}', '{}');
INSERT INTO `job_grades` VALUES ('153', 'army', '8', 'major', 'Major', '2400', '{}', '{}');
INSERT INTO `job_grades` VALUES ('154', 'army', '9', 'aspirant', 'Aspirant', '2550', '{}', '{}');
INSERT INTO `job_grades` VALUES ('155', 'army', '10', 'souslieutenant', 'Sous-lieutenant', '2700', '{}', '{}');
INSERT INTO `job_grades` VALUES ('156', 'army', '11', 'lieutenant', 'Lieutenant', '2800', '{}', '{}');
INSERT INTO `job_grades` VALUES ('157', 'army', '12', 'captain', 'Capitaine', '2950', '{}', '{}');
INSERT INTO `job_grades` VALUES ('158', 'army', '13', 'commandant', 'Commandant', '3100', '{}', '{}');
INSERT INTO `job_grades` VALUES ('159', 'army', '14', 'lieutenantcolonel', 'Lieutenant-colonel', '3200', '{}', '{}');
INSERT INTO `job_grades` VALUES ('160', 'army', '15', 'colonel', 'Colonel', '3350', '{}', '{}');
INSERT INTO `job_grades` VALUES ('161', 'army', '16', 'brigadiergeneral', 'Général de brigade', '3550', '{}', '{}');
INSERT INTO `job_grades` VALUES ('162', 'army', '17', 'divisiongeneral', 'Général de division', '3750', '{}', '{}');
INSERT INTO `job_grades` VALUES ('163', 'army', '18', 'generalofthearmycorps', 'Général de corps d\'armée', '4000', '{}', '{}');
INSERT INTO `job_grades` VALUES ('164', 'army', '19', 'generalarmy', 'Général d\'armée', '4700', '{}', '{}');
INSERT INTO `job_grades` VALUES ('165', 'army', '20', 'boss', 'Maréchal', '5200', '{}', '{}');
INSERT INTO `job_grades` VALUES ('166', 'armurier', '0', 'recrue', 'Stagiaire', '600', '{}', '{}');
INSERT INTO `job_grades` VALUES ('167', 'armurier', '4', 'boss', 'Patron', '1500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('168', 'eboueur', '0', 'interim', 'Intérimaire', '600', '{}', '{}');
INSERT INTO `job_grades` VALUES ('169', 'armurier', '1', 'colabo', 'Employé', '900', '{}', '{}');
INSERT INTO `job_grades` VALUES ('170', 'foodtruck', '2', 'resp', 'Responsable', '700', '{}', '{}');
INSERT INTO `job_grades` VALUES ('171', 'foodtruck', '3', 'boss', 'Patron', '1200', '{}', '{}');
INSERT INTO `job_grades` VALUES ('172', 'pompiste', '0', 'recrue', 'Etudiant', '50', '{}', '{}');
INSERT INTO `job_grades` VALUES ('173', 'pompiste', '1', 'experimente', 'Employé', '80', '{}', '{}');
INSERT INTO `job_grades` VALUES ('174', 'pompiste', '2', 'chef', 'Associé', '100', '{}', '{}');
INSERT INTO `job_grades` VALUES ('175', 'pompiste', '3', 'boss', 'Patron', '150', '{}', '{}');
INSERT INTO `job_grades` VALUES ('176', 'pompiste', '0', 'recrue', 'Etudiant', '50', '{}', '{}');
INSERT INTO `job_grades` VALUES ('177', 'pompiste', '1', 'experimente', 'Employé', '80', '{}', '{}');
INSERT INTO `job_grades` VALUES ('178', 'pompiste', '2', 'chef', 'Associé', '100', '{}', '{}');
INSERT INTO `job_grades` VALUES ('179', 'pompiste', '3', 'boss', 'Patron', '150', '{}', '{}');
INSERT INTO `job_grades` VALUES ('180', 'gopostal', '0', 'employee', 'Sedex', '200', '{\"tshirt_1\":59,\"torso_1\":89,\"arms\":31,\"pants_1\":36,\"glasses_1\":19,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":2,\"glasses_2\":0,\"torso_2\":1,\"shoes\":35,\"hair_1\":0,\"skin\":0,\"sex\":0,\"glasses_1\":19,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":5}', '{\"tshirt_1\":36,\"torso_1\":0,\"arms\":68,\"pants_1\":30,\"glasses_1\":15,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":27,\"glasses_2\":0,\"torso_2\":11,\"shoes\":26,\"hair_1\":5,\"skin\":0,\"sex\":1,\"glasses_1\":15,\"pants_2\":2,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":19}');
INSERT INTO `job_grades` VALUES ('184', 'mafia', '3', 'boss', 'Parain', '2700', '{}', '{}');
INSERT INTO `job_grades` VALUES ('185', 'fermier', '0', 'interim', 'Intérimaire', '0', '{}', '{}');
INSERT INTO `job_grades` VALUES ('186', 'poste', '0', 'interim', 'Intérimaire', '600', '{\"helmet_2\":7,\"pants_1\":15,\"shoes_2\":12,\"shoes\":35,\"ears_1\":-1,\"shoes_1\":1,\"torso_1\":22,\"helmet_1\":63,\"tshirt_1\":15,\"torso_2\":1}', '');
INSERT INTO `job_grades` VALUES ('196', 'baladins', '2', 'droit', 'sous-chef', '1000', '', '');
INSERT INTO `job_grades` VALUES ('197', 'baladins', '0', 'consigliere', 'Soldat', '900', '{}', '{}');
INSERT INTO `job_grades` VALUES ('198', 'baladins', '1', 'droit', 'Capo', '900', '{}', '{}');
INSERT INTO `job_grades` VALUES ('199', 'baladins', '4', 'boss', 'Le Parrain', '1000', '{}', '{}');
INSERT INTO `job_grades` VALUES ('200', 'brewer', '0', 'interim', 'Intérimaire', '0', '{}', '{}');
INSERT INTO `job_grades` VALUES ('201', 'winegrower', '0', 'interim', 'Intérimaire', '0', '{}', '{}');
INSERT INTO `job_grades` VALUES ('202', 'driveschool', '3', 'boss', 'Patron', '600', '{}', '{}');
INSERT INTO `job_grades` VALUES ('203', 'driveschool', '2', 'boss', 'Moniteur', '600', '{}', '{}');
INSERT INTO `job_grades` VALUES ('204', 'driveschool', '1', 'boss', 'Stagiaire', '600', '{}', '{}');
INSERT INTO `job_grades` VALUES ('205', 'ambulance', '4', 'med', 'Medecin', '3500', '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}');
INSERT INTO `job_grades` VALUES ('206', 'tailor', '0', 'interim', 'Intérimaire', '550', '{}', '{}');
INSERT INTO `job_grades` VALUES ('207', 'pecheur', '0', 'recrue', 'Recrue', '300', '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}');
INSERT INTO `job_grades` VALUES ('208', 'pecheur', '1', 'novice', 'Employé', '500', '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}');
INSERT INTO `job_grades` VALUES ('209', 'pecheur', '2', 'cdisenior', 'Chef d\'équipe', '750', '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}');
INSERT INTO `job_grades` VALUES ('210', 'pecheur', '3', 'boss', 'Patron', '1000', '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":14,\"torso_2\":15,\"shoes_1\":12,\"shoes_2\":0,\"pants_1\":9, \"pants_2\":5, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}');
INSERT INTO `job_grades` VALUES ('211', 'armurier', '2', 'agentsecurity', 'agent de sécurité', '1100', '', '');
INSERT INTO `job_grades` VALUES ('212', 'armurier', '3', 'chefagentsecurity', 'chef sécurité', '1350', '', '');
INSERT INTO `job_grades` VALUES ('213', 'unicorn', '3', 'animateur', 'animateur', '1200', '{}', '{}');
INSERT INTO `job_grades` VALUES ('214', 'unicorn', '4', 'videur', 'Videur', '1400', '', '');
INSERT INTO `job_grades` VALUES ('315', 'baladins', '3', 'armurier', 'sous-chef A', '1000', '', '');
INSERT INTO `job_grades` VALUES ('316', 'pizza', '0', 'barman', 'Cuisinier', '600', '{}', '{}');
INSERT INTO `job_grades` VALUES ('317', 'pizza', '1', 'viceboss', 'Livreur', '500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('318', 'pizza', '2', 'boss', 'Patron', '1500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('319', 'ambulance', '0', 'jeune_sapeur', 'Jeune Sapeur Pompier', '1000', '{}', '{}');
INSERT INTO `job_grades` VALUES ('320', 'ambulance', '6', 'sergent', 'sergent', '2200', '{}', '{}');
INSERT INTO `job_grades` VALUES ('321', 'ambulance', '7', 'sergent_chef', 'sergent chef', '2400', '{}', '{}');
INSERT INTO `job_grades` VALUES ('322', 'ambulance', '8', 'adjudant', 'adjudant', '2600', '{}', '{}');
INSERT INTO `job_grades` VALUES ('323', 'ambulance', '9', 'adjudant_chef', 'adjudant chef', '2700', '{}', '{}');
INSERT INTO `job_grades` VALUES ('324', 'ambulance', '10', 'lieutenant', 'lieutenant', '3000', '{}', '{}');
INSERT INTO `job_grades` VALUES ('325', 'ambulance', '11', 'capitaine', 'capitaine', '3400', '{}', '{}');
INSERT INTO `job_grades` VALUES ('326', 'ambulance', '12', 'commandant', 'commandant', '3700', '{}', '{}');
INSERT INTO `job_grades` VALUES ('327', 'ambulance', '13', 'boss', 'lieutenant colonel', '4000', '{}', '{}');

-- ----------------------------
-- Table structure for `jobs`
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  `job_place` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES ('1', 'unemployed', 'PAS', '0', '1');
INSERT INTO `jobs` VALUES ('2', 'ambulance', 'Pompier', '1', '1');
INSERT INTO `jobs` VALUES ('3', 'banker', 'Banquier', '1', '1');
INSERT INTO `jobs` VALUES ('4', 'slaughterer', 'Abatteur', '0', '2');
INSERT INTO `jobs` VALUES ('5', 'fisherman', 'Pêcheur', '1', '2');
INSERT INTO `jobs` VALUES ('6', 'miner', 'Mineur', '0', '2');
INSERT INTO `jobs` VALUES ('7', 'lumberjack', 'Bûcheron', '0', '2');
INSERT INTO `jobs` VALUES ('8', 'fueler', 'Raffineur', '0', '2');
INSERT INTO `jobs` VALUES ('10', 'textil', 'Couturier', '1', '2');
INSERT INTO `jobs` VALUES ('11', 'cartel', 'Cartel', '1', '1');
INSERT INTO `jobs` VALUES ('12', 'gang', 'Gang', '1', '1');
INSERT INTO `jobs` VALUES ('13', 'garagiste', 'Garagiste', '1', '1');
INSERT INTO `jobs` VALUES ('15', 'mecano', 'Mécano', '1', '1');
INSERT INTO `jobs` VALUES ('16', 'police', 'Gendarmerie', '1', '1');
INSERT INTO `jobs` VALUES ('17', 'realestateagent', 'Agent immobilier', '1', '1');
INSERT INTO `jobs` VALUES ('18', 'taxi', 'Taxi', '1', '1');
INSERT INTO `jobs` VALUES ('19', 'unicorn', 'night club', '1', '1');
INSERT INTO `jobs` VALUES ('20', 'cardealer', 'Concessionnaire', '1', '1');
INSERT INTO `jobs` VALUES ('21', 'trucker', 'Routier', '0', '2');
INSERT INTO `jobs` VALUES ('22', 'poste', 'Postier', '1', '2');
INSERT INTO `jobs` VALUES ('23', 'foodtruck', 'Restaurant', '1', '1');
INSERT INTO `jobs` VALUES ('28', 'lawyer', 'Avocat', '1', '1');
INSERT INTO `jobs` VALUES ('31', 'reporter', 'Reporter', '1', '1');
INSERT INTO `jobs` VALUES ('34', 'bahama', 'bahama', '1', '1');
INSERT INTO `jobs` VALUES ('35', 'brinks', 'Brinks', '0', '2');
INSERT INTO `jobs` VALUES ('36', 'state', 'state', '1', '1');
INSERT INTO `jobs` VALUES ('37', 'dock', 'Marina', '1', '1');
INSERT INTO `jobs` VALUES ('38', 'vigne', 'Vigneron', '1', '1');
INSERT INTO `jobs` VALUES ('40', 'army', 'Army', '1', '1');
INSERT INTO `jobs` VALUES ('41', 'armurier', 'ST-MILITARIA', '1', '1');
INSERT INTO `jobs` VALUES ('42', 'eboueur', 'Eboueur', '0', '2');
INSERT INTO `jobs` VALUES ('43', 'pompiste', 'Pompiste', '1', '1');
INSERT INTO `jobs` VALUES ('45', 'mafia', 'Santa Muerte\n', '1', '1');
INSERT INTO `jobs` VALUES ('46', 'fermier', 'Fermier', '0', '2');
INSERT INTO `jobs` VALUES ('47', 'baladins', 'Le Palle Enormi', '1', '1');
INSERT INTO `jobs` VALUES ('48', 'brewer', 'Brasseur', '0', '2');
INSERT INTO `jobs` VALUES ('49', 'winegrower', 'Vigneron', '1', '1');
INSERT INTO `jobs` VALUES ('50', 'driveschool', 'driveschool', '1', '1');
INSERT INTO `jobs` VALUES ('51', 'tailor', 'Couturier', '0', '2');
INSERT INTO `jobs` VALUES ('52', 'pecheur', 'Pécheur', '1', '1');
INSERT INTO `jobs` VALUES ('53', 'pizza', 'Domino\'s Pizza', '1', '1');

-- ----------------------------
-- Table structure for `licenses`
-- ----------------------------
DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of licenses
-- ----------------------------
INSERT INTO `licenses` VALUES ('1', 'dmv', 'Code de la route');
INSERT INTO `licenses` VALUES ('2', 'drive', 'Permis de conduire');
INSERT INTO `licenses` VALUES ('3', 'drive_bike', 'Permis moto');
INSERT INTO `licenses` VALUES ('4', 'drive_truck', 'Permis camion');
INSERT INTO `licenses` VALUES ('5', 'weapon', 'Permis de Port D\'Arme');
INSERT INTO `licenses` VALUES ('6', 'sellweapon', 'Permis de Vente D\'Arme');

-- ----------------------------
-- Table structure for `owned_dock`
-- ----------------------------
DROP TABLE IF EXISTS `owned_dock`;
CREATE TABLE `owned_dock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of owned_dock
-- ----------------------------

-- ----------------------------
-- Table structure for `owned_properties`
-- ----------------------------
DROP TABLE IF EXISTS `owned_properties`;
CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of owned_properties
-- ----------------------------

-- ----------------------------
-- Table structure for `owned_vehicles`
-- ----------------------------
DROP TABLE IF EXISTS `owned_vehicles`;
CREATE TABLE `owned_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Etat de la voiture',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of owned_vehicles
-- ----------------------------

-- ----------------------------
-- Table structure for `phone_app_chat`
-- ----------------------------
DROP TABLE IF EXISTS `phone_app_chat`;
CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phone_app_chat
-- ----------------------------

-- ----------------------------
-- Table structure for `phone_calls`
-- ----------------------------
DROP TABLE IF EXISTS `phone_calls`;
CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phone_calls
-- ----------------------------

-- ----------------------------
-- Table structure for `phone_messages`
-- ----------------------------
DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of phone_messages
-- ----------------------------

-- ----------------------------
-- Table structure for `phone_users_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `phone_users_contacts`;
CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `number` varchar(10) NOT NULL,
  `display` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of phone_users_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `playerstattoos`
-- ----------------------------
DROP TABLE IF EXISTS `playerstattoos`;
CREATE TABLE `playerstattoos` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `tattoos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of playerstattoos
-- ----------------------------

-- ----------------------------
-- Table structure for `properties`
-- ----------------------------
DROP TABLE IF EXISTS `properties`;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of properties
-- ----------------------------
INSERT INTO `properties` VALUES ('1', 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', null, '1', '1', '0', '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', '1500000');
INSERT INTO `properties` VALUES ('2', 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', null, '1', '1', '0', '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', '1500000');
INSERT INTO `properties` VALUES ('3', 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', null, '1', '1', '0', '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', '1700000');
INSERT INTO `properties` VALUES ('4', 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', null, '1', '1', '0', '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', '1500000');
INSERT INTO `properties` VALUES ('5', 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', null, '1', '1', '0', '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', '1500000');
INSERT INTO `properties` VALUES ('6', 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', null, '1', '1', '0', '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', '1500000');
INSERT INTO `properties` VALUES ('7', 'LowEndApartment', 'Appartement de base', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', null, '1', '1', '0', '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', '562500');
INSERT INTO `properties` VALUES ('8', 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', null, '1', '1', '0', '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', '1500000');
INSERT INTO `properties` VALUES ('9', 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', null, '1', '1', '0', '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', '1500000');
INSERT INTO `properties` VALUES ('10', 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', null, '1', '1', '0', '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', '1500000');
INSERT INTO `properties` VALUES ('11', 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', null, '1', '1', '0', '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', '1700000');
INSERT INTO `properties` VALUES ('12', 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', null, null, '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', null, '0', '0', '1', null, '0');
INSERT INTO `properties` VALUES ('13', 'Modern1Apartment', 'Appartement Moderne 1', null, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', null, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', '1300000');
INSERT INTO `properties` VALUES ('14', 'Modern2Apartment', 'Appartement Moderne 2', null, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', null, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', '1300000');
INSERT INTO `properties` VALUES ('15', 'Modern3Apartment', 'Appartement Moderne 3', null, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', null, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', '1300000');
INSERT INTO `properties` VALUES ('16', 'Mody1Apartment', 'Appartement Mode 1', null, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', null, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', '1300000');
INSERT INTO `properties` VALUES ('17', 'Mody2Apartment', 'Appartement Mode 2', null, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', null, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', '1300000');
INSERT INTO `properties` VALUES ('18', 'Mody3Apartment', 'Appartement Mode 3', null, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', null, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', '1300000');
INSERT INTO `properties` VALUES ('19', 'Vibrant1Apartment', 'Appartement Vibrant 1', null, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', null, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', '1300000');
INSERT INTO `properties` VALUES ('20', 'Vibrant2Apartment', 'Appartement Vibrant 2', null, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', null, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', '1300000');
INSERT INTO `properties` VALUES ('21', 'Vibrant3Apartment', 'Appartement Vibrant 3', null, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', null, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', '1300000');
INSERT INTO `properties` VALUES ('22', 'Sharp1Apartment', 'Appartement Persan 1', null, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', null, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', '1300000');
INSERT INTO `properties` VALUES ('23', 'Sharp2Apartment', 'Appartement Persan 2', null, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', null, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', '1300000');
INSERT INTO `properties` VALUES ('24', 'Sharp3Apartment', 'Appartement Persan 3', null, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', null, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', '1300000');
INSERT INTO `properties` VALUES ('25', 'Monochrome1Apartment', 'Appartement Monochrome 1', null, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', null, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', '1300000');
INSERT INTO `properties` VALUES ('26', 'Monochrome2Apartment', 'Appartement Monochrome 2', null, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', null, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', '1300000');
INSERT INTO `properties` VALUES ('27', 'Monochrome3Apartment', 'Appartement Monochrome 3', null, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', null, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', '1300000');
INSERT INTO `properties` VALUES ('28', 'Seductive1Apartment', 'Appartement Séduisant 1', null, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', null, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', '1300000');
INSERT INTO `properties` VALUES ('29', 'Seductive2Apartment', 'Appartement Séduisant 2', null, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', null, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', '1300000');
INSERT INTO `properties` VALUES ('30', 'Seductive3Apartment', 'Appartement Séduisant 3', null, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', null, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', '1300000');
INSERT INTO `properties` VALUES ('31', 'Regal1Apartment', 'Appartement Régal 1', null, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', null, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', '1300000');
INSERT INTO `properties` VALUES ('32', 'Regal2Apartment', 'Appartement Régal 2', null, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', null, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', '1300000');
INSERT INTO `properties` VALUES ('33', 'Regal3Apartment', 'Appartement Régal 3', null, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', null, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', '1300000');
INSERT INTO `properties` VALUES ('34', 'Aqua1Apartment', 'Appartement Aqua 1', null, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', null, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', '1300000');
INSERT INTO `properties` VALUES ('35', 'Aqua2Apartment', 'Appartement Aqua 2', null, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', null, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', '1300000');
INSERT INTO `properties` VALUES ('36', 'Aqua3Apartment', 'Appartement Aqua 3', null, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', null, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', '0', '1', '0', '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', '1300000');
INSERT INTO `properties` VALUES ('37', 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', null, null, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', null, '0', '0', '1', null, '0');
INSERT INTO `properties` VALUES ('38', 'IntegrityWay28', '4 Integrity Way - Apt 28', null, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', null, '[]', 'IntegrityWay', '0', '1', '0', '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', '1700000');
INSERT INTO `properties` VALUES ('39', 'IntegrityWay30', '4 Integrity Way - Apt 30', null, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', null, '[]', 'IntegrityWay', '0', '1', '0', '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', '1700000');
INSERT INTO `properties` VALUES ('40', 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', null, null, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', null, '0', '0', '1', null, '0');
INSERT INTO `properties` VALUES ('41', 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', null, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', null, '[]', 'DellPerroHeights', '0', '1', '0', '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', '1700000');
INSERT INTO `properties` VALUES ('42', 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', null, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', null, '[]', 'DellPerroHeights', '0', '1', '0', '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', '1700000');
INSERT INTO `properties` VALUES ('43', 'MazeBankBuilding', 'Maze Bank Building', '{\"x\":-79.18,\"y\":-795.92,\"z\":43.35}', null, null, '{\"x\":-72.50,\"y\":-786.92,\"z\":43.40}', '[]', null, '0', '0', '1', null, '0');
INSERT INTO `properties` VALUES ('44', 'OldSpiceWarm', 'Old Spice Warm', null, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', null, '[\"ex_dt1_11_office_01a\"]', 'MazeBankBuilding', '0', '1', '0', '{\"x\":-72.018730163574,\"y\":-814.46844482422,\"z\":243.38577270508}', '5000000');
INSERT INTO `properties` VALUES ('45', 'OldSpiceClassical', 'Old Spice Classical', null, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', null, '[\"ex_dt1_11_office_01b\"]', 'MazeBankBuilding', '0', '1', '0', '{\"x\":-72.018730163574,\"y\":-814.46844482422,\"z\":243.38577270508}', '5000000');
INSERT INTO `properties` VALUES ('46', 'OldSpiceVintage', 'Old Spice Vintage', null, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', null, '[\"ex_dt1_11_office_01c\"]', 'MazeBankBuilding', '0', '1', '0', '{\"x\":-72.018730163574,\"y\":-814.46844482422,\"z\":243.38577270508}', '5000000');
INSERT INTO `properties` VALUES ('47', 'ExecutiveRich', 'Executive Rich', null, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', null, '[\"ex_dt1_11_office_02b\"]', 'MazeBankBuilding', '0', '1', '0', '{\"x\":-72.018730163574,\"y\":-814.46844482422,\"z\":243.38577270508}', '5000000');
INSERT INTO `properties` VALUES ('48', 'ExecutiveCool', 'Executive Cool', null, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', null, '[\"ex_dt1_11_office_02c\"]', 'MazeBankBuilding', '0', '1', '0', '{\"x\":-72.018730163574,\"y\":-814.46844482422,\"z\":243.38577270508}', '5000000');
INSERT INTO `properties` VALUES ('49', 'ExecutiveContrast', 'Executive Contrast', null, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', null, '[\"ex_dt1_11_office_02a\"]', 'MazeBankBuilding', '0', '1', '0', '{\"x\":-72.018730163574,\"y\":-814.46844482422,\"z\":243.38577270508}', '5000000');
INSERT INTO `properties` VALUES ('50', 'PowerBrokerIce', 'Power Broker Ice', null, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', null, '[\"ex_dt1_11_office_03a\"]', 'MazeBankBuilding', '0', '1', '0', '{\"x\":-72.018730163574,\"y\":-814.46844482422,\"z\":243.38577270508}', '5000000');
INSERT INTO `properties` VALUES ('51', 'PowerBrokerConservative', 'Power Broker Conservative', null, '', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', null, '[\"ex_dt1_11_office_03b\"]', 'MazeBankBuilding', '0', '1', '0', '{\"x\":-72.018730163574,\"y\":-814.46844482422,\"z\":243.38577270508}', '5000000');
INSERT INTO `properties` VALUES ('52', 'PowerBrokerPolished', 'Power Broker Polished', null, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', null, '[\"ex_dt1_11_office_03c\"]', 'MazeBankBuilding', '0', '1', '0', '{\"x\":-72.018730163574,\"y\":-814.46844482422,\"z\":243.38577270508}', '5000000');
INSERT INTO `properties` VALUES ('53', 'LomBank', 'Lom Bank', '{\"x\":-1581.36,\"y\":-558.23,\"z\":34.07}', null, null, '{\"x\":-1583.60,\"y\":-555.12,\"z\":34.07}', '[]', null, '0', '0', '1', null, '0');
INSERT INTO `properties` VALUES ('54', 'LBOldSpiceWarm', 'LB Old Spice Warm', null, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', null, '[\"ex_sm_13_office_01a\"]', 'LomBank', '0', '1', '0', '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', '3500000');
INSERT INTO `properties` VALUES ('55', 'LBOldSpiceClassical', 'LB Old Spice Classical', null, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', null, '[\"ex_sm_13_office_01b\"]', 'LomBank', '0', '1', '0', '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', '3500000');
INSERT INTO `properties` VALUES ('56', 'LBOldSpiceVintage', 'LB Old Spice Vintage', null, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', null, '[\"ex_sm_13_office_01c\"]', 'LomBank', '0', '1', '0', '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', '3500000');
INSERT INTO `properties` VALUES ('57', 'LBExecutiveRich', 'LB Executive Rich', null, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', null, '[\"ex_sm_13_office_02b\"]', 'LomBank', '0', '1', '0', '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', '3500000');
INSERT INTO `properties` VALUES ('58', 'LBExecutiveCool', 'LB Executive Cool', null, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', null, '[\"ex_sm_13_office_02c\"]', 'LomBank', '0', '1', '0', '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', '3500000');
INSERT INTO `properties` VALUES ('59', 'LBExecutiveContrast', 'LB Executive Contrast', null, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', null, '[\"ex_sm_13_office_02a\"]', 'LomBank', '0', '1', '0', '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', '3500000');
INSERT INTO `properties` VALUES ('60', 'LBPowerBrokerIce', 'LB Power Broker Ice', null, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', null, '[\"ex_sm_13_office_03a\"]', 'LomBank', '0', '1', '0', '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', '3500000');
INSERT INTO `properties` VALUES ('61', 'LBPowerBrokerConservative', 'LB Power Broker Conservative', null, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', null, '[\"ex_sm_13_office_03b\"]', 'LomBank', '0', '1', '0', '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', '3500000');
INSERT INTO `properties` VALUES ('62', 'LBPowerBrokerPolished', 'LB Power Broker Polished', null, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', null, '[\"ex_sm_13_office_03c\"]', 'LomBank', '0', '1', '0', '{\"x\":-1577.68,\"y\":-565.91,\"z\":108.52}', '3500000');
INSERT INTO `properties` VALUES ('63', 'MazeBankWest', 'Maze Bank West', '{\"x\":-1379.58,\"y\":-499.63,\"z\":32.22}', null, null, '{\"x\":-1378.95,\"y\":-502.82,\"z\":32.22}', '[]', null, '0', '0', '1', null, '0');
INSERT INTO `properties` VALUES ('64', 'MBWOldSpiceWarm', 'MBW Old Spice Warm', null, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', null, '[\"ex_sm_15_office_01a\"]', 'MazeBankWest', '0', '1', '0', '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', '2700000');
INSERT INTO `properties` VALUES ('65', 'MBWOldSpiceClassical', 'MBW Old Spice Classical', null, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', null, '[\"ex_sm_15_office_01b\"]', 'MazeBankWest', '0', '1', '0', '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', '2700000');
INSERT INTO `properties` VALUES ('66', 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', null, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', null, '[\"ex_sm_15_office_01c\"]', 'MazeBankWest', '0', '1', '0', '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', '2700000');
INSERT INTO `properties` VALUES ('67', 'MBWExecutiveRich', 'MBW Executive Rich', null, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', null, '[\"ex_sm_15_office_02b\"]', 'MazeBankWest', '0', '1', '0', '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', '2700000');
INSERT INTO `properties` VALUES ('68', 'MBWExecutiveCool', 'MBW Executive Cool', null, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', null, '[\"ex_sm_15_office_02c\"]', 'MazeBankWest', '0', '1', '0', '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', '2700000');
INSERT INTO `properties` VALUES ('69', 'MBWExecutive Contrast', 'MBW Executive Contrast', null, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', null, '[\"ex_sm_15_office_02a\"]', 'MazeBankWest', '0', '1', '0', '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', '2700000');
INSERT INTO `properties` VALUES ('70', 'MBWPowerBrokerIce', 'MBW Power Broker Ice', null, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', null, '[\"ex_sm_15_office_03a\"]', 'MazeBankWest', '0', '1', '0', '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', '2700000');
INSERT INTO `properties` VALUES ('71', 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', null, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', null, '[\"ex_sm_15_office_03b\"]', 'MazeBankWest', '0', '1', '0', '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', '2700000');
INSERT INTO `properties` VALUES ('72', 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', null, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', null, '[\"ex_sm_15_office_03c\"]', 'MazeBankWest', '0', '1', '0', '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', '2700000');

-- ----------------------------
-- Table structure for `qalle_brottsregister`
-- ----------------------------
DROP TABLE IF EXISTS `qalle_brottsregister`;
CREATE TABLE `qalle_brottsregister` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofcrime` varchar(255) NOT NULL,
  `crime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qalle_brottsregister
-- ----------------------------

-- ----------------------------
-- Table structure for `rented_dock`
-- ----------------------------
DROP TABLE IF EXISTS `rented_dock`;
CREATE TABLE `rented_dock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rented_dock
-- ----------------------------

-- ----------------------------
-- Table structure for `rented_vehicles`
-- ----------------------------
DROP TABLE IF EXISTS `rented_vehicles`;
CREATE TABLE `rented_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rented_vehicles
-- ----------------------------

-- ----------------------------
-- Table structure for `shopfoodtruck`
-- ----------------------------
DROP TABLE IF EXISTS `shopfoodtruck`;
CREATE TABLE `shopfoodtruck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shopfoodtruck
-- ----------------------------
INSERT INTO `shopfoodtruck` VALUES ('1', 'Market', 'cola', '1');
INSERT INTO `shopfoodtruck` VALUES ('7', 'Market', 'water', '1');
INSERT INTO `shopfoodtruck` VALUES ('8', 'Market', 'icetea', '1');
INSERT INTO `shopfoodtruck` VALUES ('12', 'Market', 'bread', '1');
INSERT INTO `shopfoodtruck` VALUES ('13', 'Market', 'pizza', '1');
INSERT INTO `shopfoodtruck` VALUES ('14', 'Market', 'saladef', '1');
INSERT INTO `shopfoodtruck` VALUES ('15', 'Market', 'tacos', '1');
INSERT INTO `shopfoodtruck` VALUES ('16', 'Market', 'burger', '1');

-- ----------------------------
-- Table structure for `shops`
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('1', 'TwentyFourSeven', 'bread', '12');
INSERT INTO `shops` VALUES ('2', 'TwentyFourSeven', 'water', '12');
INSERT INTO `shops` VALUES ('3', 'RobsLiquor', 'bread', '12');
INSERT INTO `shops` VALUES ('4', 'RobsLiquor', 'water', '12');
INSERT INTO `shops` VALUES ('5', 'LTDgasoline', 'bread', '12');
INSERT INTO `shops` VALUES ('6', 'LTDgasoline', 'water', '12');
INSERT INTO `shops` VALUES ('17', 'TwentyFourSeven', 'medikit', '1500');
INSERT INTO `shops` VALUES ('19', 'RobsLiquor', 'medikit', '1500');
INSERT INTO `shops` VALUES ('21', 'LTDgasoline', 'medikit', '1500');
INSERT INTO `shops` VALUES ('34', 'TwentyFourSeven', 'phone', '200');
INSERT INTO `shops` VALUES ('35', 'RobsLiquor', 'phone', '200');
INSERT INTO `shops` VALUES ('36', 'LTDgasoline', 'phone', '200');
INSERT INTO `shops` VALUES ('40', 'LTDgasoline', 'croquettes', '15');
INSERT INTO `shops` VALUES ('41', 'RobsLiquor', 'croquettes', '15');
INSERT INTO `shops` VALUES ('42', 'TwentyFourSeven', 'croquettes', '15');
INSERT INTO `shops` VALUES ('43', 'TwentyFourSeven', 'gps', '50');
INSERT INTO `shops` VALUES ('44', 'RobsLiquor', 'gps', '50');
INSERT INTO `shops` VALUES ('45', 'LTDgasoline', 'gps', '50');
INSERT INTO `shops` VALUES ('46', 'TwentyFourSeven', 'phone', '600');
INSERT INTO `shops` VALUES ('47', 'RobsLiquor', 'phone', '600');
INSERT INTO `shops` VALUES ('48', 'LTDgasoline', 'phone', '600');

-- ----------------------------
-- Table structure for `society_moneywash`
-- ----------------------------
DROP TABLE IF EXISTS `society_moneywash`;
CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of society_moneywash
-- ----------------------------

-- ----------------------------
-- Table structure for `truck_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `truck_inventory`;
CREATE TABLE `truck_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`item`,`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=57348 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of truck_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for `user_accounts`
-- ----------------------------
DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2218 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for `user_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `user_contacts`;
CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `user_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `user_inventory`;
CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85632 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for `user_licenses`
-- ----------------------------
DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_licenses
-- ----------------------------

-- ----------------------------
-- Table structure for `user_parkings`
-- ----------------------------
DROP TABLE IF EXISTS `user_parkings`;
CREATE TABLE `user_parkings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_parkings
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin,
  `loadout` longtext COLLATE utf8mb4_bin,
  `position` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `phone_number` int(11) DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin,
  `animal` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `vote` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL,
  `second_job` varchar(255) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `second_job_grade` int(11) DEFAULT '0',
  `job` varchar(255) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  PRIMARY KEY (`identifier`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for `vehicle_categories`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_categories`;
CREATE TABLE `vehicle_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicle_categories
-- ----------------------------
INSERT INTO `vehicle_categories` VALUES ('13', 'vehiculegratuit', 'Vehicule Gratuit');
INSERT INTO `vehicle_categories` VALUES ('14', 'donateur', 'Véhicule Donateur');
INSERT INTO `vehicle_categories` VALUES ('15', 'vehiculeexclu', 'Vehicule Exclusif');
INSERT INTO `vehicle_categories` VALUES ('16', 'moto', 'Moto/Scooter');
INSERT INTO `vehicle_categories` VALUES ('17', 'renault', 'Renault');
INSERT INTO `vehicle_categories` VALUES ('18', 'audi', 'Audi');
INSERT INTO `vehicle_categories` VALUES ('19', 'peugeot', 'Peugeot');
INSERT INTO `vehicle_categories` VALUES ('20', 'bmw', 'BMW');
INSERT INTO `vehicle_categories` VALUES ('21', 'mercedes', 'Mercedes');
INSERT INTO `vehicle_categories` VALUES ('22', 'porsche', 'Porsche');
INSERT INTO `vehicle_categories` VALUES ('23', 'ferrari', 'Ferrari');
INSERT INTO `vehicle_categories` VALUES ('24', 'lamborghini', 'Lamborghini');
INSERT INTO `vehicle_categories` VALUES ('25', 'mclaren', 'McLaren');
INSERT INTO `vehicle_categories` VALUES ('26', 'bentley', 'Bentley');
INSERT INTO `vehicle_categories` VALUES ('27', 'astonmartin', 'Aston Martin');
INSERT INTO `vehicle_categories` VALUES ('28', 'nissan', 'Nissan');
INSERT INTO `vehicle_categories` VALUES ('29', 'tesla', 'Tesla');
INSERT INTO `vehicle_categories` VALUES ('30', 'bugatti', 'Bugatti');
INSERT INTO `vehicle_categories` VALUES ('31', 'hyundai', 'Hyundai');
INSERT INTO `vehicle_categories` VALUES ('32', 'gang', 'Gang');
INSERT INTO `vehicle_categories` VALUES ('33', 'citroen', 'Citroen');
INSERT INTO `vehicle_categories` VALUES ('34', 'jeep', 'Jeep');
INSERT INTO `vehicle_categories` VALUES ('35', 'volkswagen', 'Volkswagen');

-- ----------------------------
-- Table structure for `vehicles`
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicles
-- ----------------------------
INSERT INTO `vehicles` VALUES ('264', 'Renault Twizy', 'twizy', '0', 'vehiculegratuit');
INSERT INTO `vehicles` VALUES ('267', 'Spirit', 'spirit', '1100', 'moto');
INSERT INTO `vehicles` VALUES ('269', 'Renault 4L', 'renault4l', '1100', 'renault');
INSERT INTO `vehicles` VALUES ('273', 'Spitro', 'spitro', '3000', 'moto');
INSERT INTO `vehicles` VALUES ('274', 'Twingo', 'twingo', '6000', 'renault');
INSERT INTO `vehicles` VALUES ('275', 'Megane RS', 'meganers', '30000', 'renault');
INSERT INTO `vehicles` VALUES ('276', 'T-Max', 'tmax', '16000', 'moto');
INSERT INTO `vehicles` VALUES ('277', 'Yamaha R6', 'r6', '30000', 'moto');
INSERT INTO `vehicles` VALUES ('278', 'KTM Duke', '690r', '10000', 'moto');
INSERT INTO `vehicles` VALUES ('279', 'Audi R8', 'r8ppi', '200000', 'audi');
INSERT INTO `vehicles` VALUES ('280', 'Audi RS4', 'rs4avant', '150000', 'audi');
INSERT INTO `vehicles` VALUES ('281', 'Clio 4', '17cliofl', '15000', 'renault');
INSERT INTO `vehicles` VALUES ('282', 'Peugeot 208', '208', '6000', 'peugeot');
INSERT INTO `vehicles` VALUES ('283', 'BMW X6M SUV', 'x6m', '40000', 'bmw');
INSERT INTO `vehicles` VALUES ('284', 'BMW M4', 'f82', '75000', 'bmw');
INSERT INTO `vehicles` VALUES ('285', 'BMW M5', 'm5f90', '86000', 'bmw');
INSERT INTO `vehicles` VALUES ('286', 'BMW I8', 'I8', '170000', 'bmw');
INSERT INTO `vehicles` VALUES ('287', 'Mercedes S500', 's500w222', '130000', 'mercedes');
INSERT INTO `vehicles` VALUES ('288', 'Mercedes CLA 45', 'cla45sb', '120000', 'mercedes');
INSERT INTO `vehicles` VALUES ('289', 'Mercedes A45 AMG', 'a45', '75000', 'mercedes');
INSERT INTO `vehicles` VALUES ('290', 'Mercedes S63 AMG', 'mers63c', '40000', 'mercedes');
INSERT INTO `vehicles` VALUES ('291', 'Porsche Cayenne', 'cayenne', '10000', 'porsche');
INSERT INTO `vehicles` VALUES ('292', 'Porshe 911 Turbo', '911turbos', '120000', 'porsche');
INSERT INTO `vehicles` VALUES ('293', 'Porsche 718', '718', '500000', 'porsche');
INSERT INTO `vehicles` VALUES ('294', 'Ferrari Californiat', 'fct', '296000', 'ferrari');
INSERT INTO `vehicles` VALUES ('295', 'Mercedes SLS', 'sls', '390000', 'mercedes');
INSERT INTO `vehicles` VALUES ('296', 'Lamborghini Huracan', 'huraperfospy', '1150000', 'lamborghini');
INSERT INTO `vehicles` VALUES ('297', 'Lamborghini LP700R', 'lp700r', '750000', 'lamborghini');
INSERT INTO `vehicles` VALUES ('298', 'Ferrari 458', 'f458', '320000', 'ferrari');
INSERT INTO `vehicles` VALUES ('299', 'McLaren P1', 'p1', '1900000', 'mclaren');
INSERT INTO `vehicles` VALUES ('300', 'Bentley Continental', 'ben17', '800000', 'bentley');
INSERT INTO `vehicles` VALUES ('301', 'Aston Martin DB11', 'ast', '300000', 'astonmartin');
INSERT INTO `vehicles` VALUES ('302', 'Nissan GTR', 'gtr', '360000', 'nissan');
INSERT INTO `vehicles` VALUES ('303', 'Tesla Model S', 'tmodel', '500000', 'tesla');
INSERT INTO `vehicles` VALUES ('304', 'Tesla Roadster', 'tr22', '5000000', 'vehiculeexclu');
INSERT INTO `vehicles` VALUES ('305', 'Bugatti Chiron', 'chiron', '3000000', 'bugatti');
INSERT INTO `vehicles` VALUES ('306', 'KTM Supermotard', 'ktmsm', '50000', 'moto');
INSERT INTO `vehicles` VALUES ('307', 'YZF SuperMotard', 'yzfsm', '45000', 'moto');
INSERT INTO `vehicles` VALUES ('308', 'H2R', 'ninjah2', '40000', 'moto');
INSERT INTO `vehicles` VALUES ('309', '250 YZF', 'yzf', '20000', 'moto');
INSERT INTO `vehicles` VALUES ('310', 'Hyundai ?', 'veln', '141000', 'hyundai');
INSERT INTO `vehicles` VALUES ('311', 'Mercedes G65 AMG', 'g65amg', '301000', 'mercedes');
INSERT INTO `vehicles` VALUES ('312', 'LaFerrari Aperta', 'aperta', '2500000', 'vehiculeexclu');
INSERT INTO `vehicles` VALUES ('313', 'Rolls-Royce Phantom', 'rrphantom', '0', 'gang');
INSERT INTO `vehicles` VALUES ('314', 'Mercedes S65 AMG', 's65amg', '0', 'gang');
INSERT INTO `vehicles` VALUES ('315', '2CV', 'cit2cv', '1500', 'citroen');
INSERT INTO `vehicles` VALUES ('316', 'Citroen C4 Pallas', 'felon', '18000', 'citroen');
INSERT INTO `vehicles` VALUES ('317', 'Renault Clio 3', 'blista', '18000', 'renault');
INSERT INTO `vehicles` VALUES ('318', 'Jeep SRT-8', 'SRT8', '200000', 'jeep');
INSERT INTO `vehicles` VALUES ('319', 'Renault Kangoo', 'kangoo', '12000', 'renault');
INSERT INTO `vehicles` VALUES ('320', 'Renault Espace III', 'espace3', '10000', 'renault');
INSERT INTO `vehicles` VALUES ('321', 'Renault 11 Turbo', 'fusilade', '5000', 'renault');
INSERT INTO `vehicles` VALUES ('322', 'Citroen C4', 'citroc4', '15000', 'citroen');
INSERT INTO `vehicles` VALUES ('323', 'BMW M3', 'm3e46', '125000', 'bmw');
INSERT INTO `vehicles` VALUES ('324', 'Porsche Panamera', 'pturismo', '600000', 'porsche');
INSERT INTO `vehicles` VALUES ('326', 'Volkswagen Golf GTI Mk7', 'MK7', '35000', 'volkswagen');
INSERT INTO `vehicles` VALUES ('327', 'BMW S1000 RR', 'BMWS', '30000', 'moto');
INSERT INTO `vehicles` VALUES ('328', 'Peugeot 205 Turbo 16', 'yPG205t16B', '20000', 'peugeot');
INSERT INTO `vehicles` VALUES ('329', 'Alpine A110 1970', 'A110S', '25000', 'renault');
INSERT INTO `vehicles` VALUES ('330', 'Alpine A110 2018', 'tailgater', '160000', 'renault');
INSERT INTO `vehicles` VALUES ('331', 'Voiture de Antonio', 'SUPRA2', '0', 'donateur');
INSERT INTO `vehicles` VALUES ('332', 'Voiture de Kevin', 'mig', '0', 'donateur');
INSERT INTO `vehicles` VALUES ('333', 'Voiture de Kevin', '17m760i', '0', 'donateur');
INSERT INTO `vehicles` VALUES ('334', 'Voiture de Nikos', 'MLBRABUS', '0', 'donateur');
INSERT INTO `vehicles` VALUES ('335', 'Voiture de John', 'FASTBACK', '0', 'donateur');
INSERT INTO `vehicles` VALUES ('336', 'Voiture de Elena', 'DK350Z', '0', 'donateur');
INSERT INTO `vehicles` VALUES ('337', 'Voiture de Elena', 'scuderiag', '0', 'donateur');
INSERT INTO `vehicles` VALUES ('338', 'Voiture de Tokyo', 'fmgt', '0', 'donateur');
INSERT INTO `vehicles` VALUES ('339', 'Voiture de Kelyah', 'ghis2', '0', 'donateur');
INSERT INTO `vehicles` VALUES ('340', 'Voiture de DavidW', 'M6F13', '0', 'donateur');

-- ----------------------------
-- Table structure for `weashops`
-- ----------------------------
DROP TABLE IF EXISTS `weashops`;
CREATE TABLE `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of weashops
-- ----------------------------
INSERT INTO `weashops` VALUES ('1', 'GunShop', 'WEAPON_PISTOL', '10000');
INSERT INTO `weashops` VALUES ('2', 'BlackWeashop', 'WEAPON_PISTOL', '500');
INSERT INTO `weashops` VALUES ('3', 'GunShop', 'WEAPON_FLASHLIGHT', '600');
INSERT INTO `weashops` VALUES ('4', 'BlackWeashop', 'WEAPON_FLASHLIGHT', '700');
INSERT INTO `weashops` VALUES ('5', 'GunShop', 'WEAPON_MACHETE', '900');
INSERT INTO `weashops` VALUES ('6', 'BlackWeashop', 'WEAPON_MACHETE', '110');
INSERT INTO `weashops` VALUES ('7', 'GunShop', 'WEAPON_NIGHTSTICK', '5000');
INSERT INTO `weashops` VALUES ('8', 'BlackWeashop', 'WEAPON_NIGHTSTICK', '150');
INSERT INTO `weashops` VALUES ('9', 'GunShop', 'WEAPON_BAT', '100');
INSERT INTO `weashops` VALUES ('10', 'BlackWeashop', 'WEAPON_BAT', '100');
INSERT INTO `weashops` VALUES ('11', 'GunShop', 'WEAPON_STUNGUN', '1250');
INSERT INTO `weashops` VALUES ('12', 'BlackWeashop', 'WEAPON_STUNGUN', '50');
INSERT INTO `weashops` VALUES ('14', 'BlackWeashop', 'WEAPON_MICROSMG', '17000');
INSERT INTO `weashops` VALUES ('16', 'BlackWeashop', 'WEAPON_PUMPSHOTGUN', '45000');
INSERT INTO `weashops` VALUES ('18', 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', '50000');
INSERT INTO `weashops` VALUES ('20', 'BlackWeashop', 'WEAPON_SPECIALCARBINE', '50000');
INSERT INTO `weashops` VALUES ('22', 'BlackWeashop', 'WEAPON_SNIPERRIFLE', '60000');
INSERT INTO `weashops` VALUES ('24', 'BlackWeashop', 'WEAPON_FIREWORK', '40000');
INSERT INTO `weashops` VALUES ('28', 'BlackWeashop', 'WEAPON_BZGAS', '35000');
INSERT INTO `weashops` VALUES ('29', 'GunShop', 'WEAPON_FIREEXTINGUISHER', '100');
INSERT INTO `weashops` VALUES ('30', 'BlackWeashop', 'WEAPON_FIREEXTINGUISHER', '100');
INSERT INTO `weashops` VALUES ('31', 'GunShop', 'WEAPON_BALL', '50');
INSERT INTO `weashops` VALUES ('32', 'BlackWeashop', 'WEAPON_BALL', '50');
INSERT INTO `weashops` VALUES ('33', 'GunShop', 'WEAPON_SMOKEGRENADE', '5000');
INSERT INTO `weashops` VALUES ('34', 'BlackWeashop', 'WEAPON_SMOKEGRENADE', '5000');
INSERT INTO `weashops` VALUES ('35', 'BlackWeashop', 'WEAPON_APPISTOL', '31000');
INSERT INTO `weashops` VALUES ('36', 'BlackWeashop', 'WEAPON_CARBINERIFLE', '120000');
INSERT INTO `weashops` VALUES ('37', 'BlackWeashop', 'WEAPON_HEAVYSNIPER', '80000');
INSERT INTO `weashops` VALUES ('40', 'BlackWeashop', 'WEAPON_STICKYBOMB', '1000000');
INSERT INTO `weashops` VALUES ('42', 'BlackWeashop', 'WEAPON_KNUCKLE', '3000');
INSERT INTO `weashops` VALUES ('43', 'BlackWeashop', 'WEAPON_SWITCHBLADE', '6000');
INSERT INTO `weashops` VALUES ('44', 'BlackWeashop', 'WEAPON_VINTAGEPISTOL', '38000');
INSERT INTO `weashops` VALUES ('45', 'BlackWeashop', 'WEAPON_PISTOL50', '50000');
INSERT INTO `weashops` VALUES ('46', 'BlackWeashop', 'WEAPON_SAWNOFFSHOTGUN', '64000');
INSERT INTO `weashops` VALUES ('47', 'BlackWeashop', 'WEAPON_MINISMG', '70000');

-- ----------------------------
-- Table structure for `whitelist`
-- ----------------------------
DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE `whitelist` (
  `identifier` varchar(70) NOT NULL,
  `last_connecion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ban_reason` text,
  `ban_until` timestamp NULL DEFAULT NULL,
  `vip` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of whitelist
-- ----------------------------
INSERT INTO `whitelist` VALUES ('steam:XXXXX', '2018-08-02 01:04:12', null, null, '0');
