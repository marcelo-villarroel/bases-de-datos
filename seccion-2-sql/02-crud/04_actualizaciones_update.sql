-- ============================================================
-- 04_actualizaciones_update.sql
-- Actualizaciones (UPDATE)
-- ============================================================

-- Cambiar el nombre de un alumno cuyo id = 10 a "Javier Díaz Fernández".
UPDATE "alumno"
SET "nombre" = 'Javier Díaz Fernández'
WHERE "alumno_id" = 10;

-- Aumentar en un 5% la capacidad de todas las salas con capacidad menor a 30.
UPDATE "sala"
SET "capacidad" = ROUND("capacidad" * 1.05)
WHERE "capacidad" < 30;

-- Reasignar el curso con id = 6 para que esté a cargo del profesor con id = 3.
UPDATE "curso"
SET "profesor" = 3
WHERE "curso_id" = 6;

-- Ajustar la hora de inicio de las clases de 'Filosofía' sumando 15 minutos.
UPDATE "horario"
SET "hora_inicio" = "hora_inicio" + INTERVAL '15 minutes'
WHERE "curso" = (SELECT "curso_id" FROM "curso" WHERE "nombre" = 'Filosofía');
