const { query } = require('express');
const async = require('hbs/lib/async');
const pool = require('../database');
const TABLE_NAME = "receptes";

exports.getRecipe = async function(id, req) {
    var ingredientesBD = await pool.query("SELECT ingredients.nom_ingredient, ingredients.tipus_id_ingredient, cantidad FROM `ingredients_recepta` " +
        "LEFT JOIN ingredients  ON `ingredients_id_ingredient` = ingredients.id_ingredient " +
        "WHERE receptas_id_recepta = ? ", [id]);

    if (ingredientesBD.length === 0) return false


    var recetaInfo = await pool.query("SELECT receptes.*, users.nom_usuari, paises.nombre_pais FROM " + TABLE_NAME + " " +
        "LEFT JOIN users ON `usuaris_id_usuari`= users.id_usuari " +
        "LEFT JOIN paises ON  `paisos_id_pais`= paises.id_pais " +
        "WHERE `id_recepta` = ? AND validat_recepta = ? ", [id, 1]);

    if (recetaInfo.length === 0) return false


    var receta = await añadirIngedientes(recetaInfo, ingredientesBD)
    return receta
}

exports.getIngredients = async function() {
    var ingredientes = await pool.query("SELECT * FROM `ingredients`");
    return ingredientes
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

exports.add = async function(body, id, file) {
    let horaFormat = body.hora + ':' + body.mins;
    let tiempo = (new Date(new Date().toDateString() + ' ' + horaFormat))
    var res = await pool.query("INSERT INTO " + TABLE_NAME + " " +
        "(nom_recepta, descripcio_recepta, paisos_id_pais, usuaris_id_usuari, validat_recepta, temps, img) " +
        "VALUES (?, ?, ?, ?, ?, ?,?) ", [body.nom_recepta, body.descripcio_recepta, body.pais, id, 0, tiempo, file])
    console.log(res.insertId);
    for (let i = 0; i < body.ingredient.length; i++) {
        await pool.query("INSERT INTO ingredients_recepta(ingredients_id_ingredient, receptas_id_recepta, cantidad) " +
            " VALUES(?,?,?)", [body.ingredient[i], res.insertId, body.cantidad[i]])
    }
    return res;
}

exports.getByIngredients = async function(id, continente) {
    var queryContiente = "";

    if (continente != 0) queryContiente = "  id_continent = " + continente + " AND ";

    console.log(queryContiente);



    if (id.length > 1) {
        res = await pool.query("SELECT r.*, paises.nombre_pais " +
            "FROM receptes r " +
            "LEFT JOIN paises ON  `paisos_id_pais`= paises.id_pais " +
            "LEFT JOIN continents ON  continents.id_continent = paises.continentes_id_continente " +
            "WHERE " + queryContiente + "NOT EXISTS (SELECT * FROM ingredients i " +
            "WHERE i.id_ingredient IN (?) " +
            "AND NOT EXISTS " +
            "(SELECT * FROM ingredients_recepta ri " +
            "WHERE ri.receptas_id_recepta = r.id_recepta " +
            "AND ri.ingredients_id_ingredient = i.id_ingredient))", [id])
    } else {
        res = await pool.query("SELECT t1.*, paises.nombre_pais FROM `ingredients_recepta` " +
            "LEFT JOIN receptes t1 ON receptas_id_recepta = t1.id_recepta " +
            "LEFT JOIN paises ON  `paisos_id_pais`= paises.id_pais " +
            "LEFT JOIN continents ON  continents.id_continent = paises.continentes_id_continente " +
            "WHERE " + queryContiente + " `ingredients_id_ingredient`= ? AND t1.validat_recepta = 1", [id]);
    }

    var ingredientes = []
    for (let i = 0; i < res.length; i++) {
        ingredientes = await pool.query("SELECT `ingredients_id_ingredient` FROM `ingredients_recepta` WHERE `receptas_id_recepta` IN (?)", [res[i].id_recepta])
        res[i].ingredientes = []
        for (let j = 0; j < ingredientes.length; j++) {
            res[i].ingredientes.push(ingredientes[j].ingredients_id_ingredient)
        }
        var tipus = await pool.query("SELECT `tipus_id_ingredient` FROM `ingredients` WHERE `id_ingredient` IN (?)", [res[i].ingredientes])
        var tipusSet = new Set
        for (let j = 0; j < tipus.length; j++) {
            tipusSet.add(tipus[j].tipus_id_ingredient)
        }
        res[i].tipus = Array.from(tipusSet);

    }
    return res
}