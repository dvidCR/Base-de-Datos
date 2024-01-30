#DROP DATABASE Ej2y3_11_5;
CREATE DATABASE Ej2y3_11_5;

USE Ej2y3_11_5;

-- Ejercicio 2

/*DELIMITER //
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
SELECT @divisionv AS Division;*/

-- Ejercicio 3

/*CREATE TABLE Clientes (
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
	CREATE PROCEDURE id_mas_alto()
	BEGIN
		DECLARE identificador INT;
        DECLARE cont INT;
        DECLARE indicacion VARCHAR(50);
        DECLARE bucle cursor for SELECT id FROM Clientes; #Con esto declaramos el cursor poniendole un nombre "bucle" que se usara para recorrer todos los "id" de la tabla "Clientes".
        
        SELECT COUNT(id) INTO identificador FROM Clientes; #Esto guarda el numero de "id" totales en la variable "identificador".
        
        OPEN bucle;
			bucle_loop: LOOP
				SET cont = cont + 1;
                FETCH bucle INTO indicacion; #Llamas al cursor y guardas sus datos en la variable "indicacion".
                SELECT indicacion; #Para mostrar en pantalla lo que tenga guardado esta variable "indicacion", Aunque segun ChatGPT es un intento de PRINT.
                
                IF cont = identificador THEN 
					LEAVE bucle_loop; #Orden para cerrar el "bucle_loop"
				END IF; #Orden para acabar el IF
		END LOOP bucle_loop; #Orden para terminar el bucle general "bucle_loop"
		CLOSE bucle; #Orden para cerrar "bucle" 
	END //
	DELIMITER ;
    
CALL id_mas_alto();*/

-- Ejercicio 4

CREATE TABLE Materiales (
    id_material INT AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    zona CHAR(2),
    apartado VARCHAR(2),
    PRIMARY KEY (id_material)
);

CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT,
    nif VARCHAR(12) UNIQUE NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    PRIMARY KEY (id_proveedor)
);

CREATE TABLE Materiales_Proveedores (
    id_materiales_proveedores INT AUTO_INCREMENT,
    precio_material FLOAT(6,2) NOT NULL,
    fk_id_material INT,
    fk_id_proveedor INT,
    PRIMARY KEY (id_materiales_proveedores),
    FOREIGN KEY (fk_id_material)
    REFERENCES Materiales(id_material)
    ON DELETE CASCADE,
    FOREIGN KEY (fk_id_proveedor)
    REFERENCES Proveedores(id_proveedor)
    ON DELETE CASCADE
);

CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT,
    fk_id_proveedor INT,
    PRIMARY KEY(id_pedido),
    FOREIGN KEY (fk_id_proveedor)
    REFERENCES Proveedores(id_proveedor)
    ON DELETE CASCADE
);

CREATE TABLE Materiales_Pedidos(
    id_materiales_pedidos INT AUTO_INCREMENT,
    cantidad_material INT NOT NULL,
    precio_material FLOAT(6,2) NOT NULL,
    fk_id_material INT,
    fk_id_pedido INT,
    PRIMARY KEY (id_materiales_pedidos),
    FOREIGN KEY (fk_id_material)
    REFERENCES Materiales(id_material)
    ON DELETE CASCADE,
    FOREIGN KEY (fk_id_pedido)
    REFERENCES Pedidos(id_pedido)
    ON DELETE CASCADE
);

CREATE TABLE Albaranes (
    id_albaran INT AUTO_INCREMENT,
    fk_id_pedido INT,
    PRIMARY KEY (id_albaran),
    FOREIGN KEY (fk_id_pedido)
    REFERENCES Pedidos(id_pedido)
    ON DELETE CASCADE
);

CREATE TABLE Materiales_Albaranes(
    id_materiales_albaranes INT AUTO_INCREMENT,
    precio_material FLOAT(6,2) NOT NULL,
    fk_id_material INT,
    fk_id_albaran INT,
    PRIMARY KEY (id_materiales_albaranes),
    FOREIGN KEY (fk_id_material)
    REFERENCES Materiales(id_material)
    ON DELETE CASCADE,
    FOREIGN KEY (fk_id_albaran)
    REFERENCES Albaranes(id_albaran)
    ON DELETE CASCADE
);

CREATE TABLE Reclamaciones(
    id_reclamacion INT AUTO_INCREMENT,
    precio_establecido FLOAT(6,2) NOT NULL,
    precio_cobrado FLOAT (6,2) NOT NULL,
    diferencia FLOAT (6,2) NOT NULL,
    fk_id_albaran INT,
    PRIMARY KEY (id_reclamacion),
    FOREIGN KEY (fk_id_albaran)
    REFERENCES Albaranes(id_albaran)
    ON DELETE CASCADE
);

