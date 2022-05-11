-- Questões pares

-- Questão 2
    select f.nome
    from funcionario f
    where(f.dt_nasc > (select min(dt_nasc)
    from funcionario));