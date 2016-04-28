<?php 
require "conexion.php";
$variable = json_decode($_POST['b'], true);
$aux;

$slq3 = "SELECT id_caja from cajas where estado =".'1'."";
$resultado3 = mysqli_query($link, $slq3) or die(mysqli_error($link));
$fila3 = mysqli_fetch_assoc($resultado3);

$ncaja = $fila3['id_caja'];
if ($ncaja == "")
{
	//echo "SIN CAJA";
	$fecha =  date("Y-m-d"); 

	$slq4 = "call sp_abrir_caja('".$fecha."','T','1')";
	$resultado4 = mysqli_query($link, $slq4) or die(mysqli_error($link));
	
	$slq5 = "SELECT id_caja from cajas where estado =".'1'."";
	$resultado5 = mysqli_query($link, $slq5) or die(mysqli_error($link));
	$fila5 = mysqli_fetch_assoc($resultado5);
	$ncaja = $fila5['id_caja'];

	$sql6 = "call sp_abrir_venta()";
	$resultado6 = mysqli_query($link, $sql6) or die(mysqli_error($link));
	$fila6 = mysqli_fetch_assoc($resultado6);

	$sql7 = "SELECT id_venta FROM  ventas WHERE estado = 1";
	$resultado7 = mysqli_query($link, $sql7) or die(mysqli_error($link));
	$fila7 = mysqli_fetch_assoc($resultado7);

	$nventa = $fila7['id_venta'];
	
	foreach ($variable as $key => $value)
	{
		$fila = $key;

		if ($fila == 0){

		} 
		else
		{
    		$codbar = $value['CODIGOBARRA'];
			$cantidad = $value['CANTIDADV'];
			$preciou = $value['PRECIO'];
			$montov = $value['MONTO'];
			$sql = "INSERT INTO operaciones (codigobarra, cantvend, precioprod, monto, id_venta, id_caja) values ('". $codbar ."','". $cantidad . "','". $preciou."','".$montov."','". $nventa ."','".$ncaja."')";
			$resultado = mysqli_query($link, $sql) or die(mysqli_error($link));
			$sql2 = "UPDATE productos SET stockexistente = stockexistente - '" . $cantidad ."' WHERE codigobarra = '" . $codbar ."'"; 
			$resultado2 = mysqli_query($link, $sql2) or die(mysqli_error($link));
			$rt += $resultado ;

			$sql7 = "call sp_cerrar_venta()";
			$resultado7 = mysqli_query($link, $sql7) or die(mysqli_error($link));
    	}
  	}
  	
}

else
{
//sleep(3);


	$sql6 = "call sp_abrir_venta()";
	$resultado6 = mysqli_query($link, $sql6) or die(mysqli_error($link));
	$fila6 = mysqli_fetch_assoc($resultado6);

	$sql7 = "SELECT id_venta FROM  ventas WHERE estado = 1";
	$resultado7 = mysqli_query($link, $sql7) or die(mysqli_error($link));
	$fila7 = mysqli_fetch_assoc($resultado7);

	$nventa = $fila7['id_venta'];



	foreach ($variable as $key => $value)
	{
		$fila = $key;

		if ($fila == 0){

		} 
		else
		{
    		$codbar = $value['CODIGOBARRA'];
			$cantidad = $value['CANTIDADV'];
			$preciou = $value['PRECIO'];
			$montov = $value['MONTO'];
			$sql = "INSERT INTO operaciones (codigobarra, cantvend, precioprod, monto, id_venta, id_caja) values ('". $codbar ."','". $cantidad . "','". $preciou."','".$montov."','". $nventa ."','".$ncaja."')";
			$resultado = mysqli_query($link, $sql) or die(mysqli_error($link));
			$sql2 = "UPDATE productos SET stockexistente = stockexistente - '" . $cantidad ."' WHERE codigobarra = '" . $codbar ."'"; 
			$resultado2 = mysqli_query($link, $sql2) or die(mysqli_error($link));
			$rt += $resultado ;


			$sql7 = "call sp_cerrar_venta()";
			$resultado7 = mysqli_query($link, $sql7) or die(mysqli_error($link));
    	}
  	}
  }
	mysqli_close($link);
	//$rt .= "A" . $resultado2;
	//echo $ncaja;
 ?>