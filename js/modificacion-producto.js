$(document).ready(function(){
//$('#btbuscar').click(function(){
corbar = $('#codbarb').val();
if(corbar == "")
{
return false;
}
else
{
        $('#gifcarga').html('<br><br><br><img src="img/loading.gif" alt="" height="42" width="42"/><span>   Cargando...</span>').fadeOut(1000);
       var username = $('#codbarb').val();        
       var dataString = 'codbarb='+username;
       $.ajax({
           type: 'POST',
           url: 'buscar.php',
           data: dataString,
           success: function(data) {
    //        console.log(data);
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
         $('#txtcantv').val(1);
         $("#imgprodu").attr("src","img/"+data.imagen);        
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
}

});


$('#btbuscar').click(function(){
//$('#btbuscar').click(function(){
corbar = $('#codbarb').val();
if(corbar == "")
{
return false;
}
else
{
        $('#gifcarga').html('<br><br><br><img src="img/loading.gif" alt="" height="42" width="42"/><span>   Cargando...</span>').fadeOut(1000);
       var username = $('#codbarb').val();        
       var dataString = 'codbarb='+username;
       $.ajax({
           type: 'POST',
           url: 'buscar.php',
           data: dataString,
           success: function(data) {
    //        console.log(data);
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
         $('#txtcantv').val(1);
         $("#imgprodu").attr("src","img/"+data.imagen);        
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
}

});

$('#btconfirmar').click(function(){
//$('#btbuscar').click(function(){


        $('#gifcarga').html('<br><br><br><img src="img/loading.gif" alt="" height="42" width="42"/><span>   Cargando...</span>').fadeOut(1000);
       var codigodebarra = $('#txtcodbar').val();        
       var nombreprod = $('#txtnombre').val();  
       var precio = $('#txtprecio').val();  
       var stock = $('#txtstocke').val();  
       var dataString ={
                  codbarb:codigodebarra,
                  nombreprod:nombreprod,
                  precio:precio,
                  stock:stock
                  }

     //  'codbarb='+codigodebarra+'&nombreprod='+nombreprod+'&precio='+precio+'&stock='+stock;
       $.ajax({
           type: 'POST',
           url: 'editar-producto.php',
           data: dataString,
        //    data: JSON.stringify(dataString),
           success: function(data) {
    //        console.log(data);
          // $('#Info').fadeIn(1000).html(data);

            $('#codbarb').val(codigodebarra);
           }
            
           });


});





