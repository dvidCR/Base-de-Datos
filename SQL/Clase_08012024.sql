#DROP DATABASE Veterinario;
CREATE DATABASE Veterinario;

USE Veterinario;

CREATE TABLE vets(
	id INT AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO vets (id, first_name, last_name) VALUES
(NULL, "Paco", "Alvarez"),
(NULL, "Roberto", "Lopez"),
(NULL, "Gabriela", "Lopez"),
(NULL, "Armando", "Paredes"),
(NULL, "Armando", "Casas");

CREATE TABLE specialities(
	id INT AUTO_INCREMENT,
    name VARCHAR(80) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO specialities (id, name) VALUES
(NULL, "Veterinaria de emergencia"),
(NULL, "Anestesista"),
(NULL, "Odontólogo"),
(NULL, "Peluquero"),
(NULL, "Auxiliar");

CREATE TABLE vets_specialities(
	id_vet INT NOT NULL,
    id_specialitie INT NOT NULL,
    FOREIGN KEY (id_vet) REFERENCES vets(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_specialitie) REFERENCES specialities(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO vets_specialities (id_vet, id_specialitie) VALUES
(1, 3),
(2, 5),
(3, 1),
(4, 2),
(1, 4);

CREATE TABLE owners(
	id INT AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(80),
    telephone VARCHAR(20) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO owners (id, first_name, last_name, address, city, telephone) VALUES
(NULL, "Marta", "Rodriguez", NULL, "Pinto", "+34 658741777"),
(NULL, "Aitor", "Tilla", NULL, NULL, "+34 658741778"),
(NULL, "Dolres", "Martinez", "C/De las Esperides, 4", "Valdemoro", "+34 658741747"),
(NULL, "Francisco", "Gutierrez", "C/Libertad, 15", "Pinto", "+34 658741788"),
(NULL, "Dolores", "Ramos", NULL, NULL, "+34 658741456");

CREATE TABLE types(
	id INT AUTO_INCREMENT,
    name VARCHAR(80) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO types (id, name) VALUES
(NULL, "Dog - Golden Retriver"),
(NULL, "Dog - Podenco"),
(NULL, "Dog - Pitbull"),
(NULL, "Kitten - Orange"),
(NULL, "Kitten - Half black Half White");

CREATE TABLE pets(
	id INT AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    type_id INT NOT NULL,
    owner_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(type_id) REFERENCES types(id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY(owner_id) REFERENCES owners(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO pets (id, name, birth_date, type_id, owner_id) VALUES
(NULL, "Trasto", "2010/04/08", 1, 1),
(NULL, "Manolo", "2015/10/10", 2, 2),
(NULL, "Devorador de mundos", "2016/04/08", 3, 3),
(NULL, "Princesa", "2016/03/08", 3, 4),
(NULL, "Wilson", "2007/12/28", 4, 5),
(NULL, "Mie", "2019/01/25", 5, 5);

CREATE TABLE users(
	username VARCHAR(30) NOT NULL,
    password VARCHAR(20) NOT NULL,
    enabled boolean NOT NULL,
    PRIMARY KEY(username)
);

INSERT INTO users (username, password, enabled) VALUES
("marta.rodriguez1234", 1234, 1),
("aitortilla_de_patatas", "tortillaconcebolla1", 1),
("dolores.martinez1985", 10121985, 1),
("fran.guti2000", 01012000, 0),
("dolores.ramos555", "~543122ñdFls0?", 1);

CREATE TABLE roles(
	id INT AUTO_INCREMENT,
    role VARCHAR(20),
    username VARCHAR(30) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(username) REFERENCES users(username) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO roles (id, role, username) VALUES
(NULL, NULL, "marta.rodriguez1234"),
(NULL, "Mayor", "aitortilla_de_patatas"),
(NULL, "Animal Agresivo", "dolores.martinez1985"),
(NULL, "Donador", "fran.guti2000"),
(NULL, "Mayor", "dolores.ramos555");

SELECT * FROM vets;
SELECT * FROM specialities;
SELECT * FROM vets_specialities;
SELECT * FROM owners;
SELECT * FROM types;
SELECT * FROM pets;
SELECT * FROM users;
SELECT * FROM roles;