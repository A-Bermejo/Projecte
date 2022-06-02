// VARIABLES GLOBALES
var opcionsOpen = false;

function init() {

    var mail = document.getElementById("mail");
    mail.setAttribute("required", "");
    var regex = '/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/';
    mail.setAttribute("pattern", regex);
}
$(document).ready(init);