-- ============================================================
-- 05_eliminaciones_delete.sql
-- Eliminaciones (DELETE)
-- ============================================================

-- Eliminar todos los préstamos devueltos hace más de 1 año.
DELETE FROM "prestamo"
WHERE "devolucion" IS NOT NULL
  AND "devolucion" < CURRENT_DATE - INTERVAL '1 year';

-- Eliminar libros sin autores asignados (JOIN con autor_libro).
-- Nota: categoria_libro no tiene ON DELETE CASCADE hacia libro, por lo
-- que primero se deben eliminar sus vínculos; prestamo sí cascadea
-- automáticamente al eliminar el libro.
DELETE FROM "categoria_libro"
WHERE "libro" IN (
  SELECT l."id" FROM "libro" l
  WHERE l."id" NOT IN (SELECT "libro" FROM "autor_libro")
);

DELETE FROM "libro"
WHERE "id" NOT IN (SELECT "libro" FROM "autor_libro");
