const async = require('hbs/lib/async');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const modelAuth = require('../model/auth');
const helpers = require('../lib/helpers');
const flash = require('connect-flash/lib/flash');
const { transoperter } = require('../mailer');
const { tokenConfig } = require('../token')
const jwt = require('jsonwebtoken')



passport.use('local.signin', new LocalStrategy({
    usernameField: 'user',
    passwordField: 'pass',
    passReqToCallback: true
}, async(req, user, pass, done) => {
    var userBD = await modelAuth.getUserByUsername(user);
    if (userBD.length > 0) {
        if (userBD[0].validado === 0) return done(null, false, req.flash('errorFlash', 'Para poder acceder a su cuenta valídela con el enlace que le hemos mandado a su correo'));
        var validPassword = await helpers.matchPassword(pass, userBD[0].password)
        if (validPassword) {
            return done(null, userBD[0].id_usuari, req.flash('successFlash', ' Bienvenido ' + userBD[0].nom_usuari));
        } else {
            return done(null, false, req.flash('errorFlash', 'El nombre de usuario o la contraseña es incorrecto'));
        }
    } else {
        return done(null, false, req.flash('errorFlash', 'El nombre de usuario o la contraseña es incorrecto'));

    }
}));

passport.use('local', new LocalStrategy({
    usernameField: 'user',
    passwordField: 'pass',
    passReqToCallback: true
}, async(req, user, pass, done) => {
    try {
        if (!await comprobarNombre(req.body.user)) return done(null, false, req.flash('errorFlash', 'Nombre de usuario incorrecto: 20 caracteres como máximo y 3 como mínimo'));
        if (!await comprobarCaracteres(req.body.user)) return done(null, false, req.flash('errorFlash', 'Nombre de usuario incorrecto: Solo se admiten letras, numeros y barras bajas'));
        if (!await comprobarPass(req.body.pass)) return done(null, false, req.flash('errorFlash', 'La contraseña debe incluir como mínimo una mayúscula, una minúscula y un dígito y la longitud debe ser entre 8 y 20'));
        if (!await matchPass(req.body.pass, req.body.confPass)) return done(null, false, req.flash('errorFlash', 'Las contraseñas no coinciden'));
        if (!await comrpobarMail(req.body.mail)) return done(null, false, req.flash('errorFlash', 'Email incorrecto'));
        req.body.pass = await helpers.encryptPassword(req.body.pass)
        const res = await modelAuth.addUser(req.body);

        const newUser = {
            username: req.body.user,
            password: req.body.pass,
            id: parseInt(res.insertId)
        }

        // Crear token para validar el usuario
        const token = jwt.sign({ nom: req.body.user }, tokenConfig.JWT_SECRETO)
        await modelAuth.tokenValidar(res.insertId, token);
        await mailRegistro(req.body, token);
        return done(null, newUser.id, req.flash('successFlash', ' Bienvenido ' + newUser.username));
    } catch (e) {
        console.log(e);
        return done(null, false, req.flash('errorFlash', 'El correo o el usuario ya existe'));
    }
}));

passport.serializeUser((id, done) => {
    done(null, id);
});

passport.deserializeUser(async(id, done) => {
    var rows = await modelAuth.deserialize(id);
    done(null, rows[0])
});

async function comprobarCaracteres(nombre) {
    var regex = /^(?=.{3,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9\_\u00f1\u00d1]+$/
    return regex.test(nombre)
}
async function comprobarNombre(nombre) {
    return nombre.length <= 20 && nombre.length >= 3;
}
async function comprobarPass(pass) {
    var regexPass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}/
    return regexPass.test(pass)
}
async function matchPass(pass, confPass) {
    if (pass === confPass) return true
    else return false
}
async function comrpobarMail(mail) {
    var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return regex.test(mail)

}

async function mailRegistro(body, token) {
    await transoperter.sendMail({
        from: 'What The Food <albertobermejo02@gmail.com>',
        to: body.mail,
        subject: "Bienvenido a What The Food",
        html: "<p>Bienvenido a What The Food, por favor haga clic en el botón para validar su cuenta.</p>" +
            "<a href='http://localhost:3050/signup/validar/" + token + "'><button style='background-color: white; color: black;border: 2px solid #f44336'>Validar cuenta</button></a>"
    });
}