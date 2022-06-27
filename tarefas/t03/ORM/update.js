(async () =>{
    const database = require("./connection_sequelize")
    await database.sync()

    const produto = await projeto.findByPk(3);
    produto.resprojeto = 3;
 
const resultadoSave = await produto.save();
} )()