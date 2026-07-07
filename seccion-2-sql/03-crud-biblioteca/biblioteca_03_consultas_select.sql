-- ============================================================
-- 03_consultas_select.sql
-- Consultas SELECT
-- ============================================================

-- Obtener los usuarios con más préstamos retrasados.
SELECT u."id", u."nombre", COUNT(*) AS total_retrasados
FROM "prestamo" p
JOIN "usuario" u ON u."id" = p."usuario"
WHERE p."estado" = 'retrasado'
GROUP BY u."id", u."nombre"
ORDER BY total_retrasados DESC;

-- Libros con más de 1 autor.
SELECT l."id", l."titulo", COUNT(al."autor") AS total_autores
FROM "libro" l
JOIN "autor_libro" al ON al."libro" = l."id"
GROUP BY l."id", l."titulo"
HAVING COUNT(al."autor") > 1;

-- Total de multas por usuario.
SELECT u."id", u."nombre", COALESCE(SUM(m."monto"), 0) AS total_multas
FROM "usuario" u
LEFT JOIN "multa" m ON m."prestamo_usuario" = u."id"
GROUP BY u."id", u."nombre"
ORDER BY total_multas DESC;

-- Libros por categoría y año de publicación.
SELECT c."nombre" AS categoria, EXTRACT(YEAR FROM l."publicacion") AS anio, COUNT(*) AS total_libros
FROM "libro" l
JOIN "categoria_libro" cl ON cl."libro" = l."id"
JOIN "categoria" c ON c."id" = cl."categoria"
GROUP BY c."nombre", EXTRACT(YEAR FROM l."publicacion")
ORDER BY c."nombre", anio;

-- Libros prestados en el año 2023.
SELECT DISTINCT l."id", l."titulo"
FROM "libro" l
JOIN "prestamo" p ON p."libro" = l."id"
WHERE EXTRACT(YEAR FROM p."prestamo") = 2023;
