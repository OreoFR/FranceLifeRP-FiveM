CREATE TABLE `fine_types_ambulance` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `fine_types_ambulance` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Soin pour membre de la police', 400, 0),
(2, ' Soin de base', 500, 0),
(3, 'Soin longue distance', 750, 0),
(4, 'Soin patient inconscient', 800, 0);

INSERT INTO `addon_inventory` (`id`, `name`, `label`, `shared`) VALUES
(6, 'society_ambulance', 'Ambulance', 1);

ALTER TABLE `fine_types_ambulance`
  ADD PRIMARY KEY (`id`);