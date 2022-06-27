(async () =>{
    const database = require("./connection_sequelize")
    await database.sync()

    const projeto = await projeto.findByPk(3);
    projeto.codresponsavel = 3;
 
    const resultadoSave = await projeto.save();
} )()