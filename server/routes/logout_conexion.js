const express = require('express');
const router = express.Router();

// Ruta para cerrar sesión
router.get('/', (req, res) => {
    if (req.session) {
        req.session.destroy(err => {
            if (err) {
                console.error('Error al cerrar sesión:', err);
                return res.status(500).json({ message: 'Error al cerrar sesión.' });
            } else {
                res.clearCookie('connect.sid'); // Borra cookie de sesión
                return res.json({ message: 'Sesión cerrada exitosamente.' });
            }
        });
    } else {
        // Si no hay sesión, igual responde
        return res.json({ message: 'No hay sesión activa.' });
    }
});

module.exports = router;
