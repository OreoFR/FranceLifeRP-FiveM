/*
UPDATE SQL OBLIGATOIRE POUR RENDRE FONCTIONNEL LE GARAGE 
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `owned_vehicles`
-- ----------------------------
DROP TABLE IF EXISTS `owned_vehicles`;
CREATE TABLE `owned_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` longtext NOT NULL,
  `owner` varchar(30) NOT NULL,
  `plate` varchar(12) DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Etat de la voiture',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=605 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of owned_vehicles
-- ----------------------------
