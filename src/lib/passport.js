const async = require('hbs/lib/async');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const modelSignup = require('../model/signup');
const helpers = require('../lib/helpers');
const flash = require('connect-flash/lib/flash');

passport.use('local', new LocalStrategy({
    usernameField: 'user',
    passwordField: 'pass',
    passReqToCallback: true
}, async(req, user, pass, done) => {
    try {

        if (await comprobarEspacios(req.body.user)) return done(null, false, req.flash('errorFlash', 'Nombre de usuario incorrecto: No puede tener espacios en blanco'));
        if (!await comprobarNombre(req.body.user)) return done(null, false, req.flash('errorFlash', 'Nombre de usuario incorrecto: 20 caracteres como máximo y 3 como mínimo'));
        if (!await comprobarPass(req.body.pass)) return done(null, false, req.flash('errorFlash', 'La contraseña debe incluir como mínimo una mayúscula, una minúscula y un dígito y la longitud debe ser entre 8 y 20'));
        if (!await comrpobarMail(req.body.mail)) return done(null, false, req.flash('errorFlash', 'Email incorrecto'));
        req.body.pass = await helpers.encryptPassword(req.body.pass)
        const res = await modelSignup.addUser(req.body);

        const newUser = {
            username: req.body.user,
            password: req.body.pass,
            id: parseInt(res.insertId)
        }

        return done(null, newUser);
    } catch {
        return done(null, false, req.flash('errorFlash', 'El correo o el usuario ya existe'));
    }
}));

passport.serializeUser((newUser, done) => {
    done(null, newUser.id);
});

passport.deserializeUser(async(id, done) => {
    var rows = await modelSignup.deserialize(id);
    done(null, rows[0])
});


async function comprobarEspacios(nombre) {
    return nombre === null || nombre.replace(/ /g, '') !== nombre;
}
async function comprobarNombre(nombre) {
    return nombre.length <= 20 && nombre.length >= 3;
}
async function comprobarPass(pass) {
    var regexPass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}/
    return regexPass.test(pass)
}
async function comrpobarMail(mail) {
    var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return regex.test(mail)

}