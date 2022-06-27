// npm install pg caso seja necessário instalar as depencias para usar os pacotes necessários
// o pacote utilizado foi o pg

const {Client} = require("pg")
const client = new Client({
    host: "localhost",
    user: "postgres",
    port: 5432,
    password: "postgres",
    database: "AtividadesBD"
})
client.connect();

// a - 
client.query(`INSERT INTO atividade(descricao,codProjeto, dataInicio, dataFim) 
values ('BD-Atividade 8',2,'2018-07-26','2018-08-30')`).
then( results =>{
    const resultado = results.rows;
    console.table(resultado);
}).finally( () => client.end())