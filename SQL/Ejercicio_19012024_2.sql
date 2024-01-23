#DROP DATABASE Triger;
CREATE DATABASE Triger;

USE Triger;

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(255),
    telefono VARCHAR(15),
    DNI VARCHAR(20),
    PRIMARY KEY (id)
);


CREATE TABLE Copia_Clientes (
    id INT AUTO_INCREMENT,
    copia_cliente int,
    nombre VARCHAR(255),
    telefono VARCHAR(15),
    DNI VARCHAR(20),
    PRIMARY KEY (id)
);

-- Antes de insertar

DELIMITER //
CREATE TRIGGER insertar 
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Copia_Clientes (copia_cliente, nombre, telefono, DNI)
    VALUES (NEW.id, NEW.nombre, NEW.telefono, NEW.DNI);
END;
//
DELIMITER ;

-- Antes de borrar

DELIMITER //
CREATE TRIGGER borrar
AFTER DELETE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Copia_Clientes (copia_cliente, nombre, telefono, DNI)
    VALUES (OLD.id, OLD.nombre, OLD.telefono, OLD.DNI);
END;
//
DELIMITER ;

SELECT * FROM Clientes AS Primero;
SELECT * FROM Copia_Clientes AS Primero;
INSERT INTO Clientes VALUES(NULL, "paco", "65656565", "0215488B");
SELECT * FROM Clientes AS Segundo;
SELECT * FROM Copia_Clientes AS Segundo;
DELETE FROM Clientes WHERE id = 1;
SELECT * FROM Clientes AS Tercero;
SELECT * FROM Copia_Clientes AS Tercero;