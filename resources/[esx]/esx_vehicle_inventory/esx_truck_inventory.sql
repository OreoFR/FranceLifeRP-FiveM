CREATE TABLE IF NOT EXISTS `truck_inventory` (
`id` int(11) NOT NULL,
  `item` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `truck_inventory`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `truck_inventory`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `truck_inventory` ADD UNIQUE( `item`, `plate`);
