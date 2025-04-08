const express = require('express');
const router = express.Router();
const conexion = require('../database/database');

// Obtener todos los usuarios
router.get('/', (req, res) => {
  conexion.query('SELECT * FROM usuario', (error, results) => {
    if (error) throw error;
    res.json(results);
  });
});

// Crear usuario (ahora incluye correo)
router.post('/', (req, res) => {
  const { nombre, correo, id_rol } = req.body;
  const query = 'INSERT INTO usuario (nombre, correo, id_rol) VALUES (?, ?, ?)';
  conexion.query(query, [nombre, correo, id_rol], (error, results) => {
    if (error) throw error;
    res.json({ mensaje: 'Usuario creado' });
  });
});

// Actualizar usuario (ahora incluye correo)
router.put('/:id', (req, res) => {
  const { nombre, correo, id_rol } = req.body;
  const { id } = req.params;
  const query = 'UPDATE usuario SET nombre = ?, correo = ?, id_rol = ? WHERE id_usuario = ?';
  conexion.query(query, [nombre, correo, id_rol, id], (error) => {
    if (error) throw error;
    res.json({ mensaje: 'Usuario actualizado' });
  });
});

// Eliminar usuario
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  conexion.query('DELETE FROM usuario WHERE id_usuario = ?', [id], (error) => {
    if (error) throw error;
    res.json({ mensaje: 'Usuario eliminado' });
  });
});

module.exports = router;
