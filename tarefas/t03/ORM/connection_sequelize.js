const Sequelize = require('sequelize');
const sequelize = new Sequelize('AtividadesBD', 'postgres', 'postgres', {host: 'localhost',  dialect: 'postgres', port:5432});

module.exports = sequelize;