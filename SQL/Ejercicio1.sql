CREATE DATABASE Ejercicio1;

USE Ejercicio1;

CREATE TABLE proveedores(
	NIF CHAR(9),
    nombre VARCHAR(200),
    direccion VARCHAR(300),
    PRIMARY KEY(NIF)
);

CREATE TABLE productos(
	codigo INT AUTO_INCREMENT,
    nombre VARCHAR(200),
    precio FLOAT,
    NIF CHAR(9),
    PRIMARY KEY(codigo),
    FOREIGN KEY(NIF) REFERENCES proveedores(NIF)
);

CREATE TABLE clientes(
	nombre VARCHAR(100),
    apellidos VARCHAR(100),
    DNI CHAR(9),
    direccion VARCHAR(200),
    fecha_de_nacimiento DATE,
    PRIMARY KEY(DNI)
);

CREATE TABLE porductos_clientes(
	ID INT AUTO_INCREMENT,
    codigo INT,
    DNI CHAR(9),
    PRIMARY KEY(ID),
    FOREIGN KEY(DNI) REFERENCES clientes(DNI)
);