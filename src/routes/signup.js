const exrpess = require('express');
const router = exrpess.Router();
const passport = require('passport')
const pool = require('../database');
const model = require('../model/auth');

const { isNotLoggedIn } = require('../lib/auth');
const async = require('hbs/lib/async');


router.get('/', isNotLoggedIn, (req, res) => {
    res.render('auth/signup', { src: "signup" });
})

router.post('/', passport.authenticate('local', {
    successRedirect: '/signup/newUser',
    failureRedirect: '/signup',
    failureFlash: true
}))

router.get('/newUser', (req, res) => {
    req.flash('successFlash', 'Cuenta creada, por favor, valídela con el enlace que le hemos mandado a su correo');
    req.logOut();
    res.redirect('/signin');
})

router.get('/validar/:token', isNotLoggedIn, async(req, res) => {
    const token = await model.getTokenUser(req.params.token);
    if (!token) req.flash('errorFlash', 'El enalce a caducado o no existe!');
    if (req.url !== "/jQueryMin341.js") {
        const token = req.params.token;
        const tokenDecodablePart = token.split('.')[1];
        let decoded = Buffer.from(tokenDecodablePart, 'base64').toString();
        decoded = JSON.parse(decoded)
        await model.validarUsuario(decoded.nom);
        await model.deleteTokenUser(token);
        req.flash('successFlash', ' Cuenta validada, ya puedes iniciar sesion');
        res.redirect('/signin');
    } else {
        res.json("jquery")
    }
})
module.exports = router;