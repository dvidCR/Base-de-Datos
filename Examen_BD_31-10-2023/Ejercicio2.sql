#DROP DATABASE Ejercicio2;
CREATE DATABASE Ejercicio2;

USE Ejercicio2;

CREATE TABLE categoria(
	categoriaID INT AUTO_INCREMENT,
    nombrec VARCHAR(20) NOT NULL,
    descrip VARCHAR(100),
    encarg VARCHAR(20),
    PRIMARY KEY (categoriaID)
);

INSERT INTO categoria VALUES (NULL, "Vegana", "comida vegana", "Comida Vegana");
SELECT * FROM categoria;

CREATE TABLE plato(
	platoID INT AUTO_INCREMENT,
    nombrep VARCHAR(50) NOT NULL,
    nivel INT,
    descrip VARCHAR(100) NOT NULL,
    foto BOOLEAN,
    precio FLOAT NOT NULL,
    fk_categoriaID_categoria INT NOT NULL,
    PRIMARY KEY (platoID),
    FOREIGN KEY (fk_categoriaID_categoria) REFERENCES categoria(categoriaID)
);

INSERT INTO plato VALUES (NULL, "lentejas con espinacas", 3, "lentejas con espinacas", 1, 14.99, 1);
SELECT * FROM plato;

CREATE TABLE ingred(
	ingredID INT AUTO_INCREMENT,
    nombrei VARCHAR(50) NOT NULL,
    unidades INT NOT NULL,
    almacen VARCHAR(50) NOT NULL,
    PRIMARY KEY (ingredID)
);

INSERT INTO ingred VALUES (NULL, "bolsa de lentejas", 1, "C/ De Las Esperides, 15");
SELECT * FROM ingred;

CREATE TABLE plato_ingred(
	ingred_platoID INT AUTO_INCREMENT,
    fk_platoID_plato INT NOT NULL,
    fk_ingredID_ingred INT NOT NULL,
    PRIMARY KEY (ingred_platoID),
    FOREIGN KEY (fk_platoID_plato) REFERENCES plato(platoID),
    FOREIGN KEY (fk_ingredID_ingred) REFERENCES ingred(ingredID)
);

INSERT INTO plato_ingred VALUES (NULL, 1, 1);
SELECT * FROM plato_ingred;

CREATE TABLE proveedores(
	proveedoresID INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ingrediente VARCHAR(50) NOT NULL,
    precio FLOAT NOT NULL,
    cantidad INT NOT NULL,
    dni CHAR(9) NOT NULL,
    PRIMARY KEY (proveedoresID)
);

INSERT INTO proveedores VALUES (NULL, "Lentejas S.L", "bolsa de lentejas", 5.99, 3, "52671922Z");
SELECT * FROM proveedores;

CREATE TABLE proveedores_ingred(
	proveedores_ingredID INT AUTO_INCREMENT,
    fk_ingredID_ingred INT NOT NULL,
    fk_proveedoresID_proveedores INT NOT NULL,
    PRIMARY KEY (proveedores_ingredID),
    FOREIGN KEY (fk_ingredID_ingred) REFERENCES ingred(ingredID),
    FOREIGN KEY (fk_proveedoresID_proveedores) REFERENCES proveedores(proveedoresID)
);

INSERT INTO proveedores_ingred VALUES (NULL, 1, 1);
SELECT * FROM proveedores_ingred;