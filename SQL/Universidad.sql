/*
departamentos(pk:departamento, fk:facultad, fk:id_biblioteca)
biblioteca(pk:id_biblioteca)
facultad(pk:facultad)
interfacultativo(fk:departamento, fk:facultad)
catedras(pk:catedra, fk:departamento, fk:facultad)
profesor(pk:dni, nombre, apellido1, apellido2, fk:departamento)
adscrito(fecha_inscripcion, fk:profesor, fk:catedra)
*/

# DROP DATABASE universidad;
CREATE DATABASE IF NOT EXISTS universidad;

USE universidad;

CREATE TABLE departamentos(
	departamento VARCHAR(20) PRIMARY KEY NOT NULL,
    facultad VARCHAR(20) NOT NULL,
    id_biblioteca INT NOT NULL
);

CREATE TABLE biblioteca(
	id_biblioteca INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE facultad(
	facultad VARCHAR(20) PRIMARY KEY NOT NULL
);

CREATE TABLE interfacultativo(
	departamento VARCHAR(20),
	facultad VARCHAR(20),
    FOREIGN KEY(departamento) REFERENCES departamentos(departamento),
    FOREIGN KEY(facultad) REFERENCES facultad(facultad)
);

CREATE TABLE catedras(
	catedra VARCHAR(20) PRIMARY KEY NOT NULL,
	departamento VARCHAR(20),
    facultad VARCHAR(20) NOT NULL,
    FOREIGN KEY(departamento) REFERENCES departamentos(departamento),
    FOREIGN KEY(facultad) REFERENCES facultad(facultad)
);

CREATE TABLE profesor(
	dni CHAR(9) PRIMARY KEY,
    nombre VARCHAR(20),
    apellido1 VARCHAR(20),
    apellido2 VARCHAR(20),
    departamento VARCHAR(20) NOT NULL,
    FOREIGN KEY(departamento) REFERENCES departamentos(departamento) ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE adscrito(
	fecha_inscripcion DATE,
    profesor CHAR(9) NOT NULL,
    catedra VARCHAR(20) NOT NULL,
    FOREIGN KEY(profesor) REFERENCES profesor(dni),
    FOREIGN KEY(catedra) REFERENCES catedras(catedra)
);

ALTER TABLE departamentos ADD
FOREIGN KEY(facultad) REFERENCES facultad(facultad);

ALTER TABLE departamentos ADD
FOREIGN KEY(id_biblioteca) REFERENCES biblioteca(id_biblioteca);

INSERT INTO departamentos VALUES("Historia", "Historia", 1);
INSERT INTO departamentos VALUES("Matematicas", "Matematicas", 2);
INSERT INTO departamentos VALUES("Informatica", "Informatica", 3);
INSERT INTO departamentos VALUES("Ingenieria", "Ingeieria", 4);
INSERT INTO departamentos VALUES("Matematicas", "Ingenieria", 2);
INSERT INTO departamentos VALUES("Fisica", "Fisica", 5);
INSERT INTO departamentos VALUES("Cocina", "Cocina", 6);
INSERT INTO departamentos VALUES("Psicologia", "Psicologia", 7);
INSERT INTO departamentos VALUES("Filosofia", "Filosofia", 8);
INSERT INTO departamentos VALUES("Filologia", "Historia", 1);
INSERT INTO departamentos VALUES("Literatura", "Literatura", 11);

INSERT INTO biblioteca VALUES();
INSERT INTO biblioteca VALUES();
INSERT INTO biblioteca VALUES();
INSERT INTO biblioteca VALUES();
INSERT INTO biblioteca VALUES();
INSERT INTO biblioteca VALUES();
INSERT INTO biblioteca VALUES();
INSERT INTO biblioteca VALUES();
INSERT INTO biblioteca VALUES();
INSERT INTO biblioteca VALUES();
INSERT INTO biblioteca VALUES();

INSERT INTO facultad VALUES("Historia");
INSERT INTO facultad VALUES("Matematicas");
INSERT INTO facultad VALUES("Informatica");
INSERT INTO facultad VALUES("Ingeieria");
INSERT INTO facultad VALUES("Fisica");
INSERT INTO facultad VALUES("Cocina");
INSERT INTO facultad VALUES("Psicologia");
INSERT INTO facultad VALUES("Filosofia");
INSERT INTO facultad VALUES("Filologia");
INSERT INTO facultad VALUES("Literatura");

INSERT INTO interfacultativo VALUES("Matematicas", "Matematicas");
INSERT INTO interfacultativo VALUES("Matematicas", "Ingenieria");
INSERT INTO interfacultativo VALUES("Historia", "Historia");
INSERT INTO interfacultativo VALUES("Filologia", "Historia");

INSERT INTO catedras VALUES("Historia", 1, 1);
INSERT INTO catedras VALUES("Matematicas", 2, 2);
INSERT INTO catedras VALUES("Informatica", 3, 3);
INSERT INTO catedras VALUES("Ingeieria", 4, 4);
INSERT INTO catedras VALUES("Fisica", 5, 6);
INSERT INTO catedras VALUES("Cocina", 6, 7);
INSERT INTO catedras VALUES("Psicologia", 7, 8);
INSERT INTO catedras VALUES("Filosofia", 8, 9);
INSERT INTO catedras VALUES("Filologia", 9, 10);
INSERT INTO catedras VALUES("Literatura", 10);

INSERT INTO profesor VALUES("00000078B", "Mario", "Sierra", "Polo", "Historia");
INSERT INTO profesor VALUES("00000178C", "Dario", "Mira", "Vacas", "Ingenieria");
INSERT INTO profesor VALUES("00005178X", "Angel", "Rojo", "Blanco", "Psicologia");
INSERT INTO profesor VALUES("00905178Z", "Daniel", "Zapato", "Sanchez", "Filosofia");
INSERT INTO profesor VALUES("00935178P", "David", "Gutierrez", "Lopez", "Literatura");
INSERT INTO profesor VALUES("07935178Q", "Jorge", "Puerto", "Gaspar", "Informatica");
INSERT INTO profesor VALUES("87935178D", "Alfonso", "Lopez", "Rodriguez", "Matematicas");
INSERT INTO profesor VALUES("87995178X", "Maria", "Hernandez", "Jimenez", "Filosofia");
INSERT INTO profesor VALUES("66695178X", "Aitor", "Hassan", "Mohamed", "Filologia");
INSERT INTO profesor VALUES("87952278L", "Victor", "Cano", "Lopez", "Fisica");
INSERT INTO profesor VALUES("87952278L", "Marta", "Martinez", "Mano", "Cocina");

INSERT INTO adscrito VALUES("05/12/2001", "66695178X", "Historia");
INSERT INTO adscrito VALUES("02/03/1995", "66695178X", "Filologia");
INSERT INTO adscrito VALUES("12/01/1996", "87935178D", "Matematicas");
INSERT INTO adscrito VALUES("12/01/1996", "87935178D", "Ingenieria");
INSERT INTO adscrito VALUES();
INSERT INTO adscrito VALUES();
INSERT INTO adscrito VALUES();
INSERT INTO adscrito VALUES();
INSERT INTO adscrito VALUES();
INSERT INTO adscrito VALUES();