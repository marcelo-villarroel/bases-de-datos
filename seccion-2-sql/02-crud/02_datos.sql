
INSERT INTO "profesor" ("profesor_id", "nombre") VALUES
(1, 'Prof. Juan Hernández'),
(2, 'Prof. Elena Ruiz'),
(3, 'Prof. Andrés Jiménez'),
(4, 'Prof. Carmen Vargas'),
(5, 'Prof. Sergio Pérez');

-- Alumno
INSERT INTO "alumno" ("alumno_id", "nombre") VALUES
(1, 'Juan Pérez'),
(2, 'María González'),
(3, 'Carlos López'),
(4, 'Ana Martínez'),
(5, 'Luis Rodríguez'),
(6, 'Pedro Sánchez'),
(7, 'Laura García'),
(8, 'José Fernández'),
(9, 'Marta Gómez'),
(10, 'Javier Díaz'),
(11, 'Sofía Valdivia'),
(12, 'Tomás Riquelme'),
(13, 'Isidora Fuentes'),
(14, 'Benjamín Toro'),
(15, 'Josefa Lagos'),
(16, 'Lucas Araya'),
(17, 'Renata Palma'),
(18, 'Martín Navarrete'),
(19, 'Sofía Valdivia'),
(20, 'Tomás Riquelme'),
(21, 'Isidora Fuentes'),
(22, 'Benjamín Toro'),
(23, 'Josefa Lagos'),
(24, 'Lucas Araya'),
(25, 'Renata Palma'),
(26, 'Martín Navarrete');

-- Curso
INSERT INTO "curso" ("curso_id", "nombre", "profesor") VALUES
(1, 'Matemáticas', 1),
(2, 'Física', 2),
(3, 'Química', 3),
(4, 'Literatura', 4),
(5, 'Historia', 5),
(6, 'Biología', 1),
(7, 'Geografía', 2),
(8, 'Filosofía', 3),
(9, 'Inglés', 4),
(10, 'Programación', 5),
(11, 'Fotografía Digital', 1),
(12, 'Inteligencia Artificial', 2),
(13, 'Diseño UX/UI', 3),
(14, 'Producción Musical', 4),
(15, 'Taller de Escritura', 5),
(16, 'Cómic y Narrativa', 1),
(17, 'Iniciación al Japonés', 2),
(18, 'Introducción a Blockchain', 3),
(19, 'Fotografía Digital', 1),
(20, 'Inteligencia Artificial', 2),
(21, 'Diseño UX/UI', 3),
(22, 'Producción Musical', 4),
(23, 'Taller de Escritura', 5),
(24, 'Cómic y Narrativa', 1),
(25, 'Iniciación al Japonés', 2),
(26, 'Introducción a Blockchain', 3);

-- Alumno_curso
INSERT INTO "alumno_curso" ("alumno", "curso") VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 1),
(6, 4),
(7, 2),
(7, 6),
(8, 3),
(8, 7),
(9, 5),
(9, 8),
(10, 9);

-- Sala
INSERT INTO "sala" ("sala_id", "nombre", "capacidad") VALUES
(1, 'Sala A', 30),
(2, 'Sala B', 25),
(3, 'Sala C', 20),
(4, 'Sala D', 35),
(5, 'Sala E', 40);

-- Horario
INSERT INTO "horario" ("horario_id", "dia", "hora_inicio", "hora_fin", "sala", "curso") VALUES
(1, 'Lunes', '08:00:00', '10:00:00', 1, 1),
(2, 'Lunes', '10:00:00', '12:00:00', 2, 2),
(3, 'Martes', '08:00:00', '10:00:00', 3, 3),
(4, 'Martes', '10:00:00', '12:00:00', 4, 4),
(5, 'Miércoles', '08:00:00', '10:00:00', 5, 5),
(6, 'Miércoles', '10:00:00', '12:00:00', 1, 6),
(7, 'Jueves', '08:00:00', '10:00:00', 2, 7),
(8, 'Jueves', '10:00:00', '12:00:00', 3, 8),
(9, 'Viernes', '08:00:00', '10:00:00', 4, 9),
(10, 'Viernes', '10:00:00', '12:00:00', 5, 10);

-- Nota (tabla nueva: datos de ejemplo consistentes con alumno_curso)
INSERT INTO "nota" ("evaluacion", "nota", "fecha", "alumno", "curso") VALUES
('Prueba 1', 6.5, '2025-03-20', 1, 1),
('Prueba 2', 5.8, '2025-04-10', 1, 1),
('Prueba 1', 4.9, '2025-03-21', 1, 2),
('Prueba 1', 7.0, '2025-03-22', 2, 3),
('Prueba 1', 6.2, '2025-03-23', 2, 4),
('Prueba 1', 5.5, '2025-03-24', 3, 5),
('Prueba 1', 6.8, '2025-03-25', 3, 6),
('Prueba 1', 4.5, '2025-03-26', 4, 7),
('Prueba 1', 6.0, '2025-03-27', 4, 8),
('Prueba 1', 5.9, '2025-03-28', 5, 9),
('Prueba 1', 6.7, '2025-03-29', 5, 10),
('Prueba 1', 5.2, '2025-03-30', 6, 1),
('Prueba 1', 6.4, '2025-03-31', 6, 4),
('Prueba 1', 7.0, '2025-04-01', 7, 2),
('Prueba 1', 5.0, '2025-04-02', 7, 6),
('Prueba 1', 6.1, '2025-04-03', 8, 3),
('Prueba 1', 5.7, '2025-04-04', 8, 7),
('Prueba 1', 6.9, '2025-04-05', 9, 5),
('Prueba 1', 4.8, '2025-04-06', 9, 8),
('Prueba 1', 6.3, '2025-04-07', 10, 9);
