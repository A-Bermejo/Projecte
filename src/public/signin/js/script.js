// VARIABLES GLOBALES
var opcionsOpen = false;

function init() {

    var user = document.getElementById("user");
    user.setAttribute("required", "");
    user.setAttribute("pattern", "^(?!\s*$).+.{2,21}")
    user.setAttribute("title", "Nombre de usuario incorrecto: 20 caracteres como máximo y 3 como mínimo")

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