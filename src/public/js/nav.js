 // VARIABLES GLOBALES
 var opcionsOpen = false;

 function init() {
     var peticio = new XMLHttpRequest();

     // VARIABLES
     let inicio = document.getElementById("inicio");
     let dark = document.getElementById("darkMode");


     // EVENTOS

     inicio.addEventListener("click", inici)
     dark.addEventListener("click", darkMode)

 }

 function inici() {
     var peticio = new XMLHttpRequest();
     peticio.open("GET", 'http://localhost:3050/');
     peticio.send();

 }

 function darkMode() {
     document.body.classList.toggle('dark')
     if (document.body.classList.contains('dark')) {
         document.getElementById("darkMode").src = "index/img/brightness-high-fill.svg";
     } else {
         document.getElementById("darkMode").src = "index/img/moon-stars-fill.svg";

     }
 }
 $(document).ready(init);