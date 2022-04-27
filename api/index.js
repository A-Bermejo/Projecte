const express = require('express');
const app = express();

app.use(express.json());
// Crear server en el puerto 3050 y mostrar mensaje 
app.listen(3050, () => {
    console.log('Server open on port 3050');
});

app.get('/hola', (req, res) => {
    res.redirect();
});