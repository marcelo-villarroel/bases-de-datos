CREATE OR REPLACE FUNCTION auditar_elo()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.elo <> NEW.elo THEN
        INSERT INTO elo_historial(jugador_id,elo_anterior,elo_nuevo,cambio,motivo)
        VALUES(
            NEW.id,
            OLD.elo,
            NEW.elo,
            NEW.elo-OLD.elo,
            CASE WHEN NEW.elo>OLD.elo THEN 'Victoria' ELSE 'Derrota' END
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
