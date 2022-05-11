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

select nome from resposta
;