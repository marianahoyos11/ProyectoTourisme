const express = require('express');
const session = require('express-session');
const cors = require('cors');
const bodyParser = require('body-parser');
const path = require('path');
const connection = require('./server/database/database');

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

// Configurar sesiones
app.use(session({
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: false
}));

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

// Rutas
app.use('/registro_conexion', registroRouter);
app.use('/api/login', rutaLogin);
app.use('/api/usuarios', isAuthenticated, usuariosRouter);
app.use('/api/categorias', isAuthenticated, categoriasRouter);
app.use('/api/destinos', isAuthenticated, destinosRouter);
app.use('/api/empresas', isAuthenticated, empresasRoutes);
app.use('/api/bitacora', isAuthenticated, bitacoraRoutes);

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'client', 'registro.html'));
});

// Catch-all para rutas no definidas
app.use((req, res) => {
  res.redirect('/');
});

module.exports = app;
