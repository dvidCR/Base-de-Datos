-- Creación de la base de datos
#DROP DATABASE MiBaseDeDatos;
CREATE DATABASE IF NOT EXISTS MiBaseDeDatos;
USE MiBaseDeDatos;

-- Creación de la tabla 'Clientes'
CREATE TABLE IF NOT EXISTS Clientes (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100)
);

-- Creación de la tabla 'Pedidos'
CREATE TABLE IF NOT EXISTS Pedidos (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    fecha_pedido DATE,
    FOREIGN KEY (cliente_id)
        REFERENCES Clientes(cliente_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Creación de la tabla 'Productos'
CREATE TABLE IF NOT EXISTS Productos (
    producto_id INT PRIMARY KEY,
    nombre_producto VARCHAR(50),
    precio DECIMAL(10, 2)
);

-- Creación de la tabla 'DetallesPedido'
CREATE TABLE IF NOT EXISTS DetallesPedido (
    detalle_id INT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos(pedido_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (producto_id)
        REFERENCES Productos(producto_id)
        ON DELETE SET NULL
        ON UPDATE SET NULL
);

-- Creación de la tabla 'Empleados'
CREATE TABLE IF NOT EXISTS Empleados (
    empleado_id INT PRIMARY KEY,
    nombre_empleado VARCHAR(50),
    jefe_id INT,
    FOREIGN KEY (jefe_id)
        REFERENCES Empleados(empleado_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Inserts en la tabla 'Clientes'
INSERT INTO Clientes (cliente_id, nombre, direccion) VALUES
(1, 'Cliente1', 'Direccion1'),
(2, 'Cliente2', 'Direccion2');
-- ... Agrega 8 registros más ...

INSERT INTO Clientes (cliente_id) VALUES
(3),
(4),
(5);

INSERT INTO Clientes (nombre) VALUES
('Cliente3'),
('Cliente4'),
('Cliente5');

INSERT INTO Clientes (direccion) VALUES
('Direccion3'),
('Direccion4'),
('Direccion5');

-- Inserts en la tabla 'Pedidos'
INSERT INTO Pedidos (pedido_id, cliente_id, fecha_pedido) VALUES
(1, 1, '2023-01-01'),
(2, 2, '2023-02-01');
-- ... Agrega 8 registros más ...

INSERT INTO Pedidos (pedido_id) VALUES
(3),
(4),
(5);

UPDATE Pedidos SET cliente_id = 3 WHERE pedido_id = 3;
UPDATE Pedidos SET cliente_id = 4 WHERE pedido_id = 4;
UPDATE Pedidos SET cliente_id = 5 WHERE pedido_id = 5;

UPDATE Pedidos SET fecha_pedido = '2023-03-01' WHERE pedido_id = 3;
UPDATE Pedidos SET fecha_pedido = '2023-04-01' WHERE pedido_id = 4;
UPDATE Pedidos SET fecha_pedido = '2023-05-01' WHERE pedido_id = 5;


-- Inserts en la tabla 'Productos'
INSERT INTO Productos (producto_id, nombre_producto, precio) VALUES
(1, 'Producto1', 19.99),
(2, 'Producto2', 29.99);
-- ... Agrega 8 registros más ...

INSERT INTO Productos (producto_id) VALUES
(3),
(4),
(5);

UPDATE Productos SET nombre_producto = 'Producto3' WHERE producto_id = 3;
UPDATE Productos SET nombre_producto = 'Producto4' WHERE producto_id = 4;
UPDATE Productos SET nombre_producto = 'Producto5' WHERE producto_id = 5;

UPDATE Productos SET precio = 39.99 WHERE producto_id = 3;
UPDATE Productos SET precio = 49.99 WHERE producto_id = 4;
UPDATE Productos SET precio = 59.99 WHERE producto_id = 5;

-- Inserts en la tabla 'DetallesPedido'
INSERT INTO DetallesPedido (detalle_id, pedido_id, producto_id, cantidad) VALUES
(1, 1, 1, 5),
(2, 1, 2, 3);
-- ... Agrega 8 registros más ...

INSERT INTO DetallesPedido (detalle_id) VALUES
(3);

INSERT INTO DetallesPedido (pedido_id) VALUES
(2);

INSERT INTO DetallesPedido (producto_id) VALUES
(3);

INSERT INTO DetallesPedido (cantidad) VALUES
(1);

-- Inserts en la tabla 'Empleados'
INSERT INTO Empleados (empleado_id, nombre_empleado, jefe_id) VALUES
(1, 'Empleado1', NULL),
(2, 'Empleado2', 1);
-- ... Agrega 8 registros más ...

INSERT INTO Empleados (empleado_id) VALUES
(3),
(4),
(5);

UPDATE Empleados SET nombre_empleado = 'Empleado3' WHERE empleado_id = 3;
UPDATE Empleados SET nombre_empleado = 'Empleado4' WHERE empleado_id = 4;
UPDATE Empleados SET nombre_empleado = 'Empleado5' WHERE empleado_id = 5;

UPDATE Empleados SET jefe_id = 2 WHERE empleado_id = 3;
UPDATE Empleados SET jefe_id = 3 WHERE empleado_id = 4;
UPDATE Empleados SET jefe_id = 4 WHERE empleado_id = 5;

select * from Clientes;
select * from Pedidos;
select * from Productos;
select * from DetallesPedido;
select * from Empleados;