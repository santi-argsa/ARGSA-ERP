$("#btconfirmar").click(function() 
{

  if (confirm("Desea editar el producto")==true)
  {
    return true;
  }
    return false;
});


  $('#btbuscar').click(function(){
       $('#gifcarga').html('<br><br><br><img src="img/loading.gif" alt="" height="42" width="42"/><span>   Cargando...</span>').fadeOut(1000);
       var username = $('#codbarb').val();        
       var dataString = 'codbarb='+username;
       $.ajax({
           type: 'POST',
           url: 'buscar.php',
           data: dataString,
           success: function(data) {
            //console.log(data);
          // $('#Info').fadeIn(1000).html(data);
        try {
          data = JSON.parse(data);
            //ASIGNO VALORES A LOS INPUT RECUPERADOS DE JSON
          $("#PanelT").last().css( "background-color", "#FE9A2E");
          setTimeout(panelt, 1000);
         $('#txtnombre').val(data.nombre);
         $('#txtcodbar').val(data.codigobarra);
         $('#txtprecio').val(data.precioventa);
         $('#txtstocke').val(data.stockexistente);


         imgprodu
         $('#txtcantv').val(1);
         $('#codbarb').val('');
         //habilito el boton agregar al carrito
         $("#btvender").removeAttr("disabled");
         }
        catch(e){
          //INPUT CODIGO DE BARRA = A VACIO
          $('#codbarb').val('');
          //MUESTRO EL MENSAJE DE ERROR "PRODUCTO INEXISTENTE DENTRO DEL DIV GIFCARGA2"
          $('#gifcarga2').fadeIn(1000).html(data);
          //DESHABILITO el boton agregar al carrito
          $("#btvender").attr("disabled", "disabled");
          //DESPUES DE 4 SEGUNDOS DESAPARECE EL MENSAJE DE ERROR !! NO OCULTO EL CONTENEDOR #GIFCARGA2 SINO EL #MJSERROR
          $('#mjserror').html(data).fadeOut(4000).html(data);
        }
     
           }
       });
   }); 


function panelt(){
  $("#PanelT").last().css( "background-color", "#375A7F");
}