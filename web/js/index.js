// VARIABLES GLOBALES
var opcionsOpen = false;

function init() {
    // VARIABLES
    let opcions = document.getElementById("opcions");
    let dark = document.getElementById("darkMode");

    // EVENTOS
    opcions.addEventListener("mouseover", opcionsOver)
    opcions.addEventListener("mouseout", opcionsOut)
    opcions.addEventListener("click", opcionsclick)
    dark.addEventListener("click", darkMode)


}

function opcionsOver() {
    document.getElementById("opcions-row").style.filter = "invert(100%) sepia(1%) saturate(3614%) hue-rotate(319deg) brightness(116%) contrast(100%)"
}

function opcionsOut() {
    document.getElementById("opcions-row").style.filter = "invert(24%) sepia(31%) saturate(7034%) hue-rotate(341deg) brightness(95%) contrast(81%)"
}

function opcionsclick() {
    if (!opcionsOpen) {
        document.getElementById("opcions-row").src = "img/caret-up-fill.svg";
        opcionsOpen = true
    } else {
        document.getElementById("opcions-row").src = "img/caret-down-fill.svg";
        opcionsOpen = false
    }
}

function darkMode() {
    document.body.classList.toggle('dark')
    if (document.body.classList.contains('dark')) {
        document.getElementById("darkMode").src = "img/brightness-high-fill.svg";
    } else {
        document.getElementById("darkMode").src = "img/moon-stars-fill.svg";
    }
}
$(document).ready(init);