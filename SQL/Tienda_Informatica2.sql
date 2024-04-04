DROP DATABASE IF EXISTS tienda2;
CREATE DATABASE tienda2 CHARACTER SET utf8mb4;
USE tienda2;

CREATE TABLE fabricante (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
id_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

-- ===============================================
--  Consultas resumen
-- ===============================================
-- 1. Calcula el número total de productos que hay en la tabla productos.

SELECT COUNT(nombre) AS cantidad_productos 
FROM producto;

-- 2. Calcula el número total de fabricantes que hay en la tabla fabricante.

SELECT COUNT(nombre) AS cantidad_fabricantes 
FROM fabricante;

-- 3. Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.

SELECT COUNT(DISTINCT id_fabricante) AS distintos_fabricantes 
FROM producto;

-- 4. Calcula la media del precio de todos los productos.

SELECT AVG(precio) AS media_precios 
FROM producto;

-- 5. Calcula el precio más barato de todos los productos.

SELECT precio AS mas_barato 
FROM producto 
ORDER BY precio ASC 
LIMIT 1;

-- 6. Calcula el precio más caro de todos los productos.

SELECT precio AS mas_caro
FROM producto 
ORDER BY precio DESC 
LIMIT 1;

-- 7. Lista el nombre y el precio del producto más barato.

SELECT nombre, precio
FROM producto 
ORDER BY precio ASC 
LIMIT 1;

-- 8. Lista el nombre y el precio del producto más caro.

SELECT nombre, precio
FROM producto 
ORDER BY precio DESC 
LIMIT 1;

-- 9. Calcula la suma de los precios de todos los productos.

SELECT SUM(precio) AS suma_productos 
FROM producto;

-- 10. Calcula el número de productos que tiene el fabricante Asus.

SELECT COUNT(producto.nombre) 
FROM producto, fabricante 
WHERE producto.id_fabricante = fabricante.id AND fabricante.nombre = "Asus";

SELECT COUNT(a.nombre) 
FROM producto a
INNER JOIN fabricante b
ON a.id_fabricante = b.id
WHERE b.nombre = "Asus";

-- 11. Calcula la media del precio de todos los productos del fabricante Asus.

SELECT AVG(producto.precio) 
FROM producto, fabricante 
WHERE producto.id_fabricante = fabricante.id AND fabricante.nombre = "Asus";

SELECT AVG(a.precio) 
FROM producto a
INNER JOIN fabricante b
ON a.id_fabricante = b.id
WHERE b.nombre = "Asus";

-- 12. Calcula el precio más barato de todos los productos del fabricante Asus.

SELECT producto.precio
FROM producto, fabricante 
WHERE producto.id_fabricante = fabricante.id AND fabricante.nombre = "Asus"
ORDER BY precio ASC 
LIMIT 1;

SELECT a.precio
FROM producto a
INNER JOIN fabricante b
ON a.id_fabricante = b.id
WHERE b.nombre = "Asus"
ORDER BY precio ASC 
LIMIT 1;

-- 13. Calcula el precio más caro de todos los productos del fabricante Asus.

SELECT producto.precio
FROM producto, fabricante 
WHERE producto.id_fabricante = fabricante.id AND fabricante.nombre = "Asus"
ORDER BY precio DESC 
LIMIT 1;

SELECT a.precio
FROM producto a
INNER JOIN fabricante b
ON a.id_fabricante = b.id
WHERE b.nombre = "Asus"
ORDER BY precio DESC 
LIMIT 1;

-- 14. Calcula la suma de todos los productos del fabricante Asus.

SELECT SUM(producto.precio) 
FROM producto, fabricante 
WHERE producto.id_fabricante = fabricante.id AND fabricante.nombre = "Asus";

SELECT SUM(a.precio) 
FROM producto a
INNER JOIN fabricante b
ON a.id_fabricante = b.id
WHERE b.nombre = "Asus";

-- 15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fa‑
-- bricante Crucial.

SELECT MAX(producto.precio) 
FROM producto, fabricante 
WHERE producto.id_fabricante = fabricante.id AND fabricante.nombre = "Crucial";

SELECT MIN(a.precio) 
FROM producto a
INNER JOIN fabricante b
ON a.id_fabricante = b.id
WHERE b.nombre = "Crucial";

SELECT AVG(producto.precio) 
FROM producto, fabricante 
WHERE producto.id_fabricante = fabricante.id AND fabricante.nombre = "Crucial";

SELECT COUNT(a.precio) 
FROM producto a
INNER JOIN fabricante b
ON a.id_fabricante = b.id
WHERE b.nombre = "Crucial";

-- 16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe
-- incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el
-- nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendente‑
-- mente por el número de productos.

SELECT b.nombre, COUNT(a.id) AS num_productos
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
GROUP BY b.nombre 
ORDER BY num_productos DESC;

-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes.
-- El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

SELECT b.nombre, MAX(a.precio) AS precio_max
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
GROUP BY b.nombre;

SELECT b.nombre, MIN(a.precio) AS precio_min
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
GROUP BY b.nombre;

SELECT b.nombre, AVG(a.precio) AS precio_medio
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
GROUP BY b.nombre;

-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes
-- que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el
-- identificador del fabricante es suficiente.

SELECT b.nombre, MAX(a.precio) AS precio_max
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio > 200
GROUP BY b.nombre;

SELECT b.nombre, MIN(a.precio) AS precio_min
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio > 200
GROUP BY b.nombre;

SELECT b.nombre, AVG(a.precio) AS precio_medio
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio > 200
GROUP BY b.nombre;

SELECT b.nombre, COUNT(a.id) AS num_productos
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio > 200
GROUP BY b.nombre;

-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el
-- número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario
-- mostrar el nombre del fabricante.

SELECT b.nombre, MAX(a.precio) AS precio_max
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio > 200
GROUP BY b.nombre;

SELECT b.nombre, MIN(a.precio) AS precio_min
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio > 200
GROUP BY b.nombre;

SELECT b.nombre, AVG(a.precio) AS precio_medio
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio > 200
GROUP BY b.nombre;

SELECT b.nombre, COUNT(a.id) AS num_productos
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio > 200
GROUP BY b.nombre;

-- 20. Calcula el número de productos que tienen un precio mayor o igual a 180€.

SELECT COUNT(a.id) AS num_productos
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio >= 180;

-- 21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.

SELECT b.nombre, COUNT(a.id) AS num_productos
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio >= 180
GROUP BY b.nombre;

-- 22. Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabri‑
-- cante.

SELECT b.id, AVG(a.precio) AS num_productos
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
GROUP BY b.id;

-- 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.

SELECT b.nombre, AVG(a.precio) AS num_productos
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
GROUP BY b.nombre;

-- 24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.

SELECT b.nombre, a.precio
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio >= 150;

-- 25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.

SELECT b.nombre, a.id_fabricante AS productos_distintos_fabricante
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
GROUP BY b.id
HAVING COUNT(a.id) >= 2	;

-- 26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con
-- un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen
-- productos que cumplan la condición.

SELECT DISTINCT(b.nombre)
FROM producto a
RIGHT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio >= 220;

-- 27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con
-- un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si
-- hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el
-- listado con un valor igual a 0 en el número de productos.

SELECT b.nombre, a.nombre, a.precio
FROM producto a
LEFT JOIN fabricante b
ON a.id_fabricante = b.id
WHERE a.precio >= 220;  -- No soy capaz de sacar que los demas sean 0.

-- 28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos
-- es superior a 1000 €.

SELECT b.nombre, a.id_fabricante, SUM(a.precio) AS Precio
FROM producto a
INNER JOIN fabricante b
ON a.id_fabricante = b.id
WHERE Precio > 1000
GROUP BY a.id_fabricante;

-- 29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe
-- tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar
-- ordenado alfabéticamente de menor a mayor por el nombre del fabricante.

