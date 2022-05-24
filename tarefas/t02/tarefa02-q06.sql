-- questão 6
-- Crie um gatilho que some milhas ao cartão de milhagem sempre que um cliente é adicionado a um voo. 
-- (considere que é adicionado 1 milha no cartão para cada 10 milhas de distância percorrida em um voo).

CREATE OR REPLACE FUNCTION inc_cartao_milhas()
RETURNS TRIGGER AS 
$$
DECLARE 
distc NUMERIC(10,2);
BEGIN
    SELECT distancia FROM voo where voo.codigo = new.voo into distc;
    update milhas set quantidade = quantidade + (distc/10) where (milhas.cliente = new.cliente);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inc_num_milhas
AFTER INSERT ON cliente_voo
    FOR EACH ROW
    EXECUTE FUNCTION inc_cartao_milhas();