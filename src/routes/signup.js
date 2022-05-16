const exrpess = require('express');
const router = exrpess.Router();
const passport = require('passport')
const pool = require('../database');
const { isNotLoggedIn } = require('../lib/auth');


router.get('/', isNotLoggedIn, (req, res) => {
    res.render('auth/signup', { src: "signup" });
})

router.post('/', passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/signup',
    failureFlash: true
}))

module.exports = router;