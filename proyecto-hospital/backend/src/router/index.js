const { Router } = require('express');
const { autenticarUsuario } = require('../middleware/auth');
const {
  registroPacienteController,
  darAltaPacienteController,
  obtenerPacientesAltaController,
  obtenerPacientesEnColaController,
  obtenerPacientesHospitalizadosController,
  obtenerPacienteIdController,
  cantidadPacientesEnColaController,
  cantidadPacientesAltaController,
  cantidadPacientesHospitalizadosController,
  eliminarPacienteController,
  asignarCamaPacienteCola,
  cantidadCamasDisponibles,
  registroUsuarioController,
  loginUsuarioController,
  obtenerUsuarios,
  obtenerRolUsuario,
  eliminarUsuarioController,
} = require('../controller/controller');
const router = Router();
router.post('/api/registro-usuario', registroUsuarioController);
router.post('/api/login-usuario', loginUsuarioController);
router.post(
  '/api/paciente-registro',
  autenticarUsuario,
  registroPacienteController
);
router.put(
  '/api/paciente-alta/:pacienteId',
  autenticarUsuario,
  darAltaPacienteController
);
router.get(
  '/api/pacientes-en-alta',
  autenticarUsuario,
  obtenerPacientesAltaController
);
router.get(
  '/api/pacientes-en-cola',
  autenticarUsuario,
  obtenerPacientesEnColaController
);
router.get(
  '/api/pacientes-hospitalizados',
  autenticarUsuario,
  obtenerPacientesHospitalizadosController
);
router.get(
  '/api/paciente/:pacienteId',
  autenticarUsuario,
  obtenerPacienteIdController
);
router.get(
  '/api/cantidad-pacientes-en-cola',
  autenticarUsuario,
  cantidadPacientesEnColaController
);
router.get(
  '/api/cantidad-pacientes-en-alta',
  autenticarUsuario,
  cantidadPacientesAltaController
);
router.get(
  '/api/pacienteCola/asignar-cama',
  autenticarUsuario,
  asignarCamaPacienteCola
);
router.get(
  '/api/cantidad-pacientes-hospitalizados',
  autenticarUsuario,
  cantidadPacientesHospitalizadosController
);
router.get(
  '/api/cantidad-camas-disponibles',
  autenticarUsuario,
  cantidadCamasDisponibles
);
router.get('/api/obtener-usuarios', autenticarUsuario, obtenerUsuarios);
router.get(
  '/api/rol-usuarios/:usuarioId',
  autenticarUsuario,
  obtenerRolUsuario
);
router.delete(
  '/api/usuario-eliminar/:usuarioId',
  autenticarUsuario,
  eliminarUsuarioController
);
router.delete(
  '/api/paciente-eliminar/:pacienteId',
  autenticarUsuario,
  eliminarPacienteController
);
module.exports = router;
