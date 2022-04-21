// VARIABLES GLOBALES
var opcionsOpen = false;

function init() {
    // VARIABLES
    let opcions = document.getElementById("opcions");

    // EVENTOS
    opcions.addEventListener("mouseover", opcionsOver)
    opcions.addEventListener("mouseout", opcionsOut)
    opcions.addEventListener("click", opcionsclick)


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
$(document).ready(init);