CREATE TABLE Albaranes_Reclamaciones (
    id_albaran INT AUTO_INCREMENT,
    copia_id INT,
    fk_id_pedido INT,
    PRIMARY KEY (id_albaran),
    FOREIGN KEY (fk_id_pedido)
    REFERENCES Pedidos(id_pedido)
    ON DELETE CASCADE
);

INSERT INTO Materiales
VALUES (null, "Ladrillo", "ladrillo de 20x60", "interor", "B", "1");
INSERT INTO Materiales
VALUES (null, "Marmol", "bloque de marmol de 1x1", "cocina", "C", "2");
INSERT INTO Materiales
VALUES (null, "Cemento", "Saco de 10 kg de cemento", "exterior", "A", "3");
INSERT INTO Materiales
VALUES (null, "Pintura azul", "Pintura azul claro para exteriores", "exterior", "C", "1");
INSERT INTO Materiales
VALUES (null, "Cobertura ", "Cobertura plastica de imitacion", "techo", "B", "3");


INSERT INTO Proveedores
VALUES(null, "546351256G", "Ladrillos la piedra SL", "Calle San Geronimo 28043 Madrid", 910090287);
INSERT INTO Proveedores
VALUES(null, "653718356Y", "Minerales San Cruz S.L", "Calle Pedro Alonso 43001 Tarragona", 911129324);
INSERT INTO Proveedores
VALUES(null, "653718306Y", "CONSTRUCCION S.L", "Calle Falsa 123 28032 Madrid", 910929414);
INSERT INTO Proveedores
VALUES(6, "650018356Y", "Manolo´s SL", "Calle Velazquez 14 30100 Murcia", 910929414);

INSERT INTO Materiales_Proveedores VALUES (null, 1.45, 1, 1);
INSERT INTO Materiales_Proveedores VALUES (null, 7.56, 2, 2);
INSERT INTO Materiales_Proveedores VALUES (null, 7.56, 3, 3);

INSERT INTO Pedidos VALUES (null, 1);
INSERT INTO Pedidos VALUES (null, 2);

INSERT INTO Materiales_Pedidos VALUES (null, 120, 1.51, 1, 1);
INSERT INTO Materiales_Pedidos VALUES (null, 6, 8.92, 3, 2);


INSERT INTO Albaranes VALUES (null, 1);
INSERT INTO Albaranes VALUES (null, 2);

INSERT INTO Materiales_Albaranes VALUES (null, 1.49, 1, 1);
INSERT INTO Materiales_Albaranes VALUES (null, 7.89, 3, 2);

INSERT INTO Pedidos VALUES (11, 1);
INSERT INTO Proveedores VALUES(7, "120018356F", "Basquim sl", "Poligono industrial san fernando 28851 Madrid", 910929414);
INSERT INTO Materiales_Pedidos VALUES (11, 10, 3.21, 3, 11);

INSERT INTO Pedidos VALUES (3, 6);
INSERT INTO Albaranes VALUES (null, 3);
INSERT INTO Albaranes VALUES (null, 3);

INSERT INTO Proveedores VALUES(null, "650015126Y", "ESTRUCTURAS S.L", "Calle Islandia 28821 Coslada, Madrid", 910952814);
INSERT INTO Pedidos VALUES (4, 8);
INSERT INTO Albaranes VALUES (null, 4);

INSERT INTO Pedidos VALUES (6, 1);
INSERT INTO Materiales_Pedidos VALUES (null, 8, 2.89, 1, 6);
INSERT INTO Albaranes VALUES (11, 6);
INSERT INTO Materiales_Albaranes VALUES (null, 1.49, 4, 11);

CREATE TRIGGER Comprobacion
BEFORE INSERT ON Albaranes
FOR EACH ROW
BEGIN
	
    SET precio_m = 0;
    SET precio_p = 0;
    SELECT precio_material INTO precio_m FROM Materiales_Albaranes;
    SELECT precio_material INTO precio_p FROM Materiales_Proveedores;
    
	IF (precio_m) != (precio_p) && (precio_m - precio_p) > 2 || (precio_m - precio_p) < -2
		SET diferencia = SELECT precio_material FROM Materiales_Albaranes - SELECT precio_material FROM Materiales_Proveedores
        IF (@diferencia => 2)
			INSERT INTO Albaranes_Reclamaciones (id_albaran, copia_id, fk_id_pedido)
			VALUES (NEW.id_albaran, NEW.copia_id, NEW.fk_id_pedido);
		

END //
DELIMITER ;