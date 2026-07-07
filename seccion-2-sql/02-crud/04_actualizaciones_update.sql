
UPDATE "alumno"
SET "nombre" = 'Javier Díaz Fernández'
WHERE "alumno_id" = 10;


UPDATE "sala"
SET "capacidad" = ROUND("capacidad" * 1.05)
WHERE "capacidad" < 30;


UPDATE "curso"
SET "profesor" = 3
WHERE "curso_id" = 6;


UPDATE "horario"
SET "hora_inicio" = "hora_inicio" + INTERVAL '15 minutes'
WHERE "curso" = (SELECT "curso_id" FROM "curso" WHERE "nombre" = 'Filosofía');
