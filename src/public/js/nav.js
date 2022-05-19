// const { body } = require("express-validator");

// VARIABLES GLOBALES
var opcionsOpen = false;

function init() {

    jQuery(document).ready(function($) {
        $(document).ready(function() {
            $('.mi-selector').select2();
        });
    });



    // VARIABLES
    let dark = document.getElementById("darkMode");
    // EVENTOS
    dark.addEventListener("click", darkModeFunction)
    load();
}


function darkModeFunction() {
    document.body.classList.toggle('dark')
    if (document.body.classList.contains('dark')) {
        document.getElementById("darkMode").src = "/index/img/brightness-high-fill.svg";
    } else {
        document.getElementById("darkMode").src = "/index/img/moon-stars-fill.svg";
    }
    store(document.body.classList.contains('dark'))
}

function load() {
    const darkMode = localStorage.getItem("darkMode");
    if (!darkMode) {
        store(false)
    } else if (darkMode == 'true') {
        darkModeFunction();
    }

}

function store(value) {
    localStorage.setItem('darkMode', value)
}

$(document).ready(init);