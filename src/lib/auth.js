module.exports = {

    isLoggedIn(req, res, next) {
        if (req.isAuthenticated()) {
            return next();
        } else {
            return res.redirect('/signin');
        }
    },

    isNotLoggedIn(req, res, next) {
        if (!req.isAuthenticated()) {
            return next();
        } else {
            return res.redirect('/');
        }
    },

    isAdminLoggedIn(req, res, next) {
        if (req.isAuthenticated() && req.user.id_usuari == 1) {
            return next();
        } else {
            return res.redirect('/');
        }
    },
}