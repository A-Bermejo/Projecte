const async = require('hbs/lib/async');
const pool = require('../database');
const TABLE_NAME = "receptes_favorites";
const recipe = require('./recipe')

exports.add = async function(recipe_id, user_id) {
    var res = await pool.query("INSERT INTO " + TABLE_NAME + " " +
        "(receptas_id_recepta, usuaris_id_usuari) " +
        "VALUES (?, ?) ", [recipe_id, user_id]);
    return res;
}

exports.delete = async function(recipe_id, user_id) {
    var res = await pool.query("DELETE FROM " + TABLE_NAME + " " +
        "WHERE receptas_id_recepta = ? AND usuaris_id_usuari = ?", [recipe_id, user_id]);
    return res;
}

exports.get = async function(recipe_id, user_id) {
    var res = await pool.query("SELECT COUNT(*) AS favorite FROM " + TABLE_NAME + " " +
        "WHERE receptas_id_recepta = ? AND usuaris_id_usuari = ?", [recipe_id, user_id]);
    return res;
}

exports.getFavoritesByUsers = async function(user_id) {
    var res = await pool.query("SELECT receptas_id_recepta FROM " + TABLE_NAME + " " +
        "WHERE usuaris_id_usuari = ?", [user_id]);
    var response = [];
    for (let i = 0; i < res.length; i++) {
        response[i] = await recipe.getRecipe(res[i].receptas_id_recepta);
    }
    return response;
}