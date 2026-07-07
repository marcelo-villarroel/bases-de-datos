
SELECT u."id", u."nombre", COUNT(*) AS total_retrasados
FROM "prestamo" p
JOIN "usuario" u ON u."id" = p."usuario"
WHERE p."estado" = 'retrasado'
GROUP BY u."id", u."nombre"
ORDER BY total_retrasados DESC;


SELECT l."id", l."titulo", COUNT(al."autor") AS total_autores
FROM "libro" l
JOIN "autor_libro" al ON al."libro" = l."id"
GROUP BY l."id", l."titulo"
HAVING COUNT(al."autor") > 1;


SELECT u."id", u."nombre", COALESCE(SUM(m."monto"), 0) AS total_multas
FROM "usuario" u
LEFT JOIN "multa" m ON m."prestamo_usuario" = u."id"
GROUP BY u."id", u."nombre"
ORDER BY total_multas DESC;


SELECT c."nombre" AS categoria, EXTRACT(YEAR FROM l."publicacion") AS anio, COUNT(*) AS total_libros
FROM "libro" l
JOIN "categoria_libro" cl ON cl."libro" = l."id"
JOIN "categoria" c ON c."id" = cl."categoria"
GROUP BY c."nombre", EXTRACT(YEAR FROM l."publicacion")
ORDER BY c."nombre", anio;


SELECT DISTINCT l."id", l."titulo"
FROM "libro" l
JOIN "prestamo" p ON p."libro" = l."id"
WHERE EXTRACT(YEAR FROM p."prestamo") = 2023;
