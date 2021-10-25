const Sequelize = require('sequelize');
const DB = require('../config/database');
const Camas = require('./Camas');
const Pacientes = DB.define('pacientes', {
  id: {
    autoIncrement: true,
    primaryKey: true,
    type: Sequelize.INTEGER,
  },
  id_cama: {
    type: Sequelize.INTEGER,
    allowNull: true,
    references: {
      model: Camas,
      key: 'id',
    },
  },
  nombre: {
    type: Sequelize.STRING,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'El nombre del paciente es requerido.',
      },
    },
  },
  apellido: {
    type: Sequelize.STRING,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'El apellido del paciente es requerido.',
      },
    },
  },
  sexo: {
    type: Sequelize.STRING,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'El sexo del paciente es requerido.',
      },
    },
  },
  edad: {
    type: Sequelize.INTEGER,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'La edad del paciente es requerido.',
      },
    },
  },
  numero_personal: {
    type: Sequelize.INTEGER,
    allowNull: false,
    unique: {
      args: true,
      msg: 'EL número personal ya pertence a un paciente previamente registrado',
    },
    validate: {
      notEmpty: {
        msg: 'El número personal del paciente es requerido.',
      },
    },
  },
  numero_familiar: {
    type: Sequelize.INTEGER,
    allowNull: false,
    unique: {
      args: true,
      msg: 'El número familiar ya pertence a un paciente previamente registrado',
    },
    validate: {
      notEmpty: {
        msg: 'El número del familiar del paciente es requerido.',
      },
    },
  },
  direccion: {
    type: Sequelize.TEXT,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'La dirección del paciente es requerida.',
      },
    },
  },
  enfermedad: {
    type: Sequelize.STRING,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'La enfermedad que posee el paciente es requerida.',
      },
    },
  },
  medicamento_habitual: {
    type: Sequelize.STRING,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'El medicamento habitual del paciente es requerido.',
      },
    },
  },
  cirugias: {
    type: Sequelize.INTEGER,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'Las cirugias del paciente es requerido.',
      },
    },
  },
  habitos_alimentos: {
    type: Sequelize.TEXT,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'Los habitos alimenticios del paciente es requerido.',
      },
    },
  },
  habitos_ejercicio: {
    type: Sequelize.TEXT,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'Los habitos de ejercicio del paciente es requerido.',
      },
    },
  },
  fumador: {
    type: Sequelize.STRING,
    allowNull: false,
    defaultValue: 'No',
    validate: {
      notEmpty: {
        msg: 'Indicar si es fumador y frecuencia del paciente es necesario.',
      },
    },
  },
  alcoholico: {
    type: Sequelize.STRING,
    allowNull: false,
    defaultValue: 'No',
    validate: {
      notEmpty: {
        msg: 'Indicar si es alcoholico y frecuencia del paciente es necesario.',
      },
    },
  },
  toma_cafe: {
    type: Sequelize.STRING,
    allowNull: false,
    defaultValue: 'No',
    validate: {
      notEmpty: {
        msg: 'Indicar si es toma cafe y frecuencia del paciente es necesario.',
      },
    },
  },
  enfermedad_familiar: {
    type: Sequelize.TEXT,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'Indicar la enfermedad familiares del paciente es necesario.',
      },
    },
  },
  motivo: {
    type: Sequelize.TEXT,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'Indiciar el motivo por el cual el paciente ingresa es necesario.',
      },
    },
  },
  medicamento_hosp: {
    type: Sequelize.TEXT,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'Indiciar el medicamento que el paciente necesita es necesario.',
      },
    },
  },
  observacion: {
    type: Sequelize.TEXT,
    allowNull: false,
    validate: {
      notEmpty: {
        msg: 'Indiciar las obsercaciones del paciente es necesario.',
      },
    },
  },
  dado_alta: {
    type: Sequelize.BOOLEAN,
    allowNull: true,
    defaultValue: false,
  },
  fecha_ingreso: {
    type: Sequelize.DATE,
    allowNull: false,
    defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
  },
});
module.exports = Pacientes;
