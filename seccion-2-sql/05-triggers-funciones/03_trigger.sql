CREATE TRIGGER trg_auditar_elo
AFTER UPDATE OF elo ON jugador
FOR EACH ROW
EXECUTE FUNCTION auditar_elo();
