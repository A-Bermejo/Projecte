const exrpess = require('express');
const router = exrpess.Router();
const model = require('../model/recipe')
const { isLoggedIn } = require('../lib/auth');
const helpers = require('../lib/helpers');
const modelUser = require('../model/auth');
const flash = require('connect-flash/lib/flash');



const async = require('hbs/lib/async');

router.get('/changePassword', isLoggedIn, async(req, res) => {

    res.render('auth/changePassword', { src: "newPassword" });
});

router.post('/changePassword', isLoggedIn, async(req, res) => {
    try {
        if (req.body.pass !== req.body.confPass) {
            req.flash('errorFlash', 'Error inesperado!');
            res.redirect('/')
        }
        var comprobar = await comprobarPass(req.body.pass)
        if (!comprobar) {
            req.flash('errorFlash', 'Error inesperado!');
            res.redirect('/')
        }
        const newPass = await helpers.encryptPassword(req.body.pass);
        await modelUser.changePassword(newPass, req.user.nom_usuari);
        req.flash('successFlash', ' Se ha actualizado la contraseña');
        res.redirect('/');

    } catch (error) {
        console.log(error);
    }

});
async function comprobarPass(pass) {
    var regexPass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}/
    return regexPass.test(pass)
}

router.get('/', async(req, res) => {
    try {
        const ingredients = await model.getIngredients();
        res.render('index', { src: "index", ingredients });
    } catch (error) {
        res.render('index', { src: "index", ingredients });;
    }
})

module.exports = router;