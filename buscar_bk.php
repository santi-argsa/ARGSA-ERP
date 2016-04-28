<?php
require 'conexion.php';
      $buscar = $_POST['b'];
      if(!empty($buscar)) {
			buscard($buscar);
      }
      function buscard($b) {
       $sql = "SELECT  nombre FROM productos WHERE codigobarra=$buscar";
$resultado = mysqli_query($link, $sql) or die(mysqli_error($link));
$cantidad = mysqli_num_rows($resultado);
             
            if($cantidad == 0){
echo "No se han encontrado resultados para '<b>".$b."</b>'.";
            }else{
                  while($row=mysql_fetch_array($sql)){
                        $nombre = $row['nombre'];    
echo $nombre."<br /><br />";    
                  }
            }
      }
       
?>