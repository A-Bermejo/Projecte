const exrpess = require('express');
const router = exrpess.Router();
const passport = require('passport')
const pool = require('../database');
const { isNotLoggedIn } = require('../lib/auth');
const model = require('../model/auth');
const flash = require('connect-flash/lib/flash');
const async = require('hbs/lib/async');
const { transoperter } = require('../mailer');
const { tokenConfig } = require('../token')
const jwt = require('jsonwebtoken')
const helpers = require('../lib/helpers');



router.get('/', isNotLoggedIn, (req, res) => {
    res.render('auth/login', { src: "signin" });
})

router.get('/resetPassword', isNotLoggedIn, (req, res) => {
    res.render('auth/resetPassword', { src: "resetPassword" });
})

router.post('/resetPassword', isNotLoggedIn, async(req, res) => {
    try {
        const user = await model.getUserByMail(req.body.mail);
        if (user.length == 0) {
            req.flash('errorFlash', ' El correo es erroneo o no esta registrado');
            res.redirect('/signin/resetPassword');
        } else {
            const token = jwt.sign({ nom: user[0].nom_usuari }, tokenConfig.JWT_SECRETO, {
                expiresIn: tokenConfig.JWT_TIEMPO
            });
            await model.resetPassword(user[0].id_usuari, token);
            await mailPassword(user[0], token);
            req.flash('successFlash', ' Se ha enviado un enlace a su correo para recuperar la contraseña');
            res.redirect('/signin');
        }
    } catch (error) {

    }
})

router.get('/resetPassword/:token', async(req, res) => {
    if (req.url !== "/jQueryMin341.js") {
        const token = await model.getToken(req.params.token);
        if (token === false) {
            req.flash('errorFlash', 'El enalce a caducado o no existe!');
            res.redirect('/')
        } else {
            await model.deleteToken(req.params.token)
            res.render('auth/newPassword', { src: "newPassword", token: req.params.token });
        }

    } else {
        res.json("jquery")
    }
})

router.post('/changePassword/:token', async(req, res) => {
    if (req.body.pass !== req.body.confPass) {
        req.flash('errorFlash', 'Error inesperado!');
        res.redirect('/')
    }
    var comprobar = await comprobarPass(req.body.pass)
    if (!comprobar) {
        req.flash('errorFlash', 'Error inesperado!');
        res.redirect('/')
    } else {
        // Obtengo el token y lo desencripto para saber que usuario es 
        const token = req.params.token;
        const tokenDecodablePart = token.split('.')[1];
        let decoded = Buffer.from(tokenDecodablePart, 'base64').toString();
        decoded = JSON.parse(decoded);
        // Encripto password y luego cambio la contraseña
        const newPass = await helpers.encryptPassword(req.body.pass);
        await model.changePassword(newPass, decoded.nom);
        req.flash('successFlash', ' Se ha actualizado la contraseña');
        res.redirect('/signin');
    }

})

router.post('/', (req, res, next) => {
    passport.authenticate('local.signin', {
        successRedirect: '/',
        failureRedirect: '/signin',
        failureFlash: true
    })(req, res, next);
})

router.get('/logout', (req, res) => {
    req.logOut();
    res.redirect('/')
});
async function comprobarPass(pass) {
    var regexPass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}/
    return regexPass.test(pass)
}

async function mailPassword(body, token) {
    await transoperter.sendMail({
        from: 'What The Food <albertobermejo02@gmail.com>',
        to: body.mail,
        subject: "Recuperar contraseña 🔐",
        html: "<p>Hola si desea recuperar su contraseña haga click en el enlace, tenga en cuenta que este enlace solo tiene un uso</p> " +
            "<a href='http://localhost:3050/signin/resetPassword/" + token + "'><button style='background-color: white; color: black;border: 2px solid #f44336'>Recuperar contraseña</button></a>"
    });
}
module.exports = router;