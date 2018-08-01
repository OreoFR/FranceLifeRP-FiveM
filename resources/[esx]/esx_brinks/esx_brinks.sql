INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('brinks', 'Brinks', 0);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('brinks', 0, 'interim', 'Convoyeur de fonds', 400, '{}', '{}');

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('sacbillets', '💰 Sac de Billets', 100, 0, 1);
