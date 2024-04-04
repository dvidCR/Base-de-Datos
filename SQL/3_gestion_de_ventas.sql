DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;

CREATE TABLE cliente (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);

CREATE TABLE comercial (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
comisión FLOAT
);

CREATE TABLE pedido (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
total DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_comercial INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES cliente(id),
FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);

-- ==================================================
-- Consultas multitabla (Composición interna)
-- ==================================================
-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado
-- algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repeti‑
-- dos.

SELECT DISTINCT(c.id), c.nombre, c.apellido1, c.apellido2
FROM cliente c
INNER JOIN pedido p
ON c.id = p.id_cliente
ORDER BY c.nombre ASC;


-- 2. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mos‑
-- trar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordena‑
-- dos alfabéticamente.

SELECT *
FROM cliente c
INNER JOIN pedido p
ON c.id = p.id_cliente
ORDER BY c.nombre ASC;

-- 3. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado
-- debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los
-- comerciales ordenados alfabéticamente.
-- 4. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los
-- datos de los comerciales asociados a cada pedido.

SELECT *
FROM pedido p
INNER JOIN cliente c
ON p.id_cliente = c.id
INNER JOIN comercial co
ON p.id_comercial = co.id;

-- Ejercicio Complementario de pillar de los tres todo el contenido de la tabla pedido
SELECT *
FROM pedido p
RIGHT JOIN cliente c
ON p.id_cliente = c.id
RIGHT JOIN comercial co
ON p.id_comercial = co.id;

-- 5. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad
-- esté entre 300 € y 1000 €.
-- 6. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado
-- por María Santana Moreno.
-- 7. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sá
-- ez Vega.
-- ==================================================
-- Consultas multitabla (Composición externa)
-- ==================================================
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
-- 1. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este lista‑
-- do también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado
-- alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.

SELECT *
FROM cliente c
LEFT JOIN pedido p
ON c.id = p.id_cliente
ORDER BY c.apellido1 ASC;

-- 2. Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este
-- listado también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar
-- ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
-- José Juan Sánchez Hernández 16
-- Ejercicios. Realización de consultas SQL Curso 2023/2024
-- 3. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
-- 4. Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
-- 5. Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han
-- participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. En en
-- listado deberá diferenciar de algún modo los clientes y los comerciales.

SELECT cl.nombre AS nombre_cliente, cl.apellido1, cl.apellido2, co.nombre AS nombre_comercial, co.apellido1, co.apellido2
FROM cliente cl
LEFT JOIN pedido p
ON cl.id = p.id_cliente
RIGHT JOIN comercial co
ON p.id_comercial = co.id
WHERE cl.id IS NULL OR co.id IS NULL
ORDER BY cl.apellido1 ASC;

-- 6. ¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN?
-- Justifique su respuesta.
-- ==================================================
-- Consultas resumen
-- ==================================================
-- 1. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
-- 2. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
-- 3. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
-- 4. Calcula el número total de clientes que aparecen en la tabla cliente.
-- 5. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
-- 6. Calcula cuál es la menor cantidad que aparece en la tabla pedido.
-- 7. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla
-- cliente.
-- 8. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clien‑
-- tes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo
-- día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un
-- cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor
-- de la cantidad.
-- 9. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los
-- clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de
-- 2000 €.
-- 10. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha
-- 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
-- 11. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que
-- ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado nin‑
-- gún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos
-- realizados es 0.
-- 12. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que
-- ha realizado cada uno de clientes durante el año 2017.
-- 13. Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxi‑
-- ma cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clien‑
-- tes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es
-- 0. Puede hacer uso de la función IFNULL.
-- José Juan Sánchez Hernández 17
-- Ejercicios. Realización de consultas SQL Curso 2023/2024
-- 14. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
-- 15. Devuelve el número total de pedidos que se han realizado cada año.
-- ======================================================
-- Subconsultas - Con operadores básicos de comparación
-- ======================================================
-- 1. Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
-- 2. Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
-- 3. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
-- 4. Devuelve lafecha y la cantidad del pedido demenor valor realizado por el clientePepe Ruiz Santana.
-- 5. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un
-- pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante
-- ese mismo año.
-- ======================================================
-- Subconsultas con ALL y ANY
-- ======================================================
-- 6. Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.
-- 7. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).
-- 8. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).
-- ======================================================
-- Subconsultas con IN y NOT IN
-- ======================================================
-- 9. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
-- 10. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
-- ======================================================
-- Subconsultas con EXISTS y NOT EXISTS
-- ======================================================
-- 11. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT
-- EXISTS).
-- 12. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT
-- EXISTS).
