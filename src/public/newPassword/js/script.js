// VARIABLES GLOBALES
var opcionsOpen = false;

function init() {

    var pass = document.getElementById("pass");
    pass.setAttribute("required", "");
    var regexPass = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}"
    pass.setAttribute("pattern", regexPass)
    pass.setAttribute("title", "La contraseña debe incluir como mínimo una mayúscula, una minúscula y un dígito y la longitud debe ser entre 8 y 20")

    var confPass = document.getElementById("confPass");
    confPass.setAttribute("required", "");
    confPass.setAttribute("pattern", regexPass)
    confPass.setAttribute("title", "La contraseña debe incluir como mínimo una mayúscula, una minúscula y un dígito y la longitud debe ser entre 8 y 20")

    var showPass = document.getElementById("showPass");
    showPass.addEventListener("change", showPassword);

    pass.addEventListener("input", comprobar);
    confPass.addEventListener("input", comprobar);

}

function comprobar() {
    regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}/
    document.getElementById("error").innerHTML = ""
    let errorRegex = true
    if (!document.getElementById("pass").value.match(regex) || !document.getElementById("confPass").value.match(regex)) {
        document.getElementById("button").disabled = true
        document.getElementById("error").innerHTML = "La contraseña debe incluir como mínimo una mayúscula, una minúscula y un dígito y la longitud debe ser entre 8 y 20.";
        errorRegex = false;
    }
    if (document.getElementById("pass").value === document.getElementById("confPass").value && errorRegex) {
        document.getElementById("button").disabled = false
        document.getElementById("error").innerHTML = "";
    }
    if (document.getElementById("pass").value !== document.getElementById("confPass").value) {
        document.getElementById("button").disabled = true
        document.getElementById("error").innerHTML += " Las contraseñas no coinciden";
    }
}

function showPassword() {
    if (document.getElementById("showPass").checked == true) {
        document.getElementById("pass").type = 'text';
        document.getElementById("confPass").type = 'text';

    } else {
        document.getElementById("pass").type = 'password';
        document.getElementById("confPass").type = 'password';

    }
}

$(document).ready(init);