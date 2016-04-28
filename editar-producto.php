<?php
require 'conexion.php';

  $codbar = $_POST['codbarb'];
  $nombreprod = $_POST['nombreprod'];
  $precio = $_POST['precio'];
  $stock = $_POST['stock'];
  $sql = "update productos
          SET nombre = '".$nombreprod."', codigobarra = '".$codbar."', precioventa='".$precio."', stockexistente ='".$stock."'
          where codigobarra = '".$codbar."'";
  $resultado = mysqli_query($link, $sql) or die(mysqli_error($link));

  mysqli_close($link);


?> 