INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_assureur', 'Assurance', 1);

INSERT INTO `addon_account_data` (`account_name`, `money`, `owner`) VALUES
('society_assureur', 0, NULL);


INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('assureur', 'Assureur', 1);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('assureur', 0, 'recruit', 'Recrue', 200, '{}', '{}'),
('assureur', 1, 'employed', 'Employé', 220, '{}', '{}'),
('assureur', 2, 'boss', 'Patron', 240, '{}', '{}');