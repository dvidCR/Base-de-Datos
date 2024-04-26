# DROP DATABASE municipio;
CREATE DATABASE IF NOT EXISTS municipio;

USE municipio;

CREATE TABLE municipio(
	id_municipio INT AUTO_INCREMENT,
    zona VARCHAR(20),
    nombre VARCHAR(20),
    PRIMARY KEY(id_municipio)
);

CREATE TABLE vivienda(
	id_vivienda INT AUTO_INCREMENT,
    tamaño VARCHAR(10),
    direccion VARCHAR(30),
    codigo_postal VARCHAR(20),
    habitaciones VARCHAR(20),
    fk_id_municipio INT NOT NULL,
    PRIMARY KEY(id_vivienda),
    FOREIGN KEY(fk_id_municipio) REFERENCES municipio(id_municipio)
);

CREATE TABLE persona(
	dni CHAR(9),
    nombre VARCHAR(20),
    apellidos VARCHAR(40),
    fk_cabeza_familia CHAR(9),
    PRIMARY KEY(dni)
);

CREATE TABLE cabeza_familia(
	dni CHAR(9),
    cabeza_familia VARCHAR(20),
    PRIMARY KEY(dni)
);

CREATE TABLE propietario(
	id INT AUTO_INCREMENT,
    fk_id_vivienda INT NOT NULL,
    fk_dni_persona CHAR(9),
    PRIMARY KEY(id),
    FOREIGN KEY(fk_id_vivienda) REFERENCES vivienda(id_vivienda),
    FOREIGN KEY(fk_dni_persona) REFERENCES persona(dni)
);

ALTER TABLE vivienda ADD 
FOREIGN KEY(fk_dni_persona) REFERENCES persona(dni);