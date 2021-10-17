const Camas = require('../models/Camas');
exports.obtenerCamasDisponibles = async () => {
  try {
    const camasDisponibles = await Camas.findAll({
      where: {
        disponible: true,
      },
      order: [['id', 'ASC']],
    });
    return camasDisponibles;
  } catch (error) {
    throw new Error(error);
  }
};
