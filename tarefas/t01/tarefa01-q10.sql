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