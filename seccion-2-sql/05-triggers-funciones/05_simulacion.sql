INSERT INTO partido(ganador_id,perdedor_id) VALUES (1,2);
UPDATE jugador SET elo=elo+20 WHERE id=1;
UPDATE jugador SET elo=elo-20 WHERE id=2;
INSERT INTO partido(ganador_id,perdedor_id) VALUES (3,1);
UPDATE jugador SET elo=elo+15 WHERE id=3;
UPDATE jugador SET elo=elo-15 WHERE id=1;

SELECT * FROM jugador;
SELECT * FROM partido;
SELECT * FROM elo_historial ORDER BY fecha;
