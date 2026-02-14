// server/routes/categorias.js
const express = require('express');
const router = express.Router();
const conexion = require('../database/database');

// Obtener todas las categorías
router.get('/', (req, res) => {
  conexion.query('CALL consultar_categorias()', (error, results) => {
    if (error) {
      console.error("Error al consultar categorías:", error);
      return res.status(500).json({ error: 'Error en el servidor' });
    }

    res.json(results[0]); // Solo se devuelve una fila de resultados
  });
});



// Obtener una categoría por ID
router.get('/:id', (req, res) => {
  const { id } = req.params;

  conexion.query('CALL consultar_categoria_por_id(?)', [id], (error, results) => {
    if (error) {
      console.error("Error al obtener la categoría:", error);
      return res.status(500).json({ error: 'Error en el servidor' });
    }

    if (results[0].length === 0) {
      return res.status(404).json({ error: 'Categoría no encontrada' });
    }

    res.json(results[0][0]);
  });
});


// Crear categoría
router.post('/', (req, res) => {
  const { nombre, descripcion } = req.body;

  conexion.query(
    'CALL insertar_categoria_turistica(?, ?)',
    [nombre, descripcion],
    (error) => {
      if (error) {
        console.error("Error al crear categoría:", error);
        return res.status(500).json({ error: error.sqlMessage || 'Error en el servidor' });
      }

      res.json({ mensaje: 'Categoría creada correctamente' });
    }
  );
});


// Actualizar categoría
router.put('/:id', (req, res) => {
  const { id } = req.params;
  const { nombre, descripcion } = req.body;

  conexion.query(
    'CALL actualizar_categoria_turistica(?, ?, ?)',
    [id, nombre, descripcion],
    (error) => {
      if (error) {
        console.error("Error al actualizar categoría:", error);
        return res.status(500).json({ error: error.sqlMessage || 'Error en el servidor' });
      }

      res.json({ mensaje: 'Categoría actualizada correctamente' });
    }
  );
});


// Eliminar categoría
router.delete('/:id', (req, res) => {
  const { id } = req.params;

  conexion.query(
    'CALL eliminar_categoria_turistica(?)',
    [id],
    (error) => {
      if (error) {
        console.error("Error al eliminar categoría:", error);
        return res.status(500).json({ error: error.sqlMessage || 'Error en el servidor' });
      }

      res.json({ mensaje: 'Categoría eliminada correctamente' });
    }
  );
});

module.exports = router;
 