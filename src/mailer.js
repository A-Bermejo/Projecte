const nodemailer = require('nodemailer');
const transoperter = {}
exports.transoperter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 465,
    secure: true,
    auth: {
        user: 'albertobermejo02@gmail.com',
        pass: 'kruvvewjroadhxhw'
    }
});