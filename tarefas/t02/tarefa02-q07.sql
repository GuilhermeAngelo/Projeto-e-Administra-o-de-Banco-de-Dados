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