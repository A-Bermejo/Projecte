 function init() {
     $('.btn-success').click(async function() {
         var id = $(this).val()
         const url = "/backoffice/accept"
         const response = await fetch(url, {
                 method: 'POST',
                 headers: {
                     'Accept': 'application/json',
                     'Content-Type': 'application/json'
                 },
                 body: JSON.stringify({
                     id
                 })
             })
             .then(response => response.json())
             .then(data => {
                 $(this).remove();

             })
     });

     $('.btn-danger').click(async function() {
         var id = $(this).val()
         const url = "/backoffice/cancel"
         const response = await fetch(url, {
                 method: 'POST',
                 headers: {
                     'Accept': 'application/json',
                     'Content-Type': 'application/json'
                 },
                 body: JSON.stringify({
                     id
                 })
             })
             .then(response => response.json())
             .then(data => {
                 $(this).closest("tr").remove();
             })
     });

 }







 $(document).ready(init);