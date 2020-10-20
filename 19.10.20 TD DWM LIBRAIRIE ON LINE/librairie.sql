DROP TABLE IF EXISTS editeur ;
CREATE TABLE editeur (id_editeur INT(3) AUTO_INCREMENT NOT NULL,
Nom_editeur VARCHAR(50),
PRIMARY KEY (id_editeur)) ENGINE=InnoDB;

DROP TABLE IF EXISTS livres ;
CREATE TABLE livres (id_livres INT(3) AUTO_INCREMENT NOT NULL,
titre_livres VARCHAR(50),
sous_titre_livres VARCHAR(100),
annee_de_sortie_livres YEAR,
resume_livres TEXT,
ISBN_livres INT(13),
Prix_livres DECIMAL,
image_livres BLOB,
id_editeur **NOT FOUND**(3),
id_theme **NOT FOUND**(3),
PRIMARY KEY (id_livres)) ENGINE=InnoDB;

DROP TABLE IF EXISTS auteur ;
CREATE TABLE auteur (id_auteur INT(3) AUTO_INCREMENT NOT NULL,
Nom_auteur VARCHAR(30),
Prenom_auteur VARCHAR(30),
PRIMARY KEY (id_auteur)) ENGINE=InnoDB;

DROP TABLE IF EXISTS client ;
CREATE TABLE client (id_client INT(3) AUTO_INCREMENT NOT NULL,
Nom_client VARCHAR(30),
Prenom_client VARCHAR(30),
date_de_naissance_client DATE,
adresse_client VARCHAR(50),
ville_client VARCHAR(30),
code_postal_client INT(5),
email_client VARCHAR(50),
telephone_client INT(10),
PRIMARY KEY (id_client)) ENGINE=InnoDB;

DROP TABLE IF EXISTS theme ;
CREATE TABLE theme (id_theme INT(3) AUTO_INCREMENT NOT NULL,
Genre_theme VARCHAR(30),
PRIMARY KEY (id_theme)) ENGINE=InnoDB;

DROP TABLE IF EXISTS utilisateur ;
CREATE TABLE utilisateur (id_utilisateur INT(3) AUTO_INCREMENT NOT NULL,
admin_utilisateur VARCHAR(50),
client_utilisateur VARCHAR(50),
PRIMARY KEY (id_utilisateur)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Rediger ;
CREATE TABLE Rediger (id_auteur **NOT FOUND**(3) AUTO_INCREMENT NOT NULL,
id_livres **NOT FOUND**(3) NOT NULL,
PRIMARY KEY (id_auteur,
 id_livres)) ENGINE=InnoDB;

DROP TABLE IF EXISTS commander ;
CREATE TABLE commander (id_livres **NOT FOUND**(3) AUTO_INCREMENT NOT NULL,
id_client **NOT FOUND**(3) NOT NULL,
PRIMARY KEY (id_livres,
 id_client)) ENGINE=InnoDB;

ALTER TABLE livres ADD CONSTRAINT FK_livres_id_editeur FOREIGN KEY (id_editeur) REFERENCES editeur (id_editeur);

ALTER TABLE livres ADD CONSTRAINT FK_livres_id_theme FOREIGN KEY (id_theme) REFERENCES theme (id_theme);
ALTER TABLE Rediger ADD CONSTRAINT FK_Rediger_id_auteur FOREIGN KEY (id_auteur) REFERENCES auteur (id_auteur);
ALTER TABLE Rediger ADD CONSTRAINT FK_Rediger_id_livres FOREIGN KEY (id_livres) REFERENCES livres (id_livres);
ALTER TABLE commander ADD CONSTRAINT FK_commander_id_livres FOREIGN KEY (id_livres) REFERENCES livres (id_livres);
ALTER TABLE commander ADD CONSTRAINT FK_commander_id_client FOREIGN KEY (id_client) REFERENCES client (id_client);
