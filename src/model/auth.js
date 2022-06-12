const async = require('hbs/lib/async');
const pool = require('../database');
const TABLE_NAME = "users";

exports.addUser = async function(body) {
    return await pool.query("INSERT INTO " + TABLE_NAME + " " +
        "(nom_usuari, password, mail) VALUES(?,?,?,?)", [body.user, body.pass, body.mail])
}

exports.tokenValidar = async function(id, token) {
    return await pool.query("INSERT INTO validar_user (id_user, token) VALUES (?,?)", [id, token])
}

exports.validarUsuario = async function(user) {
    return await pool.query("UPDATE " + TABLE_NAME + " SET validado = 1 WHERE nom_usuari = ?", [user])
}

exports.deserialize = async function(id) {
    return await pool.query("SELECT * FROM " + TABLE_NAME + " WHERE id_usuari = ?", [id]);
}

exports.getUserByUsername = async function(user) {
    return await pool.query("SELECT * FROM " + TABLE_NAME + "  WHERE BINARY nom_usuari = ?", [user]);
}

exports.getUserByMail = async function(mail) {
    return await pool.query("SELECT * FROM " + TABLE_NAME + "  WHERE  mail = ?", [mail]);
}

exports.resetPassword = async function(id, token) {
    const comprobar = await pool.query("SELECT COUNT(*) AS row FROM recuperar_password WHERE id_user = ?", [id]);
    if (comprobar[0].row == 1) await pool.query("DELETE FROM `recuperar_password` WHERE id_user =  ?", [id])
    return await pool.query("INSERT INTO recuperar_password (id_user, token) VALUES(?,?)", [id, token]);
}

exports.getToken = async function(token) {
    var token = await pool.query("SELECT * FROM  recuperar_password WHERE token = ?", [token]);
    if (token.length === 0) return false
    else return true
}

exports.deleteToken = async function(token) {
    await pool.query("DELETE FROM `recuperar_password` WHERE token =  ?", [token])
}

exports.changePassword = async function(pass, name) {
    await pool.query("UPDATE " + TABLE_NAME + " " +
        "SET password = ? WHERE nom_usuari = ?", [pass, name]);
}
exports.deleteTokenUser = async function(token) {
    await pool.query("DELETE FROM `validar_user` WHERE token =  ?", [token])
}


exports.getTokenUser = async function(token) {
    var token = await pool.query("SELECT * FROM  validar_user WHERE token = ?", [token]);
    if (token.length === 0) return false
    else return true
}