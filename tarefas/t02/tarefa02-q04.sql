-- questão 4
-- Crie um gatilho que ao se adicionar um novo cliente, seja criado para ele um cartão de milhagem com 0 milhas.
CREATE FUNCTION inserir_cartao_milhas()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO milhas(cliente,quantidade)
    VALUES(NEW.codigo, 0);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER criar_cartao_milhas 
AFTER INSERT ON cliente
    FOR EACH ROW
    EXECUTE FUNCTION inserir_cartao_milhas();

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

-- questão 7
--  Crie um gatilho que adicione mais um passageiro a um voo sempre que um cliente entre em um voo. (Dica: lembre da relação cliente_voo).
CREATE FUNCTION inc_num_clientes_voo()
RETURNS TRIGGER AS $$
BEGIN
    update voo set num_passageiros = num_passageiros + 1
    where voo.codigo = new.voo;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER num_cliente_voo
AFTER INSERT ON cliente_voo
    FOR EACH ROW
    EXECUTE FUNCTION inc_num_clientes_voo();

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


-- questão 9
-- Cadastre um cartão de milhagem para um cliente qualquer e logo após crie um gatilho que cadastre um cartão de milhagem para aquele cliente
-- quando suas informações forem atualizadas. Veja e explique o que acontece quando esse procedimento for realizado.
INSERT INTO milhas(cliente, quantidade)
VALUES (1,1);

CREATE FUNCTION inserir_cartao_update() RETURNS TRIGGER
AS $$
BEGIN
    INSERT INTO milhas(cliente,quantidade) VALUES (old.codigo, 0);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inserir_cartao_milhas_on_upadate AFTER UPDATE ON cliente
FOR EACH ROW 
EXECUTE FUNCTION inserir_cartao_update();

update cliente set nome = 'Guilherme' where cliente.codigo = 5;

-- O que acontece é que como na questão 4 criamos um trigger que ao inserir um novo cliente também criamos um cartão para o mesmo, a chave primaria da
-- tabela milhas estará assciada ao codigo desse cliente por meio de uma chave estrangeira. Como  o codigo do cliente é uma chave estrangeira na
-- tabela milhas e além disso, tabém é uma chave primária, ocorrerá um erro caso tentemos adicionar outro cartão a um usuário que já foi inserido,
-- pois ao inserirmos esse novo usuário um cartão foi gerado para ele,
-- entretanto, caso esse trigger da questão 4 não existisse, a inserção do cartão funcionaria normalmente, uma vez que não ocorreria replicação de 
-- chaves primárias.