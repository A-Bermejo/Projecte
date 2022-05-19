const async = require('hbs/lib/async');
const pool = require('../database');
const TABLE_NAME = "paises";

exports.getAll = async function() {
    var ingredientes = await pool.query("SELECT * FROM " + TABLE_NAME + " ORDER BY `nombre_pais` ASC");
    return ingredientes

}