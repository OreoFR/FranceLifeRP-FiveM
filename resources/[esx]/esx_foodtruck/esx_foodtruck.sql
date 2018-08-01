SET @job_name = 'foodtruck';
SET @society_name = 'society_foodtruck';
SET @job_Name_Caps = 'Foodtruck';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'cook', 'Cuisinier', 200, '{}', '{}'),
  (@job_name, 1, 'boss', 'Patron', 300, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES  
    ('cola', 'Cola', 20),
    ('vegetables', 'Légume', 20),
    ('meat', 'Viande', 20),
    ('tacos', 'Tacos', 20),
    ('burger', 'Burger', 20)
;

INSERT INTO `shops` (`name`, `item`, `price`) VALUES
('Market', 'cola', 100),
('Market', 'vegetables', 100),
('Market', 'meat', 100)
;
