const Usuarios = require('../models/Usuarios');
exports.autenticarUsuario = async (req, res, next) => {
  if (!req.headers.autenticacion) {
    res.status(401).json({
      msg: 'Autenticación requerida',
    });
    return;
  }
  const usuarioEncontrado = await Usuarios.findAll({
    where: {
      id: req.headers.autenticacion,
    },
  });
  if (!usuarioEncontrado.length) {
    res.status(401).json({
      msg: 'Usuario no existente',
    });
    return;
  }
  return next();
};
