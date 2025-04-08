const express = require('express');
const cors = require('cors');
const session = require('express-session');
const bodyParser = require('body-parser');
const path = require('path');

const connection = require('./server/database/database');
const registroRouter = require('./server/routes/registro_conexion');
const rutaLogin = require('./server/routes/login_conexion');
const rutaGoogleLogin = require('./server/routes/google_login');
const authRoutes = require('./server/routes/auth');
const logoutRoute = require('./server/routes/logout_conexion');
const rutaDashboard = require('./server/routes/dashboard');
const seleccionarRolRoute = require('./server/routes/seleccion_rol');

require('dotenv').config(); // Asegúrate de cargar variables de entorno

const app = express();

//  Middleware de sesión
app.use(session({
  secret: process.env.SESSION_SECRET || 'clave_secreta_segura',
  resave: false,
  saveUninitialized: false,
  cookie: {
    secure: false, // Cambia a true si usas HTTPS
    httpOnly: true,
    maxAge: 1000 * 60 * 60 * 2 // 2 horas
  }
}));

app.use(cors());
app.use(bodyParser.json());

// Servir archivos estáticos desde la carpeta client
app.use(express.static(path.join(__dirname, 'client')));

//  Rutas
app.use('/api/auth', authRoutes);
//app.use('/api/auth/logout', logoutRoute);
app.use('/registro_conexion', registroRouter);
app.use('/api/login', rutaLogin);
app.use('/api/dashboard', rutaDashboard);
app.use('api/seleccionar-rol', seleccionarRolRoute);

//  Ruta principal para mostrar el formulario
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'client', 'registro.html'));
});

module.exports = app;
