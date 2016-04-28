
$(document).ready(function(){

$('#Info').hide();
$('#PanelDetalle').hide();

/*
  $("#tablacaja").DataTable( {
       "info":     false
    } ); 
    */
  $("#panelde").hide();
/*
     $('#tablaventas').DataTable( {
        "ordering": false,
        "info":     false,
         "searching": false

    } );
  */      



});




$("#btconfirmar").click(function() 
{
  var cantfilas;
  var nFilas = $("#tablaventas tbody tr").length;

  if (nFilas < 1){
    alert("No se agrego ningun producto al carrito de compras.");
    return;
  }
  else
  {
    var confirmacion = confirmarcompra();
 $("#btconfirmar").attr("disabled", "disabled"); 
    if (confirmacion == true)
    {
      var table = $('#tablaventas').tableToJSON({headings: [ 'NOMBRE','PRECIO','MONTO', 'CANTIDADV','CODIGOBARRA']});
     
      $("#panelde").show();
      $("#carrito").hide();
      llamarphp (table);
      $("#btconfirmar").removeAttr("disabled");
    }
    else
           $("#btconfirmar").removeAttr("disabled");
      return;
  }
 //alert(JSON.stringify(table));  
});

function llamarsinajax (tabla)
{
$.post('procesarventa.php', {b: tabla},
function(respuesta) {
$("#gifcarga").html(respuesta);
}).error(
function(){
console.log('Error al ejecutar la petición');
}
);
}

function llamarphp (table)
{
	$.ajax({
                    type: "POST",
                    url: "procesarventa.php",
                    data: "b="+JSON.stringify(table),
                  //  data:  "b="+JSON.stringify(table),
                //    dataType: "html",
                    beforeSend: function(data){
                        //imagen de carga

                           $("#dventas").html('<img src="img/loading.gif" alt="" height="72" width="80" margin/><span> <h3>  Procesado venta...</h3></span>');
                    },
                      error: function(data){
	           					       console.log('fail');
					  		             console.log(data);
					  		             $("#gifcarga").html(data);
                             //$("#gifcarga").html("cargo");

                    },
                    success: function(data){    
							              console.log('done');
						                console.log(data);    
                            window.location.href="form-caja-actual.php" 
                            /*
                            $("#gifcarga").empty(); 
                            $("#dventas").html('<br><br><br><br><br><img src="img/loading.gif" alt="" height="42" width="42" margin/><span>   Cargando...</span>');                                          
                            $("#dventas").empty();
                            $("#dventas").html('<div class="alert alert-success fade in" id="mjserror2"><a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a><strong>Ok!:</strong>Cantidad de productos vendidos '+ data+'</div>');
*/
                                                             
                    }
              });
}

