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