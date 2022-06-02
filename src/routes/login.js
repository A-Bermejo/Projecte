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
            req.flash('errorFlash', 'El correo es erroneo o no esta registrado');
            res.redirect('/signin/resetPassword');
        } else {
            const token = jwt.sign({ id: user[0].id_usuari }, tokenConfig.JWT_SECRETO, {
                expiresIn: tokenConfig.JWT_TIEMPO
            });
            await model.resetPassword(user[0].id_usuari, token);
            await mailPassword(user[0], token);
            req.flash('successFlash', 'Se ha enviado un enlace a su correo para recuperar la contraseña');
            res.redirect('/signin');
        }
    } catch (error) {

    }
})

router.get('/resetPassword/:token', async(req, res) => {
    if (req.url !== "/jQueryMin341.js") {
        const token = await model.getToken(req.params.token);
        if (token === false) {
            res.redirect('/')
        } else {
            res.render('auth/resetPassword', { src: "resetPassword" });
        }
    } else {
        res.json("jquery")
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

async function mailPassword(body, token) {
    await transoperter.sendMail({
        from: 'What The Food <albertobermejo02@gmail.com>',
        to: body.mail,
        subject: "Recuperar contraseña 🔐",
        html: "<p>Hola si desea recuperar su contraseña haga click en el enlace, tenga en cuenta que este enlace solo tiene un uso</p> " +
            "<a href='http://localhost:3050/login/newPassword/" + token + "'><button style='background-color: white; color: black;border: 2px solid #f44336'>Recuperar contraseña</button></a>"
    });
}
module.exports = router;