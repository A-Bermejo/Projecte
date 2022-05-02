const exrpess = require('express');
const router = exrpess.Router();
const passport = require('passport')
const pool = require('../database');

router.get('/', (req, res) => {
    res.render('signup/signup', { style: "signup" });
})

router.post('/', passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/signup',
    failureFlash: true
}))

module.exports = router;