#DROP DATABASE Ejercicio2;
CREATE DATABASE Ejercicio2;

USE Ejercicio2;

CREATE TABLE provincias(
	cod_provincia VARCHAR(30),
    nombre VARCHAR(30),
    PRIMARY KEY(cod_provincia)
);

INSERT INTO provincias VALUES
(1, "Ciudad Real"),
(2, "León"),
(3, "Soria"),
(4, "Cantabria"),
(5, "Castelllón");

SELECT * FROM provincias;

CREATE TABLE paquetes(
	cod_paquete VARCHAR(10),
    descripcion VARCHAR(100),
    destinatario VARCHAR(100),
    direccion VARCHAR(100),
    cod_provincia VARCHAR(30),
    PRIMARY KEY(cod_paquete),
    FOREIGN KEY(cod_provincia) REFERENCES provincias(cod_provincia)
);

INSERT INTO paquetes VALUES
(1, "Cascos", "Mario", "C/ Hola Nº1", 1),
(2, "Papel Higienico", "Mario", "C/ Hola Nº2", 2),
(3, "Portatil", "Angel", "C/ Hola Nº3", 3),
(4, "Cojin", "Dario", "C/ Hola Nº4", 4),
(5, "ratón", "David", "C/ Hola Nº5", 5);

SELECT * FROM paquetes;

CREATE TABLE camioneros(
	DNI CHAR(9),
    nombre VARCHAR(200),
    telefono VARCHAR(15),
    direccion VARCHAR(200),
    salario FLOAT,
    poblacion VARCHAR(30),
    cod_paquete VARCHAR(10),
    PRIMARY KEY(DNI),
    FOREIGN KEY(cod_paquete) REFERENCES paquetes(cod_paquete)
);

INSERT INTO camioneros VALUES
("11111111A", "Paco", "+34 666666661", "C/ Hola Nº6", 1135, "Ciudad Real", 1),
("11111111B", "Juan", "+34 666666662", "C/ Hola Nº7", 1135, "León", 2),
("11111111C", "Esteban", "+34 666666663", "C/ Hola Nº8", 1135, "Soria", 3),
("11111111D", "Pancracio", "+34 666666664", "C/ Hola Nº9", 1135, "Cantabria", 4),
("11111111E", "Teojildo", "+34 666666665", "C/ Hola Nº10", 1135, "Castellon", 5);

SELECT * FROM camioneros;

CREATE TABLE camiones(
	matricula VARCHAR(20),
    modelo VARCHAR(30),
    tipo VARCHAR(20),
    potencia VARCHAR(20),
    PRIMARY KEY(matricula)
);

INSERT INTO camiones VALUES
("54321A", "Mercedes", "TGX", "135cv"),
("54321B", "MAN", "TGS", "135cv"),
("54321C", "Mercedes", "TGM", "135cv"),
("54321D", "MAN", "TGL", "135cv"),
("54321E", "Mercedes", "TGE", "135cv");

SELECT * FROM camiones;

CREATE TABLE camiones_camioneros(
	matricula VARCHAR(20),
    DNI CHAR(9),
    fecha DATE,
    FOREIGN KEY(matricula) REFERENCES camiones(matricula),
    FOREIGN KEY(DNI) REFERENCES camioneros(DNI)
);

INSERT INTO camiones_camioneros VALUES
("54321A", "11111111A", "2023-10-05"),
("54321B", "11111111B", "2023-10-06"),
("54321C", "11111111C", "2023-10-05"),
("54321D", "11111111D", "2023-10-05"),
("54321E", "11111111E", "2023-10-06");

SELECT * FROM camiones_camioneros;