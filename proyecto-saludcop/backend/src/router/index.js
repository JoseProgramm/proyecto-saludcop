const { Router } = require('express');
const { registroPacienteController } = require('../controller/controller');
const router = Router();

router.post('/api/registro-paciente', registroPacienteController);
module.exports = router;
