const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

// Ruta para registro de usuarios
router.post('/register', authController.register);

// Ruta para inicio de sesión
router.post('/login', authController.login);

// Ruta para cerrar sesión
router.get('/logout', authController.logout);

module.exports = router;