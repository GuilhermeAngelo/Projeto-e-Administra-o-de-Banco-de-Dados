-- Inserindo os departamentos
insert into departamento
(nome,codigo,descricao)
values('ABC',1,null);

insert into departamento
(nome,codigo,descricao)
values('DEF',2,null);

insert into departamento
(nome,codigo,descricao)
values('GHI',3,null);

insert into departamento
(nome,codigo,descricao)
values('JKL',4,null);

insert into departamento
(nome,codigo,descricao)
values('MNO',5,null);

-- Inserindo os funcionários
insert into funcionario
(codigo,nome,sexo,dt_nasc,salario,cod_depto)
values ('0123456789','Humberto', 'M', '1970-05-07', 5000.00,1);

insert into funcionario
(codigo,nome,sexo,dt_nasc,salario,cod_depto)
values ('0123456790','Maria Joana', 'F', '1971-06-10', 5000.00,2);

insert into funcionario
(codigo,nome,sexo,dt_nasc,salario,cod_depto)
values ('0123456791','Fernando', 'M', '1960-05-01', 8000.00,3);

insert into funcionario
(codigo,nome,sexo,dt_nasc,salario,cod_depto)
values ('0123456792','Joana', 'F', '1974-06-10', 2000.00,4);

insert into funcionario
(codigo,nome,sexo,dt_nasc,salario,cod_depto)
values ('0123456793','João', 'M', '1974-04-02', 2000.00,5);

insert into funcionario
(codigo,nome,sexo,dt_nasc,salario,cod_depto)
values ('0123456794','Maria', 'F', '2001-05-02', 10000.00,5);

insert into funcionario
(codigo,nome,sexo,dt_nasc,salario,cod_depto)
values ('0123456795','Luiz', 'M', '2002-05-02', 6000.00,1);

insert into funcionario
(codigo,nome,sexo,dt_nasc,salario,cod_depto)
values ('0123456796','Cunha', 'M', '2002-06-02', 10000.00,2);

insert into funcionario
(codigo,nome,sexo,dt_nasc,salario,cod_depto)
values ('0123456797','Guilherme', 'M', '2001-05-20', 4000.00,3);

insert into funcionario
(codigo,nome,sexo,dt_nasc,salario,cod_depto)
values ('0123456798','Cecilia', 'F', '2002-01-02', 70000.00,4);

-- inserindo gerentes

update departamento set cod_gerente = '0123456789'
where departamento.codigo = 1;

update departamento set cod_gerente = '0123456796'
where departamento.codigo = 2;

update departamento set cod_gerente = '0123456797'
where departamento.codigo = 3;

update departamento set cod_gerente = '0123456798'
where departamento.codigo = 4;

update departamento set cod_gerente = '0123456794'
where departamento.codigo = 5;

-- update funcionario set cod_depto = 1
-- where funcionario.nome = 'Humberto';

-- inserindo projetos

insert into projeto
(codigo,nome,descricao,cod_depto,cod_responsavel,data_inicio,data_fim)
values (1,'Recomendação via grafos', null, 1, '0123456789','2022-05-01','2022-12-01');

insert into projeto
(codigo,nome,descricao,cod_depto,cod_responsavel,data_inicio,data_fim)
values (2,'Automoção de análise de mercado', null, 2, '0123456791','2022-04-01','2023-01-03');

insert into projeto
(codigo,nome,descricao,cod_depto,cod_responsavel,data_inicio,data_fim)
values (3,'fastView', null, 3, '0123456798','2022-05-20','2023-08-01');

insert into projeto
(codigo,nome,descricao,cod_depto,cod_responsavel,data_inicio,data_fim)
values (4,'LocalizeHoles', null, 4, '0123456796','2023-05-01','2023-12-01');

insert into projeto
(codigo,nome,descricao,cod_depto,cod_responsavel,data_inicio,data_fim)
values (5,'Imports', null, 5, '0123456797','2024-05-01','2025-12-01');

-- Inserindo Atividades

insert into atividade
(codigo, nome, descricao, cod_responsavel, data_inicio, data_fim)
values(1,'criação de grafos',null,'0123456792','2022-05-01','2022-06-01');

insert into atividade
(codigo, nome, descricao, cod_responsavel, data_inicio, data_fim)
values(2,'Teste do algoritmo de análise',null,'0123456794','2022-04-01','2022-05-01');

insert into atividade
(codigo, nome, descricao, cod_responsavel, data_inicio, data_fim)
values(3,'criação de interface',null,'0123456795','2022-05-20','2022-07-01');

insert into atividade
(codigo, nome, descricao, cod_responsavel, data_inicio, data_fim)
values(4,'algoritmo de localização',null,'0123456796','2023-05-01','2023-07-01');

insert into atividade
(codigo, nome, descricao, cod_responsavel, data_inicio, data_fim)
values(5,'projeto de desenvolvimento',null,'0123456798','2024-05-01','2024-08-01');

-- inserindo atividade_projeto

insert into atividade_projeto
(cod_projeto, cod_atividade)
values(1,1);
insert into atividade_projeto
(cod_projeto, cod_atividade)
values(2,2);
insert into atividade_projeto
(cod_projeto, cod_atividade)
values(3,3);
insert into atividade_projeto
(cod_projeto, cod_atividade)
values(4,4);
insert into atividade_projeto
(cod_projeto, cod_atividade)
values(5,5);