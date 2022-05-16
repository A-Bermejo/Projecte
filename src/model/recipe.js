const async = require('hbs/lib/async');
const pool = require('../database');
const TABLE_NAME = "receptes";

exports.getRecipe = async function(id, req) {
    var ingredientesBD = await pool.query("SELECT ingredients.nom_ingredient, ingredients.tipus_id_ingredient, cantidad FROM `ingredients_recepta` " +
        "LEFT JOIN ingredients  ON `ingredients_id_ingredient` = ingredients.id_ingredient " +
        "WHERE receptas_id_recepta = ?", [id]);

    if (ingredientesBD.length === 0) return false


    var recetaInfo = await pool.query("SELECT receptes.*, users.nom_usuari FROM " + TABLE_NAME + " " +
        "LEFT JOIN users ON `usuaris_id_usuari`= users.id_usuari " +
        "WHERE `id_recepta` = ? ", [id]);

    var receta = await añadirIngedientes(recetaInfo, ingredientesBD)
    return receta
}

async function añadirIngedientes(recetaInfo, ingredientesBD) {

    var tipus = new Set();
    recetaInfo[0].ingredientes = []
    for (const i in ingredientesBD) {
        var ingredient = { nom: ingredientesBD[i].nom_ingredient, cantidad: ingredientesBD[i].cantidad };
        recetaInfo[0].ingredientes[i] = ingredient
        tipus.add(ingredientesBD[i].tipus_id_ingredient)
    }
    recetaInfo[0].tipus = Array.from(tipus)

    return recetaInfo;
}