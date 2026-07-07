DROP TABLE IF EXISTS elo_historial CASCADE;
DROP TABLE IF EXISTS partido CASCADE;
DROP TABLE IF EXISTS jugador CASCADE;

CREATE TABLE jugador (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    elo INTEGER NOT NULL DEFAULT 1000
);

CREATE TABLE partido (
    id SERIAL PRIMARY KEY,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ganador_id INTEGER NOT NULL,
    perdedor_id INTEGER NOT NULL,
    CONSTRAINT fk_partido_ganador FOREIGN KEY (ganador_id) REFERENCES jugador(id),
    CONSTRAINT fk_partido_perdedor FOREIGN KEY (perdedor_id) REFERENCES jugador(id),
    CONSTRAINT chk_jugadores_distintos CHECK (ganador_id <> perdedor_id)
);

CREATE TABLE elo_historial (
    id SERIAL PRIMARY KEY,
    jugador_id INTEGER NOT NULL,
    elo_anterior INTEGER NOT NULL,
    elo_nuevo INTEGER NOT NULL,
    cambio INTEGER NOT NULL,
    motivo TEXT NOT NULL,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_historial_jugador FOREIGN KEY (jugador_id) REFERENCES jugador(id)
);
