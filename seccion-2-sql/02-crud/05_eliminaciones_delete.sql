
DELETE FROM "alumno_curso"
WHERE "alumno" = 4 AND "curso" = 8;


DELETE FROM "horario"
WHERE "curso" = 2;


DELETE FROM "alumno_curso"
WHERE "curso" IN (SELECT "curso_id" FROM "curso" WHERE "profesor" = 5);

DELETE FROM "curso"
WHERE "profesor" = 5;
