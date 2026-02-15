const express = require('express');
const router = express.Router();
const conexion = require('../database/database');

// Obtener todos los destinos turísticos
router.get('/', (req, res) => {
  const sql = `
    SELECT d.id_destino, d.nombre, d.descripcion, d.ciudad, d.direccion, d.id_categoria, c.nombre AS categoria
    FROM destinos_turisticos d
    JOIN categoria_turistica c ON d.id_categoria = c.id_categoria
    ORDER BY d.id_destino ASC
  `;
  conexion.query(sql, (error, results) => {
    if (error) throw error;
    res.json(results);
  });
});

// Crear destino
router.post('/', (req, res) => {
  const { nombre, descripcion, ciudad, direccion, id_categoria } = req.body;
  const sql = 'INSERT INTO destinos_turisticos (nombre, descripcion, ciudad, direccion, id_categoria) VALUES (?, ?, ?, ?, ?)';
  conexion.query(sql, [nombre, descripcion, ciudad, direccion, id_categoria], (error) => {
    if (error) throw error;
    res.json({ mensaje: 'Destino creado' });
  });
});

// Actualizar destino
router.put('/:id', (req, res) => {
  const { nombre, descripcion, ciudad, direccion, id_categoria } = req.body;
  const { id } = req.params;
  const sql = 'UPDATE destinos_turisticos SET nombre = ?, descripcion = ?, ciudad = ?, direccion = ?, id_categoria = ? WHERE id_destino = ?';
  conexion.query(sql, [nombre, descripcion, ciudad, direccion, id_categoria, id], (error) => {
    if (error) throw error;
    res.json({ mensaje: 'Destino actualizado' });
  });
});

// Eliminar destino
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  conexion.query('DELETE FROM destinos_turisticos WHERE id_destino = ?', [id], (error) => {
    if (error) throw error;
    res.json({ mensaje: 'Destino eliminado' });
  });
});

module.exports = router;
