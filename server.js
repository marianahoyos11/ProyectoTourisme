const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const path = require('path'); 
const connection = require('./server/database/database');
const registroRouter = require('./server/routes/registro_conexion');
const rutaLogin = require('./server/routes/login_conexion');
const session = require('express-session'); // Maneja sesiones entre el navegador y el servidor
const passport = require('passport'); // Maneja autenticación con Google


require('./server/config/passport') // Importa la configuración de passport

const app = express();

app.use(cors());
app.use(bodyParser.json());

// Configuración de la sesion, necesaria para que Passport funcione.
app.use(session({
  secret: 'cobija',
  resave: false,
  saveUninitialized: false
}));

// Inicialización de Passport y conexión con la sesión
app.use(passport.initialize());
app.use(passport.session());


// Servir archivos estáticos desde la carpeta client
app.use(express.static(path.join(__dirname, 'client')));

// Ruta para el registro
app.use('/registro_conexion', registroRouter);

// Ruta para login - correo y contraseña
app.use('/api/login', rutaLogin);

// Rutas de autenticación (login normal, Google, logout)
const authRoutes = require('./server/routes/auth');
app.use('/auth', authRoutes);

// Ruta principal para mostrar el formulario
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'client', 'registro.html'));
});

module.exports = app;

