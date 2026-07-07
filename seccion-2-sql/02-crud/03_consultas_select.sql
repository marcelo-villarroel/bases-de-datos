
SELECT "alumno_id", "nombre"
FROM "alumno";


SELECT c."curso_id", c."nombre" AS curso, p."nombre" AS profesor
FROM "curso" c
JOIN "profesor" p ON p."profesor_id" = c."profesor";


SELECT c."nombre" AS curso
FROM "alumno_curso" ac
JOIN "curso" c ON c."curso_id" = ac."curso"
WHERE ac."alumno" = 1;  


SELECT c."curso_id", c."nombre" AS curso, COUNT(ac."alumno") AS total_alumnos
FROM "curso" c
LEFT JOIN "alumno_curso" ac ON ac."curso" = c."curso_id"
GROUP BY c."curso_id", c."nombre"
ORDER BY c."curso_id";


SELECT c."nombre" AS curso, h."dia", h."hora_inicio", h."hora_fin", s."nombre" AS sala
FROM "horario" h
JOIN "curso" c ON c."curso_id" = h."curso"
JOIN "sala" s ON s."sala_id" = h."sala"
WHERE c."nombre" = 'Programación';


SELECT s."sala_id", s."nombre"
FROM "sala" s
WHERE s."sala_id" NOT IN (
  SELECT h."sala"
  FROM "horario" h
  WHERE h."dia" = 'Martes'
);
