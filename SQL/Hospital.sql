#DROP DATABASE Hospital;
CREATE DATABASE Hospital;

USE Hospital;

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

#Nuevos Inserts y Updates
INSERT INTO Camas VALUES(null, "laboratorio", "Quinta", "2020/01/29");
INSERT INTO Camas VALUES(null, "sala de estar", "Sexta", "2020/01/29");
INSERT INTO Camas VALUES(null, "cirugia", "Septima", "2020/01/29");
INSERT INTO Camas VALUES(null, "dermatologia", "Octava", "2020/01/29");
INSERT INTO Camas VALUES(null, "neumologia", "Novena", "2020/01/29");
SELECT * FROM Camas;
UPDATE Camas SET fechaCambioSabanas = "2020/10/01" WHERE id_cama = 1;
UPDATE Camas SET fechaCambioSabanas = "2020/09/01" WHERE id_cama = 2;
UPDATE Camas SET fechaCambioSabanas = "2020/08/01" WHERE id_cama = 3;

CREATE TABLE Pacientes(
	id_paciente INT AUTO_INCREMENT,
	nombre VARCHAR(100),
	apellido1 VARCHAR(100),
	dni CHAR(9) NOT NULL,
	fechaIngreso DATE,
	fk_id_cama INT,
	PRIMARY KEY(id_paciente)
);
INSERT INTO Pacientes VALUES(null, "Davinia", "DeLaRosa", "11111111A", "2020/01/28", 1);
INSERT INTO Pacientes VALUES(null, "María", "Pérez", "11111111A", "2020/02/14", 2);
INSERT INTO Pacientes VALUES(null, "María", "Pérez", "11111111A", "2020/02/29", 3);
INSERT INTO Pacientes VALUES(null, "José", "Ramirez", "22222222B", "2020/02/10", 4);
INSERT INTO Pacientes VALUES(null, "Rafael", "Hernández", "33333333C", "2020/01/09", 5);
INSERT INTO Pacientes VALUES(null, "Ana", "Rodríguez", "44444444D", "2020/01/26", 6);
INSERT INTO Pacientes VALUES(null, "Ana", "Rodríguez", "44444444D", "2020/01/27", 7);

#Nuevos Inserts
INSERT INTO Pacientes VALUES(null, "Javier", "Perez", "89848488H", "2020/11/30", 8);
INSERT INTO Pacientes VALUES(null, "Carlos", "Gutierrez", "94818812K", "2020/10/30", 9);
INSERT INTO Pacientes VALUES(null, "Marisa", "Ramos", "89753341L", "2020/04/07", 10);
INSERT INTO Pacientes VALUES(null, "Marta", "Jimenez", "45587106D", "2020/03/08", 11);
INSERT INTO Pacientes VALUES(null, "Marco", "Rodríguez", "01251098B", "2020/09/01", 12);
SELECT * FROM Pacientes;
UPDATE Pacientes SET fk_id_cama = 1 WHERE id_paciente = 12;
UPDATE Pacientes SET nombre = "Jaime" WHERE id_paciente = 1;
UPDATE Pacientes SET apellido1 = "Carroza" WHERE id_paciente = 1;

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

#Nuevos Inserts
INSERT INTO Medicos VALUES(null, "David", "Casado", "Rodríguez", "55555555K", "Tarde", "pediatría");
INSERT INTO Medicos VALUES(null, "Dario", "Arroyo", "Vacas", "55555555L", "Tarde", "cardiologo");
INSERT INTO Medicos VALUES(null, "Angel", "García", "Ojeda", "55555555M", "Tarde", "laboratorio");
INSERT INTO Medicos VALUES(null, "Mario", "Serradilla", "Penido", "55555555N", "Tarde", "traumatología");
INSERT INTO Medicos VALUES(null, "Daniel", "Jiménez", "Zapata", "55555555O", "Tarde", "ginecología");
SELECT * FROM Medicos;
UPDATE Medicos SET nombre = "Paula" WHERE id_medico = 10;
UPDATE Medicos SET apellido1 = "Lopez" WHERE id_medico = 10;
UPDATE Medicos SET apellido2 = "Rubio" WHERE id_medico = 10;

CREATE TABLE Pacientes_Medicos(
	id_paciente_medico INT AUTO_INCREMENT,
	fk_id_paciente INT,
	fk_id_medico INT, 
	PRIMARY KEY(id_paciente_medico)
);

INSERT INTO Pacientes_Medicos VALUES(null, 1, 1);
INSERT INTO Pacientes_Medicos VALUES(null, 1, 14);
INSERT INTO Pacientes_Medicos VALUES(null, 2, 3);
INSERT INTO Pacientes_Medicos VALUES(null, 3, 5);
INSERT INTO Pacientes_Medicos VALUES(null, 4, 6);
INSERT INTO Pacientes_Medicos VALUES(null, 5, 6);
INSERT INTO Pacientes_Medicos VALUES(null, 5, 5);
INSERT INTO Pacientes_Medicos VALUES(null, 6, 9);
INSERT INTO Pacientes_Medicos VALUES(null, 6, 10);
INSERT INTO Pacientes_Medicos VALUES(null, 7, 7);
INSERT INTO Pacientes_Medicos VALUES(null, 7, 8);

#Nuevos Inserts
INSERT INTO Pacientes_Medicos VALUES(null, 8, 8);
INSERT INTO Pacientes_Medicos VALUES(null, 9, 10);
INSERT INTO Pacientes_Medicos VALUES(null, 10, 11);
INSERT INTO Pacientes_Medicos VALUES(null, 11, 9);
INSERT INTO Pacientes_Medicos VALUES(null, 12, 1);
SELECT * FROM Pacientes_Medicos;
UPDATE Pacientes_Medicos SET fk_id_paciente = 4 WHERE id_paciente_medico = 4;
UPDATE Pacientes_Medicos SET fk_id_medico = 12 WHERE id_paciente_medico = 16;
UPDATE Pacientes_Medicos SET fk_id_paciente = 1 WHERE id_paciente_medico = 3;

ALTER TABLE Pacientes
ADD FOREIGN KEY (fk_id_cama) REFERENCES Camas (id_cama) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE Pacientes_Medicos
ADD FOREIGN KEY (fk_id_paciente) REFERENCES Pacientes (id_paciente) ON UPDATE CASCADE ON DELETE SET NULL,
ADD FOREIGN KEY (fk_id_medico) REFERENCES Medicos (id_medico) ON UPDATE CASCADE ON DELETE SET NULL;
