const exrpess = require('express');
const router = exrpess.Router();
const { isLoggedIn } = require('../lib/auth');

const pool = require('../database');

router.get('/', isLoggedIn, (req, res) => {
    res.render('favorites/favorites', { src: "favorites" });
})

module.exports = router;