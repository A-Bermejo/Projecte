const express = require('express');
const path = require('path');
const { engine } = require('express-handlebars');
// const db = require('./database')


const app = express();

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
app.use(express.json());
// Variables globales

//Routes
app.use(require('./routes'));
app.use('/', require('./routes/index'));
app.use('/login', require('./routes/login'))
    // Public

app.use(express.static(path.join(__dirname, 'public')));

// Crear server en el puerto 3050 y mostrar mensaje 
app.listen(app.get('port'), () => {
    console.log('Server open on port', app.get('port'));
});