#DROP DATABASE Ejercicio6;
CREATE DATABASE Ejercicio6;

USE Ejercicio6;

CREATE TABLE Tipos_Pago(
	ID INT AUTO_INCREMENT,
    descripcion VARCHAR(100) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE Colaboradores(
	ID INT AUTO_INCREMENT,
    NIF CHAR(9) UNIQUE NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    domicilio VARCHAR(50),
    telefono VARCHAR(15) NOT NULL,
    banco VARCHAR(30),
    IBAN CHAR(20) NOT NULL,
    descripcion VARCHAR(100),
    PRIMARY KEY(ID)
);

CREATE TABLE Pagos(
	ID INT AUTO_INCREMENT,
    concepto VARCHAR(100),
    cantidad FLOAT NOT NULL,
    fecha DATE NOT NULL,
    descripcion VARCHAR(100),
    FK_ID_Tipos_Pago INT NOT NULL,
    FK_ID_Colaboradores INT NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(FK_ID_Tipos_Pago) REFERENCES Tipos_Pago(ID),
    FOREIGN KEY(FK_ID_Colaboradores) REFERENCES Colaboradores(ID)
);

CREATE TABLE Clientes(
	ID INT AUTO_INCREMENT,
    telefono VARCHAR(15) NOT NULL,
    domicilio VARCHAR(50),
    razon_social VARCHAR(100) NOT NULL,
    PRIMARY KEY(ID)
);


CREATE TABLE Proyectos(
	ID INT AUTO_INCREMENT,
    concepto VARCHAR(100) NOT NULL,
    cuantia FLOAT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    descripcion VARCHAR(100),
    FK_ID_Clientes INT NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(FK_ID_Clientes) REFERENCES Clientes(ID)
);

CREATE TABLE Colaboladores_Proyectos(
	ID INT AUTO_INCREMENT,
	FK_ID_Colaboradores INT NOT NULL,
    FK_ID_Proyectos INT NOT NULL,
    PRIMARY KEY(ID),
	FOREIGN KEY(FK_ID_Colaboradores) REFERENCES Colaboradores(ID),
    FOREIGN KEY(FK_ID_Proyectos) REFERENCES Proyectos(ID)
);