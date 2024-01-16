#DROP DATABASE JOINS;
CREATE DATABASE JOINS;

USE JOINS;

CREATE TABLE clientes(
	id INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE pedidos(
	id_pedido INT AUTO_INCREMENT NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id)
);

INSERT INTO clientes VALUES
(NULL, "Juan");

INSERT INTO pedidos VALUES
(NULL, 1);

SELECT * FROM clientes;
SELECT * FROM pedidos;

SELECT clientes.id, clientes.nombre, pedidos.id_pedido 
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.id_cliente;