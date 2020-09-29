DROP DATABASE  IF EXISTS dbmonuments_lignes;
create database dbmonuments_lignes;


create table station
(id_station           int(5) not null,	
    nom_station       varchar (250) not null,
	primary         key (id_station)
)ENGINE=INNODB;


create table ligne_metro
(id_ligne           int(5)  not null,
    ligne 	        int(2) not null,
    nom_ligne       varchar (250) not null,
	primary         key (id_ligne)	
)ENGINE=INNODB;


create table type_monument
(id_type          int(5)  not null,
    nom_type       varchar (250) not null,
	primary         key (id_type)	
)ENGINE=INNODB;


create table monument
(   id_monument 	int(5)  not null,
    nom			    varchar(250) not null,
    adresse		    varchar(250) not null,
    Arrondissement  int(2) not null,
    primary         key (id_monument),
    id_type         int(5) not null,    
    foreign key (id_type)references type_monument(id_type)
)ENGINE=INNODB;


create table desservir_monument
(   id_desservir_monuments	  int(5)  not null,
    id_monument       int(5) not null,
    foreign key (id_monument) references monument(id_monument),
    id_station          int(5) not null,
    foreign key (id_station) references station(id_station)
    
)ENGINE=INNODB;

create table avoir_ligne_station
(   id_avoir_ligne_station	  int(5)  not null,
    id_ligne      int(5) not null,
    foreign key (id_ligne) references ligne_metro(id_ligne),
    id_station          int(5) not null,
    foreign key (id_station) references station(id_station)
    
)ENGINE=INNODB;
