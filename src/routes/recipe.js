const exrpess = require('express');
const router = exrpess.Router();
const model = require('../model/recipe')

const pool = require('../database');
const async = require('hbs/lib/async');

router.get('/', (req, res) => {
    res.render('recipe/recipe', { src: "recipe" });
})

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
            console.log(etiquetas);


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
})
module.exports = router;