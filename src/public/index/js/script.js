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
    $('#ingredient').on('select2:open', function(e) {
        $("#ingredient").css("border-radius", "0");
    });

}

function opcionsOver() {
    if (document.body.classList.contains('dark')) {
        document.getElementById("opcions-row").style.filter = "invert(10%) sepia(10%) saturate(462%) hue-rotate(187deg) brightness(92%) contrast(92%)"
    } else {
        document.getElementById("opcions-row").style.filter = "invert(100%) sepia(0%) saturate(19%) hue-rotate(69deg) brightness(105%) contrast(100%)"
    }
}

function opcionsOut() {
    document.getElementById("opcions-row").style.filter = "invert(24%) sepia(31%) saturate(7034%) hue-rotate(341deg) brightness(95%) contrast(81%)"
}

function opcionsclick() {
    if (!opcionsOpen) {
        document.getElementById("opcions-row").src = "index/img/caret-up-fill.svg";
        opcionsOpen = true
    } else {
        document.getElementById("opcions-row").src = "index/img/caret-down-fill.svg";
        opcionsOpen = false
    }
}

// function darkMode() {
//     document.body.classList.toggle('dark')
//     if (document.body.classList.contains('dark')) {
//         document.getElementById("darkMode").src = "index/img/brightness-high-fill.svg";
//     } else {
//         document.getElementById("darkMode").src = "index/img/moon-stars-fill.svg";
//     }
// }
$(document).ready(init);