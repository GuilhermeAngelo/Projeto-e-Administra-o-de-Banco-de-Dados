(async () => {
    const database = require("./connection_sequelize")
    await database.sync()

    
    const resultadoCreate = await atividade.create({
    nome: 'mouse',
    preco: 10,
    descricao: 'Um mouse USB bonitão'
})
console.log(resultadoCreate);
})()