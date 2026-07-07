
CREATE VIEW "vista_global_biblioteca" AS
SELECT
  l."id"          AS libro_id,
  l."titulo",
  l."publicacion",
  a."id"          AS autor_id,
  a."nombre"      AS autor,
  c."id"          AS categoria_id,
  c."nombre"      AS categoria,
  u."id"          AS usuario_id,
  u."nombre"      AS usuario,
  u."correo",
  p."prestamo"    AS fecha_prestamo,
  p."devolucion",
  p."estado",
  m."id"          AS multa_id,
  m."monto",
  m."pagado"
FROM "libro" l
LEFT JOIN "autor_libro" al ON al."libro" = l."id"
LEFT JOIN "autor" a ON a."id" = al."autor"
LEFT JOIN "categoria_libro" cl ON cl."libro" = l."id"
LEFT JOIN "categoria" c ON c."id" = cl."categoria"
LEFT JOIN "prestamo" p ON p."libro" = l."id"
LEFT JOIN "usuario" u ON u."id" = p."usuario"
LEFT JOIN "multa" m ON m."prestamo_usuario" = p."usuario" AND m."prestamo_libro" = p."libro";

