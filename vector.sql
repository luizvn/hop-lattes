ALTER TABLE producoes ADD COLUMN texto_busca tsvector;
UPDATE producoes SET texto_busca = to_tsvector('portuguese', nomeArtigo);

CREATE TRIGGER gatilho_atualiza_tsvector
BEFORE INSERT OR UPDATE ON producoes
FOR EACH ROW EXECUTE FUNCTION 
tsvector_update_trigger(texto_busca, 'pg_catalog.portuguese', nomeArtigo);

CREATE INDEX producoes_texto_busca_idx ON producoes USING GIN (texto_busca);

