### Resumo sobre o ODBC no NODE.JS
No node a conexão a um banco de dados postgres pode ser feita através da instalação do pacote pg (npm install pg) que possui os comando necessário para efetuar tão conexão. que pode ser feita dessa maneira

const {Client} = require("pg")

const client = new Client({
    host: "localhost",
    user: "postgres",
    port: 5432,
    password: "postgres",
    database: "AtividadesBD"
})

client.connect();

Onde por meio de uma nova instância da classe Client podemos criar a conexão desejada informando as opções necessárias.