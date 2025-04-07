const express = require('express');
const router = express.Router();
const { OAuth2Client } = require('google-auth-library');
const connection = require('../database/database');

const client = new OAuth2Client(process.env.GOOGLE_CLIENT_ID); // Asegúrate de tener esta variable en tu .env

// Ruta para manejar el login con Google
router.post('/', async (req, res) => {
    const { id_token } = req.body;

    try {
        const ticket = await client.verifyIdToken({
            idToken: id_token,
            audience: process.env.GOOGLE_CLIENT_ID,
        });

        const payload = ticket.getPayload();
        const correo = payload.email;
        const nombre = payload.name;
        const id_google = payload.sub;

        // Buscar si ya existe el usuario en la base de datos
        connection.query('SELECT u.id_usuario, u.nombre, u.correo, r.nombre AS rol FROM usuario u JOIN rol r ON u.id_rol = r.id_rol WHERE u.correo = ?', [correo], (err, results) => {
            if (err) {
                console.error('Error en la base de datos:', err);
                return res.status(500).json({ success: false, error: 'Error interno del servidor' });
            }

            if (results.length > 0) {
                // Usuario ya registrado
                const user = results[0];
                return res.json({ success: true, rol: user.rol });
            } else {
                // Si el usuario no existe, lo registramos
                const idRolUsuario = 1; // Asegúrate de que 1 sea el rol correcto para usuarios normales

                // Insertar en la tabla `usuario`
                connection.query('INSERT INTO usuario (nombre, correo, id_rol) VALUES (?, ?, ?)', [nombre, correo, idRolUsuario], (err, result) => {
                    if (err) {
                        console.error('Error al insertar usuario:', err);
                        return res.status(500).json({ success: false, error: 'Error al crear usuario' });
                    }

                    const id_usuario = result.insertId;

                    // Insertar en la tabla `autenticacion`
                    const authQuery = 'INSERT INTO autenticacion (id_usuario, correo, contrasena_hash, id_google, tipo_autenticacion) VALUES (?, ?, ?, ?, ?)';
                    const valores = [id_usuario, correo, '', id_google, 'google'];

                    connection.query(authQuery, valores, (err) => {
                        if (err) {
                            console.error('Error al insertar autenticación:', err);
                            return res.status(500).json({ success: false, error: 'Error al crear autenticación' });
                        }

                        return res.json({ success: true, rol: 'usuario' });
                    });
                });
            }
        });

    } catch (error) {
        console.error('Error al verificar token de Google:', error);
        res.status(401).json({ success: false, error: 'Token no válido' });
    }
});

module.exports = router;
