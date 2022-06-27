// c -
const {Client} = require("pg")
const client = new Client({
    host: "localhost",
    user: "postgres",
    port: 5432,
    password: "postgres",
    database: "AtividadesBD"
})
client.connect();

// c- 
client.query("SELECT p.codigo as codigo_projeto,a.descricao FROM projeto p, atividade a WHERE a.codprojeto = p.codigo").
then( results =>{
    const resultado = results.rows;
    console.table(resultado);
}).finally( () => client.end())