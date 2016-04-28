<?php
require 'conexion.php';	
$sql = "SELECT usuario
		FROM usuarios
		WHERE usuario = '".$_POST['usu_login']."' AND passwd = '".$_POST['usu_clave']."'";
		
	$resultado = mysqli_query($link, $sql);
	$cantidad = mysqli_num_rows($resultado);
	mysqli_close($link);

		if ($cantidad == 0)
		{
			header("location:index.php?error=1");
		}
		else
		{
			//Rutina de autentificacion

			session_start();

			$_SESSION['login'] = 1;
			$_SESSION['nombre'] = $_POST['usu_login'];

			header("location:form-ventas.php");
		}
?>