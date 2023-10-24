#DROP DATABASE Ejercicio9;
CREATE DATABASE Ejercicio9;

USE Ejercicio9;

CREATE TABLE Aviones(
	id INT AUTO_INCREMENT,
    modelo VARCHAR(100) NOT NULL,
    capacidad INT,
    PRIMARY KEY(id)
);

INSERT INTO Aviones VALUES(NULL,"Boeing747", NULL);
INSERT INTO Aviones VALUES(NULL,"Boeing747", 568);
SELECT * FROM Aviones;
UPDATE Aviones SET modelo = "Boeing737" WHERE id = 2;

CREATE TABLE Aeropuertos(
	id INT AUTO_INCREMENT,
    codigo VARCHAR(4),
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    PRIMARY KEY(id)
);

INSERT INTO Aeropuertos VALUES(NULL, NULL, NULL, NULL, NULL);
INSERT INTO Aeropuertos VALUES(NULL, "MAD", "BARAJAS", "MADRID", "ESPAÑA");
SELECT * FROM Aeropuertos;
UPDATE Aeropuertos SET pais = "ENGLAND" WHERE id = 2;
UPDATE Aeropuertos SET nombre = "LUTON" WHERE id = 2;
UPDATE Aeropuertos SET ciudad = "LONDON" WHERE id = 2;
UPDATE Aeropuertos SET codigo = "LON" WHERE id = 2;


CREATE TABLE Aviones_Aeropuertos(
	id INT AUTO_INCREMENT,
    fk_id_avion INT NOT NULL,
    fk_id_aeropuertos INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_id_avion) REFERENCES Aviones(id) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY(fk_id_aeropuertos) REFERENCES Aeropuertos(id) ON UPDATE CASCADE ON DELETE NO ACTION
);

INSERT INTO Aviones_Aeropuertos VALUES(NULL,2,2);
SELECT * FROM Aviones_Aeropuertos;
UPDATE Aviones_Aeropuertos SET fk_id_avion = 1 WHERE id = 1;

CREATE TABLE Programa_Vuelo(
	id INT AUTO_INCREMENT,
    num_vuelo VARCHAR(10) NOT NULL UNIQUE,
    linea_aerea VARCHAR(100) NOT NULL,
    dias_semana VARCHAR(14) NOT NULL,
    es_escala BOOLEAN,
    numero_vuelo_anterior VARCHAR(10),
    PRIMARY KEY(id)
);

INSERT INTO Programa_Vuelo VALUES(NULL, "ah4561dd", "a14", "lunes,viernes",1,"a114gv");
SELECT * FROM Programa_Vuelo;
UPDATE Programa_Vuelo SET es_escala = 2 WHERE id = 1;

CREATE TABLE Aeropuertos_Programa_Vuelo(
	id INT AUTO_INCREMENT,
    fk_id_aeropuerto_salida INT NOT NULL,
    fk_id_aeropuerto_llegada INT NOT NULL,
	fk_id_programa_vuelo INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_id_aeropuerto_salida) REFERENCES Aeropuertos(id) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY(fk_id_aeropuerto_llegada) REFERENCES Aeropuertos(id) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY(fk_id_programa_vuelo) REFERENCES Programa_Vuelo(id) ON UPDATE CASCADE ON DELETE NO ACTION
);

INSERT INTO Aeropuertos_Programa_Vuelo VALUES(NULL, 1, 2, 1);
SELECT * FROM Aeropuertos_Programa_Vuelo;
UPDATE Aeropuertos_Programa_Vuelo SET fk_id_aeropuerto_salida = 2 WHERE id = 1;

CREATE TABLE Vuelos(
	id INT AUTO_INCREMENT,
    modelo_avion VARCHAR(100) NOT NULL,
    plazas_vacias INT,
    fecha DATE NOT NULL,
    fk_id_programa_vuelo INT,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_id_programa_vuelo) REFERENCES Programa_Vuelo(id) ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO Vuelos VALUES(NULL, "awjfbafb2345", 15, 19981015,1);
SELECT * FROM Vuelos;
UPDATE Vuelos SET fecha = 20231015 WHERE id = 1;

CREATE TABLE Escalas_Tecnicas(
	id INT AUTO_INCREMENT,
    motivo VARCHAR(200) NOT NULL,
    fk_id_vuelo INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_id_vuelo) REFERENCES Vuelos(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Escalas_Tecnicas VALUES(NULL, "awjfbafb2345", 1);
SELECT * FROM Escalas_Tecnicas;
UPDATE Escalas_Tecnicas SET motivo = "Ataque Terrorista con bomba" WHERE id = 1;