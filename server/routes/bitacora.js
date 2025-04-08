const express = require("express");
const router = express.Router();
const conexion = require("../database/database");

// Obtener todos los registros de bitácora
router.get("/", (req, res) => {
  const sql = `
    SELECT b.id_bitacora, u.nombre AS usuario, b.accion, b.fecha
    FROM bitacora_auditoria b
    JOIN usuario u ON b.id_usuario = u.id_usuario
    ORDER BY b.fecha DESC
  `;
  conexion.query(sql, (error, results) => {
    if (error) {
      console.error("Error al obtener bitácora:", error);
      return res.status(500).json({ error: "Error al obtener bitácora" });
    }
    res.json(results);
  });
});

// Insertar un nuevo registro en la bitácora
router.post("/", (req, res) => {
  const { id_usuario, accion } = req.body;

  if (!id_usuario || !accion) {
    return res.status(400).json({ error: "Datos incompletos" });
  }

  const sql = "INSERT INTO bitacora_auditoria (id_usuario, accion) VALUES (?, ?)";
  conexion.query(sql, [id_usuario, accion], (error, result) => {
    if (error) {
      console.error("Error al insertar en bitácora:", error);
      return res.status(500).json({ error: "Error al insertar en bitácora" });
    }
    res.status(201).json({ mensaje: "Acción registrada en bitácora" });
  });
});

module.exports = router;
