
CREATE VIEW "vista_global_academica" AS
SELECT
  a."alumno_id",
  a."nombre"      AS alumno,
  c."curso_id",
  c."nombre"      AS curso,
  p."profesor_id",
  p."nombre"      AS profesor,
  h."horario_id",
  h."dia",
  h."hora_inicio",
  h."hora_fin",
  s."sala_id",
  s."nombre"      AS sala,
  s."capacidad",
  n."nota_id",
  n."evaluacion",
  n."nota",
  n."fecha"       AS fecha_evaluacion
FROM "alumno_curso" ac
JOIN "alumno"  a ON a."alumno_id" = ac."alumno"
JOIN "curso"   c ON c."curso_id"  = ac."curso"
JOIN "profesor" p ON p."profesor_id" = c."profesor"
LEFT JOIN "horario" h ON h."curso" = c."curso_id"
LEFT JOIN "sala"    s ON s."sala_id" = h."sala"
LEFT JOIN "nota"    n ON n."alumno" = a."alumno_id" AND n."curso" = c."curso_id";


