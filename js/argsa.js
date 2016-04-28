$(document).ready(function(){

	$('#tablacaja').DataTable( {
       
    } ); 

    $("#btvender").click(function(){
        $("#ventas").append(" <tr><td>sasaasasassa</td><td>sasaasasassa</td><td>sasaasasassa</td><td>sasaasasassa</td>");
    });

         
});



                                
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
                          $("#sarasa").html("<p align='center'><img src='ajax-loader.gif' /></p>");
                    },
                    error: function(){
                           $("#sarasa").html("<p align='center'>error</p>");
                    },
                    success: function(data){                                                    
                          $("#txtnombre").empty();
                          $("#txtnombre").append(data);
                                                             
                    }
              });



                                                                            
                                                                           
        });


                                                                   