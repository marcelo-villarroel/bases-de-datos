

CREATE TABLE "autor" (
  "id" SERIAL PRIMARY KEY,
  "nombre" TEXT NOT NULL
);

CREATE TABLE "categoria" (
  "id" SERIAL PRIMARY KEY,
  "nombre" TEXT NOT NULL
);

CREATE TABLE "libro" (
  "id" SERIAL PRIMARY KEY,
  "titulo" TEXT NOT NULL,
  "publicacion" DATE
);

CREATE TABLE "autor_libro" (
  "autor" INTEGER NOT NULL,
  "libro" INTEGER NOT NULL,
  PRIMARY KEY ("autor", "libro")
);

CREATE INDEX "idx_autor_libro" ON "autor_libro" ("libro");

ALTER TABLE "autor_libro" ADD CONSTRAINT "fk_autor_libro__autor"
  FOREIGN KEY ("autor") REFERENCES "autor" ("id");

ALTER TABLE "autor_libro" ADD CONSTRAINT "fk_autor_libro__libro"
  FOREIGN KEY ("libro") REFERENCES "libro" ("id");

CREATE TABLE "categoria_libro" (
  "categoria" INTEGER NOT NULL,
  "libro" INTEGER NOT NULL,
  PRIMARY KEY ("categoria", "libro")
);

CREATE INDEX "idx_categoria_libro" ON "categoria_libro" ("libro");

ALTER TABLE "categoria_libro" ADD CONSTRAINT "fk_categoria_libro__categoria"
  FOREIGN KEY ("categoria") REFERENCES "categoria" ("id");

ALTER TABLE "categoria_libro" ADD CONSTRAINT "fk_categoria_libro__libro"
  FOREIGN KEY ("libro") REFERENCES "libro" ("id");

CREATE TABLE "usuario" (
  "id" SERIAL PRIMARY KEY,
  "nombre" TEXT NOT NULL,
  "correo" TEXT UNIQUE NOT NULL,
  "registro" DATE
);

CREATE TABLE "prestamo" (
  "usuario" INTEGER NOT NULL,
  "libro" INTEGER NOT NULL,
  "prestamo" DATE NOT NULL DEFAULT CURRENT_DATE,
  "devolucion" DATE,
  "estado" TEXT NOT NULL,
  PRIMARY KEY ("usuario", "libro")
);

CREATE INDEX "idx_prestamo__libro" ON "prestamo" ("libro");

ALTER TABLE "prestamo" ADD CONSTRAINT "fk_prestamo__libro"
  FOREIGN KEY ("libro") REFERENCES "libro" ("id") ON DELETE CASCADE;

ALTER TABLE "prestamo" ADD CONSTRAINT "fk_prestamo__usuario"
  FOREIGN KEY ("usuario") REFERENCES "usuario" ("id") ON DELETE CASCADE;

CREATE TABLE "multa" (
  "id" SERIAL PRIMARY KEY,
  "monto" INTEGER NOT NULL,
  "pagado" BOOLEAN DEFAULT FALSE,
  "prestamo_usuario" INTEGER NOT NULL,
  "prestamo_libro" INTEGER NOT NULL
);

CREATE INDEX "idx_multa__prestamo_usuario_prestamo_libro" ON "multa" ("prestamo_usuario", "prestamo_libro");

ALTER TABLE "multa" ADD CONSTRAINT "fk_multa__prestamo_usuario__prestamo_libro"
  FOREIGN KEY ("prestamo_usuario", "prestamo_libro") REFERENCES "prestamo" ("usuario", "libro");
