const exrpess = require('express');
const router = exrpess.Router();
const model = require('../model/backoffice')
const modelRecipe = require('../model/recipe')
const modelPais = require('../model/pais');


const { isAdminLoggedIn } = require('../lib/auth');

const pool = require('../database');
const async = require('hbs/lib/async');

router.get('/', isAdminLoggedIn, async(req, res) => {

    res.render('backoffice/backoffice', { src: "backoffice" });
})

router.get('/toCheck', isAdminLoggedIn, async(req, res) => {
    var response = await model.getAll();

    res.render('backoffice/toCheck', { src: "toCheck", response });
})

router.post('/accept', isAdminLoggedIn, async(req, res) => {
    var response = await model.accept(req.body.id);
    res.json(response)
})
router.post('/cancel', isAdminLoggedIn, async(req, res) => {
    var response = await model.cancel(req.body.id);
    res.json(response)
})

router.get('/add', isAdminLoggedIn, async(req, res) => {

    const ingredients = await modelRecipe.getIngredients();
    const paises = await modelPais.getAll();
    res.render('backoffice/add', { src: "backofficeAdd", ingredients, paises });

})

router.post('/addNew', isAdminLoggedIn, async(req, res) => {
    try {
        if (req.body.nom_recepta == '' || req.body.hora == '' || req.body.mins == '' || req.body.descripcio_recepta == '') req.body.nom_recepta = null
        await model.add(req.body, req.user.id_usuari, req.file.filename)
        req.flash('successFlash', 'La receta se ha mandado correctamente')
        res.redirect('/backoffice/add');
    } catch {
        req.flash('errorFlash', 'Error inesperado')
        res.redirect('/')
    }

});


module.exports = router;