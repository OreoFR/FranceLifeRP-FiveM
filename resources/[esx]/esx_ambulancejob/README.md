# fxserver-esx_ambulancejob
FXServer ESX Ambulance Job


[UPDATE]
insert this into your database and download the new esx_ambulancejob(from TanguyOrtegat github)

```
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
```


[REQUIREMENTS]

* Auto mode
   - esx_skin => https://github.com/FXServer-ESX/fxserver-esx_skin
  
* Player management (boss actions **There is no way to earn money for now**)
  * esx_society => https://github.com/FXServer-ESX/fxserver-esx_society

[INSTALLATION]

1) CD in your resources/[esx] folder
2) Clone the repository
```
git clone https://github.com/TanguyOrtegat/esx_ambulancejob.git esx_ambulancejob
```
3) Import esx_ambulancejob.sql in your database

4) Add this in your server.cfg :

```
start baseevents
start esx_ambulancejob
```
5) * If you want player management you have to set Config.EnablePlayerManagement to true in config.lua

