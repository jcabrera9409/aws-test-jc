CREATE DATABASE IF NOT EXISTS `testdb`;

USE testdb;

CREATE TABLE `tbl_alumno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `promedio` float NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `tbl_nota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nota` int NOT NULL,
  `id_alumno` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7sduk8ryr5ifaxx92u3b8918p` (`id_alumno`),
  CONSTRAINT `FK7sduk8ryr5ifaxx92u3b8918p` FOREIGN KEY (`id_alumno`) REFERENCES `tbl_alumno` (`id`)
);

INSERT INTO tbl_alumno (id, nombre, promedio) VALUES
(1, 'Juan Pérez', 10),
(2, 'María López', 12),
(3, 'Carlos Gómez', 14),
(4, 'Ana Torres', 8),
(5, 'Luis Fernández', 15),
(6, 'Elena Ramírez', 11),
(7, 'Ricardo Medina', 9),
(8, 'Sofía Herrera', 13),
(9, 'Daniel Ortega', 10),
(10, 'Gabriela Chávez', 16),
(11, 'José Martínez', 7),
(12, 'Patricia Rojas', 14),
(13, 'Fernando Castillo', 12),
(14, 'Laura Méndez', 9),
(15, 'Alejandro Soto', 10),
(16, 'Natalia Guzmán', 11),
(17, 'Hugo Navarro', 13),
(18, 'Camila Paredes', 15),
(19, 'Pedro Vargas', 14),
(20, 'Rosa Delgado', 10);

INSERT INTO tbl_nota (nota, id_alumno) VALUES
(10, 1), (12, 1), (8, 1), (10, 1), (10, 1),
(14, 2), (15, 2), (13, 2), (12, 2), (10, 2),
(16, 3), (12, 3), (14, 3), (15, 3), (13, 3),
(8, 4), (7, 4), (10, 4), (9, 4), (6, 4),
(20, 5), (18, 5), (16, 5), (15, 5), (16, 5),
(11, 6), (12, 6), (10, 6), (11, 6), (11, 6),
(9, 7), (10, 7), (8, 7), (9, 7), (10, 7),
(13, 8), (14, 8), (12, 8), (13, 8), (13, 8),
(10, 9), (9, 9), (11, 9), (10, 9), (10, 9),
(18, 10), (16, 10), (15, 10), (17, 10), (14, 10),
(7, 11), (6, 11), (8, 11), (7, 11), (7, 11),
(14, 12), (13, 12), (12, 12), (14, 12), (17, 12),
(12, 13), (11, 13), (12, 13), (14, 13), (11, 13),
(9, 14), (8, 14), (10, 14), (9, 14), (9, 14),
(10, 15), (11, 15), (9, 15), (10, 15), (10, 15),
(11, 16), (12, 16), (10, 16), (11, 16), (11, 16),
(13, 17), (12, 17), (14, 17), (13, 17), (12, 17),
(15, 18), (16, 18), (14, 18), (15, 18), (15, 18),
(14, 19), (15, 19), (13, 19), (14, 19), (14, 19),
(10, 20), (11, 20), (9, 20), (10, 20), (10, 20);