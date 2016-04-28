<?php
require 'conexion.php'	;
$query = "SELECT nombre, codigobarra FROM productos";
  if(isset($_POST['query'])){
    // Add validation and sanitization on $_POST['query'] here
 
    // Now set the WHERE clause with LIKE query
    $query .= ' WHERE nombre LIKE "%'.$_POST['query'].'%"';
  }
 
  $return = array();
 

$resultado = mysqli_query($link, $query) or die(mysqli_error($link));


	while ($fila = mysqli_fetch_assoc($resultado))
	{						
			$return[] =  $fila['nombre'];
			$return[] =  $fila['codigobarra'];
	}

 
  // close connection
  mysqli_close($link);
 
  $json = json_encode($return);
  echo ($json);
  ?>