#DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;

CREATE TABLE departamento (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  id_departamento INT UNSIGNED,
  FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

-- Ejercicios 1.2.3

-- Ej1

SELECT apellido1 FROM empleado;

-- Ej2

SELECT DISTINCT apellido1 FROM empleado;

-- Ej3

-- SHOW COLUMNS FROM empleado;

-- Ej4

SELECT nombre, apellido1, apellido2 FROM empleado;

-- Ej5

SELECT DISTINCT id_departamento FROM empleado;

-- Ej6

SELECT DISTINCT id_departamento FROM empleado;

-- Ej7

SELECT CONCAT(nombre, ' ', apellido1, ' ', apellido2) AS nombre_completo FROM empleado;

-- Ej8

SELECT UPPER(CONCAT(nombre, ' ', apellido1, ' ', apellido2)) AS nombre_completo_mayus FROM empleado;

-- Ej9

SELECT LOWER(CONCAT(nombre, ' ', apellido1, ' ', apellido2)) AS nombre_completo_minus FROM empleado;

-- Ej10

SELECT id, SUBSTRING(nif, 1, 8) AS digitos_nif, SUBSTRING(nif, 9, 1) AS letra_nif FROM empleado;

-- Ej11

SELECT nombre, presupuesto, gastos AS presupuesto_actual
FROM departamento;

-- Ej12

SELECT nombre, presupuesto, gastos AS presupuesto_actual
FROM departamento
ORDER BY presupuesto_actual ASC;

-- Ej13

SELECT nombre FROM departamento
ORDER BY nombre ASC;

-- Ej14

SELECT nombre FROM departamento
ORDER BY nombre DESC;

-- Ej15

SELECT nombre, presupuesto
FROM departamento
ORDER BY presupuesto DESC
LIMIT 3;

-- Ej16

SELECT nombre_departamento, presupuesto
FROM departamento
ORDER BY presupuesto ASC
LIMIT 3;

-- Ej17

SELECT nombre_departamento, gastos
FROM departamento
ORDER BY gastos DESC
LIMIT 2;

-- Ej18

SELECT nombre_departamento, gastos
FROM departamento
ORDER BY gastos ASC
LIMIT 2;

-- Ej19

SELECT * FROM empleado
LIMIT 2 OFFSET 2;

-- Ej20

SELECT nombre_departamento, presupuesto
FROM departamento
WHERE presupuesto >= 150000;

-- Ej21

SELECT nombre_departamento, gastos
FROM departamento
WHERE gastos < 5000;

-- Ej22

SELECT nombre_departamento, presupuesto
FROM departamento
WHERE presupuesto > 100000 AND presupuesto < 200000;

-- Ej23

SELECT nombre_departamento
FROM departamento
WHERE NOT (presupuesto >= 100000 AND presupuesto <= 200000);

-- Ej24

SELECT nombre_departamento
FROM departamento
WHERE presupuesto BETWEEN 100000 AND 200000;

-- Ej25

SELECT nombre_departamento
FROM departamento
WHERE NOT (presupuesto BETWEEN 100000 AND 200000);

-- Ej26

SELECT nombre_departamento, gastos, presupuesto
FROM departamento
WHERE gastos > presupuesto;

-- Ej27

SELECT nombre_departamento, gastos, presupuesto
FROM departamento
WHERE gastos < presupuesto;

-- Ej28

SELECT nombre_departamento, gastos, presupuesto
FROM departamento
WHERE gastos = presupuesto;

-- Ej29

SELECT * FROM empleado
WHERE apellido2 IS NULL;

-- Ej30

SELECT * FROM empleado
WHERE apellido2 IS NOT NULL;

-- Ej31

SELECT * FROM empleado
WHERE apellido2 = 'López';

-- Ej32

SELECT * FROM empleado
WHERE apellido2 IN ('Díaz', 'Moreno');

-- Ej33

SELECT * FROM empleado
WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno';

-- Ej34

SELECT nombre, apellido1, nif
FROM empleado
WHERE id_departamento = 3;

-- Ej35

SELECT nombre, apellido1, nif
FROM empleado
WHERE id_departamento IN (2, 4, 5);

