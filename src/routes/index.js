const exrpess = require('express');
const router = exrpess.Router();
const model = require('../model/recipe')

const pool = require('../database');
const async = require('hbs/lib/async');

router.get('/', async(req, res) => {
    const ingredients = await model.getIngredients();

    res.render('index', { src: "index", ingredients });
})

module.exports = router;