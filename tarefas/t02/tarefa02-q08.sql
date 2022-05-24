-- questão 8
--  Crie um gatilho que delete todos os clientes de um voo sempre que aquele voo for deletado e mais um gatilho para deletar o piloto.
--  (Para efeito de informação, considere que o avião caiu).

-- deletando clientes do voo
CREATE FUNCTION del_clientes_voo() 
RETURNS TRIGGER AS $$
BEGIN

    CREATE OR REPLACE view cliente_in_voo AS SELECT
    c.codigo, v.codigo as cod_voo from cliente c, voo v, cliente_voo d
    where c.codigo = d.cliente and v.codigo = d.voo;

    DELETE FROM cliente_voo WHERE old.codigo in (SELECT cod_voo FROM cliente_in_voo);
    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER del_voo AFTER DELETE ON voo
FOR EACH ROW
EXECUTE FUNCTION del_clientes_voo();

-- deletando o piloto do voo
CREATE FUNCTION del_piloto_voo() RETURNS TRIGGER 
AS $$
BEGIN
    DELETE FROM piloto where old.piloto = piloto.codigo;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER del_piloto AFTER DELETE ON voo
FOR EACH ROW
EXECUTE FUNCTION del_piloto_voo();