INSERT INTO `jobs` (`id`, `name`, `label`, `whitelisted`) VALUES
(NULL, 'eboueur', 'Little Pricks', 0);

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(NULL, 'eboueur', 0, 'interim', 'Intérimaire', 250, '{}', '{}');

INSERT INTO `items` (`id`, `name`, `label`, `limit`, `rare`, `can_remove`) VALUES
(NULL, 'poubelle', 'Poubelle', -1, 0, 1);
