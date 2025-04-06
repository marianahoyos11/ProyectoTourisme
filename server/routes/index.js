const express = require('express');
const router = express.Router();

const authRoutes = require('./auth');

// Ruta raíz
router.get('/', (req, res) => {
    res.send('Bienvenido a Tourisme');
});

// Rutas de autenticación
router.use('/auth', authRoutes);

module.exports = router;
