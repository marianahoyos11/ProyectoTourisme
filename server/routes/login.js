const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const connection = require('../database/database');

const router = express.Router();

// Ruta para iniciar sesión
router.post('/', (req, res) => {
    const { correo, contrasena } = req.body;
    
    if (!correo || !contrasena) {
        return res.status(400).json({ error: "Todos los campos son obligatorios." });
    }

    // Buscar usuario con JOIN para obtener nombre y rol
    connection.query(`
        SELECT a.*, u.nombre, u.id_rol, r.nombre AS rol
        FROM autenticacion a
        INNER JOIN usuario u ON a.id_usuario = u.id_usuario
        INNER JOIN rol r ON u.id_rol = r.id_rol
        WHERE a.correo = ?
    `, [correo], async (err, results) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(500).json({ error: 'Error en el servidor' });
        }

        if (results.length === 0) {
            return res.status(401).json({ error: 'Correo o contraseña incorrectos' });
        }

        const user = results[0];

        // Verificamos contraseña
        const match = await bcrypt.compare(contrasena, user.contrasena_hash);
        if (!match) {
            return res.status(401).json({ error: 'Correo o contraseña incorrectos' });
        }

        // Generar token JWT
        const token = jwt.sign(
            { id_usuario: user.id_usuario, correo: user.correo },
            process.env.JWT_SECRET || 'clave_secreta',
            { expiresIn: '2h' }
        );

        // Si el usuario es de tipo negocio, obtener su id_empresa
        if (user.rol === 'negocio') {
            connection.query(
                'SELECT id_empresa FROM empresa WHERE id_usuario = ? LIMIT 1',
                [user.id_usuario],
                (err2, empresaResults) => {
                    if (err2) {
                        console.error('Error al buscar empresa:', err2);
                        return res.status(500).json({ error: 'Error al obtener empresa' });
                    }

                    const id_empresa = empresaResults.length > 0 ? empresaResults[0].id_empresa : null;

                    res.json({
                        message: 'Inicio de sesión exitoso',
                        token,
                        nombre: user.nombre,
                        rol: user.rol,
                        id_empresa // solo se envía si es negocio
                    });
                }
            );
        } else {
            // Para roles distintos a "negocio"
            res.json({
                message: 'Inicio de sesión exitoso',
                token,
                nombre: user.nombre,
                rol: user.rol
            });
        }
    });
});

module.exports = router;
