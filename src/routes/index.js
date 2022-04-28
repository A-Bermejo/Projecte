const exrpess = require('express');
const router = exrpess.Router();

const pool = require('../database');

router.get('/', (req, res) => {
    res.render('index', { src: "index" });
})

module.exports = router;