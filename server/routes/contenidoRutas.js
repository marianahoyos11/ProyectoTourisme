const express = require('express');
const router = express.Router();
const db = require('../database/database'); 
const multer = require('multer');
const path = require('path');

// Configurar multer para guardar imágenes
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/'); 
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname));
  }
});
const upload = multer({ storage });

// RUTA: Obtener categorías turísticas
router.get('/categorias', (req, res) => {
  db.query('SELECT id_categoria, nombre FROM categoria_turistica', (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
});

// RUTA: Obtener destinos turísticos
router.get('/destinos', (req, res) => {
  db.query('SELECT id_destino, nombre FROM destino_turistico', (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
});

// RUTA: Obtener empresas
router.get('/empresas', (req, res) => {
  db.query('SELECT id_empresa, nombre FROM empresa', (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
});

// RUTA: Guardar contenido
router.post('/agregar_contenido', upload.single('imagen'), (req, res) => {
  const { titulo, descripcion, id_categoria, id_destino, id_empresa } = req.body;
  const imagen = req.file.filename;

  const sql = `
    INSERT INTO contenido (titulo, descripcion, imagen, id_categoria, id_destino, id_empresa)
    VALUES (?, ?, ?, ?, ?, ?)
  `;

  db.query(sql, [titulo, descripcion, imagen, id_categoria, id_destino, id_empresa], (err, result) => {
    if (err) return res.status(500).json({ error: err });
    res.redirect('/contenido_empresa.html'); // Ajusta si necesitas redirigir a otra vista
  });
});

// Ruta para listar contenidos
router.get('/listar', (req, res) => {
    const sql = `
        SELECT c.*, cat.nombre AS nombre_categoria, d.nombre AS nombre_destino, e.nombre AS nombre_empresa
        FROM contenido c
        JOIN categoria_turistica cat ON c.id_categoria = cat.id_categoria
        JOIN destino_turistico d ON c.id_destino = d.id_destino
        JOIN empresa e ON c.id_empresa = e.id_empresa
        `;
  
    db.query(sql, (err, results) => {
      if (err) {
        return res.status(500).json({ error: err });
      }
      res.json(results);
    });
  });

module.exports = router;
