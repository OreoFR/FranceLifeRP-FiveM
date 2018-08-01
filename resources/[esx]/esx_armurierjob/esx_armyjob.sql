INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_army','Army',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_army','Army',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_army', 'Army', 1)
;

INSERT INTO `jobs` (name, label) VALUES 
	('army','Army')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('army',0,'recruit','Soldat',1200,'{}','{}'),
  ('army',1,'firstclass','1er Classe',1350,'{}','{}'),
  ('army',2,'capo','Caporal',1500,'{}','{}'),
  ('army',3,'chiefcapo','Caporal-Chef',1700,'{}','{}'),
  ('army',4,'sergeant','Sergent',1850,'{}','{}'),
  ('army',5,'chiefsergeant','Sergent-Chef',2000,'{}','{}'),
  ('army',6,'adjudant','Adjudant',2100,'{}','{}'),
  ('army',7,'chiefadjudant','Adjudant-Chef',2250,'{}','{}')
 ;
 INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('army',8,'major','Major',2400,'{}','{}'),
  ('army',9,'aspirant','Aspirant',2550,'{}','{}'),
  ('army',10,'souslieutenant','Sous-lieutenant',2700,'{}','{}'),
  ('army',11,'lieutenant','Lieutenant',2800,'{}','{}'),
  ('army',12,'captain','Capitaine',2950,'{}','{}'),
  ('army',13,'commandant','Commandant',3100,'{}','{}'),
  ('army',14,'lieutenantcolonel','Lieutenant-colonel',3200,'{}','{}'),
  ('army',15,'colonel','Colonel',3350,'{}','{}'),
  ('army',16,'brigadiergeneral','Général de brigade',3550,'{}','{}')
 ;
 INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('army',17,'divisiongeneral','Général de division',3750,'{}','{}'),
  ('army',18,'generalofthearmycorps','Général de corps d\'armée',4000,'{}','{}'),
  ('army',19,'generalarmy','Général d\'armée',4700,'{}','{}'),
  ('army',20,'boss','Maréchal',5200,'{}','{}')
;
