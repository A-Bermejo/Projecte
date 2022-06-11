// VARIABLES GLOBALES
var limitBoton = 10;
const tableEl = document.querySelector('table');
var id_ingredientes = [];
var id_cantidad = [];
var file = ""

async function init() {
    console.log(id_ingredientes);
    $('table').on('click', 'input[type="button"]', function(e) {
        let id = this.id
        for (let i = 0; i < id_ingredientes.length; i++) {
            if (id_ingredientes[i] == id) {
                id_ingredientes.splice(i, 1);
                id_cantidad.splice(i, 1);
            }
            console.log(id_ingredientes);
            console.log(id_cantidad);
        }
        $(this).closest('tr').remove();
        limitBoton++;
        if (limitBoton == 1) {
            document.getElementById("afegir").style.display = 'inline-block';
        }
        document.getElementById("restante").innerHTML = limitBoton;
        if (limitBoton == 10) {
            document.getElementById("enviar").disabled = true;
        }
    })

    document.getElementById("restante").innerHTML = limitBoton;

    var afegir = document.getElementById("afegir");
    afegir.addEventListener('click', afegirHTML);

    var enviar = document.getElementById("enviar");

    enviar.addEventListener('click', send)

    $('#ingredient').on('select2:select', comprobarIngrediente);

    let img = document.getElementById("img");
    img.addEventListener("change", (e) => {
        file = e.target.files;
    })

}

function comprobarIngrediente(e) {
    document.getElementById("afegir").disabled = false;
    if (id_ingredientes.includes(document.getElementById("ingredient").value)) {
        document.getElementById("afegir").disabled = true;
    }


}

function afegirHTML() {
    document.getElementById("enviar").disabled = false;
    limitBoton--
    document.getElementById("afegir").disabled = true;
    const tbody = document.querySelector('tbody');
    let comida = $('#ingredient').find('option:selected').attr("name");
    let cantidad = document.getElementById("cantidad").value;
    let id = document.getElementById("ingredient").value
    tbody.innerHTML += `<tr><td>${comida}</td><td>${cantidad}</td><td><input type="button" value="❌" id="${id}"></td></tr>`
    id_ingredientes.push(document.getElementById("ingredient").value);
    id_cantidad.push(cantidad);
    if (limitBoton === 0) {
        document.getElementById("afegir").style.display = 'none';
    }
    document.getElementById("restante").innerHTML = limitBoton;
}

async function send() {

    let nom_recepta = document.getElementById("nom_recepta").value;
    let pais = document.getElementById("pais").value;
    let hora = document.getElementById("hora").value;
    let mins = document.getElementById("mins").value;
    let descripcio_recepta = document.getElementById("descripcio_recepta").value;
    var img = document.querySelector('input[type="file"]')
    data = img.files[0]
    const formData = new FormData();
    formData.append('img', data);
    const url = "/recipe/addNew"
    const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                nom_recepta,
                pais,
                hora,
                mins,
                descripcio_recepta,
                id_ingredientes,
                id_cantidad,
            })
        })
        .then(response => response.json())
        .then(async res => {
            await fetch('/recipe/img', {
                    method: 'POST',
                    mode: 'cors',
                    cache: 'no-cache',
                    referrer: 'no-referrer',
                    body: formData
                }).then(response => response.json())
                .then(async res => {
                    location.reload();
                }).catch(location.reload())
        }).catch(
            location.reload()
        );

}


$(document).ready(init);