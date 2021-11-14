const { Router } = require('express');
// const {autenticarUsuario} = require('../middleware/auth')
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
router.post('/api/paciente-registro', registroPacienteController);
router.put('/api/paciente-alta/:pacienteId', darAltaPacienteController);
router.get('/api/pacientes-en-alta', obtenerPacientesAltaController);
router.get('/api/pacientes-en-cola', obtenerPacientesEnColaController);
router.get(
  '/api/pacientes-hospitalizados',
  obtenerPacientesHospitalizadosController
);
router.get('/api/paciente/:pacienteId', obtenerPacienteIdController);
router.get(
  '/api/cantidad-pacientes-en-cola',
  cantidadPacientesEnColaController
);
router.get('/api/cantidad-pacientes-en-alta', cantidadPacientesAltaController);
router.get('/api/pacienteCola/asignar-cama', asignarCamaPacienteCola);
router.get(
  '/api/cantidad-pacientes-hospitalizados',
  cantidadPacientesHospitalizadosController
);
router.get('/api/cantidad-camas-disponibles', cantidadCamasDisponibles);
router.get('/api/obtener-usuarios', obtenerUsuarios);
router.get('/api/rol-usuarios/:usuarioId', obtenerRolUsuario);
router.delete('/api/usuario-eliminar/:usuarioId', eliminarUsuarioController);
router.delete('/api/paciente-eliminar/:pacienteId', eliminarPacienteController);
module.exports = router;
