const express = require('express');
const path = require('path');
const { engine } = require('express-handlebars');
const flash = require('connect-flash')
const session = require('express-session');
const MySQLSession = require('express-mysql-session');
const passport = require('passport');
const { database } = require('./databaseConfig');
const cookieParser = require('cookie-parser');
const multer = require('multer');


const app = express();
require('./lib/passport.js');

//Settings 

app.set('port', 3050);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', engine({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}))
app.set('view engine', '.hbs');
const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, path.join(__dirname, 'public/uploads'))
    },
    filename: function(req, file, cb) {
        let extArray = file.mimetype.split("/");
        let extension = extArray[extArray.length - 1];
        cb(null, file.fieldname + '-' + Date.now() + '.' + extension)
    }
})

// Middlewares

app.use(session({
    secret: 'whatthefood',
    resave: false,
    saveUninitialized: false,
    store: new MySQLSession(database)
}));
app.use(cookieParser('whatthefood'))
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
app.use(multer({
    storage,
    dest: path.join(__dirname, 'public/uploads'),
    fileFilter: (req, file, cb) => {
        if (file.mimetype == "image/png" || file.mimetype == "image/jpg" || file.mimetype == "image/jpeg") {
            cb(null, true);
        } else {
            cb(null, false);
            return cb();
        }
    }
}).single('img'));
// Variables globales
app.use((req, res, next) => {
    app.locals.errorFlash = req.flash('errorFlash');
    app.locals.successFlash = req.flash('successFlash');
    app.locals.user = req.user

    next();
})

//Routes
app.use(require('./routes'));

app.use('/signup', require('./routes/signup'))
app.use('/signin', require('./routes/login'))
app.use('/favorites', require('./routes/favorites'))
app.use('/recipe', require('./routes/recipe'))
app.use('/backoffice', require('./routes/backoffice'));
app.use('/', require('./routes/index'));



// Public

app.use(express.static(path.join(__dirname, '/public')));

// Crear server en el puerto 3050 y mostrar mensaje 
app.listen(app.get('port'), () => {
    console.log('Server open on port', app.get('port'));
});