const async = require('hbs/lib/async');
const pool = require('../database');
const TABLE_NAME = "users";

exports.addUser = async function(body) {
    return await pool.query("INSERT INTO " + TABLE_NAME + " " +
        "(nom_usuari, password, mail, gmail_account) VALUES(?,?,?,?)", [body.user, body.pass, body.mail, 0])
}

exports.deserialize = async function(id) {
    return await pool.query("SELECT * FROM " + TABLE_NAME + " WHERE id_usuari = ?", [id]);
}

exports.getUserByUsername = async function(user) {
    return await pool.query("SELECT * FROM " + TABLE_NAME + "  WHERE nom_usuari = ?", [user]);
}