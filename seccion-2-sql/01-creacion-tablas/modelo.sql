-- ************************************************************
-- modelo.sql
-- Modelo Académico
-- ************************************************************

DROP TABLE IF EXISTS horario CASCADE;
DROP TABLE IF EXISTS alumno_curso CASCADE;
DROP TABLE IF EXISTS curso CASCADE;
DROP TABLE IF EXISTS alumno CASCADE;
DROP TABLE IF EXISTS profesor CASCADE;
DROP TABLE IF EXISTS sala CASCADE;

--------------------------------------------------------
-- PROFESOR
--------------------------------------------------------
CREATE TABLE profesor (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

--------------------------------------------------------
-- ALUMNO
--------------------------------------------------------
CREATE TABLE alumno (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

--------------------------------------------------------
-- SALA
--------------------------------------------------------
CREATE TABLE sala (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    capacidad INTEGER NOT NULL
);

--------------------------------------------------------
-- CURSO
--------------------------------------------------------
CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    profesor INTEGER NOT NULL,

    CONSTRAINT fk_curso_profesor
        FOREIGN KEY (profesor)
        REFERENCES profesor(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_curso_profesor
ON curso(profesor);

--------------------------------------------------------
-- ALUMNO_CURSO
--------------------------------------------------------
CREATE TABLE alumno_curso (
    alumno INTEGER NOT NULL,
    curso INTEGER NOT NULL,

    PRIMARY KEY (alumno, curso),

    CONSTRAINT fk_alumno
        FOREIGN KEY (alumno)
        REFERENCES alumno(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_curso
        FOREIGN KEY (curso)
        REFERENCES curso(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_alumno_curso
ON alumno_curso(curso);

--------------------------------------------------------
-- HORARIO
--------------------------------------------------------
CREATE TABLE horario (
    id SERIAL PRIMARY KEY,
    dia VARCHAR(15) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    sala INTEGER NOT NULL,
    curso INTEGER NOT NULL,

    CONSTRAINT fk_horario_sala
        FOREIGN KEY (sala)
        REFERENCES sala(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_horario_curso
        FOREIGN KEY (curso)
        REFERENCES curso(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_horario_sala
ON horario(sala);

CREATE INDEX idx_horario_curso
ON horario(curso);