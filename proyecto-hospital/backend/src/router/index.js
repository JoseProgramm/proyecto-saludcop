const { Router } = require('express');
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
} = require('../controller/controller');
const router = Router();

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
router.delete('/api/paciente-eliminar/:pacienteId', eliminarPacienteController);
module.exports = router;
