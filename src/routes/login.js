const exrpess = require('express');
const router = exrpess.Router();
const passport = require('passport')
const pool = require('../database');

router.get('/', (req, res) => {
    res.render('auth/login', { src: "signin" });
})

router.post('/', (req, res, next) => {

    passport.authenticate('local.signin', {
        successRedirect: '/',
        failureRedirect: '/signin',
        failureFlash: true
    })(req, res, next);
})
module.exports = router;