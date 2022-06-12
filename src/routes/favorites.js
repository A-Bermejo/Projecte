const exrpess = require('express');
const router = exrpess.Router();
const { isLoggedIn } = require('../lib/auth');
const model = require('../model/favorites')


const pool = require('../database');
const async = require('hbs/lib/async');

router.get('/', isLoggedIn, async(req, res) => {
    try {
        var userFavorites = await model.getFavoritesByUsers(req.user.id_usuari);

        for (let i = 0; i < userFavorites.length; i++) {
            for (let j = 0; j < userFavorites[i].length; j++) {
                var etiquetas = new Set(userFavorites[i][j].tipus);
                if (etiquetas.has(1) === false) {
                    userFavorites[i][j].lactosa = true;
                }
                if (etiquetas.has(12) === false) {
                    userFavorites[i][j].gluten = true;
                }
                if (etiquetas.has(9) === true) {
                    userFavorites[i][j].alcohol = true;
                }
                if (etiquetas.has(6) === false && etiquetas.has(7) === false && etiquetas.has(8) === false) {
                    userFavorites[i][j].vegano = true;
                }
                userFavorites[i][j].resumen = userFavorites[i][j].descripcio_recepta.slice(0, 100) + "..."
            }
        }
        res.render('favorites/favorites', { src: "favorites", userFavorites });
    } catch (error) {
        console.log(error);
    }
})

router.post('/add', isLoggedIn, async(req, res) => {
    try {
        var response = model.add(req.body.id_receta, req.user.id_usuari);
        res.json(response);
    } catch (error) {
        console.log(error);
    }

});

router.post('/delete', isLoggedIn, async(req, res) => {

    try {
        var response = model.delete(req.body.id_receta, req.user.id_usuari);
        res.json(response);
    } catch (error) {
        console.log(error);
    }
});

router.post('/get', isLoggedIn, async(req, res) => {
    try {
        var response = await model.get(req.body.id_receta, req.user.id_usuari);
        res.json(response);
    } catch (error) {
        console.log(error);
    }


});



module.exports = router;