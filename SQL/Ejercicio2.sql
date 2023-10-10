CREATE DATABASE Ejercicio2;

USE Ejercicio2;

CREATE TABLE provincias(
	cod_provincia VARCHAR(30),
    nombre VARCHAR(30),
    PRIMARY KEY(cod_provincia)
);

CREATE TABLE paquetes(
	cod_paquete VARCHAR(10),
    descripcion VARCHAR(100),
    destinatario VARCHAR(100),
    direccion VARCHAR(100),
    cod_provincia VARCHAR(30),
    PRIMARY KEY(cod_paquete),
    FOREIGN KEY(cod_provincia) REFERENCES provincias(cod_provincia)
);

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

CREATE TABLE camiones(
	matricula VARCHAR(20),
    modelo VARCHAR(30),
    tipo VARCHAR(20),
    potencia VARCHAR(20),
    PRIMARY KEY(matricula)
);

CREATE TABLE camiones_camioneros(
	matricula VARCHAR(20),
    DNI CHAR(9),
    fecha DATE,
    FOREIGN KEY(matricula) REFERENCES camiones(matricula),
    FOREIGN KEY(DNI) REFERENCES camioneros(DNI)
);