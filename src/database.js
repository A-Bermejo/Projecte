const mysql = require('mysql');
const { promisify } = require('util');

const { database } = require('./databaseConfig');

const pool = mysql.createPool(database)

pool.getConnection((err, con) => {
    if (err) {
        console.log("ERROR CON LA BASE DE DATOS");
        console.log(err);
    }
    if (con) {
        con.release()
        console.log('SE HA CONECTADO A LA BASE DE DATOS');
        return
    }
});

pool.query = promisify(pool.query);

module.exports = pool;