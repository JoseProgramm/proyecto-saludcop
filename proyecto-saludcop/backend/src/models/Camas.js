const Sequelize = require('sequelize');
const DB = require('../config/database');
const camas = DB.define('camas', {
  id: {
    autoIncrement: true,
    primaryKey: true,
    type: Sequelize.INTEGER,
  },
  numero_cama: {
    type: Sequelize.INTEGER,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'El numero de la cama es requerido.',
      },
    },
  },
  disponible: {
    type: Sequelize.BOOLEAN,
    allowNull: false,
    defaultValue: false,
  },
});

module.exports = camas;
