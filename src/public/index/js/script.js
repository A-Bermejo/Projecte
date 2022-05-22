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
     $('#ingredient').on('select2:select', serch);
     $('#ingredient').on('select2:unselect', serch);
     $('#continente').on('change', serch);

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

 async function serch() {
     var id = $(this).val();

     var where = []
     if (document.getElementById("vegetariano").checked) where.push("vegetariano")
     if (document.getElementById("gluten").checked) where.push("gluten")
     if (document.getElementById("alcohol").checked) where.push("alcohol")
     if (document.getElementById("lactosa").checked) where.push("lactosa")

     var continente = $("#continente").val();
     console.log(continente);
     const url = "/recipe/getByIngredients"

     const response = await fetch(url, {
             method: 'POST',
             headers: {
                 'Accept': 'application/json',
                 'Content-Type': 'application/json'
             },
             body: JSON.stringify({
                 id: id,
                 where,
                 continente
             })
         })
         .then(response => response.json())
         .then(data => {
             console.log(data);
             let resultados = document.getElementById("resultados");
             if (data.length != 0) {
                 var resultadosHTML = "";
                 for (let i = 0; i < data.length; i++) {
                     resultadosHTML += '<div class="col-6 col-md-4 col-lg-3 mt-3"> ' +
                         '<div class="card w-100 text-center">' +
                         '<img src="/uploads/' + data[i].img + '" class="card-img-top" alt="...">' +
                         '<div class="container-fluid mt-3">';
                     if (data[i].tipus.includes(6) === false && data[i].tipus.includes(6) === false && data[i].tipus.includes(7) === false && data[i].tipus.includes(8) === false) {
                         resultadosHTML += '<span class="badge bg-success">🍃Vegetariano</span>'
                     }
                     if (data[i].tipus.includes(12) === false) {
                         resultadosHTML += '<span  class="badge bg-warning">🍞Sin gluten</span>'
                     }
                     if (data[i].tipus.includes(9) === true) {
                         resultadosHTML += '<span class="badge bg-purple">🍾Con alcohol</span>'
                     }
                     if (data[i].tipus.includes(1) === false) {
                         resultadosHTML += '<span class="badge bg-secondary">🥛Sin Lactosa</span>'
                     }
                     resultadosHTML += '</div>' +
                         '<div class="card-body d-flex flex-column">' +
                         '<h5 class="card-title">' + data[i].nom_recepta + '</h5>' +
                         '<h6>Tiempo de preparacion: ' + data[i].temps + '</h6>' +
                         '<h6>País de origen: ' + data[i].nombre_pais + '</h6> ' +
                         '<p class="card-text">' + data[i].descripcio_recepta + '</p>' +
                         '<a href="/recipe/' + data[i].id_recepta + '" class="mt-auto btn btn-danger">Leer receta completa</a>' +
                         '</div>' +
                         '</div>' +
                         ' </div>'

                 }
                 resultados.innerHTML = resultadosHTML
             } else {
                 resultados.innerHTML = "<p class='text-center'>No hay resulados</p>"
             }
         }).catch();

 }


 $(document).ready(init);