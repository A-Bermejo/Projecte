const bcrypt = require('bcryptjs');
const async = require('hbs/lib/async');
const helpers = {};
helpers.encryptPassword = async(password) => {
    const salt = await bcrypt.genSalt(10);
    const result = await bcrypt.hash(password, salt);
    return result;
}

helpers.matchPassword = async(password, bdPassword) => {
    try {
        await bcrypt.compare(password, bdPassword);
    } catch (e) {

    }
}


module.exports = helpers;