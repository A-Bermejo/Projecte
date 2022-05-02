const async = require('hbs/lib/async');
const pool = require('../database');
const TABLE_NAME = "users";

exports.addUser = async function(body) {
    return await pool.query("INSERT INTO " + TABLE_NAME + " " +
        "(nom_usuari, password, mail, gmail_account) VALUES(?,?,?,?)", [body.user, body.pass, body.mail, 0])
}