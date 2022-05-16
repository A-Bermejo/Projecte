 // VARIABLES GLOBALES
 var opcionsOpen = false;

 function init() {
     // VARIABLES
     let inicio = document.getElementById("inicio");
     let dark = document.getElementById("darkMode");
     // EVENTOS

     dark.addEventListener("click", darkMode)
 }


 function darkMode() {
     document.body.classList.toggle('dark')
     if (document.body.classList.contains('dark')) {
         document.getElementById("darkMode").src = "/index/img/brightness-high-fill.svg";
     } else {
         document.getElementById("darkMode").src = "/index/img/moon-stars-fill.svg";

     }
 }
 $(document).ready(init);