// VARIABLES GLOBALES
let split = window.location.pathname.split(['/']);
const id = split[2];
async function init() {

    const button = document.getElementById('favorite');
    button.addEventListener('click', guardar)
    const urlGet = "/favorites/get"
    const response = await fetch(urlGet, {
            method: 'post',
            body: JSON.stringify({
                id_receta: id
            }),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data[0].favorite == 1) {
                button.value = "delete";
                button.src = "/img/star-fill.svg";
            } else {
                button.value = "add";
                button.src = "/img/star.svg";
            }

        }).catch();


}

async function guardar() {
    try {
        const button = document.getElementById('favorite')
        if (button.value == "add") var url = "/favorites/add"
        else var url = "/favorites/delete"
        const response = await fetch(url, {
            method: 'post',
            body: JSON.stringify({
                id_receta: id
            }),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        });
        if (url == "/favorites/add") {
            button.value = "delete";
            button.src = "/img/star-fill.svg";
        } else {
            button.value = "add";
            button.src = "/img/star.svg";
        }
    } catch (err) {}
}

$(document).ready(init);