
DELETE FROM "prestamo"
WHERE "devolucion" IS NOT NULL
  AND "devolucion" < CURRENT_DATE - INTERVAL '1 year';


DELETE FROM "categoria_libro"
WHERE "libro" IN (
  SELECT l."id" FROM "libro" l
  WHERE l."id" NOT IN (SELECT "libro" FROM "autor_libro")
);

DELETE FROM "libro"
WHERE "id" NOT IN (SELECT "libro" FROM "autor_libro");
