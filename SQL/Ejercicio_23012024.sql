#DROP DATABASE Ej2y3_11_5;
CREATE DATABASE Ej2y3_11_5;

USE Ej2y3_11_5;

-- Ejercicio 2

DELIMITER //
CREATE PROCEDURE operacion(IN numero1 INT, IN numero2 INT, OUT suma INT, OUT resta INT, OUT multiplicacion INT, OUT division FLOAT)
BEGIN
	SET suma = numero1 + numero2;
    SET resta = numero1 - numero2;
    SET multiplicacion = numero1 * numero2;
    SET division = numero1 / numero2;
END
//
DELIMITER ;

CALL operacion (5, 7, @suma, @resta, @multiplicacion, @division);
SELECT @suma AS Suma;
SELECT @resta AS Resta;
SELECT @multiplicacion AS Multiplicacion;
SELECT @divisionv AS Division;

-- Ejercicio 3

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(255),
    telefono VARCHAR(15),
    DNI VARCHAR(20),
    PRIMARY KEY (id)
);

INSERT INTO Clientes VALUES
(NULL, "paco", "65656565", "0215488B"),
(NULL, "pacos", "65656565", "0215488B");


DELIMITER //
	CREATE FUNCTION bucle(id INT)
	RETURNS INT DETERMINISTIC
	BEGIN
		RETURN 2*2;
	END
	//
	DELIMITER ;