SET @job_name = 'pizza';
SET @society_name = 'society_pizza';
SET @job_Name_Caps = 'Domino\'s Pizza';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1),
  ('society_pizza_fridge', 'Domino\'s Pizza (frigo)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'barman', 'Cuisinier', 300, '{}', '{}'),
  (@job_name, 2, 'viceboss', 'Livreur', 500, '{}', '{}'),
  (@job_name, 3, 'boss', 'Patron', 600, '{}', '{}')
;
