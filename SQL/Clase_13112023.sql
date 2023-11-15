-- Crear la base de datos
#DROP DATABASE EjercicioDB;
CREATE DATABASE IF NOT EXISTS EjercicioDB;
USE EjercicioDB;

-- Crear la primera tabla
CREATE TABLE IF NOT EXISTS Cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT CHECK (edad >=18),
    ciudad VARCHAR(50)
);

-- Insertar algunos datos en la tabla Cliente
INSERT INTO Cliente (id_cliente, nombre, apellido, edad, ciudad) VALUES
(1, 'Juan', 'Pérez', 25, 'Ciudad A'),
(2, 'María', 'Gómez', 30, 'Ciudad B'),
(3, 'Carlos', 'Martínez', 22, 'Ciudad A'),
(4, 'Laura', 'Rodríguez', 28, 'Ciudad C');

-- Crear la segunda tabla
CREATE TABLE IF NOT EXISTS Pedido (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    producto VARCHAR(50) NOT NULL,
    cantidad INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Insertar algunos datos en la tabla Pedido
INSERT INTO Pedido (id_pedido, id_cliente, producto, cantidad) VALUES
(101, 1, 'Producto X', 5),
(102, 2, 'Producto Y', 3),
(103, 3, 'Producto Z', 2),
(104, 1, 'Producto Y', 8);

-- Ejercicio 1

SELECT * FROM Cliente;

-- Ejercicio 2

SELECT DISTINCT nombre, apellido FROM Cliente;

-- Ejercicio 3

SELECT nombre, apellido, edad FROM Cliente WHERE edad > 25 ;

-- Ejercicio 4

SELECT DISTINCT cantidad FROM Pedido;

-- Ejercicio 5

SELECT DISTINCT producto FROM Pedido;

-- Ejercicio 6

SELECT id_pedido, producto, cantidad FROM Pedido WHERE cantidad >= 5;

-- Ejercicio 7

SELECT nombre, apellido, edad, ciudad FROM Cliente WHERE edad > 25 AND ciudad = "Ciudad A";

-- Ejercicio 8

SELECT producto, cantidad FROM Pedido WHERE cantidad >= 5;

-- Ejercicio 9

SELECT nombre FROM Cliente WHERE id_cliente IN(SELECT id_cliente FROM Pedido WHERE producto LIKE "Producto X");

-- Ejercicio 10

SELECT id_cliente, nombre FROM Cliente WHERE id_cliente NOT IN(SELECT id_cliente FROM Pedido WHERE id_pedido);

-- Ejercicio 11

SELECT producto, cantidad FROM Pedido WHERE id_cliente IN(SELECT id_cliente FROM Cliente WHERE ciudad = "Ciudad B" OR ciudad = "Ciudad C");

-- Ejercicio 12

SELECT nombre, apellido FROM Cliente WHERE id_cliente IN(SELECT id_cliente, producto FROM Pedido WHERE producto);

-- Ejercicio 13

SELECT producto, cantidad FROM Pedido WHERE id_cliente IN(SELECT id_cliente FROM Cliente WHERE edad < 30);

-- Ejercicio 14

SELECT id_cliente, nombre FROM Cliente WHERE id_cliente IN(SELECT id_cliente FROM Pedido WHERE producto = "Producto Y" AND cantidad > 3);

-- Ejercicio 15

SELECT nombre, apellido FROM Cliente WHERE id_cliente NOT IN(SELECT id_cliente FROM Pedido WHERE producto = "Producto Z");

-- Ejercicio 16

SELECT producto, cantidad FROM Pedido WHERE id_cliente IN(SELECT id_cliente FROM Cliente WHERE edad > 20 AND ciudad = "Ciudad A");

-- Ejercicio 17

SELECT id_cliente, nombre FROM Cliente WHERE id_cliente IN(SELECT id_cliente FROM Pedido WHERE producto = "Producto X" AND producto = "Producto Y");

-- Ejercicio 18

SELECT nombre FROM Cliente WHERE id_cliente IN(SELECT id_cliente, cantidad FROM Pedido);

-- Ejercicio 19

SELECT id_cliente, nombre FROM Cliente WHERE id_cliente IN(SELECT id_cliente FROM Pedido WHERE producto = "Producto X" AND NOT producto = "Producto Y");

-- Ejercicio 20

SELECT producto, cantidad FROM Pedido WHERE id_cliente IN(SELECT id_cliente FROM Cliente WHERE 	edad >= 25 AND edad <= 30);

-- Ejercicio 21

SELECT nombre, apellido FROM Cliente WHERE id_cliente IN(SELECT id_cliente FROM Pedido WHERE id_pedido > 2);