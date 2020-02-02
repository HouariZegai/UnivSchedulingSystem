DROP DATABASE IF EXISTS university_db;

CREATE DATABASE university_db;

USE university_db;

CREATE TABLE etudiant(
	num_et INT PRIMARY KEY AUTO_INCREMENT,
	nom_et VARCHAR(50),
	prenom_et VARCHAR(50),
	adresse VARCHAR(50)) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE promotion (
	id_promo INT PRIMARY KEY AUTO_INCREMENT,
	id_speci INT,
	niveau VARCHAR(50)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE spécialité (
	id_speci INT PRIMARY KEY AUTO_INCREMENT,
	nom_speci VARCHAR(50),
	description TEXT) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE cours (
	id_cours INT PRIMARY KEY AUTO_INCREMENT,
	id_promo INT,
	id_ens INT,
	id_salle INT,
	id_mod INT,
	jour VARCHAR(50),
	heure_debut TIME,
	heure_fin TIME) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE modules (
	id_mod INT PRIMARY KEY AUTO_INCREMENT,
	nom_mod VARCHAR(50),
	description TEXT) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE salles (
	id_salle INT PRIMARY KEY AUTO_INCREMENT,
	nom_salle VARCHAR(50),
	description VARCHAR(50)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE enseignant (
	id_ens INT PRIMARY KEY AUTO_INCREMENT,
	nom_ens VARCHAR(50),
	tel VARCHAR(15)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -----------------------------------------------
--
-- Constraints for tables
--

ALTER TABLE promotion ADD CONSTRAINT fk_promo FOREIGN KEY (id_speci) REFERENCES spécialité (id_speci);

ALTER TABLE cours 
	ADD CONSTRAINT fk_cours FOREIGN KEY (id_promo) REFERENCES promotion (id_promo),
	ADD CONSTRAINT fk_cours_2 FOREIGN KEY (id_ens) REFERENCES enseignant (id_ens),
	ADD CONSTRAINT fk_cours_3 FOREIGN KEY (id_salle) REFERENCES salles (id_salle),
	ADD CONSTRAINT fk_cours_4 FOREIGN KEY (id_mod) REFERENCES modules (id_mod);


-- -----------------------------------------------
-- Insert data to tables
--

INSERT INTO spécialité (id_speci, nom_speci, description) VALUES (1, "MGL", null);
INSERT INTO spécialité (id_speci, nom_speci, description) VALUES (2, "MGI", null);
INSERT INTO spécialité (id_speci, nom_speci, description) VALUES (3, "MRT", null);
INSERT INTO spécialité (id_speci, nom_speci, description) VALUES (4, "3L", null);
INSERT INTO spécialité (id_speci, nom_speci, description) VALUES (5, "2L", null);
INSERT INTO spécialité (id_speci, nom_speci, description) VALUES (6, "1L", null);

INSERT INTO promotion (id_promo, id_speci, niveau) VALUES (1, 1, "Master 2"); -- 2eme Master GL
INSERT INTO promotion (id_promo, id_speci, niveau) VALUES (2, 2, "Master 2"); -- 2eme Master GI
INSERT INTO promotion (id_promo, id_speci, niveau) VALUES (3, 3, "Master 2"); -- 2eme Master RT
INSERT INTO promotion (id_promo, id_speci, niveau) VALUES (4, 1, "Master 1"); -- 1er Master GL
INSERT INTO promotion (id_promo, id_speci, niveau) VALUES (5, 2, "Master 1"); -- 1er Master GI
INSERT INTO promotion (id_promo, id_speci, niveau) VALUES (6, 3, "Master 1"); -- 1er Master RT
INSERT INTO promotion (id_promo, id_speci, niveau) VALUES (7, 4, "3eme Licence");
INSERT INTO promotion (id_promo, id_speci, niveau) VALUES (8, 5, "2eme Licence");
INSERT INTO promotion (id_promo, id_speci, niveau) VALUES (9, 6, "Section 1"); -- L1 Section 1
INSERT INTO promotion (id_promo, id_speci, niveau) VALUES (10, 6, "Section 2"); -- L1 Section 2
INSERT INTO promotion (id_promo, id_speci, niveau) VALUES (11, 6, "Section 3"); -- L1 Section 3
INSERT INTO promotion (id_promo, id_speci, niveau) VALUES (12, 6, "Section 4"); -- L1 Section 4

INSERT INTO modules (id_mod, nom_mod, description) VALUES (1, "GPI", null);
INSERT INTO modules (id_mod, nom_mod, description) VALUES (2, "Android", null);
INSERT INTO modules (id_mod, nom_mod, description) VALUES (3, "Législation et déontologie de travail", null);
INSERT INTO modules (id_mod, nom_mod, description) VALUES (4, "Technique d'expression et de la rédaction scientifique", null);
INSERT INTO modules (id_mod, nom_mod, description) VALUES (5, "XML Avancé et Web 2.0", null);
INSERT INTO modules (id_mod, nom_mod, description) VALUES (6, "Maintenance logicielle", null);
INSERT INTO modules (id_mod, nom_mod, description) VALUES (7, "Anglais", null);

INSERT INTO salles (id_salle, nom_salle, description) VALUES (1, "1", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (2, "2", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (3, "3", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (4, "4", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (5, "5", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (6, "6", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (7, "7", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (8, "8", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (9, "9", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (10, "10", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (11, "11", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (12, "12", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (13, "13", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (14, "14", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (15, "15", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (16, "Amphi A", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (17, "Amphi B", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (18, "Amphi C", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (19, "Labo 1", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (20, "Labo 2", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (21, "Labo 3", null);
INSERT INTO salles (id_salle, nom_salle, description) VALUES (22, "Labo 4", null);

INSERT INTO enseignant (id_ens, nom_ens, tel) VALUES (1, "KHAROUBI Sahraoui", null);
INSERT INTO enseignant (id_ens, nom_ens, tel) VALUES (2, "BOUCHENTOUF Khaled", null);
INSERT INTO enseignant (id_ens, nom_ens, tel) VALUES (3, "MEGHAZI Hadj Madani", null);
INSERT INTO enseignant (id_ens, nom_ens, tel) VALUES (4, "OUARED Abdelakder", "0550178644");
INSERT INTO enseignant (id_ens, nom_ens, tel) VALUES (5, "DJAAFRI Laouni", null);
INSERT INTO enseignant (id_ens, nom_ens, tel) VALUES (6, "LAKMECHE Zouaoui", null);
INSERT INTO enseignant (id_ens, nom_ens, tel) VALUES (7, "CHADLI A.Hafid", null);

INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (1, 1, 1, 9, 1, "Lundi", "11:00:00", "12:30:00");
INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (2, 1, 2, 11, 3, "Lundi", "15:30:00", "17:00:00");
INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (3, 1, 3, 9, 2, "Mardi", "08:00:00", "09:30:00");
INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (4, 1, 3, 9, 2, "Mardi", "09:30:00", "11:00:00");
INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (5, 1, 3, 9, 2, "Mardi", "11:00:00", "12:30:00");
INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (6, 1, 1, 11, 1, "Mardi", "14:00:00", "15:30:00");
INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (7, 1, 4, 16, 4, "Mardi", "15:30:00", "17:00:00");
INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (8, 1, 5, 15, 5, "Mercredi", "08:00:00", "09:30:00");
INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (9, 1, 6, 18, 7, "Mercredi", "09:30:00", "11:00:00");
INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (10, 1, 5, 9, 5, "Mercredi", "12:30:00", "14:00:00");
INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (11, 1, 5, 9, 5, "Mercredi", "14:00:00", "15:30:00");
INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (12, 1, 7, 10, 6, "Jeudi", "08:00:00", "09:30:00");
INSERT INTO cours (id_cours, id_promo, id_ens, id_salle, id_mod, jour, heure_debut, heure_fin) VALUES (13, 1, 7, 10, 6, "Jeudi", "09:30:00", "11:00:00");

INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (1, "ZEGAI", "Houari", "Cité Sidi Khaled N94 Tiaret");
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (2, "BENCHOUHRA", "Anoir", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (3, "CHARFAOUI", "Younes", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (4, "BOURAS", "Mohamed Amine", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (5, "AYAD", "Toufik", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (6, "MADENE", "Malika", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (7, "NADJEM", "Nour Imen", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (8, "DAICH", "Hichem", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (9, "ZERROUKI", "Sofiane", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (10, "MAKBOUL", "Ilyes", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (11, "BENAYDEBI", "Benyoucef", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (12, "LANOUAR", "Miloud", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (13, "BENAYADA", "Yasmine", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (14, "ZIDANE", "Souhila", null);
INSERT INTO etudiant (num_et,nom_et,prenom_et,adresse) VALUES (15, "CHAHB AYN", "Walaa", null);