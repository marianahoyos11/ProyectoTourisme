function verificarSesion(req, res, next) {
    if (req.session && req.session.usuario) {
      // Usuario autenticado, sigue a la siguiente función
      next();
    } else {
      // Usuario no autenticado
      res.status(401).json({ message: 'No autorizado. Inicia sesión.' });
    }
  }
  
  module.exports = verificarSesion;
  