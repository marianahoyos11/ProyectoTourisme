const jwt = require('jsonwebtoken');

const authMiddleware = (req, res, next) => {
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
        return res.status(401).json({ error: 'No autorizado. Token no proporcionado.' });
    }

    const token = authHeader.split(' ')[1];

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET || 'clave_secreta');
        req.user = decoded; // Guardamos los datos del token (ej: id_usuario y rol) en la petición
        next(); // Continuamos con la siguiente función o ruta
    } catch (err) {
        return res.status(403).json({ error: 'Token inválido o expirado.' });
    }
};

module.exports = authMiddleware;
