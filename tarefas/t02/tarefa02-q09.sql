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

update cliente set nome = 'Guilherme' where cliente.codigo = 1;

-- O que acontece é que como na questão 4 criamos um trigger que ao inserir um novo cliente também criamos um cartão para o mesmo, a chave primaria da
-- tabela milhas estará assciada ao codigo desse cliente por meio de uma chave estrangeira. Como  o codigo do cliente é uma chave estrangeira na
-- tabela milhas e além disso, tabém é uma chave primária, ocorrerá um erro caso tentemos adicionar outro cartão a um usuário que já foi inserido,
-- pois ao inserirmos esse novo usuário um cartão foi gerado para ele,
-- entretanto, caso esse trigger da questão 4 não existisse, a inserção do cartão funcionaria normalmente, uma vez que não ocorreria replicação de 
-- chaves primárias,além disso o trigger não seria ativado no insert, mas sim no update.