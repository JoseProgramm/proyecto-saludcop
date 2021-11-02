const Pacientes = require('../models/Pacientes');
const { Op } = require('sequelize');
exports.pacientesEnCola = async () => {
  try {
    return await Pacientes.findAll({
      where: {
        id_cama: {
          [Op.eq]: null,
        },
        dado_alta: false,
      },
      order: [['id', 'ASC']],
    });
  } catch (error) {
    throw new Error(error.message);
  }
};
exports.pacientesHospitalizados = async () => {
  try {
    return await Pacientes.findAll({
      where: {
        dado_alta: false,
        id_cama: {
          [Op.ne]: null,
        },
      },
    });
  } catch (error) {
    throw new Error(error.message);
  }
};
exports.pacientesDadoAlta = async () => {
  try {
    return await Pacientes.findAll({
      where: {
        dado_alta: true,
        id_cama: {
          [Op.eq]: null,
        },
      },
    });
  } catch (error) {
    throw new Error(error.message);
  }
};
