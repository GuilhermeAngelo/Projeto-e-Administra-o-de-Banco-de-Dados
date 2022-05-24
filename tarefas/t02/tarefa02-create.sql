-- cliente (codigo, nome, endereco)
-- piloto (codigo, nome, num_voos)
-- voo (codigo, tipo, piloto, num_passageiros, distancia)
-- milhas (cliente, quantidade)
-- cliente_voo (cliente, voo, classe)

CREATE TABLE cliente (
    codigo SERIAL,
    nome VARCHAR(150),
    endereco VARCHAR(200),

    PRIMARY KEY(codigo)
);

CREATE TABLE piloto(
    codigo SERIAL,
    nome VARCHAR(250),
    num_voos INT,

    PRIMARY KEY(codigo)
);

CREATE TABLE voo(
    codigo SERIAL,
    tipo CHAR(3),
    piloto INT,
    num_passageiros INT,
    distancia NUMERIC(10,2),

    PRIMARY KEY(codigo),
    FOREIGN KEY (piloto) REFERENCES piloto(codigo) ON DELETE CASCADE
);

CREATE TABLE milhas(
    cliente INT, 
    quantidade INT,

    PRIMARY KEY(cliente),
    FOREIGN key (cliente) REFERENCES cliente(codigo)
);

CREATE TABLE cliente_voo(
    cliente INT,
    voo INT,
    classe CHAR(1),

    PRIMARY KEY(cliente,voo),
    FOREIGN KEY (cliente) REFERENCES cliente(codigo) ON DELETE CASCADE,
    FOREIGN KEY (voo) REFERENCES voo(codigo) ON DELETE CASCADE
);