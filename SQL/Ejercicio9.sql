#DROP DATABASE Ejercicio9;
CREATE DATABASE Ejercicio9;

USE Ejercicio9;

CREATE TABLE Escalas(
	ID INT AUTO_INCREMENT NOT NULL,
    Salida_sin_Bajas INT(200) NOT NULL,
    Salida_sin_Altas INT(200) NOT NULL,
    Llegada_sin_Bajas INT(200) NOT NULL,
    Llegada_sin_Altas INT(200) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE Registro_Vuelo(
	ID INT AUTO_INCREMENT NOT NULL,
    Plazas_Vacias INT(200),
    Modelo VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    FK_ID_Escalas INT NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(FK_ID_Escalas) REFERENCES Escalas(ID)
);

CREATE TABLE Pistas(
	ID INT AUTO_INCREMENT NOT NULL,
    Despegue INT(100) NOT NULL,
    Aterrizaje INT(100) NOT NULL,
    FK_ID_Registro_Vuelo INT NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(FK_ID_Registro_Vuelo) REFERENCES Registro_Vuelo(ID)
);

CREATE TABLE Programa_Vuelo(
	Num_Vuelo INT AUTO_INCREMENT NOT NULL,
    Linea_Aerea VARCHAR(20) NOT NULL,
    Tiempo VARCHAR(25),
    FK_ID_Pistas INT NOT NULL,
    PRIMARY KEY(Num_Vuelo),
    FOREIGN KEY(FK_ID_Pistas) REFERENCES Pistas(ID)
);

CREATE TABLE Aeropuerto(
	ID INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(50),
    Ciudad VARCHAR(20),
    Pais VARCHAR(20),
    Codigo VARCHAR(10) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE Aeropuerto_Programa_Vuelo(
	FK_ID_Aeropuerto INT NOT NULL,
    FK_Num_Vuelo_Programa_Vuelo INT NOT NULL,
    FOREIGN KEY(FK_ID_Aeropuerto) REFERENCES Aeropuerto(ID),
    FOREIGN KEY(FK_Num_Vuelo_Programa_Vuelo) REFERENCES Programa_Vuelo(Num_Vuelo)
);

CREATE TABLE Plazas(
	ID INT AUTO_INCREMENT NOT NULL,
    Modelo_Avion VARCHAR(20),
    Num_Plazas INT(15),
    FK_ID_Aeropuerto INT NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(FK_ID_Aeropuerto) REFERENCES Aeropuerto(ID)
);