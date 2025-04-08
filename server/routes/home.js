const express = require('express');
const router = express.Router();
const authController = require('../controller/authController');

// Ruta para cerrar sesión
router.post('/logout', authController.logout);

// Ruta para obtener nombre del usuario
router.get('/user-info', (req, res) => {
    if (req.session.user) {
        res.status(200).json({ nombre: req.session.user.nombre });
    } else {
        res.status(401).json({ error: 'No hay sesión activa' });
    }
});

module.exports = router;
