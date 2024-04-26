/*
jugador(pk:id_jugador, nombre, apellido1, apellido2, numero, fk:id_equipo)
equipo(pk:id_equipo, equipo_local, equipo_rival)
partido(pk:id_partido, min_jugadores, estadio, fecha, cambio, fk:id_equipo)
intervienen(posicion, fk:id_jugador, id_partido)
cambio(pk:id, fk:id_jugador, id_equipo, id_partido)
colegiado(pk:id_colegiado, nombre, apellido1, apellido2)
arbitran(pk:id, funcion_col, fk:id_partido, id_colegiado)
*/

# DROP DATABASE mundial;
CREATE DATABASE IF NOT EXISTS mundial;

USE mundial;

CREATE TABLE jugador(
	id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    id_equipo INT NOT NULL,
    numero INT NOT NULL
);

CREATE TABLE equipo(
	id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    equipo_local VARCHAR(50) NOT NULL,
    equipo_rival VARCHAR(50) NOT NULL
);

CREATE TABLE partido(
	id_partido INT AUTO_INCREMENT PRIMARY KEY,
    min_jugadores INT NOT NULL,
    estadio VARCHAR(20),
    fecha DATE NOT NULL,
    cambio INT NOT NULL,
    id_equipo INT NOT NULL,
    FOREIGN KEY(id_equipo) REFERENCES equipo(id_equipo)
);

CREATE TABLE intervienen(
    posicion VARCHAR(20) NOT NULL,
    id_jugador INT NOT NULL,
    id_partido INT NOT NULL,
    FOREIGN KEY(id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY(id_partido) REFERENCES partido(id_partido)
);

CREATE TABLE cambio(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    id_equipo INT NOT NULL,
    id_partido INT NOT NULL,
    FOREIGN KEY(id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY(id_equipo) REFERENCES equipo(id_equipo),
    FOREIGN KEY(id_partido) REFERENCES partido(id_partido)
);

CREATE TABLE colegiado(
	id_colegiado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50)
);

CREATE TABLE arbitran(
	id INT AUTO_INCREMENT PRIMARY KEY,
    funcion_col VARCHAR(20) NOT NULL,
    id_partido INT NOT NULL,
    id_colegiado INT NOT NULL,
    FOREIGN KEY(id_partido) REFERENCES partido(id_partido),
    FOREIGN KEY(id_colegiado) REFERENCES colegiado(id_colegiado)
);

ALTER TABLE jugador ADD
FOREIGN KEY(id_equipo) REFERENCES equipo(id_equipo);