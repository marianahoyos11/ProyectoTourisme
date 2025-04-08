// server/routes/categorias.js
const express = require('express');
const router = express.Router();
const conexion = require('../database/database');

// Obtener todas las categorías
router.get('/', (req, res) => {
  conexion.query('SELECT * FROM categoria_turistica', (error, results) => {
    if (error) throw error;
    res.json(results);
  });
});

// Obtener una categoría por ID
router.get('/:id', (req, res) => {
  const { id } = req.params;
  conexion.query('SELECT * FROM categoria_turistica WHERE id_categoria = ?', [id], (error, results) => {
    if (error) {
      console.error("Error al obtener la categoría:", error);
      return res.status(500).json({ error: 'Error en el servidor' });
    }
    if (results.length === 0) {
      return res.status(404).json({ error: 'Categoría no encontrada' });
    }
    res.json(results[0]);
  });
});

// Crear categoría
router.post('/', (req, res) => {
  const { nombre, descripcion } = req.body;
  conexion.query('INSERT INTO categoria_turistica (nombre, descripcion) VALUES (?, ?)', [nombre, descripcion], (error) => {
    if (error) throw error;
    res.json({ mensaje: 'Categoría creada' });
  });
});

// Actualizar categoría
router.put('/:id', (req, res) => {
  const { nombre, descripcion } = req.body;
  const { id } = req.params;
  conexion.query('UPDATE categoria_turistica SET nombre = ?, descripcion = ? WHERE id_categoria = ?', [nombre, descripcion, id], (error) => {
    if (error) throw error;
    res.json({ mensaje: 'Categoría actualizada' });
  });
});

// Eliminar categoría
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  conexion.query('DELETE FROM categoria_turistica WHERE id_categoria = ?', [id], (error) => {
    if (error) throw error;
    res.json({ mensaje: 'Categoría eliminada' });
  });
});

module.exports = router;
 