/*
                                
        var consulta;
                                                                          
         //hacemos focus al campo de búsqueda
        $("#btbuscar").focus();
                                                                                                    
        //comprobamos si se pulsa una tecla
        $("#btbuscar").keyup(function(e){
                                     
              //obtenemos el texto introducido en el campo de búsqueda
              consulta = $("#txtcodbar").val();
                                                                           
              //hace la búsqueda
                                                                                  
              $.ajax({
                    type: "POST",
                    url: "buscar.php",
                    data: "b="+consulta,
                    dataType: "html",
                    beforeSend: function(){
                          //imagen de carga
                          $("#gifcarga").html("<p align='center'><img src='img/loading.gif' /></p>");
                    },
                    error: function(){
                           $("#gifcarga").html("<p align='center'>error</p>");
                    },
                    success: function(data){                                                    
                          $("#txtnombre").empty();
                          $("#txtnombre").append(data);
                                                             
                    }
              });
                                                                                  
                                                                           
        });
                                                                   

*/
  /*#########################

    PROCEDIMIENTO PARA BUSCAR SI EL PRODUCTO EXISTE 
    LA CONSULTA SE REALIZA POR MEDIO DE AJAX 
    DE FORMA ASINCRONICA
    
  */

 $('#codbarb').keypress(function(event){  

      var keycode = (event.keyCode ? event.keyCode : event.which);  
      if(keycode == '13'){ 
      limpiarformprod(); 
       $('#gifcarga').html('<br><br><br><img src="img/loading.gif" alt="" height="42" width="42"/><span>   Cargando...</span>').fadeOut(1000);
       var username = $('#codbarb').val();        
       var dataString = 'codbarb='+username;
       $.ajax({
           type: 'POST',
           url: 'buscar.php',
           data: dataString,
           success: function(data) {
           	console.log(data);
          // $('#Info').fadeIn(1000).html(data);
        try {
          data = JSON.parse(data);
            //ASIGNO VALORES A LOS INPUT RECUPERADOS DE JSON
          $( "#Info" ).effect("highlight");
          $("#PanelT").last().css( "background-color", "#FE9A2E");
          setTimeout(panelt, 1000);
         $('#txtnombre').val(data.nombre);
         $('#txtcodbar').val(data.codigobarra);
         $('#txtprecio').val(data.precioventa);
         $('#txtstocke').val(data.stockexistente);
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
          $('#gifcarga2').effect("shake");
          //DESHABILITO el boton agregar al carrito
          $("#btvender").attr("disabled", "disabled");
          //DESPUES DE 4 SEGUNDOS DESAPARECE EL MENSAJE DE ERROR !! NO OCULTO EL CONTENEDOR #GIFCARGA2 SINO EL #MJSERROR
          $('#mjserror').html(data).fadeOut(4000).html(data);
        }
           }
       });
     }
   });              


    $("#btvender").click(function(){
        validaagregarcompra();
        $("#tablaventas" ).effect("highlight");
       // $("#ventas tr").toggle("highlight"); 
    });


function validaagregarcompra(){
       var txtnombre = $("#txtnombre").val();
       var txtcodbar = $("#txtcodbar").val();
       var txtprecio = $("#txtprecio").val();
       var txtstocke = $("#txtstocke").val();
       var txtcantv = $("#txtcantv").val();


       if (txtnombre == "" || txtcodbar == "" || txtprecio == "" || txtstocke == "" || txtcantv ==""){
         alert("Complete correctamente el formulario de producto para poder ingresarlo al carrito de compras.");
         return;
       }
       else
       {
         var monto = (txtprecio * txtcantv);
         txtstocke = parseInt(txtstocke);
         txtcantv = parseInt(txtcantv);
         if (txtstocke < txtcantv)
         {
         //  alert("stock existente: "+txtstocke +"  " + "cantidad a verder :"+ txtcantv);
         //limpiarformprod();
           var data = '<br><div class="alert alert-warning fade in" id="mjserror2"><a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a><strong>Error:</strong> Stock insuficiente.</div>';
           $('#codbarb').empty();
           $('#gifcarga2').fadeIn(1000).html(data);
           $('#gifcarga2').effect("shake")
           $('#mjserror2').html(data).fadeOut(2000).html(data);
         }
         else
         {
           //## EFECTO AGREGA OPEACION A CARRITO!!!!!!

           $("#ventas").append("<tr><td>"+txtnombre+"</td><td>"+txtprecio+"</td><td>"+ monto+"</td><td>"+txtcantv+"</td><td>"+txtcodbar+"</td><td>"+'<a onclick="eliminar(this.parentNode.parentNode.rowIndex)"><span><i class="fa fa-trash" ">'+"</td>");

           var data = '<br><div class="alert alert-success fade in" id="mjserror2"><a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a><strong>Ok!:</strong> Producto agregado al carrito de Compras.</div>';
           limpiarformprod();
           $('#codbarb').empty();
           $('#gifcarga2').fadeIn(1000).html(data);
          // $("#ventas tr").last().css( "background-color", "#FE9A2E");
          // $("#ventas tr").last().css( "color", "#FFFFFF");
          // $("#ventas span").last().css( "color", "#FFFFFF");
           setTimeout(nuevafilacolor, 2000);
           $('#codbarb').empty();
           calulartotal();
           //$('#Info').hide();

         }
     }
}

function nuevafilacolor(){
       // $("#ventas tr").css( "background-color", "#3D3D3D");
        //$("#ventas tr").css( "color", "#FFFFFF");
        $('#gifcarga2').empty();
}


function eliminar (i) {
   //document.getElementsByTagName("table")[1].setAttribute("id","tablaventas");
    document.getElementById("tablaventas").deleteRow(i);
    calulartotal();
}


