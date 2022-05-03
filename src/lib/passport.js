const async = require('hbs/lib/async');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const modelSignup = require('../model/signup');
const helpers = require('../lib/helpers');

passport.use('local', new LocalStrategy({
    usernameField: 'user',
    passwordField: 'pass',
    passReqToCallback: true
}, async(req, user, pass, done) => {
    try {
        const newUser = {
            username: req.body.user,
            password: req.body.pass
        }
        req.body.pass = await helpers.encryptPassword(req.body.pass)
        const res = await modelSignup.addUser(req.body);
        newUser.id = res.insertid
        return done(null, newUser);
    } catch {
        return done(null, false, req.flash('errorSignup', 'El correo o el usuario ya existe'));
    }
}));

// passport.serializeUser((user, done) => {
//     done(null, user.id)
// });

// passport.deserializeUser(async(id, done) => {
//     var rows = await modelSignup.deserialize(id);
//     done(null, rows[0])
// });