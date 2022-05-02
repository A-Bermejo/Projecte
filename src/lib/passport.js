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

    req.body.pass = await helpers.encryptPassword(req.body.pass)
    const res = await modelSignup.addUser(req.body);
    console.log(res);
}));

// passport.serializeUser((user, done) =>{

// })