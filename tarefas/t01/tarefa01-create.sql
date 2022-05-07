CREATE TABLE funcionario(
  codigo CHAR(10) PRIMARY KEY,
  nome VARCHAR(150),
  sexo char(1),
  dt_nasc char(10),
  salario NUMERIC(10,2),
  cod_depto INT,
  
  FOREIGN KEY (cod_depto) REFERENCES departamento(codigo)
);

CREATE TABLE departamento(
  codigo INT PRIMARY KEY,
  descricao VARCHAR(250),
  cod_gerente CHAR(10),
  
  FOREIGN KEY (cod_gerente) REFERENCES funcionario(codigo)
);

CREATE TABLE projeto(
  codigo INT PRIMARY KEY, 
  nome VARCHAR(150), 
  descricao VARCHAR(250),
  cod_depto INT,
  cod_responsavel CHAR(10),
  data_inicio CHAR(10),
  data_fim CHAR(10),
  
  FOREIGN KEY (cod_depto) REFERENCES departamento(codigo),
  FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo)
)

CREATE TABLE atividade(
  codigo INT PRIMARY KEY,
  nome VARCHAR(150),
  descricao VARCHAR(250),
  cod_responsavel CHAR(10),
  data_inicio CHAR(10),
  data_fim CHAR(10),
  
  FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo)
);

CREATE TABLE atividade_projeto(
  cod_projeto INT,
  cod_atividade INT,
  
  FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo),
  FOREIGN KEY (cod_atividade) REFERENCES atividade(codigo),
  
  PRIMARY KEY (cod_projeto,cod_atividade)
);