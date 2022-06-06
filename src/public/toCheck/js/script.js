 function init() {
     $('.btn-success').click(async function() {
         var id = $(this).val()
         var mail = $(this).attr('mail');
         var foodName = $(this).attr('name');
         console.log($(this).attr('mail'));
         const url = "/backoffice/accept"
         const response = await fetch(url, {
                 method: 'POST',
                 headers: {
                     'Accept': 'application/json',
                     'Content-Type': 'application/json'
                 },
                 body: JSON.stringify({
                     id,
                     mail,
                     foodName
                 })
             })
             .then(response => response.json())
             .then(data => {
                 $(this).closest("tr").remove();

             })
     });

     $('.btn-danger').click(async function() {
         var id = $(this).val()
         var mail = $(this).attr('mail');
         var foodName = $(this).attr('name');
         const url = "/backoffice/cancel"
         const response = await fetch(url, {
                 method: 'POST',
                 headers: {
                     'Accept': 'application/json',
                     'Content-Type': 'application/json'
                 },
                 body: JSON.stringify({
                     id,
                     mail,
                     foodName
                 })
             })
             .then(response => response.json())
             .then(data => {
                 $(this).closest("tr").remove();
             })
     });

 }







 $(document).ready(init);