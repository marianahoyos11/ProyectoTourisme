const bcrypt = require('bcrypt');
const path = require('path');
const fs = require('fs');
const db = require('../database/database.js');
const multer = require('multer');
const {OAuth2Client} = require('google-auth-library');
const client = new OAuth2Client('378126372935-d2n8i4nmj0ap0h0av3e9nquorcmk1kd8.apps.googleusercontent.com');

// LOGIN NORMAL
exports.login = async (req, res) => {
    const { correo, contrasena } = req.body;

    db.query('SELECT a.*, u.nombre, u.id_usuario FROM autenticacion a JOIN usuario u ON a.id_usuario = u.id_usuario WHERE a.correo = ? AND a.tipo_autenticacion = "normal"', [correo], async (error, results) => {
        if (error) return res.status(500).json({ success: false, error: 'Error del servidor' });

        if (results.length === 0) return res.status(401).json({ success: false, error: 'Correo o contraseña incorrectos' });

        const usuario = results[0];
        const passwordMatch = await bcrypt.compare(contrasena, usuario.contrasena_hash);

        if (!passwordMatch) return res.status(401).json({ success: false, error: 'Correo o contraseña incorrectos' });

        req.session.user = {
            id: usuario.id_usuario,
            nombre: usuario.nombre,
            correo: usuario.correo
        };

        return res.status(200).json({ success: true, rol: 'usuario' });
    });
};

// REGISTRO NORMAL
exports.register = async (req, res) => {
    const { nombre, correo, contrasena, fecha_nacimiento, genero, nacionalidad } = req.body;
    const contrasena_hash = await bcrypt.hash(contrasena, 10);

    // Verificar si el correo ya existe
    db.query('SELECT * FROM autenticacion WHERE correo = ?', [correo], (err, results) => {
        if (err) return res.status(500).json({ success: false, error: 'Error al verificar correo' });

        if (results.length > 0) return res.status(400).json({ success: false, error: 'El correo ya está registrado' });

        // Insertar en tabla usuario
        const id_rol = 2; // ← Cambia esto si necesitas otro rol
        db.query('INSERT INTO usuario (nombre, correo, id_rol) VALUES (?, ?, ?)', [nombre, correo, id_rol], (err, result) => {
            if (err) return res.status(500).json({ success: false, error: 'Error al registrar usuario' });

            const id_usuario = result.insertId;

            // Insertar en tabla autenticación
            const tipo_autenticacion = 'normal';
            db.query('INSERT INTO autenticacion (id_usuario, correo, contrasena_hash, fecha_nacimiento, genero, nacionalidad, tipo_autenticacion) VALUES (?, ?, ?, ?, ?, ?, ?)', 
                [id_usuario, correo, contrasena_hash, fecha_nacimiento, genero, nacionalidad, tipo_autenticacion],
                (err2) => {
                    if (err2) return res.status(500).json({ success: false, error: 'Error al guardar autenticación' });

                    return res.status(201).json({ success: true, mensaje: 'Usuario registrado exitosamente' });
                }
            );
        });
    });
};

// LOGIN CON GOOGLE
exports.googleLogin = async (req, res) => {
    const { id_token } = req.body;
    console.log('Token recibido del front:', id_token);

    if (!id_token) return res.status(400).json({ success: false, error: 'Token no proporcionado' });

    try {
        const ticket = await client.verifyIdToken({
            idToken: id_token,
            audience: '378126372935-d2n8i4nmj0ap0h0av3e9nquorcmk1kd8.apps.googleusercontent.com', 
        });

        const payload = ticket.getPayload();
        const { email, name, sub: id_google } = payload;

        // Verificar si ya existe autenticación con Google
        db.query('SELECT a.*, u.nombre FROM autenticacion a JOIN usuario u ON a.id_usuario = u.id_usuario WHERE a.correo = ? AND a.tipo_autenticacion = "google"', [email], (err, results) => {
            if (err) return res.status(500).json({ success: false, error: 'Error en el servidor' });

            if (results.length > 0) {
                const usuario = results[0];
                req.session.user = {
                    id: usuario.id_usuario,
                    nombre: usuario.nombre,
                    correo: usuario.correo
                };
                return res.status(200).json({ success: true, rol: 'usuario' });
            }

            // Crear nuevo usuario y autenticación Google
            const id_rol = 2;
            db.query('INSERT INTO usuario (nombre, correo, id_rol) VALUES (?, ?, ?)', [name, email, id_rol], (err2, result) => {
                if (err2) return res.status(500).json({ success: false, error: 'Error al registrar usuario' });

                const id_usuario = result.insertId;

                db.query('INSERT INTO autenticacion (id_usuario, correo, contrasena_hash, fecha_nacimiento, genero, nacionalidad, id_google, tipo_autenticacion) VALUES (?, ?, NULL, NULL, NULL, NULL, ?, "google")',
                    [id_usuario, email, id_google],
                    (err3) => {
                        if (err3) return res.status(500).json({ success: false, error: 'Error al guardar autenticación de Google' });

                        req.session.user = {
                            id: id_usuario,
                            nombre: name,
                            correo: email
                        };
                        return res.status(200).json({ success: true, rol: 'usuario' });
                    }
                );
            });
        });
    } catch (error) {
        console.error('Error al verificar token de Google:', error);
        return res.status(401).json({ success: false, error: 'Token inválido' });
    }
};

// CERRAR SESIÓN
exports.logout = (req, res) => {
    res.clearCookie('token'); // Solo si usas cookies en algún momento
  return res.status(200).json({ message: 'Sesión cerrada exitosamente' });
};
