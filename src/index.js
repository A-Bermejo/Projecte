const express = require('express');
const path = require('path');
const { engine } = require('express-handlebars');
const flash = require('connect-flash')
const session = require('express-session');
const MySQLSession = require('express-mysql-session');
const passport = require('passport');
const { database } = require('./databaseConfig')


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


// Middlewares

app.use(session({
    secret: 'whatthefood',
    resave: false,
    saveUninitialized: false,
    store: new MySQLSession(database)
}));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
// Variables globales
app.use((req, res, next) => {
    app.locals.errorSignup = req.flash('errorSignup');
    next();
})

//Routes
app.use(require('./routes'));
app.use('/', require('./routes/index'));
app.use('/signup', require('./routes/signup'))
    // Public

app.use(express.static(path.join(__dirname, 'public')));

// Crear server en el puerto 3050 y mostrar mensaje 
app.listen(app.get('port'), () => {
    console.log('Server open on port', app.get('port'));
});