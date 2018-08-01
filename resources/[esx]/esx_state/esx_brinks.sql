INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_state','state',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_state','state',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_state', 'state', 1)
;

INSERT INTO `jobs` (name, label) VALUES 
	('state','state')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('state',0,'interim','Intérimaire',400,'',''),
	('state',1,'member','Employer',1600,'',''),
	('state',2,'drive','Chauffeure',1800,'',''),
	('state',3,'manager','Formateur',2300,'',''),
	('state',4,'boss','Patron',4000,'','')
;

