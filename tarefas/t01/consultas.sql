-- Questões pares

-- Questão 2
    select f.nome
    from funcionario f
    where(f.dt_nasc > (select min(dt_nasc)
    from funcionario));

-- Questão 4 
SELECT f.nome,f.salario,f.cod_depto as departamento
FROM funcionario f
WHERE f.codigo NOT IN (	
  	SELECT funcionario.codigo
	FROM funcionario, departamento
	WHERE (funcionario.codigo = departamento.cod_gerente)
)
ORDER BY f.cod_depto asc
;
-- Questão 6
SELECT f.nome,f.salario,d.descricao
FROM funcionario f LEFT OUTER JOIN departamento d
ON f.cod_depto = d.codigo;

-- Questão 8

create view depto_info as select d.codigo, d.nome as departamento,f.nome as gerente
from departamento d left join funcionario f
on d.cod_gerente = f.codigo
order by d.codigo
;

create view quantidade as select d.codigo,count(*) as quantidade
from projeto p left join
 departamento d on p.cod_depto  = d.codigo
 group by d.codigo
 order by d.codigo
 ;
 
 
 select d.departamento,d.gerente, p.quantidade as quantidade_projeto
 from depto_info d left outer join quantidade p
 on d.codigo = p.codigo;

-- questão 10

CREATE VIEW projeto_info AS SELECT p.cod_responsavel AS cod_resp,p.nome AS projeto,d.nome AS departamento_projeto
FROM projeto p, departamento d
WHERE (d.codigo = p.cod_depto)
order by d.codigo;

CREATE VIEW resp_projeto AS 
SELECT p.cod_responsavel AS cod_resp ,f.nome AS nome_resposavel, d.nome AS depto_responsavel
FROM projeto p, funcionario f, departamento d
WHERE p.cod_responsavel = f.codigo AND f.cod_depto = d.codigo
ORDER BY d.codigo;

SELECT DISTINCT p.cod_resp,p.projeto,p.departamento_projeto,r.nome_resposavel,r.depto_responsavel
FROM projeto_info p , resp_projeto r
WHERE p.cod_resp = r.cod_resp;

-- Questão 12

CREATE VIEW info_projeto AS 
SELECT p.nome,p.data_inicio,p.data_fim,v.descricao,v.data_inicio AS data_inicio_atividade, v.data_fim AS data_fim_atividade
FROM projeto p, atividade_projeto a, atividade v
WHERE (p.codigo = a.cod_projeto) AND (v.codigo = a.cod_atividade);

SELECT DISTINCT*
FROM info_projeto

-- Questão 14

CREATE VIEW resp_atividades AS 
SELECT f.nome,COUNT(*) AS quantidade
FROM funcionario f, atividade a
WHERE f.codigo = a.cod_responsavel
GROUP BY f.nome;

SELECT *
FROM resp_atividades

-- Questão 16


-- Questão 18 

create view maior_salario as
select d.codigo ,max(f.salario) as salario
from funcionario f left outer join departamento d
on f.cod_depto = d.codigo
group by d.codigo;

create view resposta as 
select distinct f.nome,f.salario
from maior_salario s, funcionario f,departamento d
where s.salario = f.salario
order by f.salario;

select nome from resposta;
