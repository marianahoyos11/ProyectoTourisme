const express = require('express');
const router = express.Router();
const conexion = require('../database/database');

// Obtener todas las empresas
router.get('/', (req, res) => {
  const sql = `
    SELECT e.id_empresa, e.nombre, e.descripcion, e.tipo, e.horario_apertura, e.horario_cierre, 
           e.telefono, u.nombre AS usuario, d.nombre AS destino, e.id_usuario, e.id_destino
    FROM empresa e
    JOIN usuario u ON e.id_usuario = u.id_usuario
    JOIN destino_turistico d ON e.id_destino = d.id_destino
    ORDER BY e.id_empresa ASC
  `;
  conexion.query(sql, (error, results) => {
    if (error) throw error;
    res.json(results);
  });
});

// Crear una nueva empresa
router.post('/', (req, res) => {
  const { nombre, descripcion, tipo, horario_apertura, horario_cierre, telefono, id_usuario, id_destino } = req.body;
  const sql = `
    INSERT INTO empresa (nombre, descripcion, tipo, horario_apertura, horario_cierre, telefono, id_usuario, id_destino)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  `;
  conexion.query(sql, [nombre, descripcion, tipo, horario_apertura, horario_cierre, telefono, id_usuario, id_destino], (error) => {
    if (error) throw error;
    res.json({ mensaje: 'Empresa creada exitosamente' });
  });
});

// Actualizar una empresa
router.put('/:id', (req, res) => {
  const { nombre, descripcion, tipo, horario_apertura, horario_cierre, telefono, id_usuario, id_destino } = req.body;
  const { id } = req.params;
  const sql = `
    UPDATE empresa SET nombre = ?, descripcion = ?, tipo = ?, horario_apertura = ?, horario_cierre = ?, 
    telefono = ?, id_usuario = ?, id_destino = ? WHERE id_empresa = ?
  `;
  conexion.query(sql, [nombre, descripcion, tipo, horario_apertura, horario_cierre, telefono, id_usuario, id_destino, id], (error) => {
    if (error) throw error;
    res.json({ mensaje: 'Empresa actualizada exitosamente' });
  });
});

// Eliminar una empresa
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  conexion.query('DELETE FROM empresa WHERE id_empresa = ?', [id], (error) => {
    if (error) throw error;
    res.json({ mensaje: 'Empresa eliminada exitosamente' });
  });
});

// Obtener una empresa por ID
router.get('/:id', (req, res) => {
  const { id } = req.params;
  const sql = 'SELECT * FROM empresa WHERE id_empresa = ?';
  conexion.query(sql, [id], (error, results) => {
    if (error) throw error;
    res.json(results[0]);
  });
});

module.exports = router;
