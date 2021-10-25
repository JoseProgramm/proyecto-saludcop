const Pacientes = require('../models/Pacientes');
const Camas = require('../models/Camas');
const {
  pacientesDadoAlta,
  pacientesEnCola,
  pacientesHospitalizados,
} = require('../helpers/obtenerPacientes');
const {
  obtenerCamasDisponibles,
} = require('../helpers/obtenerCamasDisponibles');
exports.registroPacienteController = async (req, res) => {
  const {
    nombre,
    apellido,
    sexo,
    edad,
    numero_personal,
    numero_familiar,
    direccion,
    enfermedad,
    medicamento_habitual,
    cirugias,
    habitos_alimentos,
    habitos_ejercicio,
    fumador,
    alcoholico,
    toma_cafe,
    enfermedad_familiar,
    motivo,
    medicamento_hosp,
    observacion,
  } = req.body;
  if (
    !nombre ||
    !apellido ||
    !sexo ||
    !edad ||
    !numero_personal ||
    !numero_familiar ||
    !direccion ||
    !enfermedad ||
    !medicamento_habitual ||
    cirugias === undefined ||
    !habitos_alimentos ||
    !habitos_ejercicio ||
    !fumador ||
    !alcoholico ||
    !toma_cafe ||
    !enfermedad_familiar ||
    !motivo ||
    !medicamento_hosp ||
    !observacion
  ) {
    return res.status(400).json({
      msg: 'Todos los campos son obligatorios para registrar al pacuente',
    });
  }
  const [camasDisponibles] = await obtenerCamasDisponibles();
  // No existen camas disponibles, notificar al frontend. El paciente se guarda, pero no tiene cama asignada. Entra en 'cola'
  if (!camasDisponibles) {
    try {
      const paciente = await Pacientes.create({
        ...req.body,
      });
      return paciente
        ? res.status(200).json({
            msg: 'Paciente registrado correctamente',
            cola: true,
            id_cama: null,
          })
        : res.status(500).json({
            msg: 'Error al registrar paciente',
          });
    } catch (error) {
      return res.status(500).json({
        msg: 'Ocurrió un error registradoe al paciente. ' + error.message,
      });
    }
  }
  /* En caso exista camas disponibles. Registra al cliente y asigna cama. Cambia el valor de la cama de disponible false */
  try {
    const paciente = await Pacientes.create({
      ...req.body,
      id_cama: camasDisponibles.id,
    });
    const [resultadoActualizarCama] = await Camas.update(
      {
        disponible: false,
      },
      {
        where: {
          id: camasDisponibles.id,
        },
      }
    );
    if (!paciente || !resultadoActualizarCama) {
      return res.status(500).json({
        msg: 'Ocurrió un error registrando al paciente',
      });
    }
    return res.status(200).json({
      msg: 'Paciente registrado correctamente',
      cola: false,
      id_cama: paciente.id_cama,
    });
  } catch (error) {
    return res.status(500).json({
      msg: 'Ocurrió un error registradoe al paciente. ' + error.message,
    });
  }
};

exports.darAltaPacienteController = async (req, res) => {
  /* Busca el paciente, actualiza la propiedad dado_alta & elimina relacion con el id_cama */
  try {
    const [paciente] = await Pacientes.findAll({
      where: {
        id: req.params.pacienteId,
      },
    });
    if (!paciente) {
      return res.status(404).json({
        msg: 'El id enviado no corresponde a un paciente registrado.',
      });
    }
    const [camaAsignadaPaciente] = await Camas.findAll({
      where: {
        id: paciente.id_cama,
      },
    });
    if (!camaAsignadaPaciente) {
      return res.status(404).json({
        msg: 'El paciente no tiene cama asignada.',
      });
    }
    /* Busca la cama enlazada al paciente a dar de alta, actualiza la propiedad disponible */
    const [resultadoActualizarCama] = await Camas.update(
      {
        disponible: true,
      },
      {
        where: {
          id: camaAsignadaPaciente.id,
        },
      }
    );
    if (!resultadoActualizarCama) {
      return res.status(500).json({
        msg: 'Ocurrió un error actualizando el estado de la sala.',
      });
    }
    const [pacienteActualizado] = await Pacientes.update(
      {
        dado_alta: true,
        id_cama: null,
      },
      {
        where: {
          id: req.params.pacienteId,
        },
      }
    );
    if (!pacienteActualizado) {
      return res.status(500).json({
        msg: 'Ocurrió un error actualizando el paciente',
      });
    }
    return res.status(200).json({
      msg: 'Paciente dado de alta correctamente',
    });
  } catch (error) {
    return res.status(500).json({
      msg: 'Ocurrió un error dando de alta el paciente. ' + error.message,
    });
  }
};

