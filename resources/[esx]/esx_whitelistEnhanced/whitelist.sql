CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(255) NOT NULL,
  `last_connexion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ban_reason` text,
  `ban_until` timestamp NULL DEFAULT NULL,
  `vip` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;