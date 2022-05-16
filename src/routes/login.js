const exrpess = require('express');
const router = exrpess.Router();
const passport = require('passport')
const pool = require('../database');
const { isNotLoggedIn } = require('../lib/auth');


router.get('/', isNotLoggedIn, (req, res) => {
    res.render('auth/login', { src: "signin" });
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
module.exports = router;