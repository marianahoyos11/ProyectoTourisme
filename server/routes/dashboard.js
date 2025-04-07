const express = require('express');
const router = express.Router();
const verificarSesion = require('../middleware/authMiddleware'); // Importamos el middleware

// Ruta protegida que solo puedes ver si tienes sesión iniciada
router.get('/', verificarSesion, (req, res) => {
  res.json({
    message: 'Bienvenido al dashboard',
    usuario: req.session.usuario // Esta es la info del usuario en sesión
  });
});

module.exports = router;
