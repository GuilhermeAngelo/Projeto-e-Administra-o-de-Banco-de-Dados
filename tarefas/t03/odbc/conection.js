// npm install pg caso seja necessário instalar as depencias para usar os pacotes necessários
// o pacote utilizado foi o pg
(async () => {
const {Client} = require("pg")
const client = new Client({
    host: "localhost",
    user: "postgres",
    port: 5432,
    password: "postgres",
    database: "AtividadesBD"
})
client.connect();
})()