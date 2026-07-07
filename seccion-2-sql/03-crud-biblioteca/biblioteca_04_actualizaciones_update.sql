-- ============================================================
-- 04_actualizaciones_update.sql
-- Actualizaciones (UPDATE)
-- ============================================================

-- Cambiar estado de préstamos a "retrasado" si la fecha de devolución
-- (o la fecha actual, si aún no se ha devuelto) supera los 15 días
-- desde la fecha de préstamo.
UPDATE "prestamo"
SET "estado" = 'retrasado'
WHERE COALESCE("devolucion", CURRENT_DATE) - "prestamo" > 15;

-- Registrar la devolución de un préstamo y cambiar su estado.
-- (reemplazar los valores de usuario y libro por los del préstamo deseado)
UPDATE "prestamo"
SET "devolucion" = CURRENT_DATE,
    "estado" = 'devuelto'
WHERE "usuario" = 6 AND "libro" = 1;

-- Marcar una multa como pagada.
-- (reemplazar el id por el de la multa deseada)
UPDATE "multa"
SET "pagado" = TRUE
WHERE "id" = 1;
