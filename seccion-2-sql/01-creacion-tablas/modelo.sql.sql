DROP TABLE IF EXISTS horario CASCADE;
DROP TABLE IF EXISTS alumno_curso CASCADE;
DROP TABLE IF EXISTS curso CASCADE;
DROP TABLE IF EXISTS alumno CASCADE;
DROP TABLE IF EXISTS profesor CASCADE;
DROP TABLE IF EXISTS sala CASCADE;



CREATE TABLE sala (
    id_sala SERIAL,
    nombre_sala VARCHAR(50) NOT NULL,
    capacidad INTEGER NOT NULL,
    CONSTRAINT pk_sala PRIMARY KEY (id_sala)
);




CREATE TABLE profesor (
    id_profesor SERIAL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    CONSTRAINT pk_profesor PRIMARY KEY (id_profesor)
);




CREATE TABLE alumno (
    id_alumno SERIAL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    CONSTRAINT pk_alumno PRIMARY KEY (id_alumno)
);



CREATE TABLE curso (
    id_curso SERIAL,
    nombre_curso VARCHAR(150) NOT NULL,
    id_profesor INTEGER NOT NULL,
    id_sala INTEGER NOT NULL,
    CONSTRAINT pk_curso PRIMARY KEY (id_curso),
    CONSTRAINT fk_curso_profesor FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor),
    CONSTRAINT fk_curso_sala FOREIGN KEY (id_sala) REFERENCES sala(id_sala)
);



CREATE TABLE alumno_curso (
    id_alumno INTEGER NOT NULL,
    id_curso INTEGER NOT NULL,
    fecha_inscripcion DATE DEFAULT CURRENT_DATE,
    CONSTRAINT pk_alumno_curso PRIMARY KEY (id_alumno, id_curso),
    CONSTRAINT fk_alumno_curso_alumno FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno) ON DELETE CASCADE,
    CONSTRAINT fk_alumno_curso_curso FOREIGN KEY (id_curso) REFERENCES curso(id_curso) ON DELETE CASCADE
);



CREATE TABLE horario (
    id_curso INTEGER NOT NULL,
    id_sala INTEGER NOT NULL,
    dia VARCHAR(15) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    CONSTRAINT pk_horario PRIMARY KEY (id_sala, dia, hora_inicio),
    CONSTRAINT fk_horario_curso FOREIGN KEY (id_curso) REFERENCES curso(id_curso) ON DELETE CASCADE,
    CONSTRAINT fk_horario_sala FOREIGN KEY (id_sala) REFERENCES sala(id_sala) ON DELETE CASCADE
);
