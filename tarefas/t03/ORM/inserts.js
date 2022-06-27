(async () => {
    const database = require("./connection_sequelize")
    await database.sync()

    
    const resultadoCreate = await atividade.create({
    descricao: 'Atividade 44',
    codProjeto: 1,
    datainicio: '2018-06-06',
    datafim: '2019-06-06'
})
console.log(resultadoCreate);
})()