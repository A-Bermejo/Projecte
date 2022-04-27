const express = require('express');
const path = require('path');
// const db = require('./database')


const app = express();

//Settings 
app.set('port', 3050);


// Middlewares
app.use(express.json());
// Variables globales

//Routes

// Public

app.use(express.static(path.join(__dirname, 'src/public')));

// Crear server en el puerto 3050 y mostrar mensaje 
app.listen(app.get('port'), () => {
    console.log('Server open on port', app.get('port'));
});