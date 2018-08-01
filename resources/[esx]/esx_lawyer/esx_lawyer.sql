INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_lawyer','Lawyer',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_lawyer','Lawyer',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_lawyer', 'Lawyer', 1)
;

INSERT INTO `jobs` (name, label) VALUES 
	('lawyer','Lawyer')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('lawyer',0,'lawyer','Avocat',20,'',''),
	('lawyer',1,'boss','Patron Avocat',40,'','')
;		

