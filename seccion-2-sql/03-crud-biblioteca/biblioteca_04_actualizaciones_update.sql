UPDATE "prestamo"
SET "estado" = 'retrasado'
WHERE COALESCE("devolucion", CURRENT_DATE) - "prestamo" > 15;


UPDATE "prestamo"
SET "devolucion" = CURRENT_DATE,
    "estado" = 'devuelto'
WHERE "usuario" = 6 AND "libro" = 1;


UPDATE "multa"
SET "pagado" = TRUE
WHERE "id" = 1;