function panelt(){
  $("#PanelT").last().css( "background-color", "#375A7F");
}

function limpiarformprod(){
$("#txtnombre").val("");
$("#txtcodbar").val("");
$("#txtprecio").val("");
$("#txtstocke").val("");
$("#txtcantv").val("");
}


function confirmarcompra(){
    var r = confirm("CONFIRMAR VENTA?");
    if (r == true) {
          return true;
    } else {
        return false;
    }
}

function formventas(){
  window.location.href="form-ventas.php";
}


     $('#nomprod').typeahead({
          source: function (query, process) {
            $.ajax({
              url: 'autocompletar.php',
              type: 'POST',
              dataType: 'JSON',
              data: 'query=' + query,
              success: function(data) {
                 $('#nomprod').val('');
                console.log(data);
                process(data);
              }
            });
          }
        });



      $('#nomprod').keypress(function(event){  
        limpiarformprod();
      var keycode = (event.keyCode ? event.keyCode : event.which);  
      if(keycode == '13'){  
       $('#gifcarga').html('<br><br><br><img src="img/loading.gif" alt="" height="42" width="42"/><span>   Cargando...</span>').fadeOut(1000);
       var username = $('#nomprod').val();        
       var dataString = 'nomprod='+username;
       $.ajax({
           type: 'POST',
           url: 'buscar-nombre.php',
           data: dataString,
           success: function(data) {
            console.log(data);
          // $('#Info').fadeIn(1000).html(data);
        try {
          data = JSON.parse(data);
            //ASIGNO VALORES A LOS INPUT RECUPERADOS DE JSON
            //$( "#Info" ).effect( "shake" ); 
            $( "#Info" ).effect("highlight");
          $("#PanelT").last().css( "background-color", "#FE9A2E");
          setTimeout(panelt, 1000);
         $('#txtnombre').val(data.nombre);
         $('#txtcodbar').val(data.codigobarra);
         $('#txtprecio').val(data.precioventa);
         $('#txtstocke').val(data.stockexistente);
         $('#txtcantv').val(1);
         $('#codbarb').val('');
         $('#nomprod').val('');
         //habilito el boton agregar al carrito
         $("#btvender").removeAttr("disabled");
         
         }


        catch(e){
          //INPUT CODIGO DE BARRA = A VACIO
          $('#codbarb').val('');
          //MUESTRO EL MENSAJE DE ERROR "PRODUCTO INEXISTENTE DENTRO DEL DIV GIFCARGA2"
        // $('#gifcarga2').fadeIn(1000).html(data);
          //AGREGO EFECTO
          $('#gifcarga2').effect("shake");
          //DESHABILITO el boton agregar al carrito
          $("#btvender").attr("disabled", "disabled");
          //DESPUES DE 4 SEGUNDOS DESAPARECE EL MENSAJE DE ERROR !! NO OCULTO EL CONTENEDOR #GIFCARGA2 SINO EL #MJSERROR
          $('#mjserror').html(data).fadeOut(4000).html(data);
        }
           }
       });
     }
   });




  function calulartotal(){

        $('#PanelDetalle').show();

        var suma = 0;
        var cantv = 0;

        $('#tablaventas tr').each(function(){ //filas con clase 'dato', especifica una clase, asi no tomas el nombre de las columnas
          suma += parseInt($(this).find('td').eq(2).text()||0,10); //numero de la celda 3
          cantv += parseInt($(this).find('td').eq(3).text()||0,10); //numero de la celda 3
        $('#cantidadvendida').text(cantv);
        $('#montovendido').text("$"+suma);
      })

  };

/*

<!-- Fichero formulario.html -->
 
<form id='formulario'>
 <input type='text' id='codigo'>
 <button type='button' id='buscar'>Buscar Registro</button>
 <input type='text' id='nombre'>
 <input type='text' id='apellidos'>
</form>
<script>
$('#buscar').click(function(){
 $.post('datos.php', {codigo:$('#codigo').val()}, function(data){
 data = JSON.parse(data);
 $('#nombre').val(data.nombre);
 $('#apellidos').val(data.apellidos);
 });
 return false;
});
</script>*/
