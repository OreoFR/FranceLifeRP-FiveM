CREATE DATABASE IF NOT EXISTS `gta5basemods` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gta5basemods`;

# Liste des joueurs | List of players
CREATE TABLE IF NOT EXISTS `joueur`
(
`id_joueur` int(10) NOT NULL AUTO_INCREMENT,
`idInGame_joueur` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '', # Identifiant du joueur en jeu (steam...)
`money_joueur` bigint(20) NOT NULL DEFAULT '0',
`job_joueur` int(5) NOT NULL DEFAULT '0', # 5=Sans emploi; 6=Routier;
`rankJob_joueur` int(1) NOT NULL DEFAULT '0', # Affichera le grade du joueur dans son métier
`drink_joueur` int(3) NOT NULL DEFAULT '100',
`eat_joueur` int(3) NOT NULL DEFAULT '100',
`wc_joueur` int(3) NOT NULL DEFAULT '100',
`maladie_joueur` int(1) NOT NULL DEFAULT '0', # 0=En forme; 1=Malade...
PRIMARY KEY (`id_joueur`)
) 
ENGINE=MYISAM CHARSET=UTF8 AUTO_INCREMENT=1;