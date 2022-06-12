const async = require('hbs/lib/async');
const pool = require('../database');
const TABLE_NAME = "receptes";
const recipe = require('./recipe')

exports.getAll = async function(recipe_id, user_id) {
    var res = await pool.query("SELECT *, paises.nombre_pais, users.nom_usuari FROM " + TABLE_NAME + " " +
        "LEFT JOIN paises ON paises.id_pais = paisos_id_pais " +
        "LEFT JOIN users ON users.id_usuari = usuaris_id_usuari " +
        "WHERE validat_recepta = 0")
    for (let i = 0; i < res.length; i++) {
        var ingredients = await pool.query("SELECT cantidad, ingredients.nom_ingredient FROM ingredients_recepta " +
            "LEFT JOIN ingredients ON ingredients.id_ingredient = ingredients_id_ingredient " +
            "WHERE receptas_id_recepta = ?", [res[i].id_recepta])
        res[i].ingredients = []
        res[i].cantidad = []
        for (let j = 0; j < ingredients.length; j++) {
            res[i].ingredients.push(ingredients[j].nom_ingredient)
            if (ingredients[j].cantidad == "") {
                res[i].cantidad.push("No especificado")
            } else {
                res[i].cantidad.push(ingredients[j].cantidad)

            }
        }
    }

    console.log(res);
    return res
}

exports.accept = async function(id) {
    var res = await pool.query("UPDATE " + TABLE_NAME + " SET validat_recepta = 1 WHERE id_recepta = ? ", [id])
    return res
}

exports.cancel = async function(id) {
    var res = await pool.query("UPDATE " + TABLE_NAME + " SET validat_recepta = 3 WHERE id_recepta = ? ", [id])
    return res
}

exports.add = async function(body, id, file) {
    let horaFormat = body.hora + ':' + body.mins;
    let tiempo = (new Date(new Date().toDateString() + ' ' + horaFormat))

    var res = await pool.query("INSERT INTO " + TABLE_NAME + " " +
        "(nom_recepta, descripcio_recepta, paisos_id_pais, usuaris_id_usuari, validat_recepta, temps, img) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?) ", [body.nom_recepta, body.descripcio_recepta, body.pais, id, 1, tiempo, " "])

    for (let i = 0; i < body.id_ingredientes.length; i++) {
        await pool.query("INSERT INTO ingredients_recepta(ingredients_id_ingredient, receptas_id_recepta, cantidad) " +
            " VALUES(?,?,?)", [body.id_ingredientes[i], res.insertId, body.id_cantidad[i]])
    }
    return res;
}