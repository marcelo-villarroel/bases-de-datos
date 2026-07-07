
-- Autor
INSERT INTO "autor" ("id", "nombre") VALUES
(1, 'Gabriel García Márquez'),
(2, 'Isabel Allende'),
(3, 'Jorge Luis Borges'),
(4, 'Julio Cortázar'),
(5, 'Mario Vargas Llosa'),
(6, 'Adolfo Bioy Casares'),
(7, 'Umberto Eco'),
(8, 'J.K. Rowling');

-- Categoria
INSERT INTO "categoria" ("id", "nombre") VALUES
(1, 'Ficción'),
(2, 'Realismo Mágico'),
(3, 'Fantasía'),
(4, 'Ensayo'),
(5, 'Misterio');

-- Libro
INSERT INTO "libro" ("id", "titulo", "publicacion") VALUES
(1, 'Cien años de soledad', '1967-06-05'),
(2, 'La casa de los espíritus', '1982-01-01'),
(3, 'Ficciones', '1944-01-01'),
(4, 'Rayuela', '1963-01-01'),
(5, 'La ciudad y los perros', '1963-01-01'),
(6, 'Crónica de una muerte anunciada', '1981-01-01'),
(7, 'El nombre de la rosa', '1980-01-01'),
(8, 'Harry Potter y la piedra filosofal', '1997-06-26'),
(9, 'Antología de la literatura fantástica', '1940-01-01'),
(10, 'El Aleph', '1949-01-01');

-- Autor_libro (libro 9 tiene 2 autores: Borges y Bioy Casares)
INSERT INTO "autor_libro" ("autor", "libro") VALUES
(1, 1),
(1, 6),
(2, 2),
(3, 3),
(3, 9),
(6, 9),
(4, 4),
(5, 5),
(7, 7),
(8, 8),
(3, 10);

-- Categoria_libro
INSERT INTO "categoria_libro" ("categoria", "libro") VALUES
(2, 1),
(2, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(5, 7),
(3, 8),
(3, 9),
(1, 10);

-- Usuario
INSERT INTO "usuario" ("id", "nombre", "correo", "registro") VALUES
(1, 'Ana Torres', 'ana.torres@mail.com', '2022-01-15'),
(2, 'Bruno Silva', 'bruno.silva@mail.com', '2022-03-10'),
(3, 'Carla Muñoz', 'carla.munoz@mail.com', '2023-02-20'),
(4, 'Diego Rojas', 'diego.rojas@mail.com', '2023-05-05'),
(5, 'Elena Castro', 'elena.castro@mail.com', '2021-11-30'),
(6, 'Felipe Vidal', 'felipe.vidal@mail.com', '2024-01-10');

-- Prestamo
INSERT INTO "prestamo" ("usuario", "libro", "prestamo", "devolucion", "estado") VALUES
(1, 1, '2023-01-10', '2023-01-20', 'devuelto'),
(1, 4, '2023-06-01', NULL, 'retrasado'),
(1, 2, '2023-02-01', '2023-03-01', 'retrasado'),
(2, 2, '2023-03-15', '2023-04-10', 'retrasado'),
(2, 7, '2024-01-05', '2024-01-12', 'devuelto'),
(3, 3, '2023-07-20', NULL, 'retrasado'),
(3, 8, '2024-02-01', '2024-02-05', 'devuelto'),
(4, 9, '2022-05-01', '2022-05-25', 'retrasado'),
(4, 10, '2023-09-10', NULL, 'retrasado'),
(5, 5, '2021-12-01', '2021-12-10', 'devuelto'),
(5, 6, '2023-11-01', '2023-11-05', 'devuelto'),
(6, 1, '2024-03-01', NULL, 'prestado');

-- Multa
INSERT INTO "multa" ("monto", "pagado", "prestamo_usuario", "prestamo_libro") VALUES
(5000, FALSE, 2, 2),
(3000, TRUE, 4, 9),
(7000, FALSE, 1, 2),
(2000, FALSE, 4, 10),
(4500, TRUE, 3, 3);
