# DROP DATABASE metro;
CREATE DATABASE IF NOT EXISTS metro;

USE metro;

CREATE TABLE cochera (
	id_cochera INT AUTO_INCREMENT,
    capacidad_max INT NOT NULL,
    num_cochera INT NOT NULL,
    PRIMARY KEY (id_cochera)
);

CREATE TABLE linea(
	num_linea INT AUTO_INCREMENT,
    color VARCHAR(10) NOT NULL,
    destino VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_linea)
);

CREATE TABLE tren (
	id_tren INT AUTO_INCREMENT,
    capacidad INT NOT NULL,
    matricula CHAR(8) NOT NULL,
    fk_id_cochera INT NOT NULL,
    fk_num_liena INT NOT NULL,
    PRIMARY KEY (id_tren),
    FOREIGN KEY (fk_id_cochera) REFERENCES cochera(id_cochera) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fk_num_liena) REFERENCES linea(num_linea) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE estacion (
	id_estacion INT AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    calle VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_estacion)
);

CREATE TABLE linea_estacion (
	id_tren INT AUTO_INCREMENT,
    fk_num_linea INT NOT NULL,
    fk_id_estacion INT NOT NULL,
    PRIMARY KEY (id_tren),
    FOREIGN KEY (fk_num_linea) REFERENCES linea(num_linea) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (fk_id_estacion) REFERENCES estacion(id_estacion) ON UPDATE CASCADE ON DELETE NO ACTION
);