-- ============================================================
-- 05_eliminaciones_delete.sql
-- Eliminaciones (DELETE)
-- ============================================================

-- Borrar la inscripción del alumno con id = 4 para el curso con id = 8.
DELETE FROM "alumno_curso"
WHERE "alumno" = 4 AND "curso" = 8;

-- Eliminar todos los horarios correspondientes al curso con id = 2.
DELETE FROM "horario"
WHERE "curso" = 2;

-- Suprimir todos los cursos impartidos por el profesor con id = 5.
-- Nota: alumno_curso no tiene ON DELETE CASCADE hacia curso, por lo que
-- primero se deben eliminar las inscripciones relacionadas
-- (horario y nota sí cascadean automáticamente).
DELETE FROM "alumno_curso"
WHERE "curso" IN (SELECT "curso_id" FROM "curso" WHERE "profesor" = 5);

DELETE FROM "curso"
WHERE "profesor" = 5;
