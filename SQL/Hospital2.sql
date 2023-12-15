#DROP DATABASE Hospital2;
CREATE DATABASE Hospital2;

USE Hospital2;

CREATE TABLE Camas(
	id_cama INT AUTO_INCREMENT,
	zona VARCHAR(50), 
	planta VARCHAR(50) NOT NULL,
	fechaCambioSabanas DATE NOT NULL, 
	PRIMARY KEY(id_cama)
);

INSERT INTO Camas VALUES(null, "pediatría", "Primera", "2020/01/29");
INSERT INTO Camas VALUES(null, "cardiología", "Primera", "2020/01/30");
INSERT INTO Camas VALUES(null, "traumatología", "Segunda", "2020/02/15");
INSERT INTO Camas VALUES(null, "traumatología", "Segunda", "2021/02/16");
INSERT INTO Camas VALUES(null, "obstetricia", "Tercera", "2019/01/29");
INSERT INTO Camas VALUES(null, "ginecología", "Cuarta", "2020/01/29");

SELECT * FROM Camas;

CREATE TABLE Pacientes(
	id_paciente INT AUTO_INCREMENT,
	nombre VARCHAR(100),
	apellido1 VARCHAR(100),
	dni CHAR(9) NOT NULL,
	fechaIngreso DATE,
	PRIMARY KEY(id_paciente)
);
INSERT INTO Pacientes VALUES(null, "María", "Pérez", "11111111A", "2020/01/28");
INSERT INTO Pacientes VALUES(null, "María", "Pérez", "11111111A", "2020/02/14");
INSERT INTO Pacientes VALUES(null, "María", "Pérez", "11111111A", "2020/02/29");
INSERT INTO Pacientes VALUES(null, "José", "Ramirez", "22222222B", "2020/02/10");
INSERT INTO Pacientes VALUES(null, "Rafael", "Hernández", "33333333C", "2020/01/09");
INSERT INTO Pacientes VALUES(null, "Ana", "Rodríguez", "44444444D", "2020/01/26");
INSERT INTO Pacientes VALUES(null, "Ana", "Rodríguez", "44444444D", "2020/01/27");

SELECT * FROM Pacientes;

CREATE TABLE Camas_Pacientes(
	id INT AUTO_INCREMENT,
	fk_id_cama INT,
    fk_id_paciente INT,
	FOREIGN KEY (fk_id_cama) REFERENCES Camas (id_cama) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (fk_id_paciente) REFERENCES Pacientes (id_paciente) ON UPDATE CASCADE ON DELETE SET NULL,
    PRIMARY KEY(id)
);

INSERT INTO Camas_Pacientes VALUES(null, 1, 1);
INSERT INTO Camas_Pacientes VALUES(null, 3, 2);
INSERT INTO Camas_Pacientes VALUES(null, 2, 3);
INSERT INTO Camas_Pacientes VALUES(null, 3, 4);
INSERT INTO Camas_Pacientes VALUES(null, 4, 5);
INSERT INTO Camas_Pacientes VALUES(null, 6, 6);
INSERT INTO Camas_Pacientes VALUES(null, 5, 7);

SELECT * FROM Camas_Pacientes;

CREATE TABLE Medicos(
	id_medico INT AUTO_INCREMENT,
	nombre VARCHAR(100),
	apellido1 VARCHAR(100),
	apellido2 VARCHAR(100),
	dni CHAR(9) UNIQUE NOT NULL,
	turno VARCHAR(50), 
	especialidad VARCHAR(100) NOT NULL,
	PRIMARY KEY(id_medico) 
);
INSERT INTO Medicos VALUES(null, "Rosa", "Hernández", "Ruíz", "55555555A", "Mañana", "pediatría");
INSERT INTO Medicos VALUES(null, "Juan", "Ruíz", "Ruíz", "55555555B", "Tarde", "pediatría");
INSERT INTO Medicos VALUES(null, "Carlos", "Blanco", "Pérez", "55555555C", "Mañana", "cardiología");
INSERT INTO Medicos VALUES(null, "Carlos", "Hernández", "Pérez", "55555555D", "Tarde", "cardiología");
INSERT INTO Medicos VALUES(null, "Ana", "Ramirez", "Pérez", "55555555E", "Mañana", "traumatología");
INSERT INTO Medicos VALUES(null, "Gabriela", "Betancort", "Seoane", "55555555F", "Tarde", "traumatología");
INSERT INTO Medicos VALUES(null, "Juan", "Ramirez", "Seoane", "55555555G", "Mañana", "obstetricia");
INSERT INTO Medicos VALUES(null, "David", "Díaz", "Pérez", "55555555H", "Tarde", "obstetricia");
INSERT INTO Medicos VALUES(null, "Gabriela", "Martínez", "Seoane", "55555555I", "Mañana", "ginecología");
INSERT INTO Medicos VALUES(null, "Óscar", "Martínez", "Pérez", "55555555J", "Tarde", "ginecología");

SELECT * FROM Medicos;

