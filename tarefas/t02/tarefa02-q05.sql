-- questão 5
--  Crie um gatilho que ao se adicionar um voo, seja adicionado +1 voo para o piloto daquele voo.

CREATE FUNCTION  inc_num_voos_piloto()
RETURNS TRIGGER AS
$$
BEGIN
    update piloto set num_voos = num_voos  + 1
    where piloto.codigo = NEW.piloto;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
    

CREATE TRIGGER inc_num_voos
AFTER INSERT ON voo
    FOR EACH ROW
    EXECUTE FUNCTION inc_num_voos_piloto();