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
        const result = await bcrypt.compare(password, bdPassword);
        return result;

    } catch (e) {
        console.log(e);
    }
}


module.exports = helpers;