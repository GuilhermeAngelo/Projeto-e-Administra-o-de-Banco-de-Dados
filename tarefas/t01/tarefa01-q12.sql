-- Questão 12

CREATE VIEW info_projeto AS 
SELECT p.nome,p.data_inicio,p.data_fim,v.descricao,v.data_inicio AS data_inicio_atividade, v.data_fim AS data_fim_atividade
FROM projeto p, atividade_projeto a, atividade v
WHERE (p.codigo = a.cod_projeto) AND (v.codigo = a.cod_atividade);

SELECT DISTINCT*
FROM info_projeto