exports.obtenerPacientesAltaController = async (req, res) => {
  try {
    const pacientesEnAlta = await pacientesDadoAlta();
    return !pacientesEnAlta.length
      ? res.status(404).json({
          msg: 'No hay pacientes dado de alta',
          pacientesEnAlta: [],
        })
      : res.status(200).json({
          msg: 'Pacientes dado de alta',
          pacientesEnAlta,
        });
  } catch (error) {
    return res.status(500).json({
      msg:
        'Ocurrió un error obteniendo los pacientes dado de alta. ' +
        error.message,
    });
  }
};
exports.obtenerPacientesEnColaController = async (req, res) => {
  try {
    const pacientesCola = await pacientesEnCola();
    return !pacientesCola.length
      ? res.status(200).json({
          msg: 'No hay pacientes en cola actualmente',
          pacientesCola: [],
        })
      : res.status(200).json({
          msg: 'Pacientes en cola actuales',
          pacientesCola,
        });
  } catch (error) {
    return res.status(500).json({
      msg:
        'Ocurrió un error obteniendo los pacientes en cola. ' + error.message,
    });
  }
};
exports.obtenerPacientesHospitalizadosController = async (req, res) => {
  try {
    const pacientesHospital = await pacientesHospitalizados();
    return !pacientesHospital.length
      ? res.status(404).json({
          msg: 'No hay pacientes hospitalizados actualmente',
          pacientesHospital: [],
        })
      : res.status(200).json({
          msg: 'Pacientes hospitalizados actuales',
          pacientesHospital,
        });
  } catch (error) {
    return res.status(500).json({
      msg:
        'Ocurrió un error obteniendo los pacientes hospitalizados. ' +
        error.message,
    });
  }
};

exports.obtenerPacienteIdController = async (req, res) => {
  try {
    const paciente = await Pacientes.findAll({
      where: {
        id: req.params.pacienteId,
      },
    });
    if (!paciente) {
      return res.status(404).json({
        msg: 'El id enviado no corresponde a un paciente registrado.',
      });
    }
    return res.status(200).json({
      msg: 'Paciente obtenido correctamente',
      paciente,
    });
  } catch (error) {
    return res.status(500).json({
      msg: 'Ocurrió un error obteniendo el paciente. ' + error.message,
    });
  }
};

exports.cantidadPacientesEnColaController = async (req, res) => {
  try {
    let cantidadPacienteCola = await pacientesEnCola();
    cantidadPacienteCola = cantidadPacienteCola.length;
    return res.status(200).json({
      msg: 'Cantidad de pacientes en cola',
      cantidadPacienteCola,
    });
  } catch (error) {
    return res.status(500).json({
      msg:
        'Ocurrió un error obteniendo la cantidad de pacientes en cola. ' +
        error.message,
    });
  }
};
exports.cantidadPacientesAltaController = async (req, res) => {
  try {
    let cantidadPacientesDadoAlta = await pacientesDadoAlta();
    cantidadPacientesDadoAlta = cantidadPacientesDadoAlta.length;
    return res.status(200).json({
      msg: 'Cantidad de pacientes en cola',
      cantidadPacientesDadoAlta,
    });
  } catch (error) {
    return res.status(500).json({
      msg:
        'Ocurrió un error obteniendo la cantidad de pacientes en cola. ' +
        error.message,
    });
  }
};
exports.cantidadPacientesHospitalizadosController = async (req, res) => {
  try {
    let cantidadPacientesHospitalizados = await pacientesHospitalizados();
    cantidadPacientesHospitalizados = cantidadPacientesHospitalizados.length;
    return res.status(200).json({
      msg: 'Cantidad de pacientes en cola',
      cantidadPacientesHospitalizados,
    });
  } catch (error) {
    return res.status(500).json({
      msg:
        'Ocurrió un error obteniendo la cantidad de pacientes en cola. ' +
        error.message,
    });
  }
};
exports.eliminarPacienteController = async (req, res) => {
  try {
    const fueEliminado = await Pacientes.destroy({
      where: {
        id: req.params.pacienteId,
      },
    });
    return fueEliminado
      ? res.status(200).json({
          msg: 'Paciente eliminado correctamente.',
        })
      : res.status(404).json({
          msg: 'No se pudo eliminar el paciente, compruebe que el id pertenezca a un paciente registrado e intente nuevamente.',
        });
  } catch (error) {
    return res.status(500).json({
      msg: 'Ocurrió un error eliminando el paciente. ' + error.message,
    });
  }
};
