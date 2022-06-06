// VARIABLES GLOBALES
var limitBoton = 10;

async function init() {
    document.getElementById("restante").innerHTML = limitBoton;

    var afegir = document.getElementById("afegir");
    afegir.addEventListener('click', afegirHTML);
    var a = document.getElementById("a");


    // document.getElementById('ingredient').addEventListener('change', function() {
    //     console.log('You selected: ', this.value);
    // });




    $('#ingredient').on('select2:select', function(e) {
        var data = e.params.data;
        console.log(ingredient.value);
    });


}

function afegirHTML() {

    limitBoton--
    const myClone = $("#ingredientes").clone();
    myClone.find("span").remove();
    myClone.find("select").select2();
    $("#copy").append(myClone);
    if (limitBoton === 0) {
        document.getElementById("afegir").style.display = 'none';
    }
    document.getElementById("restante").innerHTML = limitBoton;
}


$(document).ready(init);