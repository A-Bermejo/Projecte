// VARIABLES GLOBALES
var opcionsOpen = false;

function init() {
    var user = document.getElementById("user");
    user.setAttribute("required", "");
    user.setAttribute("pattern", "^(?!\s*$).+.{3,20}")
    user.setAttribute("title", "Nombre de usuario incorrecto: 20 caracteres como máximo y 3 como mínimo")

    var mail = document.getElementById("mail");
    mail.setAttribute("required", "");
    var regex = '/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/';
    mail.setAttribute("pattern", regex);

    var pass = document.getElementById("pass");
    pass.setAttribute("required", "");
    var regexPass = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}"
    pass.setAttribute("pattern", regexPass)
    pass.setAttribute("title", "La contraseña debe incluir como mínimo una mayúscula, una minúscula y un dígito y la longitud debe ser entre 8 y 20")

    var showPass = document.getElementById("showPass");
    showPass.addEventListener("change", showPassword);
}


function showPassword() {
    if (document.getElementById("showPass").checked == true) {
        document.getElementById("pass").type = 'text';
    } else {
        document.getElementById("pass").type = 'password';
    }
}





$(document).ready(init);