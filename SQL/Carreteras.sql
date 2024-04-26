/*
carreteras(pk:nombre_carretera)
tramos(pk:id_tramos, construccion, nombre_tramo, fk:nombre_area, nombre_carretera)
areas(pk:nombre_area)
terminos(pk:id_terminos, km_entrada, km_salida)
pasa(fk:id_tramos, id_terminos)
*/

# DROP DATABASE carretera;
CREATE TABLE IF NOT EXISTS carretera;

USE carretera;

CREATE TABLE carreteras(
	nombre_carretera VARCHAR(15) PRIMARY KEY NOT NULL
);

CREATE TABLE tramos(
	id_tramos INT AUTO_INCREMENT PRIMARY KEY,
    construccion BOOLEAN,
    nombre_tramo VARCHAR(15),
    nombre_area VARCHAR(15) NOT NULL,
    nombre_carretera VARCHAR(15) NOT NULL,
    FOREIGN KEY(nombre_carretera) REFERENCES carreteras(nombre_carretera)
);

CREATE TABLE areas(
	nombre_area VARCHAR(15) PRIMARY KEY NOT NULL
);

CREATE TABLE terminos(
	id_terminos VARCHAR(50) PRIMARY KEY NOT NULL,
    km_entrada DOUBLE,
    km_salida DOUBLE
);

CREATE TABLE pasa(
	id_tramos INT NOT NULL,
    id_terminos VARCHAR(50)NOT NULL,
    FOREIGN KEY(id_tramos) REFERENCES tramos(id_tramos),
    FOREIGN KEY(id_terminos) REFERENCES terminos(id_terminos)
);

ALTER TABLE tramos ADD 
FOREIGN KEY(nombre_area) REFERENCES areas(nombre_area);
