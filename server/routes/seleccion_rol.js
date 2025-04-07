const express = require('express');
const router = express.Router();
const connection = require('../database/database');

// Ruta para asignar el rol después del login con Google
router.post('/', (req, res) => {
  const { rol } = req.body;

  // Validar que el usuario está en sesión
  if (!req.session || !req.session.user) {
    return res.status(401).json({ success: false, message: 'Sesión no válida' });
  }

  const correo = req.session.user.correo;

  // Obtener el ID del rol correspondiente (turista = 1, negocio = 2)
  const idRol = rol === 'negocio' ? 2 : 1;

  // Actualizar la tabla usuario con el nuevo rol
  const query = 'UPDATE usuario SET id_rol = ? WHERE correo = ?';

  connection.query(query, [idRol, correo], (err, result) => {
    if (err) {
      console.error('Error al actualizar el rol:', err);
      return res.status(500).json({ success: false, message: 'Error al asignar rol' });
    }

    // Actualizamos la sesión también
    req.session.user.rol = rol;

    res.json({ success: true });
  });
});

module.exports = router;
