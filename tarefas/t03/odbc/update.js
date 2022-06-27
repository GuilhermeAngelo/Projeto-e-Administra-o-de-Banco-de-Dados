const {Client} = require("pg")
const client = new Client({
    host: "localhost",
    user: "postgres",
    port: 5432,
    password: "postgres",
    database: "AtividadesBD"
})
client.connect();

// b -
client.query("UPDATE projeto SET codresponsavel = 3 WHERE projeto.codigo = 3").
then( results =>{
    const resultado = results.rows;
    console.table(resultado);
}).finally( () => client.end())