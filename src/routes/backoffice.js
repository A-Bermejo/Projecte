const exrpess = require('express');
const router = exrpess.Router();
const model = require('../model/backoffice')
const modelRecipe = require('../model/recipe')
const modelPais = require('../model/pais');
const { transoperter } = require('../mailer');


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
    try {
        var response = await model.accept(req.body.id);
        aceptarReceta(req.body);
        res.json(response);
    } catch (error) {
        console.log(error);
    }
})
router.post('/cancel', isAdminLoggedIn, async(req, res) => {
    try {
        var response = await model.cancel(req.body.id);
        cancelarReceta(req.body);
        res.json(response);
    } catch (error) {
        console.log(error);
    }
})

router.get('/add', isAdminLoggedIn, async(req, res) => {
    try {
        const ingredients = await modelRecipe.getIngredients();
        const paises = await modelPais.getAll();
        res.render('backoffice/add', { src: "backofficeAdd", ingredients, paises });
    } catch (error) {
        console.log(error);
    }

})

router.post('/addNew', isAdminLoggedIn, async(req, res) => {
    try {
        console.log(req.body);
        if (req.body.nom_recepta == '' || req.body.hora == '' || req.body.mins == '' || req.body.descripcio_recepta == '') req.body.nom_recepta = null
        var response = await model.add(req.body, req.user.id_usuari);
        console.log(response);
        res.json(response);
    } catch (e) {
        req.flash('errorFlash', 'Error inesperado')
        res.json(e)
    }
});

function aceptarReceta(body) {
    transoperter.sendMail({
        from: 'What The Food <albertobermejo02@gmail.com>',
        to: body.mail,
        subject: "Receta aprobada",
        html: "<p>Nos gustaría informarle que su receta '" + body.foodName + "' ha sido aprobada y ya está disponible para ser encontrada en What The Food. Haga click en el boto para verla</p> " +
            "<a href='http://localhost:3050/recipe/" + body.id + "'><button style='background-color: white; color: black;border: 2px solid #f44336'>Ver receta</button></a>"
    });
}

function cancelarReceta(body) {
    transoperter.sendMail({
        from: 'What The Food <albertobermejo02@gmail.com>',
        to: body.mail,
        subject: "Receta denegada",
        html: "<p>Lamentamos comunicarle que su receta '" + body.foodName + "' ha sido denegada. Si no esta de acuerdo con esta decisión por favor responda a este correo.</p> "
    });
}


module.exports = router;