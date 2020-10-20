drop database if exists Librairie;

CREATE DATABASE IF NOT EXISTS Librairie;

USE Librairie;

DROP TABLE IF EXISTS editeur ;
CREATE TABLE editeur (
id_editeur INT(3) AUTO_INCREMENT primary key NOT NULL,
Nom_editeur VARCHAR(50)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS livres ;
CREATE TABLE livres (
id_livres INT(3) AUTO_INCREMENT primary key NOT NULL,
titre_livres VARCHAR(50),
sous_titre_livres VARCHAR(100),
annee_de_sortie_livres YEAR,
resume_livres TEXT,
ISBN_livres INT(13),
Prix_livres DECIMAL,
image_livres BLOB,
id_editeur int(3),
id_theme int(3)
) ENGINE=InnoDB;



DROP TABLE IF EXISTS auteur ;
CREATE TABLE auteur (
id_auteur INT(3) AUTO_INCREMENT PRIMARY KEY  NOT NULL,
Nom_auteur VARCHAR(30)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS client ;
CREATE TABLE client (
id_client INT(3) AUTO_INCREMENT PRIMARY KEY NOT NULL,
Nom_client VARCHAR(30),
Prenom_client VARCHAR(30),
date_de_naissance_client DATE,
adresse_client VARCHAR(50),
ville_client VARCHAR(30),
code_postal_client INT(5),
email_client VARCHAR(50),
telephone_client INT(10)
) ENGINE=InnoDB;

insert into client(Nom_client,Prenom_client,date_de_naissance_client,adresse_client,ville_client,code_postal_client,email_client,telephone_client) 
VALUES
( doe, john, 2000/06/14, 1 rue moufetard, Paris, 75009, john@doe.com, 06548978544),
( smith, john, 2001/06/14, 3 rue moufetard, Paris, 75009, smith@.com, 06545696124),
( bush, john, 1998/06/14, 5 rue moufetard, Paris, 75009, bush@doe.com, 06548968524),
( obama, john, 1999/06/14, 9 rue rivoli, Paris, 75006, obama@doe.com, 06548956124),
( leopold, john, 1997/06/14, 12 rue moufetard, toulouse, 31200 leopold@doe.com, 06548956124),
( suarez, john, 2002/06/14, 40 rue pantin, marseille, 13005, suarez@doe.com, 06548956124),
( cavani, john, 2003/06/14, 1 rue paris, Paris, 75018, cavani@doe.com, 06548956698),
( neymar, john, 2004/06/14, 1 rue lille, Paris, 75017, neymar@doe.com, 06425956124),
( robert, john, 1995/06/14, 1 rue de lyon, Paris, 75012, robert@doe.com, 06548566124),


DROP TABLE IF EXISTS theme ;
CREATE TABLE theme (id_theme INT(3) AUTO_INCREMENT PRIMARY KEY NOT NULL,
Genre_theme VARCHAR(30)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS utilisateur ;
CREATE TABLE utilisateur (id_utilisateur INT(3) AUTO_INCREMENT PRIMARY KEY NOT NULL,
admin_utilisateur VARCHAR(50),
client_utilisateur VARCHAR(50)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Rediger ;
CREATE TABLE Rediger (
id_auteur int(3) AUTO_INCREMENT NOT NULL,
id_livres int(3) NOT NULL,
PRIMARY KEY (id_auteur,id_livres)
 ) ENGINE=InnoDB;

DROP TABLE IF EXISTS commander ;
CREATE TABLE commander (
id_livres int(3) NOT NULL,
id_client int(3) NOT NULL,
PRIMARY KEY (id_livres,id_client)
) ENGINE=InnoDB;

ALTER TABLE livres ADD CONSTRAINT FK_livres_id_editeur FOREIGN KEY (id_editeur) REFERENCES editeur (id_editeur);

ALTER TABLE livres ADD CONSTRAINT FK_livres_id_theme FOREIGN KEY (id_theme) REFERENCES theme (id_theme);
ALTER TABLE Rediger ADD CONSTRAINT FK_Rediger_id_auteur FOREIGN KEY (id_auteur) REFERENCES auteur (id_auteur);
ALTER TABLE Rediger ADD CONSTRAINT FK_Rediger_id_livres FOREIGN KEY (id_livres) REFERENCES livres (id_livres);
ALTER TABLE commander ADD CONSTRAINT FK_commander_id_livres FOREIGN KEY (id_livres) REFERENCES livres (id_livres);
ALTER TABLE commander ADD CONSTRAINT FK_commander_id_client FOREIGN KEY (id_client) REFERENCES client (id_client);
