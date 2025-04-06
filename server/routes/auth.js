const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');
const passport = require('passport');

// Ruta para registro de usuarios
router.post('/register', authController.register);

// Ruta para inicio de sesión
router.post('/login', authController.login);

// Ruta para cerrar sesión
router.get('/logout', authController.logout);

// Inicio de proceso de autenticación con Google
router.get('/google', 
    passport.authenticate('google', { scope: ['profile', 'email'] })
);

// Ruta a la que Google redirige despues de autenticarse
router.get('/google/callback',
    passport.authenticate('google', {
        successRedirect: 'login',  //Si la autenticación es exitosa, redirige a la ruta de login
        failureRedirect: '/index' // Si la autenticación falla, redirige a la ruta de index
    
    })
);

module.exports = router;