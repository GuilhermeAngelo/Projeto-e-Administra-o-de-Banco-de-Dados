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