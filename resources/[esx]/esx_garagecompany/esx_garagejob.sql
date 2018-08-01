USE `gta5_gamemode_essential`;

INSERT INTO `jobs` (name, label)
VALUES
  ('garagiste', 'Garagiste')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female)
VALUES
('garagiste', 0, 'employee_test', 'Employé à l\'essai', 1800, '{}', '{}'),
('garagiste', 1, 'employee', 'Salarié', 2100, '{}', '{}'),
('garagiste', 2, 'employee_confirme', 'Salarié confirme', 2500, '{}', '{}'),
('garagiste', 3, 'mecano_expert', 'Expert Mécanicien', 2800, '{}', '{}'),
('garagiste', 4, 'manager', 'Manager', 3000, '{}', '{}'),
('garagiste', 5, 'PDG', 'PDG', 5000, '{}', '{}')
;

