<?php
sleep(1);
require 'conexion.php';
if($_REQUEST) {
  $nomprod = $_REQUEST['nomprod'];
  $sql = "select nombre, codigobarra, precioventa, stockexistente from productos where nombre = '".$nomprod."'";
  $resultado = mysqli_query($link, $sql) or die(mysqli_error($link));
  $fila = mysqli_fetch_assoc($resultado);
   if(mysqli_num_rows($resultado) > 0)
    echo json_encode(($fila));
   else
       echo '<br><div class="alert alert-danger fade in" id="mjserror">
   <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
   <strong>Error:</strong> Producto inexistente en la base de productos.
</div>';
}
mysqli_close($link);
?> 