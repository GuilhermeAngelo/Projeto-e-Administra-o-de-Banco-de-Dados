(async () => {
    const database = require("./connection_sequelize")
    await database.sync()

    
})()