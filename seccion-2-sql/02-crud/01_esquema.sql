-- ============================================================
-- 01_esquema.sql
-- Creación de tablas, índices y llaves foráneas del modelo académico
-- ============================================================

CREATE TABLE "alumno" (
  "alumno_id" SERIAL PRIMARY KEY,
  "nombre" TEXT NOT NULL
);

CREATE TABLE "profesor" (
  "profesor_id" SERIAL PRIMARY KEY,
  "nombre" TEXT NOT NULL
);

CREATE TABLE "curso" (
  "curso_id" SERIAL PRIMARY KEY,
  "nombre" TEXT NOT NULL,
  "profesor" INTEGER NOT NULL
);

CREATE INDEX "idx_curso__profesor" ON "curso" ("profesor");

ALTER TABLE "curso" ADD CONSTRAINT "fk_curso__profesor"
  FOREIGN KEY ("profesor") REFERENCES "profesor" ("profesor_id") ON DELETE CASCADE;

CREATE TABLE "alumno_curso" (
  "alumno" INTEGER NOT NULL,
  "curso" INTEGER NOT NULL,
  PRIMARY KEY ("alumno", "curso")
);

CREATE INDEX "idx_alumno_curso" ON "alumno_curso" ("curso");

ALTER TABLE "alumno_curso" ADD CONSTRAINT "fk_alumno_curso__alumno"
  FOREIGN KEY ("alumno") REFERENCES "alumno" ("alumno_id");

ALTER TABLE "alumno_curso" ADD CONSTRAINT "fk_alumno_curso__curso"
  FOREIGN KEY ("curso") REFERENCES "curso" ("curso_id");

CREATE TABLE "nota" (
  "nota_id" SERIAL PRIMARY KEY,
  "evaluacion" TEXT NOT NULL,
  "nota" DECIMAL(3, 1) NOT NULL,
  "fecha" DATE NOT NULL,
  "alumno" INTEGER NOT NULL,
  "curso" INTEGER NOT NULL
);

CREATE INDEX "idx_nota__alumno" ON "nota" ("alumno");
CREATE INDEX "idx_nota__curso" ON "nota" ("curso");

ALTER TABLE "nota" ADD CONSTRAINT "fk_nota__alumno"
  FOREIGN KEY ("alumno") REFERENCES "alumno" ("alumno_id") ON DELETE CASCADE;

ALTER TABLE "nota" ADD CONSTRAINT "fk_nota__curso"
  FOREIGN KEY ("curso") REFERENCES "curso" ("curso_id") ON DELETE CASCADE;

CREATE TABLE "sala" (
  "sala_id" SERIAL PRIMARY KEY,
  "nombre" TEXT NOT NULL,
  "capacidad" INTEGER NOT NULL
);

CREATE TABLE "horario" (
  "horario_id" SERIAL PRIMARY KEY,
  "dia" TEXT NOT NULL,
  "hora_inicio" TIME NOT NULL,
  "hora_fin" TIME NOT NULL,
  "sala" INTEGER NOT NULL,
  "curso" INTEGER NOT NULL
);

CREATE INDEX "idx_horario__curso" ON "horario" ("curso");
CREATE INDEX "idx_horario__sala" ON "horario" ("sala");

ALTER TABLE "horario" ADD CONSTRAINT "fk_horario__curso"
  FOREIGN KEY ("curso") REFERENCES "curso" ("curso_id") ON DELETE CASCADE;

ALTER TABLE "horario" ADD CONSTRAINT "fk_horario__sala"
  FOREIGN KEY ("sala") REFERENCES "sala" ("sala_id") ON DELETE CASCADE;
