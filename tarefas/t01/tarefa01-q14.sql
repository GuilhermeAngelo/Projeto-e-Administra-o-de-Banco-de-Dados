-- Questão 14

CREATE VIEW resp_atividades AS 
SELECT f.nome,COUNT(*) AS quantidade
FROM funcionario f, atividade a
WHERE f.codigo = a.cod_responsavel
GROUP BY f.nome;

SELECT *
FROM resp_atividades;