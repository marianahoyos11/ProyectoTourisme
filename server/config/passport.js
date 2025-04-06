const GoogleStrategy = require('passport-google-oauth20').Strategy;
const passport = require('passport');
const db = require('../database/database.js');

module.exports = function(passport) {
    passport.use(new GoogleStrategy({
        clientID: process.env.GOOGLE_CLIENT_ID,
        clientSecret: process.env.GOOGLE_CLIENT_SECRET,
        callbackURL: '/auth/google/callback'
    },
    async function(accessToken, refreshToken, profile, done) {
        try {
            const email = profile.emails[0].value;
            const fullName = profile.displayName;

            db.query('SELECT * FROM usuario WHERE correo = ?', [correo], (err, results) => {
                if (err) return done(err);

                if (results.length > 0) {
                    // Usuario ya existe
                    return done(null, results[0]);
                } else {
                    // Crear nuevo usuario
                    const nuevoUsuario = {
                        nombre: fullName,
                        correo: email,
                        contrasena: null,
                        fecha_registro: new Date()
                    };

                    db.query('INSERT INTO usuario SET ?', nuevoUsuario, (err, res) => {
                        if (err) return done(err);
                        nuevoUsuario.id = res.insertId;
                        return done(null, nuevoUsuario);
                    });
                }
            });
        } catch (error) {
            return done(error);
        }
    }));

    passport.serializeUser(function(user, done) {
        done(null, user.id);
    });

    passport.deserializeUser(function(id, done) {
        db.query('SELECT * FROM usuario WHERE id_usuario = ?', [id], (err, results) => {
            if (err) return done(err);
            done(null, results[0]);
        });
    });
};