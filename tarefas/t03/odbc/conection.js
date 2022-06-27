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

// 5 - Use o programa de conexão feito na questão 3, e faça a execução dos seguintes comandos SQL

// a - 
client.query(`INSERT INTO atividade(descricao,codProjeto, dataInicio, dataFim) 
values ('BD-Atividade 5',3,'2018-07-26','2018-08-30')`).
then( results =>{
    const resultado = results.rows;
    console.table(resultado);
}).finally( () => client.end())

// b -
client.query("UPDATE projeto SET codresponsavel = 3 WHERE projeto.codigo = 3").
then( results =>{
    const resultado = results.rows;
    console.table(resultado);
}).finally( () => client.end())

// c -
client.query("SELECT p.codigo as codigo_projeto,a.descricao FROM projeto p, atividade a WHERE a.codprojeto = p.codigo").
then( results =>{
    const resultado = results.rows;
    console.table(resultado);
}).finally( () => client.end())
