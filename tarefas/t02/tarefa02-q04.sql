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