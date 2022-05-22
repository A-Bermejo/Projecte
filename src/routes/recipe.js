const exrpess = require('express');
const router = exrpess.Router();
const model = require('../model/recipe');
const modelPais = require('../model/pais');

const pool = require('../database');
const async = require('hbs/lib/async');
const { isLoggedIn } = require('../lib/auth');

router.get('/', (req, res) => {
    res.render('recipe/recipe', { src: "recipe" });
})

router.get('/getAllIngredients', async(req, res) => {
    const ingredients = await model.getIngredients();
    res.json(ingredients);
})


router.get('/add', isLoggedIn, async(req, res) => {

    const ingredients = await model.getIngredients();
    const paises = await modelPais.getAll();

    res.render('recipe/add', { src: "recipeadd", ingredients, paises });

});

router.post('/addNew', isLoggedIn, async(req, res) => {
    try {
        if (req.body.nom_recepta == '' || req.body.hora == '' || req.body.mins == '' || req.body.descripcio_recepta == '') req.body.nom_recepta = null
        await model.add(req.body, req.user.id_usuari, req.file.filename)
        req.flash('successFlash', 'La receta se ha mandado correctamente')
        res.redirect('/');
    } catch {
        req.flash('errorFlash', 'Error inesperado')
        res.redirect('/recipe/add')
    }

});

router.get('/:id', async(req, res) => {
    if (req.url !== "/jQueryMin341.js") {
        const recetaInfo = await model.getRecipe(req.params.id);
        if (recetaInfo === false) {
            req.flash('errorFlash', 'La receta introducida no existe')
            res.redirect('/')
        } else {
            const etiquetas = new Set(recetaInfo[0].tipus);
            const etiquetasHBS = {}
            if (etiquetas.has(1) === false) {
                etiquetasHBS.lactosa = true;
            }
            if (etiquetas.has(12) === false) {
                etiquetasHBS.gluten = true;
            }
            if (etiquetas.has(9) === true) {
                etiquetasHBS.alcohol = true;
            }
            if (etiquetas.has(6) === false && etiquetas.has(7) === false && etiquetas.has(8) === false) {
                etiquetasHBS.vegano = true;
            }

            res.render('recipe/recipe', { src: "recipe", recetaInfo, etiquetasHBS });
        }
    } else {
        res.json("jquery")
    }
})

router.get('/getById/:id', async(req, res) => {
    var recetaInfo = await model.getRecipe(req.params.id);
    console.log(recetaInfo[0]);
    res.json(recetaInfo);
});

router.post('/getByIngredients', async(req, res) => {
    try {
        var response = await model.getByIngredients(req.body.id, req.body.continente);
        console.log(response);
        var trueResponse = []
        if (req.body.where.length != 0) {
            for (let i = 0; i < response.length; i++) {
                var condicion = true
                if (req.body.where.includes("vegetariano") && (response[i].tipus.includes(6) || response[i].tipus.includes(7) || response[i].tipus.includes(8))) {
                    condicion = false
                }
                if (req.body.where.includes("gluten") && response[i].tipus.includes(12)) {
                    condicion = false
                }
                if (req.body.where.includes("alcohol") && response[i].tipus.includes(9)) {
                    condicion = false
                }
                if (req.body.where.includes("lactosa") && response[i].tipus.includes(1)) {
                    condicion = false
                }
                if (condicion) trueResponse.push(response[i])
            }
            res.json(trueResponse)
        } else {
            res.json(response)
        }
    } catch {
        req.flash('errorFlash', 'Error inesperado')
        res.redirect('/')
    }
})

module.exports = router;