#DROP DATABASE Biblioteca;
CREATE DATABASE Biblioteca;


USE Biblioteca;


CREATE TABLE Autores (
	AutorID INT AUTO_INCREMENT PRIMARY KEY,
	Nombre VARCHAR(255) NOT NULL
);


CREATE TABLE Editoriales (
	EditorialID INT AUTO_INCREMENT PRIMARY KEY,
	Nombre VARCHAR(255) NOT NULL
);


CREATE TABLE Generos (
	GeneroID INT AUTO_INCREMENT PRIMARY KEY,
	Nombre VARCHAR(255) NOT NULL
);


CREATE TABLE Libros (
	LibroID INT AUTO_INCREMENT,
	Titulo VARCHAR(255) NOT NULL,
	AutorID INT,
	EditorialID INT,
	GeneroID INT,
	AnioPublicacion INT,
	ISBN VARCHAR(13) NOT NULL,
	Stock INT NOT NULL,
    PRIMARY KEY(LibroID),
	FOREIGN KEY (AutorID) REFERENCES Autores(AutorID),
	FOREIGN KEY (EditorialID) REFERENCES Editoriales(EditorialID),
	FOREIGN KEY (GeneroID) REFERENCES Generos(GeneroID)
);


CREATE TABLE Prestamos (
	PrestamoID INT AUTO_INCREMENT,
	LibroID INT,
	FechaPrestamo DATE NOT NULL,
	FechaDevolucion DATE,
    PRIMARY KEY(PrestamoID),
	FOREIGN KEY (LibroID) REFERENCES Libros(LibroID)
);

CREATE TABLE Personas (
	PersonasID INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100),
	fk_LibroID_Libros INT NOT NULL,
    fk_PrestamosID_Prestamos INT NOT NULL,
    PRIMARY KEY(PersonasID),
	FOREIGN KEY(fk_LibroID_Libros) REFERENCES Libros(LibroID),
    FOREIGN KEY(fk_PrestamosID_Prestamos) REFERENCES Prestamos(PrestamoID)
);

INSERT INTO Autores (Nombre) VALUES
('Gabriel García Márquez'),
('J.K. Rowling'),
('George Orwell');


INSERT INTO Editoriales (Nombre) VALUES
('Penguin Random House'),
('Scholastic'),
('HarperCollins');


INSERT INTO Generos (Nombre) VALUES
('Ficción'),
('Fantasía'),
('Ciencia Ficción');


INSERT INTO Libros (Titulo, AutorID, EditorialID, GeneroID, AnioPublicacion, ISBN, Stock) VALUES
('Cien años de soledad', 1, 1, 1, 1967, '9780143039653', 10),
('Harry Potter y la piedra filosofal', 2, 2, 2, 1997, '9780439554930', 15),
('1984', 3, 3, 3, 1949, '9780451524935', 8);
SELECT * FROM Libros;


INSERT INTO Prestamos (LibroID, FechaPrestamo, FechaDevolucion) VALUES
(1, '2023-01-15', '2023-02-15'),
(2, '2023-02-10', '2023-03-10');
SELECT * FROM Prestamos;

INSERT INTO Personas VALUES
(1, "Mario", "Serradilla", "Penido", 1, 1),
(2, "Angel", "Garcia", "Ojeda", 2, 2);
SELECT * FROM Personas;

UPDATE Libros
SET Stock = 7
WHERE LibroID = 1;

