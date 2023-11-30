#DROP DATABASE Vehiculos;
CREATE DATABASE Vehiculos;

USE Vehiculos;

CREATE TABLE Persona (
	id INT AUTO_INCREMENT,
    dni CHAR(9) NOT NULL,
    telefono VARCHAR(13) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(id)
);
INSERT INTO Persona VALUE
(1, "02581473C", "+34 654123789", "Madrid", "C/ Hola, 1", "Romero Martinez", "Alejandro"),
(2, "87481473A", "+34 654123781", "Barcelona", "C/ Adios, 7", "Ramos Rodríguez", "Juan"),
(3, "25841473P", "+34 654123782", "Toledo", "C/ Puerta, 3", "Rubio Rojo", "Marta"),
(4, "02584452E", "+34 654123783", "Vallecas", "C/ Esperides, 25", "Cana Gutierrez", "Maria"),
(5, "02518473F", "+34 654123784", "Castellón", "C/ Villanueva, 13", "Martinez Martinez", "Mario");

UPDATE Persona SET apellidos = "Martinez Paredes" WHERE id = 5;

DELETE FROM Persona WHERE id = 2;

SELECT * FROM Persona;
SELECT nombre FROM Persona;
SELECT apellidos FROM Persona;
SELECT dni FROM Persona;
SELECT telefono FROM Persona;

CREATE TABLE Vehiculo (
	id INT AUTO_INCREMENT,
    matricula CHAR(7) NOT NULL UNIQUE,
    marca VARCHAR(15) NOT NULL,
    modelo VARCHAR(30) NOT NULL,
    fk_id_persona INT NOT NULL,
    fk_id_infracciones INT,
    FOREIGN KEY (fk_id_persona) REFERENCES Persona (id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(id)
);

INSERT INTO Vehiculo VALUE
(1, "ABF3475", "Ford", "Mustang", 1, 1),
(2, "ABF3400", "Mercedes", "Benz", 3, NULL),
(3, "ABF5555", "BMW", "Serie 3", 4, 5),
(4, "CDB7800", "BMW", "X11", 5, 4),
(5, "ABF4561", "Fiat", "500", 4, 2);

UPDATE Vehiculo SET matricula = "ABC1234" WHERE id = 1;

DELETE FROM Vehiculo WHERE id = 5;

SELECT * FROM Vehiculo;
SELECT matricula FROM Vehiculo;
SELECT marca FROM Vehiculo;
SELECT modelo FROM Vehiculo;
SELECT fk_id_infracciones FROM Vehiculo;


CREATE TABLE Infracciones (
	id_referencia INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    lugar VARCHAR(50),
    hora TIME NOT NULL,
    importe FLOAT NOT NULL,
    PRIMARY KEY(id_referencia)
);

INSERT INTO Infracciones VALUE
(1, "2023-3-15", "A-15", "12:15:20", 150),
(2, "2023-4-01", "A-50", "13:15:20", 150),
(3, "2023-4-14", "M-30", "21:45:01", 300),
(4, "2023-4-21", "M-50", "01:35:42", 1000),
(5, "2023-4-20", "M-50", "03:00:55", 2000);

UPDATE Infracciones SET lugar = "R-3" WHERE id_referencia = 2;

DELETE FROM Infracciones WHERE id_referencia = 3;

SELECT * FROM Infracciones;
SELECT fecha FROM Infracciones;
SELECT hora FROM Infracciones;
SELECT lugar FROM Infracciones;
SELECT importe FROM Infracciones;

CREATE TABLE Accidente (
	id_referencia INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    lugar VARCHAR(50),
    hora TIME NOT NULL,
	fk_id_vehiculo INT NOT NULL,
    FOREIGN KEY (fk_id_vehiculo) REFERENCES Vehiculo (id) ON UPDATE CASCADE ON DELETE NO ACTION,
    PRIMARY KEY(id_referencia)
);

INSERT INTO Accidente VALUE
(1, "2023-12-23", "R-3", "12:15:20", 2),
(2, "2023-12-06", "M-50", "13:15:20", 2),
(3, "2023-12-23", "M-30", "23:45:01", 1),
(4, "2023-12-23", "M-50", "23:45:01", 3),
(5, "2023-12-23", "M-50", "23:45:01", 4);

UPDATE Accidente SET lugar = "A-2" WHERE id_referencia = 2;

DELETE FROM Accidente WHERE id_referencia = 1;

SELECT * FROM Accidente;
SELECT fecha FROM Accidente;
SELECT hora FROM Accidente;
SELECT lugar FROM Accidente;
SELECT fk_id_vehiculo FROM Accidente;

ALTER TABLE Vehiculo
ADD FOREIGN KEY (fk_id_infracciones) REFERENCES Infracciones (id_referencia) ON UPDATE CASCADE ON DELETE CASCADE;