CREATE TABLE Pacientes_Medicos(
	id_paciente_medico INT AUTO_INCREMENT,
	fk_id_paciente INT,
	fk_id_medico INT,
    FOREIGN KEY (fk_id_paciente) REFERENCES Pacientes (id_paciente) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (fk_id_medico) REFERENCES Medicos (id_medico) ON UPDATE CASCADE ON DELETE SET NULL,
	PRIMARY KEY(id_paciente_medico)
);

INSERT INTO Pacientes_Medicos VALUES(null, 1, 1);
INSERT INTO Pacientes_Medicos VALUES(null, 1, 2);
INSERT INTO Pacientes_Medicos VALUES(null, 2, 3);
INSERT INTO Pacientes_Medicos VALUES(null, 3, 5);
INSERT INTO Pacientes_Medicos VALUES(null, 4, 6);
INSERT INTO Pacientes_Medicos VALUES(null, 5, 6);
INSERT INTO Pacientes_Medicos VALUES(null, 5, 5);
INSERT INTO Pacientes_Medicos VALUES(null, 6, 9);
INSERT INTO Pacientes_Medicos VALUES(null, 6, 10);
INSERT INTO Pacientes_Medicos VALUES(null, 7, 7);
INSERT INTO Pacientes_Medicos VALUES(null, 7, 8);

SELECT * FROM Pacientes_Medicos;

-- op1

SELECT nombre FROM Pacientes WHERE nombre != "María";

-- op2

SELECT zona, planta FROM Camas WHERE fechaCambioSabanas = "2021/02/16";

-- op3

SELECT id_paciente FROM Pacientes WHERE dni != "33333333C";

-- op4

SELECT turno, nombre, especialidad FROM Medicos WHERE id_medico != 2 AND id_medico != 4 AND id_medico != 5;

-- op5

SELECT nombre, apellido1 FROM Medicos WHERE especialidad != "cardiología";

-- op6

SELECT DISTINCT fk_id_medico FROM Pacientes_Medicos WHERE fk_id_paciente != 2;

-- op7

SELECT id_medico FROM Medicos WHERE id_medico NOT IN(SELECT fk_id_medico FROM Pacientes_Medicos);

-- op8

SELECT DISTINCT nombre, apellido1 FROM Pacientes WHERE id_paciente IN(SELECT fk_id_paciente FROM Pacientes_Medicos WHERE fk_id_medico != 7 AND fk_id_medico != 9);

-- op9

SELECT DISTINCT (fk_id_medico)
FROM Pacientes_Medicos;

SELECT SUM(id_medico)
FROM Medicos;

SELECT COUNT(*) AS CUANTAS_MARIAS
FROM Pacientes
WHERE nombre="María";

SELECT AVG(id_medico)
FROM Medicos;

-- op10

SELECT nombre, apellido1, apellido2 FROM Medicos WHERE id_medico IN(SELECT fk_id_medico FROM Pacientes_Medicos);

-- op11

SELECT DISTINCT zona FROM Camas WHERE id_cama IN(SELECT fk_id_paciente FROM Camas_Pacientes);

-- op12

SELECT id_paciente_medico FROM Pacientes_Medicos WHERE fk_id_paciente IN(SELECT id_paciente, nombre FROM Pacientes) AND fk_id_medico IN(SELECT id_medico, nombre FROM Medicos);

-- op13

SELECT dni, especialidad FROM Medicos WHERE id_medico IN(SELECT fk_id_medico FROM Pacientes_Medicos WHERE fk_id_paciente IN(SELECT id_paciente FROM Pacientes WHERE apellido1 = "Pérez"));

-- op14

SELECT id_paciente, nombre FROM Pacientes WHERE id_paciente IN(SELECT fk_id_paciente FROM Pacientes_Medicos WHERE fk_id_medico IN(SELECT id_medico FROM Medicos WHERE especialidad = "pediatría"));

-- op15

SELECT COUNT(nombre) FROM Pacientes WHERE id_paciente = 1;

-- op16

SELECT SUM(id_medico) FROM Medicos WHERE nombre = "Carlos";

-- op17

SELECT DISTINCT apellido1 FROM Pacientes;

-- op18

SELECT id_cama FROM Camas WHERE id_cama IN(SELECT SUM(id_cama) FROM Camas WHERE id_cama IN(SELECT COUNT(id_cama) FROM Camas WHERE id_cama IN(SELECT AVG(id_cama) FROM Camas)));

-- op19

SELECT nombre FROM Medicos WHERE id_medico IN(SELECT fk_id_medico FROM Pacientes_Medicos WHERE fk_id_paciente NOT IN(SELECT id_paciente FROM Pacientes WHERE nombre = "María" AND apellido1 = "Pérez" AND nombre ="Ana" AND apellido1 = "Rodríguez"));

-- op20

SELECT nombre FROM Medicos WHERE nombre = "Gabriela" AND apellido1 ="Martínez" AND apellido2 = "Seoane" IN(SELECT fk_id_medico FROM Pacientes_Medicos WHERE fk_id_paciente IN(UPDATE nombre, apellido1 FROM Pacientes WHERE nombre = "María" AND apellido1 = "Pérez" AND nombre ="Ana" AND apellido1 = "Rodríguez"));