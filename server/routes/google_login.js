const express = require('express');
const router = express.Router();
const { OAuth2Client } = require('google-auth-library');
const connection = require('../database/database');

const client = new OAuth2Client(process.env.GOOGLE_CLIENT_ID);

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
        connection.query(
            'SELECT u.id_usuario, u.nombre, u.correo, r.nombre AS rol FROM usuario u JOIN rol r ON u.id_rol = r.id_rol WHERE u.correo = ?',
            [correo],
            (err, results) => {
                if (err) {
                    console.error('Error en la base de datos:', err);
                    return res.status(500).json({ success: false, error: 'Error interno del servidor' });
                }

                if (results.length > 0) {
                    // Usuario ya registrado
                    const user = results[0];
                    req.session.user = {
                        id_usuario: user.id_usuario,
                        nombre: user.nombre,
                        rol: user.rol
                    };
                    return res.json({ success: true, redirect: '/dashboard.html' }); // O la página principal del usuario
                } else {
                    // Si el usuario no existe, lo registramos con rol NULL
                    connection.query(
                        'INSERT INTO usuario (nombre, correo, id_rol) VALUES (?, ?, NULL)',
                        [nombre, correo],
                        (err, result) => {
                            if (err) {
                                console.error('Error al insertar usuario:', err);
                                return res.status(500).json({ success: false, error: 'Error al crear usuario' });
                            }

                            const id_usuario = result.insertId;

                            const authQuery = 'INSERT INTO autenticacion (id_usuario, correo, contrasena_hash, id_google, tipo_autenticacion) VALUES (?, ?, ?, ?, ?)';
                            const valores = [id_usuario, correo, '', id_google, 'google'];

                            connection.query(authQuery, valores, (err) => {
                                if (err) {
                                    console.error('Error al insertar autenticación:', err);
                                    return res.status(500).json({ success: false, error: 'Error al crear autenticación' });
                                }

                                // Guardar sesión
                                req.session.user = {
                                    id_usuario,
                                    nombre,
                                    rol: null
                                };

                                return res.json({ success: true, redirect: '/seleccion_rol.html' });
                            });
                        }
                    );
                }
            }
        );
    } catch (error) {
        console.error('Error al verificar token de Google:', error);
        res.status(401).json({ success: false, error: 'Token no válido' });
    }
});

module.exports = router;
