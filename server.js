const express = require('express');
//const session = require('express-session');
const cors = require('cors');
const bodyParser = require('body-parser');
const path = require('path');
const db = require('./server/database/database');
const contenidoRutas = require('./server/routes/contenidoRutas');

// Rutas
const registroRouter = require('./server/routes/registro_conexion');
const rutaLogin = require('./server/routes/login_conexion');
const usuariosRouter = require('./server/routes/usuarios');
const categoriasRouter = require('./server/routes/categorias');
const destinosRouter = require('./server/routes/destinos');
const empresasRoutes = require('./server/routes/empresa');
const bitacoraRoutes = require("./server/routes/bitacora");

const app = express();

app.use(cors());
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: true }));


// // Configurar sesiones
// app.use(session({
//   secret: process.env.SESSION_SECRET,
//   resave: false,
//   saveUninitialized: false
// }));

// Middleware de autenticación
function isAuthenticated(req, res, next) {
  if (req.session && req.session.user) {
    return next();
  } else {
    return res.redirect('/login.html');
  }
}

app.use(express.static(path.join(__dirname, 'client')));
app.use(express.static('public'));
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));


// Rutas
app.use('/registro_conexion', registroRouter);
app.use('/api/login', rutaLogin);
app.use('/api/usuarios', usuariosRouter);
app.use('/api/categorias', categoriasRouter);
app.use('/api/destinos', destinosRouter);
app.use('/api/empresas', empresasRoutes);
app.use('/api/bitacora',  bitacoraRoutes);
app.use('/api/contenido', contenidoRutas);

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'client', 'registro.html'));
});

// Catch-all para rutas no definidas
app.use((req, res) => {
  res.redirect('/');
});

module.exports = app;
